# Your First Fill

This is the moment the software earns its keep. You have a photograph on the canvas — a face, a landscape, a still life, anything with tonal variety. You're about to turn it into vector art with a single click and two slider adjustments.

## Adding a Linear Fill

In the **Layers Panel** (lower-right corner of the workspace), click the **+** button. A menu appears listing all twelve fill types. Choose **Linear**.

The canvas transforms. Where there was a photograph, there are now parallel lines — horizontal by default — whose thickness varies with the brightness of the image beneath them. Dark regions of the photo produce thick, heavy strokes. Bright regions produce thin strokes, or no strokes at all. Mid-tones produce proportional weights in between.

You're looking at a vector engraving. Every one of those lines is a mathematically defined Bezier curve, scalable to any size, printable at any resolution. And it took one click.

Take a moment to zoom in (**Alt + scroll wheel** or press **Z** and click). Notice that the strokes are perfectly smooth at every magnification. There are no pixels. This is vector artwork — it looks as clean printed on a postcard as it would printed on a wall.

## The Interval Slider

Now look at the **Properties Panel** on the right. The topmost parameter (or one of the first you'll see) is **Interval**. This controls the spacing between the parallel lines — the distance from one stroke centre to the next.

Drag **Interval** to the left, toward smaller values. Try **0.5 mm**. The lines pack tighter together, and the image sharpens. Fine details emerge — individual eyelashes, texture in fabric, the grain of wood. The effect is delicate, precise, like a banknote portrait or a steel engraving.

Now drag **Interval** to the right. Try **2 mm**. The lines spread apart. Detail vanishes, but the image becomes bolder, more graphic. There's an appealing coarseness to it, like a woodcut or a linocut print.

Push further. Try **5 mm** or even **10 mm**. Now you're in poster territory — massive strokes that reduce your image to its most essential shapes. This is abstraction by way of spacing.

**Interval is the single most impactful parameter in Vexy Lines.** If you never touch another control, this one alone gives you a range from photographic fineness to bold graphic abstraction. Here's a rough guide to what different values produce:

| Interval | Character | Reminds You Of |
|----------|-----------|---------------|
| 0.3–0.5 mm | Ultra-fine, almost photographic | Banknote portraits, security engraving |
| 0.5–1.0 mm | Fine detail, clear tonal range | Copperplate engraving, book illustrations |
| 1.0–2.0 mm | Medium weight, readable and bold | Woodcuts, editorial illustration |
| 2.0–5.0 mm | Bold strokes, simplified forms | Linocuts, poster art |
| 5.0–15 mm | Very bold, abstract | Graphic design elements, patterns |

Set it wherever you like. There's no "correct" Interval — it depends entirely on the size of your document, the detail in your source image, and the look you want. For this first experiment, somewhere around **1.0 mm** gives a satisfying balance of detail and clarity.

## The Angle Slider

Below Interval (or nearby in the Properties Panel), you'll find **Angle**. This rotates the direction of the parallel lines.

The default is **0 degrees** — horizontal lines. Try these:

- **45 degrees** — The classic engraving diagonal. Most traditional engravings use a diagonal because it avoids aligning with the horizontal and vertical edges of the image, which can create visual interference patterns. This is the "safe" choice and it almost always looks good.

- **90 degrees** — Vertical lines. A completely different mood. Vertical strokes emphasise height, make portraits look more solemn, and give landscapes a sense of rain or falling light.

- **30 degrees** or **60 degrees** — Shallower or steeper diagonals. Subtly different from 45, these feel less conventional and can add visual interest.

- **135 degrees** — The mirror-image diagonal. Combined with a second fill at 45 degrees, this produces crosshatching (more on that in a moment).

The Angle parameter wraps around: 180 degrees looks the same as 0 degrees, since lines have no direction, only orientation.

Try rotating the angle slowly and watch how the character of the image changes. A portrait that looks stoic with vertical lines looks dynamic with diagonal lines and gentle with horizontal ones. The same data, the same algorithm, the same spacing — just a rotation — and the emotional register shifts.

## Dynamic Color

While you're exploring, try this: find the **Dynamic Color** toggle in the Properties Panel and turn it on.

The strokes change from a single flat colour (black, by default) to a rainbow of colours sampled from the source image. Each stroke picks up the colour of the pixel beneath it. A portrait's skin tones, eye colour, and hair colour all appear in the vector strokes.

This transforms the output from monochrome engraving to full-colour vector illustration. It's one checkbox. The effect is dramatic.

Dynamic Color works with any fill type, not just Linear. But it's most striking on your first Linear fill because the parallel lines create a surprisingly accurate colour image — like a colour photograph rendered entirely in strokes.

Turn it off again for now. We'll come back to it in [Part 4](001-toc.md). Monochrome fills are easier to learn from because you can see the relationship between brightness and stroke weight more clearly.

## The "Wow" Moment

By now, you've done three things:

1. Clicked **+** and chose **Linear**.
2. Dragged **Interval** to taste.
3. Rotated **Angle** to taste.

And you have a piece of vector artwork that genuinely looks like a hand-crafted engraving. It's not a filter — those strokes are real vector paths you can open in Illustrator, edit point by point, scale to any size, and print at any resolution.

This is the core of Vexy Lines. Everything else in the application — the eleven other fill types, the masking system, the layers and groups, the mesh warping, the threshold histogram — builds on this foundation. Those features give you control, nuance, and creative range. But the fundamental transaction is always the same: brightness values go in, vector strokes come out.

## Your Second Fill (Crosshatching)

Ready for the next leap? Add a second fill on top of the first one.

1. Click **+** in the Layers Panel again.
2. Choose **Linear** again (yes, the same fill type).
3. In the Properties Panel, set the new fill's **Angle** to **90 degrees** (or 135 degrees if your first fill is at 45).
4. Set its **Interval** to the same value as your first fill, or slightly larger.

Now you have two sets of parallel lines crossing each other — classic **crosshatching**. In the dark areas of the image, both sets of lines are thick, creating a dense mesh. In the bright areas, both sets thin out or disappear. In the mid-tones, the intersection of two stroke directions creates a woven texture that evokes centuries of printmaking tradition.

This is the "one fill is a sketch, two fills become an engraving" principle. Each additional fill layer adds depth, richness, and visual complexity. Three fills at different angles approach the look of a master engraver. Four fills with varying intervals start to feel like mezzotint.

But you don't need to stop at Linear. Your second fill could be a **Halftone** for a pop-art dot pattern in the background. Or a **Wave** fill for organic flowing lines in one area, masked to cover only part of the image. Or a **Scribble** fill for chaotic energy in the shadows.

The twelve fill types and the ability to stack them infinitely are what make Vexy Lines a creative tool rather than a one-trick converter. [Tuning Your Artwork](107-adjusting-fills.md) covers all the parameters that let you refine each fill. [Hiding and Revealing](108-basic-masks.md) shows you how to use masks to control where each fill appears.

## What Just Happened (Technically)

Behind the interface, here's what Vexy Lines did when you added that Linear fill:

1. **Read the source image** — every pixel, converted to a luminance (brightness) value from 0 (black) to 255 (white).
2. **Generated a grid of parallel lines** at the specified Interval and Angle, covering the entire canvas.
3. **Modulated each line's thickness** based on the luminance of the source image pixels along that line's path. Dark pixels → thick strokes. Bright pixels → thin strokes (or gaps).
4. **Applied the Image Threshold** settings to decide which luminance values produce strokes at all. The default threshold includes the full range, but you can narrow it (more on this in [Tuning Your Artwork](107-adjusting-fills.md)).
5. **Rendered the result** as vector paths on the canvas.

This entire computation happens every time you change a parameter, which is why the [refresh controls](112-refresh-controls.md) exist — for complex documents, you may want to control when recalculation happens rather than letting it run continuously.

## Next Steps

You've made your first fill. You've rotated it, spaced it, and possibly crosshatched it. The output is already something you could export and use. From here:

- [Tuning Your Artwork](107-adjusting-fills.md) covers every parameter in the Properties Panel — including the powerful Image Threshold histogram and the Stroke Thickness modes.
- [Hiding and Revealing](108-basic-masks.md) teaches you to use masks, so different fills appear in different areas of the image.
- [Getting Your Art Out](110-exporting.md) explains how to export when you're ready.

Or, if you can't resist experimenting, click that **+** button again and try a fill type you haven't used yet. Wave, Halftone, and Scribble are all immediately rewarding.
