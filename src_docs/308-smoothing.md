# Smoothing and Curve Quality

Every stroke Vexy Lines generates begins as a series of points — coordinates calculated from the source image, the fill algorithm, and the parameter values you have set. Smoothing is the negotiation between those raw points and the curves that connect them. At zero, the stroke follows every pixel boundary with angular fidelity, corners and all. At maximum, the stroke flows like calligraphy, ignoring small-scale detail in favour of elegance. Neither extreme is universally correct. The right value depends on what you are making and where it is going.

## How Smoothing Works

The fill algorithm generates a set of coordinates along each stroke path. These points follow the source image's brightness contours — they zig where the brightness changes, zag where an edge appears, and step along pixel boundaries where the image is noisy.

The Smoothing parameter (0–100) controls how aggressively Vexy Lines fits curves through these points:

- **At 0:** Every calculated point is honoured. The stroke path passes through every coordinate, producing tight corners and pixel-stepped edges. The output is maximally faithful to the source data.
- **At 50:** Points that deviate less than a moderate tolerance from a smooth curve are dropped. The stroke rounds corners and skips minor jags. The output follows the source data's broad contours but not its noise.
- **At 100:** Only the most structurally significant points are retained. The stroke becomes a series of long, flowing Bezier curves that approximate the overall shape while ignoring local detail. The output is elegant but may lose fine features.

## The Trade-Off

Smoothing always trades detail for elegance. The question is where the balance point lies for your specific project.

### What You Gain with Higher Smoothing

- **Aesthetic flow.** Strokes look confident and intentional, like pen work by a skilled draughtsman.
- **Smaller files.** Fewer control points mean simpler path data. An SVG with smoothing at 80 can be half the size of the same fill at smoothing 0. For web delivery, this matters.
- **Faster rendering.** Fewer points mean less computation when the file is displayed, rasterised, or printed.
- **Cleaner cutting.** Laser cutters and vinyl plotters follow smoother paths more accurately. Tight corners at low smoothing can cause mechanical chatter.

### What You Lose with Higher Smoothing

- **Fine detail.** A face with subtle laugh lines loses them. A building with ornamental stonework blurs into a smooth surface. A tree's individual leaves merge into a rounded canopy.
- **Edge accuracy.** The Trace fill, which follows image contours, becomes an approximation of those contours rather than a faithful tracing.
- **Texture.** The pixel-level roughness that low smoothing preserves can function as visual texture — a grain that gives the stroke character. High smoothing sands it away.

## Smoothing by Use Case

| Use Case | Smoothing Value | Why |
|----------|----------------|-----|
| Pixel art conversion | 0–10 | Preserve the pixel grid. Each step in the stroke aligns with the source pixel boundary. |
| Detailed technical illustration | 10–30 | Retain fine features (bolt threads, circuit traces, anatomical detail) while removing pixel noise. |
| General illustration | 30–50 | A balanced default. Strokes are smooth enough to look hand-drawn, detailed enough to convey the image. |
| Laser cutting / vinyl plotting | 40–60 | Smooth enough for clean mechanical execution, detailed enough to capture the design's character. |
| Artistic line work | 50–70 | Flowing, confident strokes with intentional simplification. Fine art and editorial illustration. |
| Fine art / gallery prints | 70–90 | Maximally elegant strokes. The fill's pattern and the image's broad tonal structure are the subject, not pixel-level detail. |
| Calligraphic effects | 85–100 | Long, sweeping curves with minimal inflection. Best paired with wide intervals and bold thickness. |

## Smoothing and Trace Fills

For the Trace fill, smoothing is not just cosmetic — it is structurally critical. Trace generates contour lines that follow brightness boundaries in the source image. At smoothing 0, those contours follow every pixel step, producing jagged outlines that look like low-resolution bitmap traces. At smoothing 50–70, the contours become the clean, flowing outlines you expect from vector art.

If you are using Trace as the basis for an outline illustration, start at 60 and adjust from there. Below 40, Trace outlines look rough. Above 85, they lose the fidelity that makes Trace useful as a contour-following tool — they become generic rounded shapes that could have come from any vector drawing app.

## Smoothing and File Size

The relationship between smoothing and file size is significant and predictable:

| Smoothing | Relative Point Count | Relative File Size |
|-----------|---------------------|-------------------|
| 0 | 1x (baseline) | 1x |
| 25 | ~0.6x | ~0.6x |
| 50 | ~0.35x | ~0.4x |
| 75 | ~0.2x | ~0.25x |
| 100 | ~0.1x | ~0.15x |

These ratios are approximate and vary with the source image's complexity. A smooth studio portrait with soft gradients has fewer raw points to begin with, so smoothing has less impact. A noisy outdoor photo with complex detail has many raw points, and smoothing dramatically reduces them.

For a document with multiple fills and tight intervals, increasing smoothing from 30 to 70 on all fills can reduce the total SVG size by 40–60%. If you are exporting for web delivery and the files are larger than expected, smoothing is the first parameter to revisit.

## Smoothing vs. Thickness Smoothing

Vexy Lines has two different smoothing controls, and they are easy to confuse:

- **Smoothing** (this article) affects the shape of the stroke path — where the stroke goes, how it curves, how many control points define it.
- **Thickness Smoothing** (in the [Stroke Thickness](303-stroke-thickness.md) section) affects the weight of the stroke along its length — how rapidly the thickness changes as the stroke crosses from dark to light regions.

They are independent. You can have high path smoothing (flowing curves) with low thickness smoothing (rapid weight changes), producing strokes that flow smoothly but pulse between thin and thick. Or low path smoothing (jagged corners) with high thickness smoothing (gradual weight changes), producing angular strokes with even, consistent weight.

For most work, set both to similar values. But when they diverge, the visual effect is distinctive and worth exploring.

## Smoothing and Randomisation

[Randomisation](307-randomisation.md) displaces stroke positions from their ideal grid. Smoothing then determines how those displaced strokes are drawn.

- **High randomisation + low smoothing:** Strokes are displaced and jagged. The effect is electric, agitated, nervous. Useful for textures that represent anxiety, turbulence, or decay.
- **High randomisation + high smoothing:** Strokes are displaced and flowing. The effect is organic, warm, hand-drawn. Useful for natural textures — hair, grass, water, fabric.
- **Low randomisation + low smoothing:** Strokes are regular and jagged. Pixel-grid fidelity with mechanical precision. Useful for digital-aesthetic or retro-computing effects.
- **Low randomisation + high smoothing:** Strokes are regular and flowing. Clean, elegant, professional. The most common combination for polished illustration.

## Smoothing and Output Medium

The destination of your artwork should influence your smoothing choice:

### Screen Display (72–144 DPI)

At screen resolution, individual control points are invisible. Smoothing values above 40 are largely indistinguishable from each other on screen. Optimise for file size by pushing smoothing to 60–80. The viewer will never see the lost detail at screen pixel density.

### Print (300+ DPI)

At print resolution, the difference between smoothing 40 and 70 is visible under close inspection. If your print will be examined at arm's length (a book illustration, a poster), smoothing 50–70 works well. If it will be examined under a loupe (fine art prints, philatelic reproductions), keep smoothing below 40.

### Laser Cutting / Plotter Output

Mechanical output devices physically follow the path. Sharp corners at low smoothing cause the cutting head to decelerate, stop, and change direction — increasing cut time and potentially burning the material. Smoothing at 40–60 produces paths that the machine can follow at consistent speed with clean results.

### Embroidery / CNC

Similar to laser cutting but even more sensitive to sharp direction changes. Smoothing at 60–80 is typically necessary for clean output.

## Step-by-Step: Finding the Right Smoothing

1. Start at 40. This is a safe middle ground — smooth enough to look professional, detailed enough to capture the image.
2. Zoom to 100% and examine a region with fine detail (eyes in a portrait, window frames in a building, leaf edges in a landscape). Is the detail preserved?
3. Zoom to 200% and examine a region with simple tonal gradients (a smooth wall, a clear sky, a cheek). Are the strokes flowing and clean, or do they jitter?
4. If detail is being lost, reduce smoothing by 10. If strokes are jittery, increase by 10.
5. Check file size after export. If it is larger than your delivery requirements allow, increase smoothing in steps of 10 until the file is within budget.
6. For Trace fills, always check smoothing separately from other fills. Trace is the most smoothing-sensitive fill type.

## Further Reading

- [Stroke Thickness: Weight from Light](303-stroke-thickness.md) — includes Thickness Smoothing, the companion control for weight transitions.
- [Randomisation and Organic Feel](307-randomisation.md) — randomisation and smoothing together define the organic quality of strokes.
- [Interval and Spacing: Density Control](305-interval-spacing.md) — more strokes (tighter interval) mean more control points, amplifying smoothing's file-size impact.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
