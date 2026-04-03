# Stroke Thickness: Weight from Light

Stroke thickness is where Vexy Lines stops being a pattern generator and starts being an image renderer. Without thickness variation, every stroke in a Linear fill would be the same width regardless of what lies beneath it — a grid of uniform lines, not a portrait. Thickness is the mechanism that translates brightness into visual weight, and understanding its three modes is the difference between a sketch and a masterpiece.

## The Fundamental Relationship

The default behaviour is simple: dark pixels produce thick strokes, light pixels produce thin strokes. A shadow under a chin becomes a cluster of heavy, ink-laden lines. A highlight on a forehead becomes a cluster of wispy hairlines. The eye reads thickness variation as tone, the same way it reads the varying line weights in a copper engraving or a banknote portrait.

This mapping can be inverted. Enable **Thickness Invert** and light pixels produce thick strokes while dark pixels produce thin ones. This is useful for white-on-black compositions or for fills that represent light rather than shadow — imagine radial rays that thicken where the image is brightest, simulating a spotlight.

## The Three Modes

The Stroke Thickness section of the Properties Panel offers a mode selector with three options. Each mode defines the mathematical curve that maps pixel brightness (0 = black, 255 = white) to stroke weight.

### Linear Mode

The mapping is a straight line from Thickness Max (at brightness 0) to Thickness Min (at brightness 255). Midtones get a weight exactly halfway between the two extremes.

- **Character:** Even, predictable, faithful to the source image's tonal range.
- **Best for:** General-purpose work, technical illustration, any subject where you want the full tonal range represented proportionally.
- **Example values:** Min 0.15 mm, Max 1.5 mm. A face rendered in Linear mode at these values will show fine hairlines in the lightest skin areas and solid-feeling lines in the eyebrows and nostrils.

### Thick Mode

The mapping curve is weighted toward the heavy end. Midtones are rendered closer to the maximum weight than in Linear mode. Only the very brightest pixels approach the minimum weight.

- **Character:** Bold, dramatic, high contrast. Dark and mid-dark areas merge into dense, almost solid regions. The image reads as heavier than it actually is.
- **Best for:** Strong graphic work, woodcut simulations, high-contrast portraits, any composition that benefits from visual punch. Works exceptionally well with high-contrast source images that have clear light/dark separation.
- **Example values:** Min 0.2 mm, Max 2.5 mm. A face in Thick mode fills the shadow side almost completely with ink, leaving only the brightest highlights as visible paper.

### Thin Mode

The mapping curve is weighted toward the light end. Midtones are rendered closer to the minimum weight. Only the very darkest pixels approach the maximum weight.

- **Character:** Delicate, airy, detail-preserving. The image reads lighter than it is. Individual strokes remain visible across most of the tonal range, even in moderately dark areas.
- **Best for:** Fine engraving, architectural illustration, subjects with intricate detail that would be lost in heavy ink. Works well with low-contrast source images where you want to preserve subtle tonal differences.
- **Example values:** Min 0.1 mm, Max 0.8 mm. A face in Thin mode shows individual lines even in the darkest shadows, creating a delicate hatching effect throughout.

## Min and Max Values

The **Thickness Min** and **Thickness Max** fields define the weight range in the current document units (mm, px, in, or pt). The mode curve maps brightness to a position within this range.

### Practical Ranges by Use Case

| Use Case | Min | Max | Mode | Why |
|----------|-----|-----|------|-----|
| Fine engraving | 0.05 mm | 0.4 mm | Thin | Hairline precision, every stroke individually legible |
| Classic illustration | 0.15 mm | 1.5 mm | Linear | Full tonal range, balanced weight distribution |
| Bold poster | 0.3 mm | 3.0 mm | Thick | Heavy ink presence, reads from distance |
| Dramatic woodcut | 0.5 mm | 5.0 mm | Thick | Near-solid darks, high contrast |
| Architectural drawing | 0.1 mm | 0.6 mm | Linear | Clean, technical feel with visible line weights |
| Pen-and-ink sketch | 0.2 mm | 1.0 mm | Linear | Natural variation without extremes |
| Laser engraving | 0.1 mm | 0.5 mm | Linear | Consistent burn width, no ultra-thins that vanish |
| Screen print | 0.3 mm | 2.0 mm | Thick | Ink must flow through mesh, thin lines clog |

### The Zero Problem

Setting Thickness Min to exactly 0 means the brightest pixels produce strokes with zero width — effectively invisible. This might seem like a clean way to eliminate strokes in highlights, but it creates a discontinuity: strokes that are almost but not quite zero width are present in the file but invisible to the eye, bloating file size without visual benefit. Use the [Image Threshold](304-image-threshold.md) to exclude highlights instead, and keep Thickness Min at 0.05 mm or above.

## Thickness Smoothing

As a stroke travels across your image, it passes through pixels of varying brightness. Without smoothing, the stroke weight would change at every pixel, producing a jittery, serrated edge — thick here, thin there, thick again one pixel later. Thickness Smoothing (0–100) controls how aggressively these transitions are averaged.

- **0:** No smoothing. The stroke weight responds to every pixel it crosses. Useful only when you want a deliberately rough, textured look, or when your source image has very clean tonal regions with no noise.

- **20–40:** Light smoothing. Weight transitions are softened but still responsive to local detail. A good starting point for most work.

- **50–70:** Moderate smoothing. Weight changes are gentle and gradual. The stroke reads as a confident, intentional line rather than a nervous response to pixel data. This is the range most illustrators settle into.

- **80–100:** Heavy smoothing. The stroke weight barely changes along its length, averaging large regions of the image into a single weight. Useful for calligraphic effects where you want a slow, sweeping taper rather than rapid variation.

### Smoothing and Detail

There is a trade-off. Smoothing that eliminates pixel-level noise also eliminates pixel-level detail. A face with subtle laugh lines around the eyes will lose those lines at high smoothing because the weight variation that would represent them gets averaged away. If fine detail matters, keep smoothing below 50 and ensure your source image is high-resolution and low-noise. If broad tonal sweeps matter more, push smoothing higher.

## Thickness and Interval: The Density Pair

Thickness and [Interval](305-interval-spacing.md) together determine the visual density of your fill. The relationship is geometric:

- When **Thickness Max ≥ Interval**, strokes in the darkest regions touch or overlap. The area appears solid.
- When **Thickness Max < Interval**, there is always white space between strokes, even in the darkest regions. The area appears hatched.
- When **Thickness Min** is close to **Thickness Max**, there is little weight variation. The fill looks uniform, with density controlled purely by the threshold and interval.

A classic engraving look uses Thickness Max at roughly 60–80% of the Interval value. This ensures the darkest areas are dense but never fully solid, preserving the characteristic look of individually visible lines.

## Thickness and File Size

Varying stroke thickness means each stroke is a filled outline (a shape with two edges) rather than a single-width path. This approximately doubles the geometric data compared to constant-width strokes. Heavier max thickness values also mean wider shapes, which can add control points at curves.

For file-size-sensitive work (web SVGs, email attachments), consider:

- Keeping the min-max range narrow. A range of 0.2–0.8 mm produces smaller shapes than 0.1–5.0 mm.
- Using Thickness Smoothing above 40. Smoother transitions mean fewer control points per stroke.
- Combining thickness control with [Image Threshold](304-image-threshold.md) to eliminate strokes in areas where they contribute no useful information.

## Invert: When Light Means Heavy

Enable **Thickness Invert** to reverse the mapping. Now bright pixels produce thick strokes and dark pixels produce thin ones (or no strokes, if the threshold excludes them).

This sounds backwards, but it is exactly right for:

- **White-ink-on-dark-paper** compositions. If your output will be white lines on a dark background, the "light" areas of your image are where you want the most ink.
- **Light-source fills.** A radial fill with inverted thickness thickens where the image is brightest, creating rays that emphasize light rather than shadow.
- **Emboss accents.** Paired with the [Emboss](310-emboss.md) effect, inverted thickness on a secondary fill can simulate the bright side of a 3D surface.

## Step-by-Step: Finding the Right Thickness for a Portrait

1. Start with Linear mode, Min 0.15 mm, Max 1.5 mm, Smoothing 40. This is a neutral starting point.
2. Look at the darkest shadow areas (under the chin, inside nostrils, deep eye sockets). Are the strokes merging into solid black? If yes and you want visible lines, reduce Max or increase Interval.
3. Look at the lightest areas (forehead highlight, tip of nose). Are strokes visible? If they are too faint, increase Min. If they clutter a region that should be clean paper, narrow the threshold range — see [Image Threshold](304-image-threshold.md).
4. Switch to Thick mode. Does the added drama suit the subject? Thick mode is flattering for strong-featured faces and high-contrast lighting.
5. Switch to Thin mode. Does the delicacy suit the subject? Thin mode is flattering for soft lighting and detailed textures like hair or fabric.
6. Adjust Smoothing last. Zoom to 100% and watch the stroke edges as you drag the slider. Find the point where noise disappears but detail survives.

## Further Reading

- [Image Threshold: Choosing What Matters](304-image-threshold.md) — controls which brightness values produce strokes at all, working alongside thickness to define tonal rendering.
- [Interval and Spacing: Density Control](305-interval-spacing.md) — the other half of the density equation.
- [Smoothing and Curve Quality](308-smoothing.md) — Smoothing in the Smoothing section affects path shape; Thickness Smoothing affects weight transitions. They are separate controls with complementary roles.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
