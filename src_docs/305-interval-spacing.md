# Interval and Spacing: Density Control

Interval is the simplest parameter in Vexy Lines and, pixel for pixel, the most powerful. It is the distance between repeating elements — the gap from one stroke to the next, from one dot row to the next, from one spiral ring to the next. Change it by one millimetre and the entire character of your fill transforms: from a sparse pencil sketch to a dense copperplate engraving, from a polite halftone grid to a crushing wall of dots.

## What Interval Means

For a Linear fill, interval is the perpendicular distance between adjacent parallel lines. For a Circular fill, it is the distance between concentric rings. For a Halftone fill, it is the distance between dot centers in the grid. For a Spiral fill, it is the gap between successive turns. The concept adapts to each algorithm, but the principle is constant: interval defines how much blank space separates the repeating elements.

The value is specified in the document's current units — millimetres, pixels, inches, or points. You can change units in [Document and Canvas Settings](312-document-settings.md), and the interval display updates accordingly. A value of 2 in a millimetre document is 2 mm. Switch to inches and the same physical distance displays as approximately 0.079 in.

## The Density Spectrum

| Interval | Character | Rendering Speed | File Size |
|----------|-----------|-----------------|-----------|
| 0.3–0.8 mm | Ultra-dense. Individual strokes barely visible. Approaches photographic tone. | Slow | Large |
| 0.8–1.5 mm | Dense. Individual strokes visible on close inspection. The classic engraving range. | Moderate | Moderate |
| 1.5–3.0 mm | Medium. Clear line pattern with generous white space. Graphic and readable. | Fast | Small |
| 3.0–6.0 mm | Sparse. Bold, widely spaced elements. Sketch-like or diagrammatic. | Very fast | Very small |
| 6.0–15.0 mm | Decorative. Elements function as independent marks rather than image rendering. | Instant | Tiny |
| 15.0+ mm | Extreme. Only a handful of elements across the canvas. Useful for grids or guides. | Instant | Minimal |

These ranges assume a canvas size of roughly A4 (210 x 297 mm). On a business-card-sized canvas, 3 mm is medium. On a billboard, 3 mm is microscopically dense. Always think of interval relative to your output size.

## Interval and Stroke Thickness: The Density Pair

Interval and [Stroke Thickness](303-stroke-thickness.md) together determine the visual coverage of your fill. The ratio between them controls whether your image reads as an airy sketch or a rich, tonal rendering.

### When Thickness Max Equals Interval

At the darkest point of your image, the stroke width equals the gap between strokes. The result: solid black. No white space visible. The strokes merge into a continuous field of ink. This is useful for dramatic, high-contrast work where you want true blacks, but it sacrifices the visible-line character that makes Vexy Lines distinctive.

### When Thickness Max Is Half the Interval

At the darkest point, the stroke occupies half the available space. You always see individual lines, even in the deepest shadows. This is the sweet spot for most illustration work — dense enough to render tone convincingly, open enough to preserve the line quality.

### When Thickness Max Is a Quarter of the Interval

Strokes are always thin relative to the space around them. Even the darkest areas read as hatching rather than tone. The image has an airy, architectural quality. This works well for technical illustration, line art, and fills where you want the pattern itself to be the visual interest.

### The Formula

A useful rule of thumb: **Thickness Max / Interval = coverage ratio**. At 1.0, you get solid tone in the darks. At 0.5, you get classic engraving density. At 0.25, you get open hatching. Decide on the look you want, then set the ratio accordingly.

| Desired Look | Coverage Ratio | Example: Interval 2 mm | Thickness Max |
|-------------|----------------|------------------------|---------------|
| Solid darks | 1.0 | 2.0 mm | 2.0 mm |
| Rich engraving | 0.6 | 2.0 mm | 1.2 mm |
| Classic hatching | 0.5 | 2.0 mm | 1.0 mm |
| Open sketch | 0.25 | 2.0 mm | 0.5 mm |
| Delicate tracery | 0.1 | 2.0 mm | 0.2 mm |

## Interval and Image Threshold

[Image Threshold](304-image-threshold.md) determines which pixels produce strokes. Interval determines how densely those strokes are spaced. The interaction matters:

- **Wide threshold + tight interval:** Strokes everywhere, closely spaced. Maximum coverage. This is where you get the richest tonal reproduction, but also the largest files and slowest rendering.
- **Narrow threshold + tight interval:** Strokes only in selected tonal bands, but those bands are rendered with dense detail. Useful for the three-fill stack technique described in [Image Threshold: Choosing What Matters](304-image-threshold.md).
- **Wide threshold + wide interval:** Strokes everywhere but sparsely spaced. A quick-rendering sketch with broad coverage but low detail. Good for early composition exploration.
- **Narrow threshold + wide interval:** Strokes only in selected tonal bands, and those bands are rendered sparsely. Minimal visual footprint. Useful for accent fills that add a few strokes in specific regions without competing with the primary fill.

## Per-Fill Differences

While interval means "distance between elements" in every fill type, the visual effect of a given interval value varies:

### Linear, Wave, Wireframe
Interval is the perpendicular distance between adjacent lines. Visually intuitive: double the interval, half the line density.

### Circular
Interval is the radial distance between concentric rings. Near the center, rings are close together regardless of interval because the circumference is small. Near the edges, the same radial interval produces wider-spaced arcs. The result: circular fills always look denser near their center.

### Spiral
Similar to Circular, but the single continuous path means interval is the gap between successive turns. Tight interval produces a densely wound spring. Wide interval produces an open coil.

### Radial
Interval controls the angular spacing between rays, converted to distance at a reference radius. More rays = denser = more coverage. Fewer rays = sparser = more starburst.

### Halftone
Interval is the center-to-center distance of the dot grid. Tight interval means many small dots packed closely — a fine screen. Wide interval means fewer, larger dots — a coarse screen. The dot size itself is controlled by [Stroke Thickness](303-stroke-thickness.md), so interval and thickness together define the halftone's frequency and amplitude.

### Trace
Interval controls the distance between contour levels. Tight interval produces many closely spaced contour lines, like a detailed topographic map. Wide interval produces fewer contours, like a simplified elevation diagram.

### Scribble
Interval influences the density of scribble clusters. Tight interval means the chaotic strokes are packed close together, producing dark, energetic regions. Wide interval spaces them out, producing a looser, more casual scribble.

### Fractal
Interval controls the recursion density of the space-filling curve. Tight interval produces an intricate, tightly woven pattern. Wide interval produces a simpler curve with fewer turns.

## Performance and File Size

Interval has a direct, roughly quadratic relationship with both rendering time and file size. Halving the interval approximately quadruples the number of strokes (twice as many rows, each with proportionally more strokes), which quadruples the rendering time and the file size.

| Interval | Relative Stroke Count | Relative Render Time | Relative File Size |
|----------|----------------------|---------------------|--------------------|
| 4.0 mm | 1x (baseline) | 1x | 1x |
| 2.0 mm | ~4x | ~4x | ~4x |
| 1.0 mm | ~16x | ~16x | ~16x |
| 0.5 mm | ~64x | ~64x | ~64x |

These numbers are approximate — the actual count depends on canvas size, threshold range, and fill type. But the exponential growth is real. Going from 2 mm to 0.5 mm interval on a large canvas can turn a 200 KB SVG into a 12 MB SVG and a 2-second render into a 2-minute render.

**Practical advice:** Start wide (3–4 mm) when exploring compositions. Tighten the interval only after you have settled on your fill types, angles, and threshold ranges. Save the final tightening (below 1 mm) for the last step before export.

## The Density Bomb

A density bomb happens when you set a very tight interval (below 0.5 mm) on a large canvas with a wide threshold range. Vexy Lines will faithfully attempt to generate thousands of strokes per square centimetre. Your computer will slow to a crawl. Your file will balloon to hundreds of megabytes.

Prevention:

1. Turn off **Auto Refresh** before tightening interval below 1 mm. See [Controlling When Vexy Recalculates](112-refresh-controls.md).
2. Use **Refresh Fill** (not Refresh All) to regenerate only the fill you are adjusting.
3. Narrow the [Image Threshold](304-image-threshold.md) range first, so fewer pixels produce strokes.
4. Check the document's global interval minimum in [Document and Canvas Settings](312-document-settings.md). Setting a floor of 0.3 mm prevents accidental sub-millimetre values.

## Step-by-Step: Finding the Right Interval

1. Start at 3.0 mm. This renders quickly and gives you an immediate sense of whether the fill type and angle work for your image.
2. Halve it to 1.5 mm. The fill becomes noticeably denser. Individual strokes are still clearly visible. Evaluate whether the tonal rendering is improving or just getting busier.
3. If you want more density, halve again to 0.75 mm. At this point, rendering may take a few seconds. Check whether the added strokes reveal new detail or just fill space.
4. For final output, choose the widest interval that still renders the tonal detail you need. Every unnecessary stroke costs time and bytes.

## Further Reading

- [Stroke Thickness: Weight from Light](303-stroke-thickness.md) — the partner parameter that, together with interval, defines visual density.
- [Image Threshold: Choosing What Matters](304-image-threshold.md) — controls which pixels produce strokes, complementing interval's control of how densely those strokes are spaced.
- [Controlling When Vexy Recalculates](112-refresh-controls.md) — essential reading before experimenting with tight intervals.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
