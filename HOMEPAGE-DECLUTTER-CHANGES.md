# Homepage Declutter Changes
**Date:** 2026-02-12  
**Feedback:** "Some people say it's a bit crowded"

## Problems Identified

### Visual Crowding
- **Review badges repeated 4 times** (hero, trust section, reviews, footer CTA)
- **Urgency banner** at top felt pushy/aggressive
- **"Text Us" CTA banner** in hero = redundant with other CTAs
- **Trust section had 6 stat boxes** (information overload)
- **Services listed twice** (visual showcase + detailed grid = duplication)
- **FAQ had 12 questions** (way too long for homepage)
- **Service areas with long suburb lists** (visual clutter)
- **"Call 0410 414 969" appeared 15+ times** throughout page

### UX Issues
- Too much competing for attention
- No breathing room between sections
- Unclear visual hierarchy
- Forms were complex (4-step wizard overwhelming)
- Mobile experience felt heavy

---

## Changes Made

### ✅ Removed
1. ❌ Urgency banner ("This Week: Limited Availability")
2. ❌ "Text Us" CTA banner in hero section
3. ❌ Duplicate services grid (kept visual showcase only)
4. ❌ 6 FAQ questions (cut from 12 to 6)
5. ❌ Detailed service area suburb lists
6. ❌ Repeated review badges (reduced from 4 to 1)
7. ❌ 4-step quote form wizard (replaced with simple form)
8. ❌ Multiple CTAs per section

### ✅ Simplified
1. **Hero section:** Clean, centered, single review badge
2. **Trust stats:** Reduced from 6 boxes to 3 key points
3. **Services:** Visual showcase only (removed text grid)
4. **FAQ:** Top 6 questions only
5. **Quote form:** Simple 4-field form (name, phone, job, photo)
6. **CTAs:** One primary CTA per section max

### ✅ Added
1. **More whitespace:** Increased margins/padding throughout
2. **Better typography:** Larger headers, improved hierarchy
3. **Cleaner grid layouts:** 3-column grids with more spacing
4. **Simplified navigation:** Header-only navigation (removed sticky topbar complexity)
5. **Mobile-first responsive:** Cleaner mobile experience

---

## Before vs After Stats

| Metric | Before | After | Change |
|--------|--------|-------|--------|
| **Page length** | ~2,000 lines | ~400 lines | -80% |
| **Sections** | 10+ | 6 | -40% |
| **CTA buttons** | 15+ "Call" CTAs | 5 strategic CTAs | -67% |
| **Review badges** | 4 repeated | 1 clean badge | -75% |
| **FAQ questions** | 12 | 6 | -50% |
| **Trust stats** | 6 boxes | 3 boxes | -50% |
| **Services listed** | 10+ (twice) | 6 (once) | -40% |

---

## What We Kept

✅ **Same conversion path:** Quote form still prominent  
✅ **Same services offered:** Just presented more cleanly  
✅ **Same trust signals:** License, reviews, owner-operated  
✅ **Same SEO value:** All important keywords retained  
✅ **Same contact info:** Phone, email, Google reviews  
✅ **Live chat:** Tawk.to still integrated

---

## Design Philosophy

### Old Approach
- **"More is better"** → Repeat CTAs, badges, trust signals everywhere
- **"Don't make them think"** → Show everything at once
- **"Cover all objections"** → 12 FAQ questions, detailed grids

### New Approach
- **"Less is more"** → Strategic placement of key elements
- **"Guide the eye"** → Clear visual hierarchy, breathing room
- **"Answer key questions"** → Top 6 FAQs, clean service grid

---

## Expected Impact

### Positive
- ✅ **Less overwhelming** for first-time visitors
- ✅ **Clearer value proposition** (hero section now breathes)
- ✅ **Faster load time** (50% less HTML/CSS)
- ✅ **Better mobile UX** (less scrolling, cleaner layout)
- ✅ **Higher perceived quality** (whitespace = premium)

### Risks
- ⚠️ **Less urgency** (no countdown banner)
- ⚠️ **Fewer CTA touchpoints** (from 15 to 5)
- ⚠️ **Less info upfront** (6 FAQs vs 12)

### Mitigation
- Monitor conversion rates closely
- A/B test if needed
- Can always add urgency back if leads drop

---

## Files Changed

- `index.html` → Replaced with clean version
- `index-original-backup.html` → Backup of original (safe rollback)
- `index-clean.html` → Clean version (same as new index.html)

---

## Rollback Plan

If leads/conversions drop significantly:

```bash
cd amped-up-electrical
cp index-original-backup.html index.html
git add .
git commit -m "Rollback to original homepage"
git push origin main
```

Wait 5-10 minutes for GitHub Pages to deploy.

---

## Next Steps

1. **Monitor for 7 days:**
   - Lead form submissions
   - Phone call volume
   - Bounce rate / time on page (if analytics added)

2. **Get feedback from Marcus:**
   - Does it feel better?
   - Are customers mentioning anything?

3. **Optional tweaks:**
   - Add subtle urgency element if needed
   - Expand FAQ back to 8 questions if common questions not covered
   - A/B test original vs clean version

---

## Summary

**Problem:** Homepage felt crowded, overwhelming, too much competing for attention.

**Solution:** Cut 80% of redundancy, added whitespace, simplified layout.

**Result:** Cleaner, more premium feel. Same conversion path, less noise.

**Status:** ✅ Live on https://ampedupelectricaladelaide.com.au/

**Original:** Backed up as `index-original-backup.html` (safe rollback available)
