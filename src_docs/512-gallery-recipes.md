# Gallery of Techniques

Twelve recipes. Each fits on an index card: a name, a source type, a layer stack, key parameters, and an export format. No theory, no background, no history. Just the settings. Reproduce any of these in ten minutes or less.

If you want to understand *why* these values work, the earlier articles in Part 5 explain the reasoning. This page is for people who already understand the reasoning and just need the numbers.

---

## 1. Copper-Plate Portrait

A face rendered in the style of banknote engraving — formal, precise, and hypnotically detailed.

**Source:** High-contrast portrait, directional lighting, clean background.

| Layer | Fill | Interval | Angle | Thickness | Threshold |
|-------|------|----------|-------|-----------|-----------|
| 1 | Linear | 2.0 mm | 15° | Linear, max 0.8 mm | Full range |
| 2 | Linear | 1.8 mm | 75° | Thin, max 0.5 mm | 0–100 |
| 3 | Linear | 1.0 mm | 15° | Thick, max 1.2 mm | 0–60 |
| 4 | Trace | — | — | Fixed 0.3 mm, Smoothing 70 | Full range |

**Masks:** Layers 1–3 masked to face/neck. Layer 4 full canvas.
**Export:** SVG or PDF.
**Full guide:** [Portrait Engraving](502-portrait-engraving.md)

---

## 2. Fingerprint Spiral

A portrait where a single continuous spiral line creates a fingerprint-like image. Mesmerising at any scale.

**Source:** High-contrast face, centred, tight crop.

| Layer | Fill | Interval | Special | Threshold |
|-------|------|----------|---------|-----------|
| 1 | Spiral | 1.5 mm | Centre on nose bridge, Thickness Thick, max 1.0 mm | Full range |
| 2 | Trace | — | Smoothing 60, Thickness 0.2 mm | Midtones 60–200 |

**Masks:** Layer 1 full canvas. Layer 2 full canvas.
**Key move:** Set the Spiral centre precisely on the nose bridge. The spiral radiates outward, thickening in the shadows and thinning in the highlights, creating a fingerprint-portrait hybrid.
**Export:** SVG. Looks stunning as a large-format print.

---

## 3. Pop-Art Halftone

Roy Lichtenstein meets a laser printer. Bold dots, sampled colours, thick outlines.

**Source:** Simple composition with bold shapes — face in profile, single object, graphic scene.

| Layer | Fill | Interval | Special | Threshold |
|-------|------|----------|---------|-----------|
| 1 | Halftone | 3.0 mm | Circle, Grid, Dynamic Color ON | Full range |
| 2 | Linear | 0.6 mm | Flat colour (magenta or cyan) | 0–80 |
| 3 | Trace | — | Smoothing 40, Thickness 1.5 mm | Full range |

**Masks:** Layer 1 full canvas. Layer 2 masked to shadow areas. Layer 3 full canvas.
**Key move:** Dynamic Color on the Halftone layer. The dots carry the source colours.
**Export:** PNG at 300 DPI for posters. SVG for screen printing.
**Full guide:** [Composition Recipes](409-composition-recipes.md)

---

## 4. Topographic Landscape

Rolling hills rendered as contour lines, like a topographic survey map transformed into art.

**Source:** Landscape with smooth rolling terrain, visible depth layers.

| Layer | Fill | Interval | Angle | Special | Threshold |
|-------|------|----------|-------|---------|-----------|
| 1 | Trace | — | — | Smoothing 90, Thickness 0.2 mm | Full range |
| 2 | Circular | 3.0 mm | — | Centre off-canvas bottom | Highlights 140–255 |

**Masks:** Both layers full canvas.
**Key move:** The Trace fill detects tonal boundaries in the terrain, producing contour lines. The Circular fill adds subtle concentric rings that radiate from below the horizon, suggesting depth. Smoothing at 90 makes the contour lines flow like a real survey.
**Export:** SVG. Beautiful as a line-art print.

---

## 5. Wood-Grain

Organic parallel curves that mimic natural wood grain — use for backgrounds, textures, or standalone abstract art.

**Source:** Any photo with smooth tonal gradients. A close-up of actual wood works, but even a portrait creates interesting "wood" patterns.

| Layer | Fill | Interval | Special | Threshold |
|-------|------|----------|---------|-----------|
| 1 | Wave | 1.5 mm | Wave Height 6 mm, Wave Length 30 mm, Angle 0°, Randomization 25% | Full range |
| 2 | Wave | 3.0 mm | Wave Height 10 mm, Wave Length 50 mm, Angle 5°, Randomization 35% | Midtones 40–180 |

**Masks:** Both layers full canvas.
**Key move:** Two Wave layers at slightly different angles and frequencies create interference patterns that look remarkably like wood grain. The randomization adds the irregularity that makes wood look natural.
**Export:** SVG. Works as a texture layer in other compositions.

---

## 6. Newspaper Photo

Vintage newsprint halftone — the look of a 1960s broadsheet photograph reproduced on cheap stock.

**Source:** Any photograph. Portraits and news scenes work best for the nostalgic effect.

| Layer | Fill | Interval | Special | Threshold |
|-------|------|----------|---------|-----------|
| 1 | Halftone | 2.0 mm | Circle, Grid, Angle 45°, Thickness max 1.8 mm | Full range |

**Masks:** Full canvas.
**Key move:** Single Halftone layer. The magic is in the angle (45° is the classic newsprint screen angle) and the interval (2.0 mm gives visible dots that read as "printed" not "digital"). One layer. One fill. Done.
**Export:** PNG. The raster output at screen resolution is part of the aesthetic.

---

## 7. Calligraphic

Graceful, flowing strokes that suggest brush calligraphy — thick on the downstrokes, thin on the upstrokes.

**Source:** Subject with strong vertical forms — a standing figure, a tree, a building.

| Layer | Fill | Interval | Angle | Special | Threshold |
|-------|------|----------|-------|---------|-----------|
| 1 | Wave | 2.0 mm | 80° | Wave Height 8 mm, Length 15 mm, Thickness Thick, max 1.5 mm | Full range |
| 2 | Trace | — | — | Smoothing 80, Thickness 0.15 mm | Midtones 50–200 |

**Masks:** Both full canvas.
**Key move:** The Wave fill at near-vertical angle (80°) with high amplitude and Thick thickness mode creates strokes that swell and taper like brush marks. The subtle Trace outlines provide structure beneath the calligraphic gestures.
**Export:** SVG or PDF.

---

## 8. Geometric Abstraction

Hard-edged geometric zones, each with a different fill, creating a Mondrian-meets-engraving composition.

**Source:** Any photograph with distinct regions (a still life, a cityscape, a face).

| Layer | Fill | Interval | Angle | Special | Mask |
|-------|------|----------|-------|---------|------|
| 1 | Linear | 1.5 mm | 0° | Randomization 0% | Rectangle mask: left third |
| 2 | Linear | 1.5 mm | 90° | Randomization 0% | Rectangle mask: right third |
| 3 | Halftone | 2.0 mm | — | Circle, Grid | Rectangle mask: centre top |
| 4 | Circular | 2.5 mm | — | Centre: canvas centre | Ellipse mask: centre bottom |
| 5 | Trace | — | — | Smoothing 100, Thickness 0.8 mm | Full canvas |

**Key move:** Precise rectangular and elliptical masks create geometric zones. Each zone gets a different fill type, all reading from the same source photo. The bold Trace outlines (0.8 mm) emphasise the zone boundaries.
**Export:** SVG. Strong as a gallery print.

---

## 9. Photo-Mosaic Text

A portrait made entirely of words. Character density follows image tone — dense text in shadows, sparse in highlights.

**Source:** High-contrast portrait, tight crop.

| Layer | Fill | Interval | Special | Threshold |
|-------|------|----------|---------|-----------|
| 1 | Text | 1.2 mm | Font: monospaced (Courier), content: subject's name repeated or a descriptive paragraph | Full range |
| 2 | Trace | — | Smoothing 50, Thickness 0.1 mm | Strong edges only (tight threshold) |

**Masks:** Both full canvas.
**Key move:** The Text fill packs characters where the image is dark and spaces them where it's light. Use the subject's name, a poem, or descriptive text for thematic resonance. The ghost-thin Trace outlines at 0.1 mm provide barely-visible structure.
**Export:** PDF at high resolution. The text must be legible upon close inspection.

---

## 10. Neon Wireframe

A retro-futuristic 3D mesh effect — vaporwave aesthetics, sci-fi terrain, synthwave album covers.

**Source:** A landscape, a face, or any image with smooth tonal gradients.

| Layer | Fill | Interval | Special | Threshold |
|-------|------|----------|---------|-----------|
| 1 | Wireframe | 3.0 mm | Colour: cyan (#00FFFF) | Full range |
| 2 | Wireframe | 3.0 mm | Colour: magenta (#FF00FF), Angle offset 90° from Layer 1 | Full range |

**Masks:** Both full canvas.
**Key move:** Two Wireframe layers at perpendicular angles in neon colours against a black canvas background. The overlapping grids create a luminous 3D mesh. Set canvas colour to pure black for maximum neon contrast.
**Export:** PNG with black background. The raster format preserves the neon-on-black look.

---

## 11. Contour Map

Topographic-style contour lines that trace elevation across the image, creating a map-like abstraction.

**Source:** Landscape or object with smooth tonal gradients. Mountain scenes are the natural fit.

| Layer | Fill | Interval | Special | Threshold |
|-------|------|----------|---------|-----------|
| 1 | Trace | — | Smoothing 95, Spot Size 10 px, Thickness 0.15 mm, Colour: brown (#8B4513) | Full range, stepped |

**Key move:** The single Trace layer does everything. The trick is in the threshold: set multiple threshold bands by stacking several Trace fills, each responding to a different brightness slice. Layer one traces the 0–50 band, layer two traces 50–100, layer three traces 100–150, and so on. Each contour line represents a specific "elevation" (brightness level), just like a real topographic map.

For five contour levels:

| Sub-Layer | Threshold | Colour | Thickness |
|-----------|-----------|--------|-----------|
| 1a | 0–50 | Dark brown | 0.2 mm |
| 1b | 50–100 | Medium brown | 0.15 mm |
| 1c | 100–150 | Tan | 0.15 mm |
| 1d | 150–200 | Light tan | 0.1 mm |
| 1e | 200–255 | Cream | 0.1 mm |

**Export:** SVG or PDF. Beautiful as a minimalist print.

---

## 12. Woven Crosshatch

Two fill families that weave over and under each other like fabric, creating a textile-textured image.

**Source:** Any photograph. Portraits and still lifes show the weave pattern most clearly.

| Layer | Fill | Interval | Angle | Special |
|-------|------|----------|-------|---------|
| 1 (parent) | Linear | 2.0 mm | 0° | Colour: black, Dash 4 mm, Gap 4 mm |
| 2 (clone of 1) | Linear | (inherited) | (inherited) | Colour: dark grey, Shift +1.0 mm |
| 3 (parent) | Linear | 2.0 mm | 90° | Colour: black, Dash 4 mm, Gap 4 mm |
| 4 (clone of 3) | Linear | (inherited) | (inherited) | Colour: dark grey, Shift +1.0 mm |

**Setup:** Enable "Can Cut Other Fills" on Layers 1 and 2. Enable "Can Be Cut By Other Fills" on Layers 3 and 4. The horizontal and vertical families weave through each other.
**Key move:** The Dash/Gap settings (4 mm each) create the over-under rhythm. The shifted clones in each family add a second strand for a denser weave.
**Export:** SVG. Works beautifully printed on textured paper.
**Full guide:** [Cloning for Coordinated Systems](410-cloning-strategies.md)

---

## Using These Recipes

1. **Pick one.** Whichever catches your eye.
2. **Open a source photo.** The recipe suggests a source type, but experiment freely.
3. **Build the layer stack** exactly as specified. Use the parameter values in the table.
4. **Evaluate the result.** It will look good. It might not look perfect for *your* photo.
5. **Adjust.** Tighten or widen intervals, shift thresholds, change angles. The recipe got you to 80% — the last 20% is tuning to your specific image.
6. **Save as a style template** if you like the result. See [Building a Style Library](510-style-libraries.md).

Every recipe here started as an experiment. The best ones will start as a recipe and end as something you've made entirely your own.
