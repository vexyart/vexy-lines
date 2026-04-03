# Text: Painting with Letters

What if every stroke were a letter? What if the shadow under a chin were built from the word "shadow," and the highlight on a cheekbone were spelled out in the subject's name? Text fill replaces vector lines with characters, arranging them so that character density follows image brightness. Dark areas pack tight with overlapping glyphs. Light areas space them thin. From across a room, you see a photograph. From arm's length, you see it is made entirely of type.

This is ASCII art reborn as vector graphics --- scalable, printable, and far more precise than anything a monospaced terminal could produce.

---

## What It Looks Like

Characters from your chosen set distribute across the canvas. In dark regions, letters cluster densely: large, bold, overlapping. In light regions, they shrink and scatter, leaving generous white space. The specific letterforms are visible up close but merge into continuous tone at distance.

The effect varies dramatically depending on the font and character set. A monospaced typeface produces a rigid, terminal-inspired grid. A serif font produces something closer to calligraphic texture. A decorative font becomes pure pattern. The content of the text --- what letters and words appear --- adds a semantic layer that no other fill type can match.

---

## When to Use Text

- **Typographic portraits:** The subject's name, a poem, a quote, or the subject's own words forming their face. The meaning of the text reinforces (or subverts) the image.
- **ASCII art as fine art:** The programmer aesthetic, elevated to gallery print. Monospaced font, dense interval, exported at poster scale.
- **Event and memorial art:** The names of attendees, donors, or the deceased forming an image relevant to the occasion.
- **Promotional and editorial illustration:** A portrait built from the article text, or a product photo built from its specifications.
- **Novelty and gift artwork:** A photo formed from a personal message, a poem, or repeated significant words.
- **Data visualisation crossover:** The text content carries information (names, dates, statistics) while the visual arrangement carries the image.

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Character Set** | The characters used to form the image. Can be a single character, a word, a sentence, or any string. | Single character (e.g., "X") for pure pattern. A name or word for semantic content. The full alphabet for variety. |
| **Font** | The typeface used to render each character. | Monospaced (Courier, Menlo) for ASCII aesthetic. Serif (Times, Georgia) for literary character. Sans-serif (Helvetica, Arial) for clean modern look. |
| **Interval** | Spacing between character placement points, in mm. Controls overall density. | 1 mm for dense text mass. 3 mm for readable individual characters. 6+ mm for large, isolated glyphs. |
| **Angle** | Rotation of the text layout grid. | 0° for horizontal reading direction. 90° for vertical columns. Other angles for dynamic orientation. |
| **Stroke Thickness** | Controls the weight of the character outlines (when characters are rendered as outlines rather than filled shapes). | Thin for delicate letterforms. Medium for balanced. Thick for bold stamp-like characters. |
| **Image Threshold** | Histogram handles controlling which brightness range generates text. | Full range for complete tonal reproduction. Narrow to shadows for text-in-dark-areas-only. |
| **Dynamic Color** | Characters sample the source image colour at their position. | Off for monochrome text. On for characters coloured by the image beneath them. |
| **Smoothing** | Controls the outline quality of character paths. | Low for crisp, precise letterforms. High for softened, slightly rounded characters. |
| **Randomization** | Adds positional and rotational jitter to character placement. | 0% for precise grid alignment. 10--20% for subtle organic scatter. 50%+ for scattered, collaged effect. |
| **Multiplier** | Scales overall character size. | 1.0 default. 0.5 for small, dense characters. 2.0 for large, prominent glyphs. |

---

## Step-by-Step: Portrait Formed from the Subject's Name

This walkthrough creates a typographic portrait where the subject's face is built entirely from repeated instances of their name.

### 1. Choose your image

Select a high-contrast portrait. Dramatic lighting works best --- strong shadows provide the density that makes text accumulation visible. Black-and-white source images are easier for a first attempt, though colour works once you enable Dynamic Color.

### 2. Add a Text fill

Click **+** in the Layers Panel. Select **Text**. Characters appear across the canvas.

### 3. Enter the character set

In the Properties Panel, type the subject's name into the Character Set field. For example: "ALICE". The fill cycles through these characters as it distributes them across the image. Longer strings provide more visual variety; shorter strings create stronger repetition.

For a first attempt, a short name (4--7 characters) works well. Each letter appears frequently enough to be recognisable.

### 4. Choose the font

Select a font that matches the intended mood:

- **Courier or Menlo:** Monospaced. Grid-aligned. Technical and retro.
- **Times New Roman or Georgia:** Serif. Literary and traditional.
- **Helvetica or Arial:** Sans-serif. Clean and modern.
- **A display or script font:** Decorative. Highly stylised but can be harder to read at small sizes.

For a name-based portrait, a clean sans-serif at medium weight is a safe starting point.

### 5. Set the density

- **Interval:** 2 mm. Individual characters are visible at arm's length but dense enough to form continuous tone.
- **Multiplier:** 1.0.

### 6. Configure the layout

- **Angle:** 0°. Horizontal reading direction. The name reads left-to-right across the face.
- **Randomization:** 5%. Just enough to break the grid rigidity without making the text illegible.

### 7. Map brightness to character density

- **Stroke Thickness:** Linear mode. Dark areas get larger, bolder characters. Light areas get smaller, thinner ones.
- **Image Threshold:** Full range.

### 8. Evaluate

Zoom out. The portrait should be recognisable as a face, built entirely from tiny instances of the name. Zoom in. Individual letters should be legible. The name "ALICE" should be readable where character density is not too extreme.

If the face lacks definition, tighten the interval to 1.5 mm. If the text is unreadable, widen to 3 mm. The balance between image fidelity and text legibility is the central tension of Text fill, and every project finds a different sweet spot.

### 9. Optional: Dynamic Color

Enable Dynamic Color. Each character takes the skin tone, hair colour, or background hue of the pixel beneath it. The monochrome text portrait gains warmth and dimensionality. Particularly striking when the name appears in skin tones across the cheeks and forehead, in dark tones through the hair, and in background colours around the edges.

---

## Creative Variations

### Single Repeated Character

Use a single character instead of a word. The letter "O" produces a dot-matrix effect similar to [Halftone](207-halftone.md) but with typographic character. The letter "X" produces aggressive crossmarks. The number "0" and "1" produce a binary/Matrix aesthetic. The character "/" produces a slashed hatching pattern.

- **Character Set:** "O"
- **Font:** Courier (monospaced for even grid).
- **Interval:** 1.5 mm.
- **Randomization:** 0%. Perfect grid.

### Legible Sentence Portrait

Instead of a repeated short name, use a full sentence, paragraph, or poem. The text wraps across the image, forming the portrait while remaining readable as continuous prose to someone patient enough to follow the flow.

- **Character Set:** A full paragraph of text (the longer the better for variety).
- **Font:** A readable serif at adequate size.
- **Interval:** 3 mm. Large enough for individual characters to be legible.
- **Angle:** 0°.
- **Randomization:** 0%. Characters must align in reading order.

The tension between image and text creates dual engagement: the viewer sees the face *and* reads the message. Use the subject's own words, a relevant quote, or the text of the article the portrait accompanies.

### Multi-Font Layering

Two Text fills using different fonts, each targeting a different brightness range:

- Fill 1: Bold sans-serif (Helvetica Bold), threshold narrowed to shadows. Interval 2 mm. These characters form the dark masses --- hair, eye sockets, shadow areas.
- Fill 2: Light serif (Times Italic), threshold narrowed to midtones and highlights. Interval 2.5 mm. These characters form the lighter areas --- skin, clothing, background.

The two fonts create textural contrast. Shadows are bold and assertive. Highlights are delicate and literary. The font choice itself carries semantic weight.

### Typed Texture

Dense text as pure texture, with readability deliberately sacrificed:

- **Character Set:** Full alphabet, numbers, and punctuation.
- **Font:** Monospaced, small.
- **Interval:** 0.6 mm. Characters pack so tightly they merge into texture.
- **Randomization:** 30%. Characters scatter and overlap.
- **Multiplier:** 0.8.

From any reasonable distance, the result reads as a fine-grained texture --- like stippling or dense hatching --- with the typographic origin visible only on very close inspection. The "text" aspect becomes an Easter egg rather than a primary visual element.

### Emoji and Symbol Fill

If your font includes emoji or special symbols, use them as the character set. Hearts, stars, musical notes, arrows, currency symbols --- any character set creates a themed texture.

- **Character Set:** "♥♦♣♠" (card suits) for a poker-themed image.
- **Character Set:** "☀★✦✧" for celestial themes.
- **Character Set:** "$€£¥" for financial commentary.

The semantic content of the symbols adds a layer of meaning to the image that letterforms alone cannot provide.

---

## Tips

- **Readability and image fidelity are in tension.** Large, readable characters mean fewer characters, which means less tonal resolution. Small, dense characters reproduce the image better but become illegible. Every project requires a conscious decision about which matters more. There is no universal right answer.
- **Monospaced fonts align in grids; proportional fonts create texture.** If you want the orderly, terminal-inspired look, use a monospaced font with 0% Randomization. If you want organic, hand-placed character feel, use a proportional font with 10--20% Randomization.
- **Dark characters on light background is the default.** But the reverse --- light characters on a dark background --- works too, provided you invert the brightness logic. Use the Image Threshold to swap which brightness range generates text, or simply invert the source image.
- **Text fill generates many individual paths.** Each character is a separate vector object. At dense intervals, a single fill can produce thousands of character paths. This can slow SVG rendering in some editors. If performance matters, increase Interval or reduce the character count.
- **The character set length affects rhythm.** A single character ("X") creates monotonous regularity. A five-character name ("ALICE") creates a 5-beat rhythm. A full sentence creates pseudo-random variety. Longer character sets look more natural; shorter ones look more deliberate. Neither is better --- they serve different purposes.
- **Text + Trace = annotated illustration.** Use [Trace](208-trace.md) for outlines and Text for interior fill. The traced edges define shapes. The text fills them with content. The combination is particularly effective for editorial illustration where the text content is relevant to the subject.

---

*Previous: [Fractal: Space-Filling Curves](211-fractal.md) | Next: [Handmade: Your Strokes, Your Rules](213-handmade.md)*
