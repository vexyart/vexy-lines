# Laser Cutting and CNC

A laser cutter doesn't admire your artwork. It follows paths. Every vector stroke in your Vexy Lines export becomes a command: move here, fire the laser, cut or engrave. The difference between a successful cut and a charred mess is whether those paths were designed for a machine rather than a screen.

This article covers the translation from Vexy Lines vector output to machine-ready files for laser cutters, CNC routers, and vinyl cutters.

---

## Two Operations: Cut and Engrave

Laser cutters perform two fundamentally different operations, and Vexy Lines handles both:

| Operation | What the Laser Does | Vexy Lines Fill | SVG Element |
|-----------|-------------------|----------------|-------------|
| **Cut** | Burns through the material along a path | **Trace** (outlines) | Stroke (no fill) |
| **Engrave** | Rasters or scores the surface following a path | **Linear, Halftone, Wave**, etc. | Stroke (no fill) |

**Cutting** follows the path once and severs the material. You want clean closed paths — the outlines of the shapes you're cutting out.

**Engraving** follows the path to mark the surface without cutting through. You want fill patterns — the decorative strokes that texture the surface.

Most laser projects use both: Trace fills for the cut paths, Linear/Halftone/Wave fills for the engraved decoration.

---

## Layer Colour Coding

Most laser software (LightBurn, LaserGRBL, Glowforge, RDWorks) uses path colour to determine operation type and settings. The convention:

| Colour | Operation | Typical Settings |
|--------|-----------|-----------------|
| **Red** | Cut (through) | High power, low speed, single pass |
| **Black** | Engrave (mark surface) | Lower power, higher speed, single or multiple passes |
| **Blue** | Score (light surface mark) | Low power, high speed |

In Vexy Lines:

1. Set your **Trace fill** (cut paths) colour to **red**.
2. Set your **shading fills** (engrave patterns) colour to **black**.
3. Set any **light score marks** colour to **blue**.

When the laser software imports the SVG, it automatically groups paths by colour and applies the corresponding power/speed settings.

---

## Trace for Cutting

The Trace fill generates the contour paths that become your cut lines. For laser cutting, set it up carefully:

| Parameter | Value | Why |
|-----------|-------|-----|
| **Smoothing** | 40–60 | Enough to avoid jagged corners but not so much that sharp features round off |
| **Min Spot Size** | 8–15 px | Eliminates tiny contour fragments that the laser would try to cut — wasting time and potentially damaging the material |
| **Threshold** | Adjusted to capture only the edges you want to cut | Too sensitive = too many contours = confusing cut paths |
| **Colour** | Red (or your laser software's cut colour) | Identifies these paths as cut operations |

### Closed Paths

Laser cutting requires **closed paths** — the path must start and end at the same point to cut out a complete shape. Trace fills in Vexy Lines typically produce closed contours, but complex images can generate open paths (contours that run off the canvas edge).

After export, open the SVG in a vector editor and verify that cut paths are closed. Most laser software will also warn about open paths.

---

## Linear and Halftone for Engraving

Fill patterns become the engraved decoration on the material surface. The laser follows each stroke path, scoring the surface.

### Linear Engraving

| Parameter | Value | Why |
|-----------|-------|-----|
| **Interval** | 0.5–1.5 mm (depends on material and laser) | Must be wider than the laser beam width (typically 0.1–0.3 mm) |
| **Angle** | Your choice — 0°, 45°, or matching the design | Affects visual texture of the engraved surface |
| **Smoothing** | 50–70 | Smooth paths mean fewer direction changes, which means cleaner engraving |
| **Stroke Thickness** | Set to a single weight (0.2–0.5 mm) or use brightness mapping | Single weight for consistent engraving depth; mapped weight for variable depth |
| **Randomization** | 0–5% | Machines don't benefit from randomization; keep paths predictable |
| **Colour** | Black | Identifies as engrave operation |

### Halftone Engraving

Halftone fills produce dot patterns where the laser engraves individual dots of varying sizes. The effect on wood or acrylic is striking — a photographic image rendered as burned dots.

| Parameter | Value | Why |
|-----------|-------|-----|
| **Shape** | Circle | Circles engrave most cleanly (no sharp corners for the laser to navigate) |
| **Mode** | Grid | Predictable spacing prevents overlapping burns |
| **Interval** | 1.0–2.0 mm | Spacing between dot centres; must accommodate the largest dot |
| **Colour** | Black | Engrave operation |

---

## Critical: Minimum Detail Size

Every laser has a **beam width** — the diameter of the focused laser spot. This is typically:

- **CO2 lasers:** 0.1–0.3 mm
- **Diode lasers:** 0.08–0.15 mm
- **Fibre lasers:** 0.02–0.05 mm

**No stroke or gap in your design should be smaller than the beam width.** If the laser beam is 0.2 mm wide and your fill produces strokes with 0.15 mm gaps between them, the laser will burn through the gaps — turning your engraving into a cut.

Safe minimums:

| Detail | Minimum Size |
|--------|-------------|
| Stroke thickness | Beam width × 1.5 (e.g., 0.3 mm for a 0.2 mm beam) |
| Gap between strokes | Beam width × 2 (e.g., 0.4 mm for a 0.2 mm beam) |
| Smallest Halftone dot | Beam width × 3 (e.g., 0.6 mm for a 0.2 mm beam) |
| Interval | Stroke thickness + gap (e.g., 0.7 mm minimum) |

---

## Stroke vs. Fill in SVG

This is a critical technical distinction for laser work:

- **Stroke** (vector path with a line width) = the laser follows the path. This is what you want.
- **Fill** (enclosed shape filled with solid colour) = the laser rasters the enclosed area back and forth. This is slower and sometimes undesirable.

Vexy Lines exports strokes as vector paths — which is correct for laser work. But be aware:

- Some vector editors convert strokes to filled outlines during editing. If you edit the SVG in Illustrator, verify that paths remain as strokes, not filled shapes.
- Some laser software interprets thick strokes differently than thin ones. Test with your specific software.

---

## Materials

Different materials respond differently to laser engraving and cutting. Here's how Vexy Lines parameters should adjust:

### Wood (Plywood, MDF, Hardwood)

- **Engraving:** Linear or Halftone at 1.0–1.5 mm interval. Wood engraves beautifully with visible burn contrast.
- **Cutting:** Trace outlines. Multiple passes may be needed for thick stock.
- **Tip:** Wider intervals (2.0+ mm) on softwoods like pine, which burn more aggressively. Tighter intervals (1.0 mm) on hardwoods like maple, which handle detail well.

### Acrylic

- **Engraving:** Produces a frosted white mark on clear acrylic. Halftone fills look especially good — the frosted dots catch light.
- **Cutting:** Clean edges when well-calibrated. Trace outlines work perfectly.
- **Tip:** Acrylic melts rather than burns. Tight intervals (< 0.8 mm) can cause melting between strokes. Keep intervals at 1.0 mm+.

### Paper and Cardboard

- **Engraving:** Light scoring. Reduce laser power significantly. Linear fills at 1.5–2.0 mm interval.
- **Cutting:** Easy to cut. Trace outlines with single pass.
- **Tip:** Paper is the ideal test material. Run every design on cardboard first before committing to expensive stock.

### Leather

- **Engraving:** Beautiful results. The burn darkens the leather surface. Linear and Wave fills produce an embossed-leather effect.
- **Cutting:** Works well for thin leather (< 3 mm).
- **Tip:** Leather warps when heated. Use wider intervals (2.0+ mm) and multiple light passes instead of one heavy pass.

### Metal

- **Engraving only** (most hobby lasers can't cut metal). Fibre lasers engrave metal directly; CO2 lasers need marking spray.
- **Tip:** Keep intervals tight (0.5–0.8 mm) on metal — the marks are subtle and benefit from density.

---

## The Test-on-Cardboard Rule

Never run a design on your final material without testing on cardboard first. Cardboard is cheap, cuts easily, and reveals problems:

- Are the cut paths closed? (If not, the piece won't separate.)
- Are the engrave intervals wide enough? (If strokes merge into solid burns, widen the interval.)
- Are there tiny fragments? (If the laser spends time on microscopic contours, increase Min Spot Size in the Trace fill.)
- Does the design fit? (Print at 1:1 or cut on cardboard at 1:1 to check physical dimensions.)

---

## Export Settings

| Setting | Value |
|---------|-------|
| **Format** | SVG |
| **Colour coding** | Red = cut, Black = engrave, Blue = score |
| **Canvas size** | Match material dimensions |
| **Smoothing** | 40–60 on all fills |
| **Stroke output** | Paths (not filled outlines) |

After exporting, open the SVG in your laser software and verify:

1. Cut paths (red) are closed and form complete shapes.
2. Engrave paths (black) are within the material boundary.
3. No paths extend beyond the material dimensions.
4. Path count is reasonable (thousands, not millions — a million paths will take hours to process).

---

## Summary

| Vexy Lines Fill | Laser Operation | Colour | Key Parameters |
|----------------|----------------|--------|---------------|
| Trace | Cut | Red | Smoothing 40–60, Spot Size 8–15 px |
| Linear | Engrave | Black | Interval ≥ beam width × 3, Randomization 0–5% |
| Halftone | Engrave | Black | Circle shape, Grid mode, Interval ≥ 1.0 mm |
| Wave | Engrave | Black | Smoothing 50+, moderate amplitude |

*Next: [Botanical Illustration](507-botanical-illustration.md)*
