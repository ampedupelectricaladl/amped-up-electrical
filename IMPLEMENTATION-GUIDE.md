# Quick Implementation Guide
**For: Marcus Debarley - Amped Up Electrical Adelaide**  
**Prepared by: OpenClaw AI Agent**  
**Date: February 3, 2026**

---

## 🚀 Quick Start (30 Minutes)

Follow these steps in order for maximum impact:

---

### Step 1: Upload Core Files (5 minutes)

1. **Upload to website root directory:**
   - `sitemap.xml`
   - `robots.txt`

2. **Verify upload:**
   - Visit: https://ampedupelectricaladelaide.com.au/sitemap.xml
   - Visit: https://ampedupelectricaladelaide.com.au/robots.txt
   - Both should display content (not 404 error)

✅ **Done? Continue to Step 2**

---

### Step 2: Fix Quote Form (10 minutes)

**CRITICAL:** This form currently doesn't work. Fix it now!

#### Option A: FormSubmit (Easiest - Recommended)

1. Open `index.html` in editor
2. Find the `<form>` tag (around line 900)
3. **Replace this:**
   ```html
   <form id="quoteForm">
   ```

4. **With this:**
   ```html
   <form id="quoteForm" action="https://formsubmit.co/ampedupelectricaladl@gmail.com" method="POST">
     <input type="hidden" name="_subject" value="Website Quote Request - Amped Up Electrical">
     <input type="hidden" name="_template" value="box">
     <input type="hidden" name="_captcha" value="false">
     <input type="hidden" name="_next" value="https://ampedupelectricaladelaide.com.au/?success=true">
   ```

5. Save and upload `index.html`

6. **Test it:**
   - Fill out form on website
   - Submit
   - **First time only:** Check email for confirmation link from FormSubmit
   - Click confirmation link
   - Done! Future forms will go straight to your email

✅ **Done? Test by submitting a quote request**

---

### Step 3: Update Schema Markup (10 minutes)

1. Open `index.html` in editor
2. Find the `<script type="application/ld+json">` section (around line 17-70)
3. **Delete everything from `{` to `}` inside that script tag**
4. **Copy the ENTIRE contents** of `schema-improvements.json`
5. **Paste it** inside the `<script>` tags, replacing the old schema
6. Save and upload

**Verify:**
- Visit: https://search.google.com/test/rich-results
- Enter your website URL
- Should show: "Page is eligible for rich results" with stars/reviews

✅ **Done? Continue to Step 4**

---

### Step 4: Add Essential Meta Tags (5 minutes)

1. Open `index.html`
2. Find the `<head>` section
3. **After the existing `<meta>` tags, add these:**

```html
<!-- Canonical URL -->
<link rel="canonical" href="https://ampedupelectricaladelaide.com.au/" />

<!-- Geo tags for local SEO -->
<meta name="geo.region" content="AU-SA" />
<meta name="geo.placename" content="Adelaide" />
<meta name="geo.position" content="-34.8819;138.6222" />

<!-- Enhanced Open Graph image -->
<meta property="og:image" content="https://ampedupelectricaladelaide.com.au/hero-thumbs-up.jpg" />
<meta property="og:url" content="https://ampedupelectricaladelaide.com.au/" />

<!-- Twitter Card -->
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content="Amped Up Electrical Adelaide - Licensed Electrician" />
<meta name="twitter:description" content="Fast, reliable electrical service across Adelaide. Call 0410 414 969." />
<meta name="twitter:image" content="https://ampedupelectricaladelaide.com.au/hero-thumbs-up.jpg" />
```

4. Save and upload

✅ **Done? Continue to Step 5**

---

### Step 5: Submit to Google (5 minutes)

1. **Go to:** [Google Search Console](https://search.google.com/search-console)
2. Log in with your Google account
3. **Add property:** ampedupelectricaladelaide.com.au
4. **Verify ownership** (HTML file upload or DNS)
5. **Submit sitemap:**
   - Go to "Sitemaps" in left menu
   - Enter: `sitemap.xml`
   - Click "Submit"

6. **Check for errors:**
   - Wait 24-48 hours
   - Return to Search Console
   - Check "Coverage" report
   - Fix any errors shown

✅ **Done! The basics are complete**

---

## 📊 Phase 2: Image Optimization (30-60 minutes)

**Impact:** 50%+ faster page load, better mobile experience

### Option A: Use Online Tool (Easier)

1. Go to https://squoosh.app/
2. For each image file on your site:
   - Upload the JPG file
   - Select "WebP" format
   - Set quality to 80%
   - Download the .webp version
   - Upload both JPG and WebP to website

3. Update HTML to use WebP:

**Before:**
```html
<img src="hero-thumbs-up.jpg" alt="Electrician" />
```

**After:**
```html
<picture>
  <source srcset="hero-thumbs-up.webp" type="image/webp" />
  <img src="hero-thumbs-up.jpg" alt="Adelaide electrician Marcus" loading="lazy" />
</picture>
```

### Option B: Use PowerShell Script (if you have ImageMagick)

1. Install ImageMagick from https://imagemagick.org/script/download.php
2. Run the script:
   ```powershell
   cd C:\path\to\website\
   .\optimize-images.ps1
   ```
3. Script will:
   - Backup originals to `images-original/`
   - Create optimized WebP versions
   - Show size savings

4. Update HTML as shown in Option A

---

## 🔍 Phase 3: Google Business Profile (When Approved)

Once your Google Business Profile is approved:

### Immediate Actions:
1. ✅ **Complete profile 100%:**
   - Business hours (including 24/7 emergency note)
   - Services (list all: switchboard, EV charger, etc.)
   - Photos (10+ high-quality images)
   - Description (use keywords: electrician Adelaide, eastern suburbs, etc.)

2. ✅ **Set primary categories:**
   - Primary: Electrician
   - Secondary: Emergency electrician, Electrical installation service

3. ✅ **Add Q&A:**
   - Pre-answer common questions
   - "Do you service [suburb]?" → Yes!
   - "Emergency callouts?" → 24/7 available

4. ✅ **First post:**
   - Share recent job
   - Include photos
   - Mention suburbs serviced

### Weekly Tasks:
- Post update (recent job, tip, seasonal reminder)
- Respond to any reviews (same day!)
- Add 2-3 new photos

### Monthly Tasks:
- Check insights (views, calls, direction requests)
- Update services if needed
- Refresh photos (keep it current)

---

## 📱 Phase 4: Conversion Optimization (Optional)

### Add WhatsApp Contact (High Impact)

Many Adelaide customers prefer WhatsApp. Add this button:

```html
<!-- Add next to phone number button -->
<a href="https://wa.me/61410414969?text=Hi%20Marcus,%20I%20need%20an%20electrician" 
   class="btn" 
   style="background: #25D366; color: white;">
  💬 WhatsApp Quote
</a>
```

### Add Sticky Mobile Call Button

```html
<!-- Add just before </body> tag -->
<style>
@media (max-width: 768px) {
  .mobile-cta {
    display: flex !important;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 12px;
    background: rgba(20,20,26,0.98);
    backdrop-filter: blur(10px);
    border-top: 1px solid var(--border);
    z-index: 9999;
    gap: 10px;
  }
  .mobile-cta .btn {
    flex: 1;
    text-align: center;
    padding: 14px;
    font-size: 16px;
    font-weight: 1000;
  }
}
</style>

<div class="mobile-cta" style="display:none;">
  <a href="tel:0410414969" class="btn primary">📞 Call Now</a>
  <a href="https://wa.me/61410414969" class="btn" style="background:#25D366;color:#fff;">💬 WhatsApp</a>
</div>
```

---

## ✅ Verification Checklist

After implementation, verify these work:

- [ ] Sitemap loads: https://ampedupelectricaladelaide.com.au/sitemap.xml
- [ ] Robots.txt loads: https://ampedupelectricaladelaide.com.au/robots.txt
- [ ] Quote form sends email when submitted
- [ ] Website passes [Google Rich Results Test](https://search.google.com/test/rich-results)
- [ ] Mobile site loads fast on phone
- [ ] All images appear correctly
- [ ] Phone number click-to-call works on mobile
- [ ] Instagram link works
- [ ] All location pages load correctly

---

## 📈 Measuring Success

### Week 1:
- Google Search Console shows sitemap submitted ✓
- Quote form submissions received ✓
- Page load time improved ✓

### Week 2-4:
- Google starts indexing location pages
- Rich snippets begin appearing in search
- Increase in organic traffic

### Month 2-3:
- More location pages ranking
- Increase in phone calls
- Better Google Business Profile ranking (when approved)

### Track These Metrics:
1. **Calls per week** (from website)
2. **Form submissions per week**
3. **Google Search impressions** (Search Console)
4. **Google Maps views** (once GBP live)

**Target:** 30-50% increase in leads within 60 days

---

## 🆘 Troubleshooting

### Quote form not working?
- Check email spam folder
- Verify FormSubmit confirmation was clicked
- Test with different email address

### Sitemap not showing in Search Console?
- Wait 24-48 hours
- Check file is actually uploaded
- Verify XML is valid

### Images not loading?
- Check file names match HTML exactly (case-sensitive)
- Clear browser cache
- Verify files uploaded correctly

### Rich snippets not showing?
- Can take 2-4 weeks for Google to show them
- Use Rich Results Test to verify markup is correct
- Be patient - Google rolls these out slowly

---

## 💡 Pro Tips

1. **Update Instagram weekly** - it's linked on your site, keep it fresh
2. **Collect reviews actively** - ask happy customers to review on Google
3. **Post on GBP weekly** - keeps your business showing in local searches
4. **Monitor Search Console** - catches technical issues early
5. **Test on mobile often** - most leads come from mobile devices

---

## Next Steps After This Guide

1. **Content marketing:** Add blog section with electrical safety tips
2. **Seasonal campaigns:** Ceiling fan specials in summer, etc.
3. **Service-specific pages:** Separate pages for switchboards, EV chargers
4. **Video content:** Short Instagram Reels showing before/after
5. **Customer testimonial videos:** Very powerful for conversion

---

## Need Help?

- **Schema testing:** https://search.google.com/test/rich-results
- **Image optimization:** https://squoosh.app/
- **Page speed test:** https://pagespeed.web.dev/
- **Mobile test:** https://search.google.com/test/mobile-friendly
- **Free SEO audit:** https://web.dev/measure/

---

**You've got this! 🚀**

Start with Step 1 and work through. Each step builds on the last. The biggest wins are Steps 1-3 (sitemap, form fix, schema).

*Questions? Review the full audit report (website-audit-report.md) or the detailed changes document (CHANGES-MADE.md).*
