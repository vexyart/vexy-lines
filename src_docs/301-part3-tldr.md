# The Control Surface

Every fill in Vexy Lines is born equal — a blank algorithm waiting for instructions. The Properties Panel is where you give those instructions. It is a single vertical column on the right side of the workspace, and it changes its contents depending on what you have selected. Select a Linear fill and you see Interval, Angle, Stroke Thickness, Image Threshold, Smoothing, Randomization, Shift, Colour, Dashes, Emboss, Clones, and Overlap Control. Select a Halftone fill and you see all of those plus Shape and Shape Rotation. Select nothing and the panel goes quiet.

This article maps every control in the Properties Panel so you know what lives where, what it does, and which fills it applies to. Think of it as the legend for a control-room dashboard — once you know where each dial sits, you can stop hunting and start creating.

## The Layout

The Properties Panel is divided into collapsible sections. From top to bottom, the default order is:

1. **Fill Type indicator** — shows the algorithm name and icon for the selected fill.
2. **Colour** — static colour picker or dynamic colour toggle.
3. **Stroke Thickness** — brightness-to-weight mapping with mode selector.
4. **Image Threshold** — histogram with draggable shadow and highlight handles.
5. **Interval** — distance between repeating elements.
6. **Angle** — rotation of the fill pattern.
7. **Randomization** — controlled chaos percentage.
8. **Smoothing** — curve quality versus detail trade-off.
9. **Shift** — pattern origin offset.
10. **Dash Patterns** — dash length and gap length for dashed strokes.
11. **Emboss / Bas-Relief** — 3D appearance through paired offset strokes.
12. **Clones** — linked copies inheriting parent parameters.
13. **Overlap Control** — inter-fill cutting and weaving choreography.

Some sections appear only when relevant. You will not see Shape unless a Halftone fill is selected. You will not see Wave Height unless a Wave fill is selected. You will not see Center controls unless a Circular, Spiral, or Radial fill is selected.

## Quick-Reference Table

The table below lists every parameter in the Properties Panel, what it does, its typical value range, and which fills it applies to. "All" means every fill type responds to it. A dash means the parameter has no numeric range (it is a toggle, dropdown, or colour value).

| Parameter | What It Does | Range | Applies To |
|-----------|-------------|-------|------------|
| **Colour (Static)** | Sets a single flat colour for all strokes in the fill | — (colour picker) | All |
| **Colour (Dynamic)** | Strokes sample colours from the source image | On / Off toggle | All |
| **Segment Length** | Controls how often dynamic colour is re-sampled along a stroke | 1–100 | All (when Dynamic is on) |
| **Opacity** | Transparency of the fill's strokes | 0–100% | All |
| **Thickness Mode** | How brightness maps to stroke weight: Linear, Thick, or Thin | 3 modes | All |
| **Thickness Min** | Minimum stroke weight | 0.01–50 mm | All |
| **Thickness Max** | Maximum stroke weight | 0.01–50 mm | All |
| **Thickness Smoothing** | Softens abrupt weight transitions along a stroke | 0–100 | All |
| **Thickness Invert** | Reverses the mapping: light areas become thick, dark become thin | On / Off | All |
| **Threshold Left (Shadows)** | Brightness value below which pixels are ignored | 0–255 | All |
| **Threshold Right (Highlights)** | Brightness value above which pixels are ignored | 0–255 | All |
| **Threshold Invert** | Reverses which pixels are included vs. excluded | On / Off | All |
| **Interval** | Distance between repeating elements | 0.1–100 mm | All |
| **Angle** | Rotation of the fill pattern | 0–360° | Linear, Wave, Halftone, Wireframe, Fractal, Text |
| **Randomization** | Controlled displacement of stroke positions | 0–100% | All |
| **Random Distance** | Radial-specific random displacement of ray endpoints | 0–100% | Radial |
| **Smoothing** | Curve interpolation quality | 0–100 | All |
| **Shift X / Shift Y** | Offsets the pattern origin horizontally or vertically | unlimited (mm) | All |
| **Wave Height** | Amplitude of the sinusoidal curve | 0.1–50 mm | Wave |
| **Wave Length** | Wavelength of the sinusoidal curve | 0.1–100 mm | Wave |
| **Center X / Center Y** | Coordinates of the pattern's focal point | canvas coordinates | Circular, Spiral, Radial |
| **Shape** | Dot/element shape: circle, square, diamond, triangle, hexagon, line, cross | 7 options | Halftone |
| **Shape Rotation** | Rotation of individual halftone shapes | 0–360° | Halftone |
| **Dash Length** | Length of visible stroke segments | 0.1–50 mm | All |
| **Gap Length** | Length of invisible breaks between dashes | 0.1–50 mm | All |
| **Emboss Enable** | Activates the bas-relief effect | On / Off | All |
| **Emboss Rise** | Apparent depth of the 3D offset | 0–100 | All (when Emboss is on) |
| **Emboss Smoothness** | Softens the emboss transition | 0–100 | All (when Emboss is on) |
| **Emboss Random** | Adds irregularity to the emboss offset | 0–100 | All (when Emboss is on) |
| **Clone** | Creates a linked copy inheriting parent angle, interval, and fill type | Action button | All |
| **Can Cut Other Fills** | This fill's strokes interrupt strokes from other fills | On / Off | All |
| **Can Be Cut By Other Fills** | Other fills' strokes can interrupt this fill's strokes | On / Off | All |
| **Cut Orientation** | Direction in which cuts are applied: horizontal, vertical, both, or auto | 4 modes | All (when cutting is on) |

## How Parameters Interact

No parameter works alone. Understanding their interactions is half the craft:

- **Interval + Thickness**: Set interval to 2 mm and thickness max to 2 mm and the darkest areas of your image will produce solid black with no visible gap between strokes. Set interval to 2 mm and thickness max to 0.5 mm and even the darkest regions will have visible white space. This pair is the primary density control.

- **Threshold + Interval**: Narrowing the threshold range (say, keeping only midtones from 80 to 180) means fewer pixels generate strokes, so even a tight interval produces sparser output. Use this to target specific tonal bands — see [Image Threshold: Choosing What Matters](304-image-threshold.md).

- **Randomization + Smoothing**: High randomization with low smoothing produces jagged, electric noise. High randomization with high smoothing produces organic drift — like hand-drawn lines that wander but never break. Pair them together, not in isolation.

- **Dynamic Colour + Segment Length**: Short segment length means the colour changes rapidly along each stroke, producing a confetti-like effect. Long segment length means each stroke holds its sampled colour for longer stretches, producing a painterly wash. See [Colour: Static and Dynamic](302-colour.md) for the full picture.

- **Angle + Overlap Control**: When two fills cut each other at different angles, the cuts create a weave — one fill passes over, then under, then over the other. The visual effect depends entirely on the angle difference between the two fills. See [Clones and Overlap Control](311-clones-overlap.md).

## Fills and Their Unique Parameters

Most parameters are shared across all fills. Here is what makes each fill special:

| Fill | Unique Parameters |
|------|-------------------|
| **Linear** | (none — all shared parameters) |
| **Wave** | Wave Height, Wave Length |
| **Circular** | Center X, Center Y |
| **Spiral** | Center X, Center Y |
| **Radial** | Center X, Center Y, Random Distance |
| **Halftone** | Shape, Shape Rotation |
| **Trace** | (relies heavily on Smoothing and Threshold) |
| **Wireframe** | (relies on Interval for mesh density) |
| **Scribble** | (relies heavily on Randomization) |
| **Fractal** | (relies on Interval for recursion density) |
| **Text** | Text content, Font, Font Size |
| **Handmade** | (uses strokes you draw as the repeating element) |

## Where to Go Next

Each section of the Properties Panel has its own article with practical values, visual explanations, and workflow advice:

- [Colour: Static and Dynamic](302-colour.md)
- [Stroke Thickness: Weight from Light](303-stroke-thickness.md)
- [Image Threshold: Choosing What Matters](304-image-threshold.md)
- [Interval and Spacing: Density Control](305-interval-spacing.md)
- [Angle and Rotation](306-angle-rotation.md)
- [Randomisation and Organic Feel](307-randomisation.md)
- [Smoothing and Curve Quality](308-smoothing.md)
- [Dashes, Gaps, and Overlap Cuts](309-dash-patterns.md)
- [Emboss and Bas-Relief](310-emboss.md)
- [Clones and Overlap Control](311-clones-overlap.md)
- [Document and Canvas Settings](312-document-settings.md)

Or, if you prefer to learn by doing, go back to [Your First Fill](106-first-fill.md) and follow along — every parameter mentioned there links back here.
