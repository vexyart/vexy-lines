# Tattoo Design

Skin is not paper. It stretches, it bleeds ink sideways over time, it wraps around muscles and bones that change shape when the body moves. A design that looks perfect on screen might become an illegible smudge on a forearm after five years. Vexy Lines is an excellent tattoo design tool precisely because it produces clean vector strokes with controllable spacing — but you need to design for the medium, not just the screen.

---

## The Rules of Skin

Before opening Vexy Lines, internalise three constraints that govern every parameter choice:

### 1. No Tiny Details

Ink migrates under the skin over time. Fine lines that are 0.1 mm apart on screen will blur into a solid blob on skin within a few years. The minimum safe spacing between parallel strokes is about 1.5–2.0 mm at the final tattoo size.

This means: **wider intervals than you'd use for print.** A portrait engraving for a poster might use 1.0 mm intervals. The same design for a tattoo needs 2.0 mm minimum.

### 2. Strong Outlines

Outlines contain the design. Without them, shading strokes have no boundary and visually bleed into the surrounding skin. Traditional tattooing uses thick outlines (0.5–1.5 mm at final size) for exactly this reason.

This means: **Trace fill at high thickness, placed on top of everything.**

### 3. Test at Actual Size

A design that looks great at A4 print size might be destined for a 7 cm wrist. Print the design at actual size (1:1 on paper) and examine it. If you can't see individual strokes clearly at arm's length, the intervals are too tight.

---

## General Parameter Guidelines

| Parameter | Tattoo Value | Why |
|-----------|-------------|-----|
| **Interval** | 2.0–3.0 mm (at final size) | Ink migration needs breathing room |
| **Stroke Thickness Max** | 0.8–1.5 mm | Thin strokes fade; thick strokes survive |
| **Stroke Thickness Min** | 0.3 mm | Below 0.3 mm, tattoo needles can't reliably reproduce |
| **Smoothing** | 70–90 | Smooth curves translate better to skin than jagged paths |
| **Randomization** | 0–10% | Controlled precision — the tattoo artist adds organic variation naturally |
| **Min Spot Size (Trace)** | 5–8 px | Prevents tiny contour fragments that can't be tattooed |

---

## Tattoo Styles in Vexy Lines

### Traditional / Old-School

Bold outlines, limited shading, flat colour areas.

| Layer | Fill | Parameters | Mask |
|-------|------|-----------|------|
| 1 | Linear | Interval 2.5 mm, Angle 45°, Thickness mode Thick, max 1.0 mm | Mask to shaded areas only |
| 2 | Trace | Thickness 1.2 mm, Smoothing 80, Spot Size 8 px | Full design area |

The Trace outlines do the heavy lifting. The Linear shading adds tone to specific regions (under a rose petal, behind a banner, inside a shadow). Keep the shading minimal — traditional tattoos are defined by line, not tone.

### Fine-Line

Delicate single-line work with minimal shading. Currently trendy, but prone to fading — design with wider spacing than the style's screen-based examples suggest.

| Layer | Fill | Parameters | Mask |
|-------|------|-----------|------|
| 1 | Linear | Interval 2.5 mm, Angle 15°, Thickness mode Thin, max 0.5 mm | Mask to subtle shading areas |
| 2 | Wave | Interval 3.0 mm, Wave Height 2 mm, Wave Length 12 mm, Thickness max 0.4 mm | Decorative flow areas |
| 3 | Trace | Thickness 0.4 mm, Smoothing 90 | Full design |

Every stroke is thin. The design reads through line placement and density, not through heavy ink. **Warning:** Fine-line tattoos age the fastest. Advise the client that details may blur in 5–10 years.

### Dot-Work

Shading built entirely from dots rather than lines. Maps perfectly to Vexy Lines' Halftone fill.

| Layer | Fill | Parameters | Mask |
|-------|------|-----------|------|
| 1 | Halftone | Shape: Circle, Mode: Random, Interval 2.5 mm | Full design area |
| 2 | Trace | Thickness 0.8 mm, Smoothing 80 | Outlines only |

**Random mode** is critical for dot-work tattoos. Grid mode produces a mechanical pattern that reads as "printed" rather than "tattooed." Random scatters the dots naturally, mimicking hand-poked dot-work.

Set the Halftone interval so the smallest dots (in highlight areas) are at least 0.8 mm in diameter. Smaller dots merge or disappear on skin.

### Blackwork / Heavy Shading

Maximum ink coverage with deep shadows. The inverse of fine-line — bold, dramatic, high-contrast.

| Layer | Fill | Parameters | Mask |
|-------|------|-----------|------|
| 1 | Linear | Interval 1.5 mm, Angle 15°, Thickness mode Thick, max 2.0 mm | Shadow areas |
| 2 | Linear | Interval 1.5 mm, Angle 75°, Thickness mode Thick, max 1.5 mm, Threshold 0–80 | Deep shadow crosshatch |
| 3 | Trace | Thickness 1.5 mm, Smoothing 70 | Full design |

The tight interval (1.5 mm) is acceptable here because blackwork is meant to be dense. The heavy strokes fill the skin with ink. In the deepest shadows, the crosshatch layers produce near-solid black — exactly what blackwork demands.

---

## Placement and Mesh Warping

A tattoo design on screen is flat. A tattoo on a body wraps around a curved surface. Vexy Lines' mesh warping lets you preview how the design looks on its intended placement.

### Forearm

1. Build the design flat.
2. Apply a **Donut** mesh template.
3. Reshape the donut to approximate a cylinder the diameter of a forearm.
4. The design wraps around the curve, compressing at the edges (where the arm curves away from the viewer).
5. Evaluate: do the compressed-edge strokes still have adequate spacing?

### Shoulder / Upper Arm

1. Apply a **Rising** mesh to simulate the deltoid curve.
2. Stretch the mesh to match the shoulder's contour.
3. Check that strokes at the curve's peak (where they compress) don't merge.

### Ribs / Torso

1. Apply a **Rising** or **Falling** mesh to simulate the rib cage curvature.
2. The undulating surface stretches strokes in the valleys and compresses them on the peaks.

**Key question after warping:** Are the most compressed areas still printable? If strokes at the mesh's tightest point are closer than 1.5 mm, widen the interval or simplify the design in that region.

---

## Design Checklist

- [ ] All stroke intervals ≥ 2.0 mm at final tattoo size
- [ ] All stroke thicknesses ≥ 0.3 mm
- [ ] Trace outlines present and ≥ 0.5 mm thick
- [ ] Smoothing ≥ 70 on all fills
- [ ] Min Spot Size ≥ 5 px on Trace fills
- [ ] Design printed at 1:1 scale and reviewed at arm's length
- [ ] Mesh warping tested for intended body placement
- [ ] No isolated tiny elements (dots, short lines) that will blur

---

## Working with the Tattoo Artist

The Vexy Lines output is a *design template*, not a direct tattoo stencil. The tattoo artist will:

- Trace the design onto transfer paper (or use a thermal printer).
- Adjust line weights for their needle setup.
- Modify details based on the client's skin type and body placement.

Provide the artist with:

- **SVG file** (preferred) — scalable, editable.
- **PDF at final size** — printable 1:1 for review.
- **A separate version without outlines** — some artists prefer to draw their own outlines by hand.

Don't over-detail the design. Leave room for the artist's interpretation. A Vexy Lines export with too many micro-details will frustrate the artist and produce a worse tattoo than a cleaner, slightly simpler design.

---

## Export

| Output | Format | Settings |
|--------|--------|----------|
| Design file for artist | SVG | Full detail, all layers |
| Review print | PDF at 1:1 scale | All layers visible |
| Stencil template | SVG, outlines only | Hide all layers except Trace |
| Social media preview | PNG at 150 DPI | All layers, white background |

*Next: [Laser Cutting and CNC](506-laser-cutting.md)*
