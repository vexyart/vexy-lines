# Randomisation and Organic Feel

A perfectly spaced grid of parallel lines is beautiful in its precision — and immediately identifiable as machine-made. The human hand does not draw with 1.000 mm spacing. It drifts, stutters, overshoots. Randomisation is how Vexy Lines fakes that drift. At 0%, the output is a flawless mechanical pattern. At 5%, it could have been drawn by a very steady hand. At 50%, it looks like a sketch on a moving train. The right amount depends entirely on whether you want your viewer to see the machine or forget it exists.

## What Gets Randomised

The Randomisation slider (0–100%) does not add random noise to the strokes themselves — it does not make straight lines wobbly. Instead, it displaces the position of each stroke element relative to its mathematically perfect grid position. The specific displacement depends on the fill type:

### Linear, Wave, Wireframe
Each line is shifted perpendicular to its direction. At 0%, all lines are evenly spaced. At 50%, each line is offset from its ideal position by up to half the interval distance, in either direction. Lines can bunch together or spread apart, but they remain parallel and straight (or sinusoidal, for Wave).

### Circular
Each concentric ring is shifted radially — some rings move slightly inward, others slightly outward. The rings remain circular but their spacing becomes irregular, like ripples on water disturbed by a breeze.

### Spiral
The spiral turn spacing becomes uneven. Some turns are tighter, others looser. The spiral remains continuous but gains an organic, hand-wound quality.

### Radial
Each ray is shifted angularly from its ideal position. The sunburst pattern becomes irregular — more rays cluster on one side, gaps open on another. This fill also has its own **Random Distance** parameter (separate from the main Randomisation slider) that varies the length of each ray. More on that below.

### Halftone
Each dot is shifted from its grid position. At low randomisation, the grid is slightly imperfect — like a letterpress impression on soft paper. At high randomisation, the grid dissolves into scattered dots, like spilled confetti.

### Trace
Contour lines are displaced from their mathematically calculated positions. Light randomisation makes contour maps look hand-drawn. Heavy randomisation makes them look like they were traced during an earthquake.

### Scribble
Scribble is already random by nature. The Randomisation slider amplifies the chaos. At 0%, the scribble follows a loosely defined pattern. At 100%, it is pure entropy.

### Fractal
The space-filling curve is displaced from its mathematical path. Light randomisation softens the geometric rigidity. Heavy randomisation turns the fractal into abstract mark-making.

### Text
Character positions are displaced from the baseline grid. Light randomisation looks like typewriter text on rough paper. Heavy randomisation looks like ransom-note letters.

### Handmade
Your drawn strokes are displaced from their repeat positions. Since Handmade fills already carry the irregularity of your hand, even small randomisation values create visible variation between repeats.

## The Randomisation Spectrum

| Value | Character | Looks Like |
|-------|-----------|------------|
| **0%** | Perfectly mechanical. Zero deviation from the mathematical grid. | Machine engraving, guilloche, banknote patterns, technical drawings. The regularity is the point. |
| **1–3%** | Imperceptibly imperfect. The grid is not quite perfect, but you cannot say why. | High-quality letterpress, precision hand engraving. The viewer senses craftsmanship without seeing error. |
| **5–10%** | Handmade feel. Lines drift slightly. Spacing varies just enough to look human. | Skilled illustrator's hatching, careful pen work, architectural sketching. The most broadly useful range. |
| **15–25%** | Noticeably irregular. The pattern is visible but clearly drawn by hand. | Quick sketching, field illustration, editorial cartooning. Confident and loose. |
| **30–50%** | Organic. The underlying pattern is suggested rather than stated. | Artistic ink work, expressive mark-making, natural textures (grass, fur, fabric grain). |
| **60–80%** | Chaotic. The pattern is barely recognisable. Elements scatter freely. | Deliberate disorder, abstract texture, emotional expression, storm effects. |
| **80–100%** | Near-random. Only the fill type's basic nature (lines vs. dots vs. curves) is identifiable. | Abstract art, noise textures, intentionally deconstructed patterns. |

## Random Distance (Radial Fills Only)

Radial fills have a second randomisation control: **Random Distance**. While the main Randomisation slider shifts ray angles, Random Distance varies the length of each ray from the center point outward. At 0%, all rays extend to the canvas edge. At higher values, some rays stop short while others extend fully, creating an organic starburst with irregular reach.

Combine both controls:
- **Randomisation 0% + Random Distance 0%:** A perfect sunburst — every ray at equal angles, every ray the same length.
- **Randomisation 15% + Random Distance 0%:** Rays at irregular angles but all the same length. An imperfect but complete sunburst.
- **Randomisation 0% + Random Distance 40%:** Rays at perfect angles but varying lengths. Like a dandelion seed head — regular but ragged.
- **Randomisation 15% + Random Distance 40%:** Both irregular. A natural-looking radial burst with the feel of an explosion or firework.

## Shift vs. Randomisation

The Properties Panel also has a **Shift** parameter (Shift X, Shift Y), and it is easy to confuse with Randomisation. They do different things:

- **Shift** moves the entire pattern as a rigid block. All elements move together by the same offset. The pattern structure is preserved. Shift is deterministic — the same values always produce the same result.
- **Randomisation** moves each element independently by a different random amount. The pattern structure is disrupted. Randomisation is stochastic — refreshing the fill produces a slightly different result each time (though the random seed is stored, so a saved file always looks the same when reopened).

Use Shift to align a pattern with a specific feature in the image — centering a halftone grid on a face, for example. Use Randomisation to break the mechanical feel of the pattern.

They can be combined. A shifted, randomised fill is a displaced pattern that also has organic irregularity. The shift sets the general position; the randomisation adds the human touch.

## When to Add Randomisation

### Almost Always (5–15%)

For most illustration work, a small amount of randomisation improves the result. The viewer's eye is extraordinarily sensitive to perfect regularity — it reads as "computer-generated" even in high-quality work. A 5–10% randomisation value is the equivalent of a guitarist's natural timing variation: technically imperfect, perceptually superior.

### Never (0%)

Some subjects demand mechanical precision:

- **Guilloche patterns** (the anti-counterfeiting swirls on banknotes and certificates). Regularity is the security feature.
- **Technical drawings** and architectural plans. Precision communicates accuracy.
- **Geometric art** where the pattern itself is the subject (Op Art, Islamic geometry, mathematical visualisation).
- **Screen-print registration guides** where alignment matters for physical production.

### Heavy (30%+)

Some subjects benefit from visible chaos:

- **Natural textures:** Grass, hair, fur, bark, water, and clouds all have irregular structure. A heavily randomised fill mimics their organic quality better than a clean grid.
- **Expressive mark-making:** When the artwork is about energy and emotion rather than accurate reproduction, heavy randomisation conveys gesture.
- **Distressed or vintage effects:** Paired with the [Dash Patterns](309-dash-patterns.md) feature, heavy randomisation creates the look of worn or degraded printing.

## Randomisation and Other Parameters

### Randomisation + Smoothing

High randomisation with low [Smoothing](308-smoothing.md) produces strokes that are displaced and jagged — electric, nervous energy. High randomisation with high smoothing produces strokes that are displaced but flowing — organic, hand-drawn warmth. The combination matters more than either parameter alone.

### Randomisation + Interval

At tight intervals, randomisation can cause strokes to overlap or bunch together, creating unintentional dark spots. If you see unwanted density clusters, either reduce the randomisation percentage or widen the interval to give the displaced strokes more room to scatter without colliding.

### Randomisation + Dynamic Colour

When [Dynamic Colour](302-colour.md) is enabled, displaced strokes sample colour from their new (randomised) positions rather than their grid positions. This means the colour mapping becomes slightly unpredictable — strokes that would have sampled a shadow might now sample a highlight, and vice versa. At low randomisation (under 15%), this effect is negligible. At high randomisation, it produces a pointillist scatter of unexpected colours.

## Step-by-Step: Dialling in the Right Amount

1. Start at 0% and evaluate the fill's mechanical appearance. Ask: does this perfection serve the image?
2. Increase to 5%. The change is subtle. Look for it in the evenness of stroke spacing — are gaps slightly varied? Does it feel less rigid?
3. Increase to 15%. Now the randomisation is visible. The pattern reads as hand-drawn. For most illustration, stop here.
4. If the subject is organic (landscape, animal, textile), try 30%. Evaluate whether the strokes still read as a coherent pattern or have become scattered noise.
5. Push to 50% and beyond only if you want the pattern to dissolve. Check for unintentional overlaps and density clusters.
6. For Radial fills, adjust Random Distance separately after setting the main Randomisation slider. Start at 0% and increase in steps of 10%.

## Further Reading

- [Smoothing and Curve Quality](308-smoothing.md) — the partner parameter that controls whether randomised strokes are jagged or flowing.
- [Interval and Spacing: Density Control](305-interval-spacing.md) — wider intervals give randomised strokes more room to scatter.
- [Angle and Rotation](306-angle-rotation.md) — the fill's base angle determines the direction from which randomisation displaces strokes.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
