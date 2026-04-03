# Handmade: Your Strokes, Your Rules

Every other fill in Vexy Lines is algorithmic. You set parameters. The software draws. Handmade inverts that relationship. You draw the strokes --- or import them, or paste them from another application --- and the software distributes them across your image, repeating and modulating your hand-drawn marks according to brightness. Your stroke. Your rules. The algorithm serves, not leads.

This is the fill for artists who think, "I like what Vexy Lines does, but I want my own line quality." Calligraphers who want their brush strokes distributed across a portrait. Illustrators who want a signature mark language repeated at scale. Designers who have a specific SVG pattern and want it to respond to image tone. Handmade is the blank canvas within the canvas.

---

## What It Looks Like

That depends entirely on what you draw. A wavy line produces flowing undulations across the image. A sharp zigzag produces angular energy. A complex calligraphic stroke produces elaborate texture. A simple dot produces something like [Halftone](207-halftone.md) but with your dot's specific shape.

The brightness rule still applies: your strokes cluster densely in dark areas and space out in light areas. The weight of each stroke instance may also vary with brightness, thickening in shadows and thinning in highlights. But the fundamental *shape* of the mark is yours.

---

## When to Use Handmade

- **Custom calligraphic textures:** Draw a brush stroke. Let Vexy Lines tile it across the image with brightness-responsive density.
- **Imported SVG pattern distribution:** Import a decorative element (a leaf, a geometric motif, a logo) and see it distributed across an image, sized by brightness.
- **Signature mark language:** Develop a personal stroke vocabulary and apply it consistently across projects.
- **Pen-plotter customisation:** Draw the exact stroke profile your plotter pen produces, then generate art optimised for that specific tool.
- **Mixed organic/algorithmic compositions:** Handmade strokes for certain areas (hair, foliage) combined with algorithmic fills for others (skin, background).
- **Total creative control:** When no algorithmic fill produces the exact look you want, draw it yourself.

---

## The Three Modes

Handmade offers three distribution modes, each treating your strokes differently:

### Manual

Your strokes stay exactly where you draw them. No duplication, no redistribution, no brightness response. What you place is what you get. Use Manual when you want precise control over every mark --- hand-placed strokes in specific locations, like a traditional illustrator working directly on the canvas.

This mode bypasses the brightness-to-density logic entirely. It is not really a "fill" in the usual Vexy Lines sense --- it is a drawing mode that happens to live inside the fill framework.

### Blend

Multiple strokes morph between each other across the image, driven by brightness. Draw two source strokes: one bold and angular, one light and curvy. In dark areas, the distributed strokes resemble the bold one. In light areas, they resemble the light one. Mid-tones produce intermediate shapes that blend between the two.

Blend requires at least two source strokes. More strokes create more blend stages and richer transitions. The algorithm interpolates between them in the order you drew them.

### Balanced

Your source strokes are duplicated and distributed to maintain even density across the image. The algorithm adds or removes stroke instances to ensure consistent coverage, adjusting individual stroke weight according to brightness. Dark areas get thicker instances. Light areas get thinner ones. But the spacing remains uniform.

Balanced is the most "automatic" mode. Draw one or a few strokes, switch to Balanced, and the software fills the image with brightness-modulated copies. This is the mode most similar to how other fills (Linear, Wave) work --- except the stroke shape is yours rather than algorithmic.

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Mode** | Manual, Blend, or Balanced. Controls how strokes are distributed. | Manual for precise placement. Blend for brightness-driven morphing. Balanced for even distribution. |
| **Interval** | Spacing between stroke instances in Balanced mode, in mm. (Not applicable to Manual mode.) | 1 mm for dense texture. 3 mm for visible individual marks. 6+ mm for sparse, prominent marks. |
| **Angle** | Rotation applied to all distributed stroke instances. | 0° default. Match to the natural angle of your drawn strokes, or rotate for dynamic effect. |
| **Stroke Thickness** | Brightness-to-weight mapping for distributed instances. | Linear for proportional brightness response. Thick for heavy shadows. |
| **Image Threshold** | Histogram handles for brightness range. | Full range for complete tonal rendering. Narrow to restrict strokes to specific tonal regions. |
| **Randomization** | Positional and rotational jitter applied to distributed instances. | 0% for precise tiling. 10--20% for organic scatter. 40%+ for loose, collaged arrangement. |
| **Dynamic Color** | Distributed strokes sample source image colours at their positions. | Off for monochrome. On for colour-responsive distribution. |
| **Smoothing** | Controls the smoothness of the path curves in your source strokes. | Depends on your input. Low to preserve sharp angles. High to smooth rough input. |
| **Multiplier** | Scales overall instance size. | 1.0 default. Increase to enlarge copies of your stroke. Decrease to shrink them. |

---

## Step-by-Step: Draw a Wavy Stroke, Fill the Image

This walkthrough demonstrates the most common Handmade workflow: draw one stroke, switch to Balanced mode, and watch it replicate across the image.

### 1. Choose your image

Select any photograph with decent tonal range. Portraits, landscapes, and textured surfaces all work. The image matters less than your stroke choice --- the Handmade fill's character comes from *you*, not from the algorithm.

### 2. Add a Handmade fill

Click **+** in the Layers Panel. Select **Handmade**. The canvas awaits your input.

### 3. Draw your source stroke

Select the **Pencil tool (P)**. Draw a single stroke on the canvas. For this walkthrough, draw a gentle wave --- a loose S-curve about 20--30 mm long. Do not try to be precise. The beauty of Handmade is that your hand's natural imperfections become the texture.

A few strokes to consider:

- A single loose wave (organic, flowing)
- A tight zigzag (energetic, aggressive)
- A broad, thick-to-thin brush stroke (calligraphic)
- A small circle or spiral (dot-like)

### 4. Switch to Balanced mode

In the Properties Panel, set **Mode** to **Balanced**. The single stroke you drew is now distributed across the entire image. Copies of your wave appear everywhere, their density and weight modulated by the source photograph's brightness.

### 5. Set the distribution density

- **Interval:** 2 mm. A starting point. Tighten for denser texture, widen for sparser marks.
- **Randomization:** 15%. Enough jitter to prevent the tiled copies from looking mechanical, but not so much that the stroke orientation becomes random.

### 6. Configure the brightness response

- **Stroke Thickness:** Linear mode. Dark areas produce thicker copies of your stroke. Light areas produce thinner copies.
- **Image Threshold:** Full range.

### 7. Evaluate

Zoom out. Your hand-drawn wave now tiles across the photograph, building tone through accumulated repetition. The marks are yours --- your line quality, your curvature, your energy --- but they respond to the image like any other fill.

If the texture feels too uniform, increase Randomization. If it feels too chaotic, decrease it. If individual stroke instances are too small, increase Multiplier. If they overlap too much, increase Interval.

### 8. Refine the source stroke

Not happy with your stroke? Draw another one. In Balanced mode, the fill regenerates using your latest input. Iterate: draw, evaluate, draw again. The feedback loop is fast.

---

## Creative Variations

### Calligraphic Portrait

Draw a single brush-like stroke --- thick at the start, tapering to a point. A stroke that a calligrapher would make with a loaded brush.

- **Mode:** Balanced.
- **Interval:** 1.5 mm.
- **Angle:** 30° (the natural angle of a broad-nib pen held in the right hand).
- **Randomization:** 10%.
- **Stroke Thickness:** Thick mode.

The portrait is built from hundreds of calligraphic marks, each one carrying your hand's specific thick-to-thin transition. The result looks like a Zen brush painting assembled from individual strokes.

### Imported SVG Pattern

Instead of drawing on the canvas, import an SVG element:

1. Create a decorative motif in Illustrator, Affinity Designer, or Inkscape --- a leaf, a star, a geometric tessellation unit.
2. Save as SVG.
3. In Vexy Lines, with a Handmade fill selected, import the SVG as your source stroke.
4. Switch to Balanced mode.

The imported motif distributes across the image, sized and weighted by brightness. A leaf motif on a landscape creates a "painting made of leaves" effect. A geometric pattern on an abstract composition creates mathematical texture with imported precision.

### Blend Between Geometric and Organic

Draw two source strokes:

- Stroke 1: A straight, precise horizontal line (geometric, controlled).
- Stroke 2: A loose, wavy scribble (organic, chaotic).

Set **Mode** to **Blend**. In dark areas, the distributed marks resemble the scribble. In light areas, they resemble the straight line. The transition zone --- mid-tones --- produces marks that are half-controlled, half-chaotic. The portrait (or landscape) transitions from order in the highlights to chaos in the shadows, a visual metaphor for control and its absence.

### Paste from Illustrator

Copy a vector path in Illustrator (Cmd+C). Switch to Vexy Lines. Paste (Cmd+V). The pasted path becomes a Handmade source stroke. This workflow lets you design your stroke with Illustrator's precision tools, then deploy it with Vexy Lines' brightness-responsive distribution.

### Multiple Source Strokes in Balanced Mode

Draw three to five different strokes: a straight line, a wave, a zigzag, a spiral, a dot. Switch to Balanced mode. The algorithm cycles through your stroke library, distributing different marks across the image. The result has more visual variety than a single-stroke fill, resembling the natural variation of a hand-drawn illustration where the artist's marks are never exactly identical.

- **Randomization:** 20--30% for each stroke to have slightly different placement and rotation.
- **Interval:** 1.5 mm.

---

## Tips

- **Balanced is the quickest path to results.** If you are experimenting, start with Balanced mode. Draw one stroke. Evaluate. Iterate. Manual mode is for precise work; Blend mode is for advanced brightness-driven morphing. Balanced is where most users spend most of their time.
- **Your stroke quality is the fill's quality.** A clumsy stroke produces clumsy texture. A confident stroke produces confident texture. Take time with your source strokes --- they are the DNA of the entire fill. Five minutes of careful stroke experimentation pays off across the whole image.
- **Short strokes tile better than long strokes.** A 10 mm stroke distributes cleanly and fills the image evenly. A 100 mm stroke is harder to tile without awkward overlaps and gaps. If your results look patchy, shorten your source stroke.
- **Blend mode needs distinct source strokes.** If your two source strokes are nearly identical, the blend produces nearly identical marks everywhere --- no visible morphing. Make the source strokes as different as practical: one thick, one thin; one angular, one curved; one long, one short. The more different the inputs, the more visible the brightness-driven transition.
- **Handmade + mask = localised texture.** Draw a specific stroke for a specific area. Hair gets a loose, flowing Handmade stroke. Skin gets [Linear](202-linear.md). Background gets [Halftone](207-halftone.md). Handmade is most powerful when used selectively, providing custom texture where algorithmic fills fall short.
- **Experiment with unexpected imported SVGs.** A company logo. A letter of the alphabet. A leaf outline. A gear icon. The Balanced distribution algorithm treats any shape as a repeatable mark. The creative possibilities are limited only by what you can draw or import.

---

*Previous: [Text: Painting with Letters](212-text.md) | Next: [Combining Fills: The Art of the Stack](214-combining-fills.md)*
