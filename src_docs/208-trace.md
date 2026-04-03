# Trace: Finding Edges

Every other fill in Vexy Lines asks the same question: "How bright is this pixel?" Trace asks a different one: "Where does brightness change?" It ignores flat areas entirely and hunts for boundaries --- the edge of a jaw against a background, the line where shadow meets light, the border between one colour region and another. It converts those boundaries into clean vector paths. No fill patterns, no dot grids, no parallel lines. Just edges.

The result is closer to auto-tracing than to engraving. But unlike generic auto-tracers, Trace is designed to work *alongside* other Vexy Lines fills. Use it alone for silhouettes and logo vectorisation. Combine it with Linear or Halftone for outline-plus-shading compositions that rival hand-drawn illustration.

---

## What It Looks Like

Clean vector outlines following the contours of your source image. High-contrast edges produce thick, confident paths. Subtle transitions produce thin, tentative ones (or nothing at all, depending on your threshold setting). The output resembles a line drawing extracted from a photograph --- the kind of illustration you might find in a technical manual, an architectural rendering, or a comic book before the colourist gets involved.

At low sensitivity, Trace captures only the strongest edges: the outline of a face, the border of a building. At high sensitivity, it captures everything: wrinkles, hair strands, fabric folds, background noise. The skill lies in finding the right balance for your subject.

---

## When to Use Trace

- **Logo and icon vectorisation:** Convert a raster logo into clean vector paths with one fill.
- **Silhouettes and outlines:** Extract the outer boundary of a subject for cutting machines, screen printing, or overlay compositions.
- **Contour map illustration:** Layer multiple Trace fills at different thresholds to create topographic-style contour lines.
- **Comic book inking:** Trace provides the outlines; other fills provide the shading. The combination is classic.
- **Cutting and plotting paths:** Trace output is inherently suitable for vinyl cutters, laser cutters, and pen plotters that follow paths rather than filling areas.
- **Edge-plus-fill compositions:** Trace for structure, [Linear](202-linear.md) or [Halftone](207-halftone.md) for tonal rendering. See [Combining Fills](214-combining-fills.md).

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Smoothing** | Controls path smoothness, from pixel-precise staircase edges to flowing organic curves. 0--100. | 0 for pixel-art aesthetic (every staircase preserved). 30--50 for general use. 80--100 for flowing, simplified contours. |
| **Min Spot Size** | Minimum area (in pixels) for a detected region to generate a path. Eliminates noise and small artifacts. | 5 px for basic cleanup (removes dust and single-pixel noise). 20 px for medium cleanup. 50 px for capturing only major shapes. 200+ px for extreme simplification. |
| **Image Threshold** | Controls which brightness boundaries count as edges. Low values trace everything; high values trace only strong contrasts. | Full range to trace all visible edges. Narrow the shadow handle for high-contrast-only detection. Pull both handles inward for a specific brightness band. |
| **Stroke Thickness** | Weight of the traced outlines. Can be uniform or brightness-mapped. | Uniform 0.5--1 pt for clean technical outlines. Brightness-mapped (Linear mode) for artistic weight variation. |
| **Smoothness** | Curve fitting quality. Higher values produce fewer control points and smoother curves. | Low (10--20) for detailed, accurate tracing. High (60--80) for simplified, illustrative outlines. |
| **Dynamic Color** | Traced paths sample the source colour at each edge point. | Off for monochrome outlines. On for outlines that carry the colours of the boundaries they trace. |
| **Multiplier** | Scales overall outline weight. | 1.0 default. 2.0--3.0 for bold comic-book outlines. 0.5 for delicate tracing. |

---

## Step-by-Step: High-Contrast Logo Vectorisation

This walkthrough converts a raster logo (a high-contrast black-and-white image) into clean vector paths.

### 1. Prepare your image

Start with a high-contrast version of the logo. If the original is not already black-and-white, increase the contrast in any image editor before importing. Sharp edges produce better traces than soft gradients.

File > New, drag in the logo image.

### 2. Add a Trace fill

Click **+** in the Layers Panel. Select **Trace**. Vector paths appear along the detected edges.

### 3. Set Smoothing

- **Smoothing:** 60. High enough to produce clean curves without pixel staircase artifacts, but not so high that sharp corners become rounded.

For logos with intentionally sharp corners (geometric logos, block text), reduce to 20--30 to preserve angular geometry. For logos with organic curves (script lettering, illustrated marks), increase to 70--80.

### 4. Eliminate noise

- **Min Spot Size:** 50 px. This removes any small artifacts, stray pixels, or background noise. Only shapes with an area of 50 pixels or more generate paths.

If important small details (dots on letters, thin strokes) disappear, reduce Min Spot Size to 10--20 px. If unwanted noise persists, increase to 100+ px.

### 5. Narrow the threshold

For a clean black-on-white logo, the Image Threshold should capture only the boundary between black and white. Drag both handles inward so only the middle brightness range triggers edge detection. This focuses Trace on the actual logo edges and ignores any slight grey variations in the background.

### 6. Check the stroke weight

- **Stroke Thickness:** Set to a uniform weight rather than brightness-mapped. A logo vectorisation typically wants consistent outline weight.
- **Multiplier:** 1.0 for standard weight. Increase if the outlines are too thin to see clearly.

### 7. Export

Export as SVG. The traced paths are clean vector outlines suitable for scaling to any size. Open in Illustrator or Affinity Designer for further refinement if needed.

---

## Creative Variations

### Pixel-Art Aesthetic

Smoothing at 0. Every pixel staircase is preserved. The traced edges look like they came from an 8-bit video game: blocky, angular, unapologetically digital. Apply to a photograph and the result is a strange hybrid of photographic content and pixel-art rendering. Works well at low resolution --- resize your source image to 200x200 pixels before importing for maximum effect.

- **Smoothing:** 0
- **Min Spot Size:** 3 px
- **Stroke Thickness:** Uniform, 1 pt

### Fluid Illustration Outlines

Smoothing at 90--100. Min Spot Size at 30 px. The traced paths become flowing, simplified contours that suggest the subject rather than precisely reproducing it. Fewer control points, more gestural energy. The result looks like an illustrator's confident ink line, not a mechanical trace.

Combine with Dynamic Color (on) so the outlines carry hints of the source image's palette. The colour information is subtle but adds warmth.

### Layered Contour Map

Multiple Trace fills, each targeting a different brightness band, stacked to create topographic contour lines:

- Fill 1: Image Threshold handles at 20%--30%. Traces the boundary between the darkest shadows and everything else. Thick stroke (Multiplier 2.0). Colour: black.
- Fill 2: Threshold at 40%--50%. Mid-shadow contour. Medium stroke (Multiplier 1.5). Colour: dark grey.
- Fill 3: Threshold at 60%--70%. Mid-tone contour. Standard stroke (Multiplier 1.0). Colour: medium grey.
- Fill 4: Threshold at 80%--90%. Highlight contour. Thin stroke (Multiplier 0.7). Colour: light grey.

The result: a portrait (or landscape) rendered as nested contour lines, each representing a different elevation of brightness. From a distance, it reads as a topographic map of light.

### Trace + Linear: The Classic Combo

This is the bread and butter of multi-fill composition:

- Trace fill: Smoothing 50, Min Spot Size 20, bold outlines (Multiplier 2.0). Provides structure and definition.
- [Linear](202-linear.md) fill: Interval 1.5 mm, Angle 45°, threshold narrowed to exclude highlights. Provides tonal shading inside the traced outlines.

The Trace fill draws the "ink lines." The Linear fill draws the "shading." Together, they produce an illustration that looks hand-drawn by someone who is very good at their job. See [Combining Fills](214-combining-fills.md) for the full multi-layer recipe.

### Silhouette Extraction

Push the threshold to capture only the strongest contrast boundary --- the outline of the subject against the background:

- **Image Threshold:** Narrow to detect only the darkest-to-lightest transitions.
- **Min Spot Size:** 100+ px. Kill everything except the main subject outline.
- **Smoothing:** 60--70.
- **Stroke Thickness:** Uniform, heavy weight.

The result: a clean silhouette path around your subject. Export as SVG for use as a cutting path (vinyl cutters, laser cutters) or as a mask in other design software. If you need a filled silhouette rather than just an outline, use the traced path as a mask for a solid fill.

---

## Tips

- **Trace is not a replacement for dedicated auto-tracers** (like Adobe's Image Trace or Potrace). Those tools are optimised for precise bitmap-to-vector conversion with extensive settings for curve fitting, corner detection, and colour quantisation. Trace is optimised for integration with other Vexy Lines fills. Use it for artistic edge detection and multi-fill compositions, not for production-quality logo conversion of complex raster art.
- **Start with Min Spot Size high, then lower it.** Begin at 50 px. See which shapes are captured. Lower gradually until the important details appear. This is faster than starting low and trying to eliminate thousands of noise paths.
- **Image Threshold is your most powerful control.** More than any other fill, Trace's character changes dramatically with threshold adjustments. The same image can produce delicate detail tracing or bold silhouette outlines depending entirely on where you place the histogram handles.
- **Smoothing and Min Spot Size trade off.** High smoothing with low min spot size produces many smooth paths (slow to render, potentially noisy). High smoothing with high min spot size produces few smooth paths (fast, clean). Find the combination that captures your subject without the noise.
- **Trace works on any image, but high contrast works best.** Photographs with crisp edges (architecture, text, objects on white backgrounds) trace cleanly. Photographs with soft gradients (foggy landscapes, soft-lit portraits) produce ambiguous edges. Increase contrast in your image before importing if Trace is not finding the edges you want.
- **Use Trace as a structural skeleton.** In complex compositions, Trace provides the visual framework --- the outlines that tell the viewer what they are looking at. Other fills provide texture, tone, and colour within that framework. This division of labour produces results that neither fill could achieve alone.

---

*Previous: [Halftone: Dots and Shapes](207-halftone.md) | Next: [Wireframe: Dimensional Lattice](209-wireframe.md)*
