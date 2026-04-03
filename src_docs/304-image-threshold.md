# Image Threshold: Choosing What Matters

Not every pixel in your source image deserves a stroke. The brightest highlights on a forehead might be better left as blank paper. The darkest shadows in a nostril might work better as solid weight from [Stroke Thickness](303-stroke-thickness.md) alone, without additional fills competing for the same space. Image Threshold is the gate that decides which pixels participate and which get ignored. Master it, and you control not just how your artwork looks, but what it is about.

## The Histogram

Open the Image Threshold section in the Properties Panel and you see a small histogram — a graph showing how many pixels in your source image fall at each brightness level. The horizontal axis runs from 0 (pure black, left) to 255 (pure white, right). The vertical axis shows the count of pixels at each level. A portrait with dramatic lighting will show peaks at both ends. A foggy landscape will cluster in the middle.

The histogram is not decoration. It is a map of your image's tonal structure, and the two draggable handles sitting on it are your tools for carving that structure into zones.

## The Two Handles

### Left Handle (Shadow Cutoff)

Drag this rightward to exclude dark pixels. At position 0, every pixel from pure black upward is included. Drag it to 60, and pixels with brightness 0–59 are ignored — no strokes are generated in those regions. The darkest shadows become empty space.

### Right Handle (Highlight Cutoff)

Drag this leftward to exclude bright pixels. At position 255, every pixel from pure white downward is included. Drag it to 200, and pixels with brightness 201–255 are ignored — no strokes are generated in those bright regions. Highlights become blank paper.

### What "Ignored" Means

When a pixel falls outside the threshold range, Vexy Lines does not generate a stroke at that position. It is not that the stroke becomes invisible or zero-width — it simply does not exist. This is different from setting Thickness Min to zero, which creates invisible geometry that still bloats your file. Threshold exclusion is clean: no pixel, no stroke, no data.

## Isolating Tonal Bands

The real power of Image Threshold emerges when you use it to isolate specific ranges of brightness — and then stack multiple fills, each covering a different range.

### Shadows Only

Left handle at 0, right handle at 85. Only the darkest quarter of the tonal range produces strokes. Use this for a fill that renders deep shadows with tight, heavy lines while leaving midtones and highlights to other fills.

### Midtones Only

Left handle at 85, right handle at 170. Only the middle band produces strokes. This is where most of the visual information in a photograph lives — skin tones, fabric folds, architectural surfaces. A fill targeting midtones does the bulk of the image-rendering work.

### Highlights Only

Left handle at 170, right handle at 255. Only the brightest pixels produce strokes. This is a narrow, specialised use: rendering the lightest tones in a subject where you want strokes everywhere, including the highlights that would normally be blank paper. Useful for white-on-dark compositions or for adding a faint texture to bright areas.

## The Three-Fill Stack

This is one of the most powerful techniques in Vexy Lines, and it relies entirely on Image Threshold.

1. **Fill 1 — Shadows.** Linear fill, Angle 0°, Interval 0.8 mm, Thickness Max 2.0 mm. Threshold: left 0, right 85. Black colour. This fill produces dense, heavy horizontal lines in the darkest regions.

2. **Fill 2 — Midtones.** Linear fill, Angle 45°, Interval 1.2 mm, Thickness Max 1.0 mm. Threshold: left 85, right 170. Dark grey colour (#444444). Diagonal lines of moderate weight fill the midtone areas without competing with the shadow fill.

3. **Fill 3 — Highlights.** Linear fill, Angle 90°, Interval 2.0 mm, Thickness Max 0.4 mm. Threshold: left 170, right 255. Light grey colour (#999999). Faint vertical lines provide a whisper of texture in the brightest zones.

The result is a trichromatic engraving where shadows, midtones, and highlights are rendered by separate fills at different angles, weights, and densities. Each fill does one job. The composite reads as a rich, layered image with the depth of a 19th-century steel engraving.

You can extend this to four or five fills for even finer tonal control, though diminishing returns set in quickly. Three fills cover the vast majority of use cases.

### Avoiding Gaps and Overlaps

If your three fills use threshold ranges 0–85, 85–170, and 170–255, the boundaries are seamless: every pixel brightness value is covered by exactly one fill. But if you set ranges 0–80, 90–160, and 175–255, pixels with brightness 81–89, 161–174 produce no strokes from any fill. Those tonal zones become blank paper — which might be a deliberate choice (visual breathing room) or an accident (muddy midtones disappearing).

Conversely, overlapping ranges (0–100, 80–180, 160–255) mean some pixels are rendered by two fills simultaneously. This produces denser coverage in the overlap zones, which can look intentional (extra richness in the mid-shadows) or accidental (a visible band of heavier-than-expected tone).

Neither approach is wrong. But be deliberate. Check your ranges against the histogram to see exactly which tones fall in the gaps or overlaps.

## Invert

The **Invert** toggle reverses the threshold logic. Instead of including pixels inside the range and excluding those outside, it includes pixels outside the range and excludes those inside.

With left at 85 and right at 170 and Invert enabled, Vexy Lines generates strokes for pixels with brightness 0–84 and 171–255 — the shadows and highlights — while excluding the midtones. This is a quick way to create a fill that renders only the extremes of the tonal range.

Invert is also useful when you have already set up a midtone fill with range 85–170 and want to create a complementary fill that covers everything else. Clone the fill, toggle Invert, and adjust the angle and thickness. The two fills together cover the full range with no overlap.

## Threshold and Stroke Thickness

These two controls are deeply intertwined. Both respond to pixel brightness, but they do different things:

- **Threshold** decides whether a stroke exists at a given location.
- **Thickness** decides how heavy that stroke is.

A fill with threshold range 0–200 and Thickness mode Linear will produce strokes for most of the image, with weight varying from thick (in darks) to thin (at brightness 200). A fill with threshold range 0–120 and the same thickness settings will produce strokes only in the darker half, but those strokes will have the same weight mapping — the thinnest strokes will appear at brightness 120, not 200.

This means narrowing the threshold range effectively compresses the thickness range onto a smaller tonal band. Strokes at the boundary of the threshold will have the minimum thickness. Strokes at the darkest end will have the maximum thickness. The full min-to-max weight transition happens within whatever brightness range the threshold allows.

### Practical Implication

If you want a fill that produces only heavy strokes in the deepest shadows (no hairlines, no thin transitions), narrow the threshold to 0–60 and set Thickness Min close to Thickness Max. The fill will produce strokes only in the darkest zones, and those strokes will all be roughly the same heavy weight.

If you want a fill that shows the full gradation from hairline to heavy but only in the shadows and midtones, set the threshold to 0–170 and keep a wide min-max thickness range. The fill will still produce hairlines — they will just appear at brightness 170 instead of 255.

## Threshold and Dynamic Colour

When [Dynamic Colour](302-colour.md) is enabled, the threshold determines not just where strokes appear but which source image colours are sampled. Excluding highlights (right handle at 180) means no strokes exist in bright regions, so the bright colours in your source image never appear in the output. If your source image has a vivid blue sky that you want represented, make sure the threshold range includes the sky's brightness level.

## Step-by-Step: Setting Threshold for a High-Contrast Portrait

1. Add a Linear fill. Leave threshold at the full 0–255 range initially.
2. Look at the histogram. A high-contrast portrait will show a bimodal distribution — peaks near the dark end and near the bright end, with a dip in between.
3. Identify the shadow peak. Drag the left handle to just before the peak begins — perhaps position 10–15. This trims the deepest crushed blacks, which often contain sensor noise rather than image detail.
4. Identify the highlight peak. Drag the right handle to just after the peak ends — perhaps position 230–240. This removes the blown-out highlights, which contain no useful detail.
5. Check the canvas. Strokes should now cover the meaningful tonal range without wasting effort on pure-black noise or pure-white blowout.
6. Decide whether to split. If the midtone dip is deep, consider splitting into two fills — one for shadows (0–120) and one for midtones/highlights (120–240) — with different angles or fill types.

## Further Reading

- [Stroke Thickness: Weight from Light](303-stroke-thickness.md) — the weight mapping that works hand-in-hand with threshold.
- [Interval and Spacing: Density Control](305-interval-spacing.md) — threshold exclusion thins out strokes regionally; interval controls global spacing.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
