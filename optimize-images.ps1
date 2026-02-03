# Image Optimization Script for Amped Up Electrical Adelaide
# Converts JPG images to WebP format for 70-80% size reduction
# Requires: ImageMagick or Windows built-in tools

Write-Host "=== Amped Up Electrical - Image Optimization ===" -ForegroundColor Cyan
Write-Host ""

# Check if magick (ImageMagick) is available
$hasMagick = $null -ne (Get-Command magick -ErrorAction SilentlyContinue)

if (-not $hasMagick) {
    Write-Host "⚠️  ImageMagick not found. Please install it:" -ForegroundColor Yellow
    Write-Host "   Download from: https://imagemagick.org/script/download.php" -ForegroundColor Yellow
    Write-Host "   Or use online tool: https://squoosh.app/" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Alternative: Use the online optimization guide below" -ForegroundColor Green
    Write-Host ""
    Write-Host "=== MANUAL OPTIMIZATION INSTRUCTIONS ===" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Go to: https://squoosh.app/" -ForegroundColor White
    Write-Host ""
    Write-Host "For each image:" -ForegroundColor White
    Write-Host "  1. Upload the image" -ForegroundColor Gray
    Write-Host "  2. Select 'WebP' format from right panel" -ForegroundColor Gray
    Write-Host "  3. Set quality to 80%" -ForegroundColor Gray
    Write-Host "  4. Click 'Download'" -ForegroundColor Gray
    Write-Host "  5. Save with .webp extension" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Images to optimize:" -ForegroundColor White
    Get-ChildItem -Path "." -Filter "*.jpg" | ForEach-Object {
        $size = [math]::Round($_.Length / 1KB, 0)
        Write-Host "  - $($_.Name) (${size} KB)" -ForegroundColor Gray
    }
    Write-Host ""
    Write-Host "Target: Reduce each image to <50 KB" -ForegroundColor Green
    Write-Host ""
    exit
}

# Create backup directory
$backupDir = "images-original"
if (-not (Test-Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir | Out-Null
    Write-Host "✓ Created backup directory: $backupDir" -ForegroundColor Green
}

# Get all JPG images
$images = Get-ChildItem -Path "." -Filter "*.jpg"

if ($images.Count -eq 0) {
    Write-Host "No JPG images found in current directory." -ForegroundColor Yellow
    exit
}

Write-Host "Found $($images.Count) images to optimize" -ForegroundColor White
Write-Host ""

$totalSaved = 0

foreach ($image in $images) {
    $originalSize = $image.Length
    $originalSizeKB = [math]::Round($originalSize / 1KB, 0)
    
    # Skip if already very small
    if ($originalSize -lt 50KB) {
        Write-Host "⏭️  Skipping $($image.Name) (already optimized: ${originalSizeKB} KB)" -ForegroundColor Gray
        continue
    }
    
    Write-Host "🔧 Processing: $($image.Name) (${originalSizeKB} KB)" -ForegroundColor Cyan
    
    # Backup original if not already backed up
    $backupPath = Join-Path $backupDir $image.Name
    if (-not (Test-Path $backupPath)) {
        Copy-Item $image.FullName $backupPath
        Write-Host "   ✓ Backed up to $backupDir" -ForegroundColor Gray
    }
    
    # Convert to WebP
    $webpName = [System.IO.Path]::ChangeExtension($image.Name, ".webp")
    $webpPath = Join-Path $image.DirectoryName $webpName
    
    try {
        # Convert using ImageMagick (quality 80, optimized for web)
        & magick convert $image.FullName -quality 80 -define webp:method=6 $webpPath
        
        if (Test-Path $webpPath) {
            $webpSize = (Get-Item $webpPath).Length
            $webpSizeKB = [math]::Round($webpSize / 1KB, 0)
            $saved = $originalSize - $webpSize
            $savedKB = [math]::Round($saved / 1KB, 0)
            $savingPercent = [math]::Round(($saved / $originalSize) * 100, 0)
            
            $totalSaved += $saved
            
            Write-Host "   ✓ Created $webpName (${webpSizeKB} KB) - Saved ${savedKB} KB (${savingPercent}%)" -ForegroundColor Green
        }
        else {
            Write-Host "   ❌ Failed to create WebP for $($image.Name)" -ForegroundColor Red
        }
    }
    catch {
        Write-Host "   ❌ Error processing $($image.Name): $_" -ForegroundColor Red
    }
    
    Write-Host ""
}

$totalSavedKB = [math]::Round($totalSaved / 1KB, 0)
$totalSavedMB = [math]::Round($totalSaved / 1MB, 2)

Write-Host "=== Optimization Complete ===" -ForegroundColor Green
Write-Host "Total space saved: ${totalSavedKB} KB (${totalSavedMB} MB)" -ForegroundColor White
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Test WebP images in browser" -ForegroundColor White
Write-Host "2. Update HTML to use <picture> tags for WebP support" -ForegroundColor White
Write-Host "3. Keep JPG as fallback for older browsers" -ForegroundColor White
Write-Host ""
Write-Host "Example HTML:" -ForegroundColor Cyan
Write-Host @"
<picture>
  <source srcset="image.webp" type="image/webp">
  <img src="image.jpg" alt="Description" loading="lazy">
</picture>
"@ -ForegroundColor Gray
Write-Host ""
Write-Host "Original images backed up to: $backupDir" -ForegroundColor Yellow
