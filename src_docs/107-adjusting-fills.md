# Tuning Your Artwork

A fill straight out of the box looks good. A fill after ten minutes of parameter tuning looks like you spent a month with a burin and a copper plate. The Properties Panel is where that transformation happens.

## The Properties Panel

When you select a fill layer in the Layers Panel (or click on a fill's strokes in the canvas with the Editor tool **V**), the Properties Panel on the right displays every parameter that controls that fill's appearance. The exact set of parameters varies by fill type — a Halftone fill has dot-shape options that a Linear fill doesn't — but a core set appears across nearly all fills.

This article covers the universal parameters. For fill-specific parameters, see the relevant article in Part 2.

## Interval

**What it does:** Controls the spacing between strokes — the distance from one stroke's centre to the next.

**Why it matters:** Interval is the most powerful single parameter. It determines the overall density and fineness of your vector artwork. Nothing else changes the visual impact as dramatically.

| Value | Effect |
|-------|--------|
| Small (0.3–0.5 mm) | Dense, fine detail. Approaches photographic fidelity. |
| Medium (1–2 mm) | Balanced detail and graphic presence. The sweet spot for most work. |
| Large (3–10 mm) | Bold, abstracted. Strong graphic character. |

**Tips:**
- Match Interval to your intended viewing distance. Fine intervals look stunning up close but merge into flat grey from across a room. Larger intervals read clearly from a distance.
- Two fills at the same Interval produce even crosshatching. Two fills at different Intervals create a primary/secondary hierarchy — the coarser fill dominates while the finer fill adds subtle tonal detail.
- Very small Interval values on large documents produce enormous numbers of paths, which can slow rendering and make exports heavy. See [Controlling When Vexy Recalculates](112-refresh-controls.md) if performance becomes an issue.

## Angle

**What it does:** Rotates the fill pattern, in degrees.

**Why it matters:** Angle changes the visual character without changing the density or tone. Horizontal lines feel calm. Diagonal lines feel dynamic. Vertical lines feel solemn. The same image, same interval — a 45-degree rotation changes the mood entirely.

| Value | Effect |
|-------|--------|
| 0° | Horizontal lines. Calm, wide, restful. |
| 45° | Classic engraving diagonal. Dynamic and conventional. |
| 90° | Vertical lines. Tall, solemn, rain-like. |
| Any other angle | Unconventional. Can feel fresh or unsettling. |

**Tips:**
- 45 degrees is the "safe" angle — it avoids visual interference with the horizontal and vertical edges of rectangular images.
- For crosshatching, use two fills 90 degrees apart (e.g., 45° and 135°, or 0° and 90°).
- Angle wraps at 180°: a fill at 0° and a fill at 180° look identical, since lines have orientation but no direction.

## Image Threshold

**What it does:** Controls which brightness values in the source image produce strokes. Displayed as a histogram with adjustable handles for shadows, midtones, and highlights.

**Why it matters:** This is your tonal editor. The histogram shows the distribution of brightness values in your source image. By moving the handles, you decide which parts of that distribution generate strokes.

**The three handles:**

- **Shadows handle** (left side) — Sets the darkest brightness value that produces strokes. Move it right to start dropping the very darkest tones, leaving pure shadows empty.
- **Highlights handle** (right side) — Sets the brightest value that produces strokes. Move it left to stop generating strokes in highlights, leaving bright areas completely white.
- **Midtone handle** (centre) — Shifts the tonal balance. Drag it left to weight the fill toward highlights (lighter overall). Drag right to weight toward shadows (darker overall).

**Practical examples:**

| Adjustment | Result |
|-----------|--------|
| Default (full range) | Strokes everywhere — darks are thick, lights are thin |
| Pull highlights handle left | Bright areas go completely blank. High-contrast look. |
| Pull shadows handle right | Dark areas go blank. Ethereal, highlight-only rendering. |
| Narrow both handles toward midtones | Only mid-brightness areas get strokes. Shadows and highlights both go blank. |
| Shift midtone handle left | Overall lighter rendering. More white space. |
| Shift midtone handle right | Overall darker rendering. Heavier coverage. |

**Tips:**
- If your fill looks too dark and muddy, pull the highlights handle leftward. The white space you create adds contrast and clarity.
- If your fill looks washed out, push the shadows handle rightward or shift the midtone handle to the right.
- The histogram shape tells you about your source image. A peak on the left means lots of dark pixels. A peak on the right means lots of light pixels. Adjust accordingly.

## Stroke Thickness

**What it does:** Controls how source image brightness maps to stroke weight. Three modes, each producing a different tonal curve.

**The three modes:**

- **Linear** — Proportional mapping. Brightness maps directly to stroke weight with no bias. The most neutral and predictable mode.
- **Thick** — Biased toward heavy strokes. Dark areas become very dark; mid-tones are rendered with more weight than Linear would give them. The overall effect is richer, inkier, more dramatic.
- **Thin** — Biased toward fine strokes. Light areas stay light; mid-tones render with less weight. The effect is airier, more delicate, with more visible white space.

| Mode | Character | Best For |
|------|-----------|----------|
| **Linear** | Neutral, even tonal range | Technical illustration, balanced portraits |
| **Thick** | Rich, heavy, dramatic | Bold graphics, high-contrast art, dark subjects |
| **Thin** | Light, airy, delicate | Bright subjects, watercolour-like effects, minimalism |

**Tips:**
- Try all three modes on the same fill. The difference is immediately visible and you'll develop a preference quickly.
- Thick mode on a dark source image can produce nearly solid black areas. Combine with Image Threshold adjustments to keep things open.
- Thin mode on a bright source image may produce barely visible strokes. Increase Interval to compensate, or shift the midtone handle toward shadows.

## Smoothing

**What it does:** Controls how smooth the generated stroke paths are. Higher values produce smoother, more flowing curves. Lower values allow more angular, pixelated stroke edges.

**Why it matters:** At low Interval values, individual strokes follow fine brightness variations in the source image. Without smoothing, these strokes can look jagged — their edges jitter as they respond to pixel-level brightness changes. Smoothing averages these variations into fluid curves.

**Tips:**
- Higher Smoothing produces more elegant strokes but may lose fine detail. It's a trade-off between smoothness and fidelity.
- For organic subjects (portraits, landscapes), higher Smoothing usually looks better.
- For technical subjects (architecture, machinery), lower Smoothing preserves hard edges.
- Smoothing also affects export file size: smoother curves can sometimes be described with fewer control points, producing smaller SVG files.

## Randomization

**What it does:** Adds controlled disorder to stroke placement, on a scale from 0% (perfectly regular) to 100% (maximum chaos).

**Why it matters:** Perfectly regular patterns can look mechanical — too precise, too digital. A small amount of randomisation introduces the kind of organic variation that makes output look hand-made rather than computed.

| Value | Effect |
|-------|--------|
| 0% | Perfect regularity. Every stroke exactly where the algorithm places it. |
| 5–15% | Subtle variation. Looks hand-drawn without being messy. The sweet spot for most work. |
| 25–50% | Noticeable disorder. Strokes shift and jitter visibly. Energetic, sketchy feel. |
| 75–100% | Heavy chaos. Pattern structure nearly dissolves. Useful for abstract textures. |

**Tips:**
- Even 5% Randomization makes a surprising difference. Try toggling between 0% and 5% on a Linear fill to see it.
- Randomization interacts with Interval: at large Intervals, small percentages produce bigger absolute shifts (because the spacing is larger to begin with).
- High Randomization with Scribble fills can produce genuinely chaotic, expressive textures. High Randomization with Linear fills tends to look messy rather than expressive — the contrast between "supposed to be straight lines" and "they're not" reads as error rather than style. Know which fill types benefit.

## Shift

**What it does:** Offsets the entire pattern from its default starting position, sliding it across the canvas.

**Why it matters:** When stacking multiple fills, Shift lets you prevent exact alignment between layers. Two Linear fills at the same Angle but different Shifts produce a moiré-like optical effect that can be beautiful or distracting — Shift gives you control.

**Tips:**
- If two fills at similar angles produce visual interference (moiré patterns), nudge one with Shift to break the alignment.
- Shift is also useful for precisely positioning a pattern relative to a specific feature in the source image — centring a ring pattern over an eye, for instance.

## Dynamic Color

**What it does:** When enabled, each stroke samples the colour of the source image pixel beneath it, instead of using a flat fill colour.

**Why it matters:** This single toggle transforms monochrome vector artwork into full-colour illustration. A Linear fill with Dynamic Color produces a striped colour rendering of your photo. A Halftone fill with Dynamic Color produces coloured dots. Every fill type gains a colour dimension.

**Tips:**
- Dynamic Color requires a colour source image (obviously). If your source is greyscale, Dynamic Color produces greyscale strokes — functional but visually identical to choosing a grey fill colour manually.
- The colour is sampled at the stroke's position, so fine Intervals produce more colour fidelity (more strokes = more samples). At large Intervals, colour becomes impressionistic — broad swaths of the average colour in each region.
- Dynamic Color increases visual complexity. For clean, graphic looks, monochrome fills often work better. For illustration and artistic expression, Dynamic Color opens a wide creative range.

## Layering Fills: The Composition Principle

One fill is a sketch. Two fills become an engraving. Three fills approach the richness of a mezzotint.

Each fill layer in Vexy Lines is independent: its own algorithm, its own parameters, its own mask. Stacking fills is how you build complex, nuanced artwork:

- **Crosshatching:** Two Linear fills at perpendicular angles.
- **Tone + texture:** A fine Linear fill for tonal rendering, with a coarse Scribble fill for energy in the shadows.
- **Mixed media:** A Halftone fill for the background, a Trace fill for edge definition, a Handmade fill for expressive foreground detail.

There's no limit to how many fills you can stack (beyond your computer's patience and the [refresh controls](112-refresh-controls.md)). Each fill reads the same source image independently and generates its own vector paths.

To control *where* each fill appears — making the Halftone fill cover only the background while the Linear fill covers only the face — you use **masks**. That's the next article: [Hiding and Revealing](108-basic-masks.md).
