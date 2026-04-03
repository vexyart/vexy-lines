# Emboss and Bas-Relief

Flat vector strokes live in two dimensions. Emboss lifts them into the illusion of a third. Enable it, and Vexy Lines generates paired offset strokes — one light, one dark — flanking the original path, simulating the highlight and shadow that a raised surface would cast under directional light. The effect turns a line drawing into something that looks carved, stamped, or pressed into metal. It is theatrical, it is unapologetically fake, and on the right image it is magnificent.

## How It Works

The bas-relief effect works by tripling each stroke:

1. **The original stroke** remains at its calculated position, drawn in the fill's assigned colour.
2. **A highlight stroke** is offset in the direction of the simulated light source, drawn in a lighter value.
3. **A shadow stroke** is offset in the opposite direction, drawn in a darker value.

The eye reads the light-dark pair as evidence of a raised surface catching directional light. The stronger the offset and the greater the value contrast, the deeper the apparent relief.

This is the same optical trick used in embossed stationery, coin minting, and Photoshop's venerable Emboss filter — but applied to vector strokes rather than raster pixels. The result is scalable: zoom in and the relief holds up, because it is geometry, not a pixel effect.

## The Parameters

Four parameters control the emboss effect. All appear in the Emboss / Bas-Relief section of the Properties Panel when the effect is enabled.

### Enable (enbl_basrelief)

A simple toggle. Off by default. Turn it on to activate the effect for the selected fill.

### Rise (bsrf_rise): 0–100

Controls the apparent depth of the relief — the distance between the highlight and shadow offset strokes. At 0, the offsets are negligible and the effect is invisible. At 100, the offsets are at their maximum, producing a dramatically sculpted appearance.

| Rise Value | Apparent Depth | Best For |
|------------|---------------|----------|
| 5–15 | Subtle. A hint of dimension, like lightly pressed paper. | Elegant stationery, background texture, fine engraving with depth |
| 20–40 | Moderate. Clearly three-dimensional but not overwhelming. | Coin and medal effects, architectural ornament, classical portraits |
| 50–70 | Strong. The relief dominates the visual impression. | Dramatic bas-relief panels, bold decorative work |
| 80–100 | Extreme. The offsets are wide enough to interfere with adjacent strokes. | Experimental, abstract, or when the emboss effect itself is the subject |

### Smoothness (bsrf_smoothness): 0–100

Controls how gradually the highlight and shadow strokes transition from their offset positions. At 0, the offset strokes follow the same sharp contours as the original. At 100, they are heavily smoothed, creating a soft, rounded appearance.

Low smoothness produces a chiselled, hard-edged look — like a stamp cut into metal. High smoothness produces a pillowed, inflated look — like a surface pressed into soft leather.

| Smoothness | Character |
|------------|-----------|
| 0–20 | Sharp, mechanical. Each stroke's highlight and shadow follow its contours precisely. |
| 30–50 | Moderate softening. Corners are rounded but the stroke's shape is preserved. |
| 60–80 | Smooth, organic. The relief looks molded rather than carved. |
| 90–100 | Very soft. The offset strokes become gentle undulations that barely follow the original path. |

### Random (bsrf_random): 0–100

Adds irregularity to the offset direction and distance. At 0, every stroke's highlight and shadow are offset by exactly the same amount in exactly the same direction. At higher values, each stroke's offset varies randomly — some deeper, some shallower, some slightly rotated.

This is the parameter that prevents embossed fills from looking like a Photoshop filter applied uniformly. A random value of 10–20 introduces the kind of variation you see in actual hammered metalwork, where the craftsman's hand varied the depth from stroke to stroke.

| Random | Character |
|--------|-----------|
| 0 | Uniform. Every stroke has identical relief. Clean and mechanical. |
| 5–15 | Slight variation. The relief looks hand-crafted but controlled. |
| 20–40 | Noticeable variation. Some strokes are more raised than others. Artisanal quality. |
| 50+ | Rough, uneven. The surface looks weathered or crudely worked. |

## Subjects That Work

Emboss is not universally flattering. It excels on subjects with clear depth information — images where you can already see what is raised and what is recessed.

### Portraits and Faces

The human face has strong topographic structure: the nose projects forward, the eye sockets recede, the cheekbones rise, the jaw defines a boundary. Emboss amplifies this existing depth. A portrait rendered with Linear fill at 0° angle, moderate thickness (0.2–1.5 mm), and emboss Rise 25, Smoothness 40 looks like a classical coin or medal.

### Architecture

Columns, capitals, cornices, and door frames have geometric depth that emboss renders convincingly. The parallel lines of a Linear fill become the striations of carved stone. Rise 30–50 with Smoothness 20–30 produces a chiselled look.

### Coins and Medals

This is emboss's natural habitat. Use a Circular or Radial fill to match the circular format, enable emboss with Rise 35, Smoothness 45, and the result genuinely resembles a numismatic illustration.

### Relief Sculpture

Any image of a physical bas-relief (Egyptian wall carvings, Greek friezes, Renaissance panels) is already lit to emphasise depth. Emboss reinforces that existing light/shadow information rather than fighting it.

### What Works Less Well

- **Flat subjects** (text on paper, geometric patterns, screenshots) have no depth for emboss to amplify. The effect looks arbitrary — light and shadow offsets with no logical relationship to the subject.
- **Very busy images** (dense foliage, crowd scenes, gravel textures) produce chaotic emboss offsets that read as visual noise rather than depth.
- **Subjects already rendered with multiple fills.** Emboss on every fill in a five-fill composition creates competing light directions and confusing depth cues. Use emboss on one or two dominant fills and leave the rest flat.

## Emboss and Colour

### Static Colour

With static colour, the highlight and shadow strokes are automatically generated as lighter and darker versions of the fill's assigned colour. A fill coloured dark blue (#1A3A6A) produces highlight strokes in a lighter blue and shadow strokes in a near-black navy. The colour shift is calculated from the Rise value — higher rise means greater colour contrast.

This works well for single-colour compositions and for fills where colour consistency matters.

### Dynamic Colour

With [Dynamic Colour](302-colour.md) enabled, the original stroke samples its colour from the source image. The highlight and shadow strokes are then calculated as lighter and darker versions of each sampled colour. The result is a full-colour embossed image — every colour in the source photograph is rendered with its own highlight and shadow.

This can be stunning on portraits (skin tones gain a sculptural quality) and landscapes (mountains and buildings pop forward). But it can also produce muddy results on images with very dark or very saturated colours, where the highlight offset cannot generate a visibly lighter version. If the emboss looks flat in coloured areas, increase the Rise value or switch those areas to a static colour fill.

### Recommended Colour Approach

For maximum emboss impact, use a **monochrome static colour** (dark grey, sepia, or deep blue) and let the light/dark offsets do all the work. This mimics the look of a single-material relief — bronze, stone, or leather — where depth is the only visual variable. Adding colour to an embossed fill dilutes the depth illusion by introducing a competing visual channel.

## Emboss and Thickness

The [Stroke Thickness](303-stroke-thickness.md) mode interacts with emboss in important ways:

- **Thick mode + high Rise:** The combination of heavy strokes and wide offsets can cause highlight and shadow strokes to overlap with adjacent original strokes, creating a muddy tangle. Reduce Rise or widen the Interval to give the offset strokes room.
- **Thin mode + moderate Rise:** A refined, delicate relief. The thin strokes produce fine highlight and shadow lines that suggest engraved metalwork or die-stamped paper.
- **Linear mode + moderate Rise:** The balanced default. Works for most subjects.

### The Width Calculation

The total visual width of an embossed stroke is approximately: original thickness + (2 × offset distance). A stroke that is 1 mm wide with Rise 30 might have highlight and shadow strokes offset by 0.3 mm each, making the total visual width about 1.6 mm. If your [Interval](305-interval-spacing.md) is 2 mm, the embossed strokes consume 80% of the available space in the darkest areas. At Interval 1.5 mm, they overlap. Plan accordingly.

## Step-by-Step: Classical Coin Portrait

1. Open a high-contrast portrait photo — dramatic side lighting works best.
2. Add a Circular fill. Set the Center to the middle of the face.
3. Set Interval to 1.2 mm, Thickness Linear mode, Min 0.1 mm, Max 1.0 mm.
4. Set Colour to a warm bronze tone: #8B6914.
5. Narrow the [Image Threshold](304-image-threshold.md) to 10–230, trimming the extremes.
6. Enable Emboss. Set Rise to 30, Smoothness to 40, Random to 10.
7. Refresh the fill. The concentric rings should now appear to rise from the surface, with the face's features — nose, brow, chin — projecting forward.
8. Adjust Rise up or down to taste. If the highlight and shadow strokes are interfering with each other, widen Interval to 1.5 mm.
9. For a more weathered look, increase Random to 25. For a more polished look, decrease it to 0.

## Combining Emboss with Other Effects

- **Emboss + Dashes:** Dashed strokes with emboss produce a beaded or riveted surface — each dash appears as a raised bump with its own highlight and shadow. See [Dashes, Gaps, and Overlap Cuts](309-dash-patterns.md).
- **Emboss + Randomisation:** Adding [Randomisation](307-randomisation.md) to an embossed fill produces an uneven, hand-worked surface. The strokes are displaced and each displacement gets its own emboss offset, creating the look of hammered metal.
- **Emboss + Weaving:** An embossed weave (see [Clones and Overlap Control](311-clones-overlap.md)) adds depth to the over-under illusion. The threads that pass "over" can be embossed to emphasise their elevation.

## Further Reading

- [Stroke Thickness: Weight from Light](303-stroke-thickness.md) — thickness determines the base width that emboss offsets expand.
- [Colour: Static and Dynamic](302-colour.md) — colour mode affects how highlight and shadow strokes are tinted.
- [Clones and Overlap Control](311-clones-overlap.md) — combining emboss with overlap cutting for 3D weave effects.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
