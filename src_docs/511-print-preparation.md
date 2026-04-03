# Preparing Files for Print

Your artwork looks perfect on screen. Then the print arrives and the fine hatching in the shadows has turned into a dark smear, the delicate Trace outlines have vanished, and the background texture that looked subtle at 100% zoom is invisible on paper. The screen lied. Not because the software was wrong, but because screens and presses speak different languages, and translation requires deliberate preparation.

This article covers every setting and decision between "I'm happy with this on screen" and "this printed exactly as intended."

---

## Vector vs. Raster: The Format Decision

Vexy Lines produces vector output (SVG, PDF, EPS) and raster output (PNG, JPEG). The choice depends on your printing method.

| Format | Type | When to Use | When to Avoid |
|--------|------|-------------|---------------|
| **PDF** | Vector | Offset printing, digital press, large format, archival | When the print shop specifically requests another format |
| **SVG** | Vector | Further editing before print, web-to-print services | Direct submission to most commercial printers (they prefer PDF) |
| **EPS** | Vector | Legacy print workflows, older RIP software | Modern workflows (EPS is being phased out) |
| **PNG** | Raster | Inkjet printing, online print services, social media | Offset or large-format where resolution matters |
| **JPEG** | Raster | Quick proofs, email previews | Any final print production (JPEG compression damages line art) |

**The default recommendation: PDF for print.** It embeds vector data, handles colour profiles, and is universally accepted by print shops.

---

## Resolution: What Applies and What Doesn't

Vector output from Vexy Lines is resolution-independent. A PDF of your engraving contains mathematical curve definitions, not pixels. It prints at the resolution of the press — 2400 DPI on an offset press, 1200 DPI on a digital press — regardless of any resolution setting in Vexy Lines.

**When does resolution matter?** Only when exporting raster formats (PNG, JPEG). For raster exports:

| Print Type | Required DPI | Notes |
|------------|-------------|-------|
| Offset printing | 300 DPI | Industry standard for halftone reproduction |
| Digital press | 300 DPI | Same standard, easier to exceed |
| Large format (banners, posters viewed from distance) | 150 DPI | Viewers stand 1–3 metres away; 150 DPI is indistinguishable from 300 at that distance |
| Very large format (billboards) | 72–100 DPI | Viewed from 5+ metres. Even 72 DPI looks sharp. |
| Fine art / giclée | 300–360 DPI | Matches inkjet printer native resolution |

For vector exports (PDF, SVG, EPS), ignore DPI entirely. The printer's RIP handles resolution.

---

## Canvas Size and Physical Dimensions

Before exporting, set your canvas size to match the final print dimensions. If your poster is 18 × 24 inches, set the canvas to 18 × 24 inches. This ensures:

- Fill intervals are physically accurate. An interval of 1.5 mm in the document is 1.5 mm on the print.
- Stroke thicknesses are correct. A 0.3 mm outline is 0.3 mm on paper.
- The print shop doesn't need to scale your file, which can introduce unwanted thickness changes.

If you've been working at a different canvas size (e.g., a smaller size for faster rendering), scale the canvas to the final print size before exporting. Re-render all fills after resizing to recalculate stroke positions at the correct dimensions.

---

## Bleed and Trim

If your artwork extends to the edge of the printed piece (no white border), you need **bleed** — extra artwork that extends beyond the trim line.

### What is bleed?

Printing presses don't cut with pixel-perfect precision. The cut can drift by 1–2 mm. If your artwork stops exactly at the trim line and the cut drifts inward, a sliver of white paper appears at the edge. Bleed prevents this by extending artwork 3–5 mm beyond the trim.

### Adding bleed in Vexy Lines

1. **Set your canvas size** to the final trim size plus bleed on all sides. For a 210 × 297 mm (A4) print with 3 mm bleed: set canvas to 216 × 303 mm.
2. **Extend all fills** to cover the bleed area. Make sure no fill stops at the trim boundary — every fill that touches an edge must extend to the canvas edge (which is now 3 mm beyond the trim).
3. **Adjust masks** to cover the bleed area. If a fill is masked to the background, extend that mask 3 mm beyond where the trim will be.

### Trim marks

Some print shops want trim marks (small lines indicating where to cut) embedded in the file. Others add their own. Ask before adding. If needed, create a thin-stroke rectangle at the trim dimensions on a separate layer, with crop marks extending into the bleed.

---

## Colour: RGB to CMYK

Vexy Lines works in RGB colour space. Most commercial printing uses CMYK (Cyan, Magenta, Yellow, Key/Black). The conversion matters because some RGB colours — particularly bright blues, greens, and oranges — don't have exact CMYK equivalents. They shift during conversion, sometimes noticeably.

### For single-colour (black) artwork

No conversion needed. Export with strokes set to pure black (R:0, G:0, B:0). In CMYK, this maps to K:100 (pure black ink) — the cleanest possible print.

If you want a richer black (for large solid areas), some printers prefer "rich black" (C:40, M:30, Y:30, K:100). But for line art, pure K:100 is standard and avoids registration issues between colour plates.

### For multi-colour artwork

**Option 1: Let the print shop convert.** Export your RGB PDF and tell the printer "please convert to CMYK using [profile]." The most common profile for coated paper is US Web Coated (SWOP) v2 or ISO Coated v2 300%. For uncoated paper, use US Web Uncoated or ISO Uncoated.

**Option 2: Convert before sending.** Open your exported PDF in Acrobat Pro, Illustrator, or Affinity Publisher and convert to the appropriate CMYK profile. Compare the before and after — if any colours shift unacceptably, adjust them in Vexy Lines and re-export.

### For spot colours (screen printing, Pantone)

Use solid flat colours in Vexy Lines (no Dynamic Color). Name your colours to match Pantone references if required. Export as PDF or SVG and communicate the Pantone numbers to the printer separately.

---

## Stroke Thickness for Reproduction

The minimum printable stroke thickness depends on the printing method:

| Method | Minimum Stroke | Notes |
|--------|---------------|-------|
| Offset (coated paper) | 0.15 mm | Excellent fine-detail reproduction |
| Offset (uncoated paper) | 0.2 mm | Ink spreads slightly on absorbent paper |
| Digital press (laser) | 0.2 mm | Toner particles limit fine detail |
| Digital press (inkjet) | 0.25 mm | Ink dot size limits resolution |
| Large format (solvent/eco-solvent) | 0.5 mm | Lower resolution heads |
| Screen printing | 0.3–0.5 mm | Mesh count dependent — see [Preparing for Screen Printing](504-screen-printing.md) |

**Check your Stroke Thickness Min** in the Properties Panel. If it's below the minimum for your print method, increase it. Strokes below the printable minimum will either vanish or bleed into their neighbours.

---

## Large Format Considerations

Printing at poster, banner, or wall-mural scale introduces specific adjustments:

### Widen your intervals

A 1.5 mm interval that looks detailed on an A4 print looks dense and muddy on a 2-metre-wide banner. Scale intervals up proportionally:

| Print Size | Interval Multiplier | Example |
|------------|---------------------|---------|
| A4 (210 mm) | 1.0× (baseline) | 1.5 mm |
| A2 (420 mm) | 1.5–2.0× | 2.2–3.0 mm |
| A0 (841 mm) | 2.5–3.5× | 3.7–5.2 mm |
| 2 metres+ | 4–6× | 6–9 mm |

These are guidelines, not rules. The right interval depends on viewing distance. A poster in a hallway (viewed at 1 metre) needs finer detail than a banner on a building (viewed at 20 metres).

### Increase stroke thickness proportionally

If intervals double, stroke thicknesses should roughly double too. Otherwise, the strokes become invisibly thin relative to the gaps.

### Test at actual size

If you can't print a full-size proof, print a portion at 1:1 scale on standard paper. A 30 × 30 cm section of your banner, printed at actual size, shows you exactly what the final output will look like in that area.

---

## Proofing at 100%

The most common print preparation mistake: evaluating artwork at the wrong zoom level.

**Always proof at 100% (actual pixels or actual size).** At 100% zoom, 1 mm on screen ≈ 1 mm on paper (assuming your screen is roughly calibrated). This shows you the physical stroke spacing and thickness at print scale.

At 50% zoom, strokes look twice as close together and twice as thin as they'll actually print. You'll think the artwork needs more density and increase it — then the print comes out too dark.

At 200% zoom, strokes look twice as far apart and twice as thick. You'll think the artwork needs less density and decrease it — then the print comes out too light.

**Zoom to 100%. Evaluate. Then export.**

If your canvas is larger than your screen at 100%, pan across it in sections. The whole composition matters, but detail quality matters more — and detail quality is only visible at 100%.

---

## Packaging: What to Send the Printer

A print-ready submission includes:

| Item | Purpose |
|------|---------|
| **PDF file** (or SVG/EPS if requested) | The artwork |
| **Proof image** (low-res PNG or JPEG) | Visual reference for the printer to compare against |
| **Specifications document** | Trim size, bleed, colour mode, spot colours, paper stock, quantity |
| **Font info** | Not applicable for Vexy Lines (all text is outlines), but note this if the print shop asks |

### Specifications to communicate

- **Trim size:** 210 × 297 mm (or whatever your target is)
- **Bleed:** 3 mm (or 5 mm, per printer's request)
- **Colour mode:** CMYK (or specify spot colours)
- **Paper stock:** Coated / uncoated / textured / coloured
- **Quantity:** Number of prints
- **Special finishes:** Foil stamping, embossing, spot UV (if applicable)

---

## Screen Print Specifics

For screen printing preparation, see [Preparing for Screen Printing](504-screen-printing.md). The key additional requirements:

- Separate files per colour
- Colour coding for screens
- Registration marks
- Trapping at colour boundaries
- Interval sizing for mesh count

---

## Pre-Flight Checklist

Before sending any file to a printer:

- [ ] Canvas size matches trim dimensions (plus bleed if applicable)
- [ ] All fills have been refreshed at final canvas size
- [ ] Stroke thicknesses are above the minimum for the print method
- [ ] Intervals look correct at 100% zoom
- [ ] Colour mode is appropriate (RGB for digital, CMYK for offset, spot for screen)
- [ ] No elements extend beyond the canvas (unless intentional bleed)
- [ ] Export format is PDF (or as specified by the printer)
- [ ] A proof image is included for visual reference
- [ ] Specifications are documented and attached

---

## Summary

| Decision | Rule of Thumb |
|----------|---------------|
| Format | PDF for print, SVG for editing, PNG for screen |
| DPI (raster only) | 300 for standard, 150 for large format |
| Bleed | 3–5 mm on all sides if art extends to edge |
| Minimum stroke | 0.15–0.5 mm depending on print method |
| Colour | Pure K:100 for black, CMYK profile for colour, Pantone for spot |
| Large format intervals | Multiply baseline by 2–6× depending on size |
| Proof zoom | Always 100% (actual size) |

*Next: [Gallery of Techniques](512-gallery-recipes.md)*
