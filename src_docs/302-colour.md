# Colour: Static and Dynamic

A vector stroke without colour is just geometry. Colour is what makes it visible, and Vexy Lines gives you two fundamentally different ways to assign it: pick one colour and paint every stroke the same, or let each stroke steal its colour from the source image beneath it. The first is called Static colour. The second is called Dynamic colour. Knowing when to use each — and how to combine them — is one of the fastest ways to elevate your work from technical exercise to finished art.

## Static Colour

Static colour is the default. Every stroke in the fill is drawn in exactly the same colour. The Properties Panel gives you five ways to choose that colour:

### The Colour Wheel

The large circular wheel selects hue (the angle around the circle) and saturation (the distance from center to edge). A vertical strip beside the wheel controls brightness. Click anywhere on the wheel, and the fill updates. This is the fastest way to explore when you do not have a specific value in mind.

### HSB Sliders

Below the wheel, three sliders offer numeric precision:

- **H (Hue):** 0–360°. Red is 0°, green is 120°, blue is 240°.
- **S (Saturation):** 0–100%. Zero is grey; 100 is the purest version of the hue.
- **B (Brightness):** 0–100%. Zero is black regardless of hue; 100 is the full-brightness version.

When you need to match a brand colour, type the numbers directly. When you need two fills that differ by exactly 30° of hue, the H slider is your friend.

### RGB Sliders

Toggle the slider mode to RGB for direct red, green, and blue control. Each channel runs from 0 to 255. This is less intuitive for visual exploration but essential when matching values from Photoshop, Illustrator, or CSS.

### Hex Input

A text field accepts standard six-character hex codes: `#FF6B35` for a warm orange, `#1A1A2E` for near-black navy. Paste values directly from design tools or web specs. The field also accepts three-character shorthand — `#F00` expands to `#FF0000`.

### Swatches

A row of saved colour swatches sits below the sliders. Click a swatch to apply it. Right-click (or Ctrl+click) a swatch to replace it with the current colour. Swatches persist with the document, so you can build a palette specific to each piece.

### Eyedropper

Click the eyedropper icon, then click anywhere on screen — not just on the Vexy Lines canvas but anywhere on your display. The fill colour updates instantly to match the sampled pixel. This is invaluable when matching colours from a reference image open in another application, or when picking a colour from the source image itself to use as a static fill.

**Practical tip:** The eyedropper samples at screen resolution, not document resolution. If you are zoomed out, the sampled pixel may be a blend of several source pixels. Zoom in to the region of interest before sampling for accuracy.

## Dynamic Colour

Toggle the **Dynamic** switch in the Colour section and everything changes. Strokes no longer share a single colour. Instead, each stroke — and each segment of each stroke — samples the colour of the source image pixel directly beneath it. A red shirt in the photo produces red strokes. A blue sky produces blue strokes. The source image's colour palette becomes the fill's colour palette.

### How It Works

As Vexy Lines generates each stroke, it walks along the stroke path and, at regular intervals, reads the RGB value of the source image at that point. The interval is controlled by the **Segment Length** parameter. Each segment of the stroke is then drawn in the colour sampled at its starting point.

### Segment Length

This is the single most important parameter in dynamic colour mode, and it deserves careful attention.

- **Short segment length (1–10):** Colour changes rapidly along each stroke. Every few points, the stroke shifts to the next sampled colour. This produces high colour fidelity — the vector output closely matches the source photograph — but can look busy and confetti-like at high zoom. File sizes increase because each colour change adds a new path segment.

- **Medium segment length (10–40):** A good default. Strokes hold each colour long enough to read as intentional brushwork. The effect is painterly — you can see that the stroke knows about the image, but it is not slavishly reproducing it. File sizes are moderate.

- **Long segment length (40–100):** Each stroke takes on a single dominant colour, sampled near its start. The effect is more like colour-coded hatching than photographic reproduction. Tonal areas become broader swathes of flat colour. File sizes are smallest. This is effective for bold, graphic work.

### Practical Examples

| Goal | Segment Length | Why |
|------|---------------|-----|
| Photorealistic colour portrait | 3–8 | Rapid sampling captures skin tones, hair colour, and background shifts within each stroke |
| Impressionist landscape | 20–35 | Broad colour areas suggest foliage, sky, and water without microdetail |
| Pop art poster | 50–80 | Large flat colour zones create graphic impact |
| Monochrome with colour accents | Use static for base, dynamic for accent fill | — |

## Combining Static and Dynamic

Static and dynamic are not either/or across a document — they are per-fill settings. This means you can stack multiple fills and use different colour modes for each:

**Example: Engraved portrait with colour underlay**

1. Add a Linear fill, set to Dynamic colour with Segment Length 5. Set a wide interval (3–4 mm) so the colour strokes are visible as distinct lines.
2. Add a second Linear fill above it, set to Static colour — black. Set a tight interval (0.8–1.2 mm) and adjust the Image Threshold to cover only the darkest tones (left handle at 0, right handle at 120).
3. The result: fine black engraving lines render the detail and shadows, while wider colour strokes beneath them provide the hue information. The effect resembles hand-coloured engravings from the 18th century.

**Example: Outline with flat colour fill**

1. Add a Trace fill set to Static colour — dark grey (#333333). This produces contour lines around shapes in the image.
2. Add a Halftone fill beneath it, set to Dynamic colour with a medium Segment Length of 25. The dots pick up the source image's colours while the outlines stay neutral.
3. The result looks like a comic book panel: black outlines, colour fills.

## Opacity

Both static and dynamic colour fills support an **Opacity** slider (0–100%). At 100%, strokes are fully opaque — they cover whatever is beneath them. At lower values, underlying fills and the background show through.

Opacity is especially useful with dynamic colour fills stacked on top of static fills. Set the dynamic fill to 60–80% opacity and the static fill colour bleeds through, tinting the sampled colours. At 30–40%, the dynamic colour becomes a subtle wash over a dominant static tone.

**Be aware:** Opacity in SVG export is implemented as the `stroke-opacity` attribute. Some older print RIPs do not handle transparency well. If you are exporting for offset printing, consider flattening transparency by exporting as PNG at high resolution instead.

## Colour and File Size

Static colour fills are compact. Every stroke in the fill shares one colour definition, so the SVG or PDF contains a single colour attribute applied to many paths.

Dynamic colour fills are larger. Each colour change along a stroke creates a new path element in the exported file. A fill with Segment Length 3 on a complex image can produce SVG files ten to twenty times larger than the same fill with static colour.

If file size matters — and it does for web delivery, email attachments, or documents with dozens of fills — consider these strategies:

- Increase Segment Length. Going from 5 to 20 can halve the file size with only a modest loss of colour fidelity.
- Use dynamic colour only on fills where colour variation matters. A background fill of parallel lines does not need per-segment colour if it covers a region of roughly uniform hue.
- Limit the number of dynamic fills in a single document. Two or three dynamic fills are usually sufficient. Additional fills can use static colours that approximate the dominant tones.

## The Eyedropper Shortcut for Dynamic Decisions

Not sure whether a particular region benefits from dynamic colour? Use the eyedropper to sample a few pixels from the region. If they are all roughly the same hue, static colour will look nearly identical and produce smaller files. If the samples vary widely — a face with skin, hair, and eye colours all in close proximity — dynamic colour will capture the variation that static cannot.

## Further Reading

- [Stroke Thickness: Weight from Light](303-stroke-thickness.md) — thickness interacts with colour to determine how much of each stroke's colour is visible.
- [Image Threshold: Choosing What Matters](304-image-threshold.md) — threshold determines which pixels contribute strokes at all, filtering the pool of source colours available to dynamic fills.
- [Interval and Spacing: Density Control](305-interval-spacing.md) — tighter intervals mean more strokes sampling more colours, amplifying the dynamic effect.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
