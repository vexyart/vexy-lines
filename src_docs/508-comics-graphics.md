# Comics and Graphic Novels

Inking a comic page by hand takes four to eight hours. A professional inker — someone like Klaus Janson or Scott Williams — earns that time with decades of practice, precise brush control, and an intuitive sense of where thick lines become thin ones. Vexy Lines won't replace that intuition. But it will give you consistent, editable, resolution-independent inking in a fraction of the time, and for artists who write and draw but dread the inking stage, that's worth a conversation.

---

## What Vexy Lines Does for Comics

Comics need three things from their line art:

1. **Bold outlines** that define characters, objects, and panel borders.
2. **Expressive shading** that adds depth and mood without relying on colour (essential for black-and-white work).
3. **Speed** — a monthly book needs 20+ pages per month. Anything that shortens the inking pipeline matters.

Vexy Lines handles all three:

- **Trace fill** for inking (outline generation from pencil art or photo reference).
- **Linear fill** for shadow hatching.
- **Halftone fill** for Ben-Day dots (classic comic shading).
- **Per-group source images** for panel-by-panel workflow.

---

## The Panel-by-Panel Workflow

A comic page has multiple panels, each containing a different scene, angle, or moment. In Vexy Lines, each panel is a **group** with its own source image.

### Setup

1. **Create the document** at your page size. Standard US comic: 6.625 × 10.25 inches at 300 DPI.
2. **Create a group for each panel.** Name them: "Panel 1," "Panel 2," etc.
3. **Assign each panel's source image.** Drag the pencil art (or photo reference) for that panel onto the group header.
4. **Mask each group** to its panel rectangle using the Rectangle mask tool (I).

Now each panel is an independent composition within the page. Fills inside Panel 1 read from Panel 1's source image and render only within Panel 1's rectangular mask. You can work on each panel without affecting the others.

### Panel Borders

Panel borders can be:

- **Rectangle masks** with visible borders (set the mask outline to render as a stroke).
- **A separate layer** at the top of the page with simple rectangles drawn using the Pencil tool (P), not connected to any fill.
- **Part of the Trace fill** if your source art includes panel borders — the Trace algorithm will detect and outline them.

---

## Inking with Trace

The Trace fill is your automated inker. Feed it pencil art and it produces clean vector outlines.

### Settings for Comic Inking

| Parameter | Value | Why |
|-----------|-------|-----|
| **Smoothing** | 50–70 | Clean but not over-smooth. Comic inking has energy — too much smoothing kills it |
| **Min Spot Size** | 5–10 px | Eliminates pencil smudges and scanner noise |
| **Thickness** | 0.5–1.0 mm | Comic outlines are bold. 0.5 mm for interior detail, 1.0 mm for character silhouettes |
| **Threshold** | Adjusted per panel | Pencil art varies in darkness. Set threshold so the Trace captures the intended lines without picking up construction marks |

### Source Art Tips

Trace works best with high-contrast source art:

- **Scan pencils at 600 DPI greyscale.** Higher resolution gives Trace more edge information.
- **Darken pencils digitally** before importing. Increase contrast so pencil lines are near-black against a near-white background.
- **Remove construction lines.** Trace detects all edges — including guidelines, perspective grids, and layout marks. Clean these up before importing, or set the threshold to ignore them (they're usually lighter than the final pencil lines).

### Thick and Thin: The Inking Principle

Professional inking varies line weight constantly: thick on the shadow side of a figure, thin on the light side, thick where forms turn away from the viewer, thin where they face toward. This thick-and-thin variation is what separates dead outlines from living ones.

Vexy Lines' Trace fill generates lines with brightness-mapped thickness: darker edges in the source art produce thicker traces. To exploit this:

1. **Darken the shadow-side pencil lines** in your source art (or do this digitally before importing).
2. **Lighten the light-side lines.**
3. The Trace fill's thickness mapping will automatically produce thick outlines on the shadow side and thin outlines on the light side.

This takes some preparation in the source art but produces inking that has genuine thick-and-thin variation without manual vector editing.

---

## Shadow Hatching with Linear

Comics use hatching to indicate shadows, volume, and mood. In traditional inking, this is done by hand — rows of parallel lines drawn with a nib or brush. In Vexy Lines, it's a Linear fill.

### Settings for Comic Hatching

| Parameter | Value | Why |
|-----------|-------|-----|
| **Interval** | 1.0–2.0 mm | Wider than engraving, because comics are viewed at a larger reduction ratio |
| **Angle** | 45° (classic) or follow the form | 45° is the default shadow direction. Following the form (curving with the body surface) is more sophisticated but requires per-region masking |
| **Thickness** | Thick mode, max 0.8 mm | Shadows should be bold |
| **Threshold** | Shadows only (0–100) | Hatching belongs in the dark areas. Midtones and highlights should be clean white |
| **Randomization** | 5–10% | A little variation feels hand-drawn. Too much looks sloppy. |

### Masking Shadow Areas

Don't apply hatching to the entire panel. Mask it to the specific shadow areas:

- Under chins and jaws
- The dark side of faces and bodies
- Cast shadows from objects
- Interior of coats, capes, hair masses

Use the Brush (B) to paint shadow masks quickly. Comic shadows are often graphic and simplified — you're not matching a photograph's shadow map, you're making dramatic decisions about where darkness lives.

---

## Ben-Day Dots with Halftone

Ben-Day dots — the regular patterns of coloured dots used in classic comics (1940s–1980s) — are a Halftone fill:

| Parameter | Value |
|-----------|-------|
| **Shape** | Circle |
| **Mode** | Grid |
| **Interval** | 2.0–3.0 mm (visible dots, not subtle halftone) |
| **Colour** | The screen colour (red for skin, blue for skies, yellow for highlights) |
| **Threshold** | Biased to control which areas get dots |

### The Classic Two-Tone Look

1. **Black Trace fill** on top (outlines).
2. **Black Linear fill** in the middle (shadow hatching).
3. **Red Halftone fill** at the bottom (skin/warm areas, masked).
4. **Blue Halftone fill** at the bottom (cool areas, masked).

The dots render beneath the black line art. Where they're visible (in the non-shadowed areas), they provide the flat comic-book colour. Where hatching or solid black covers them, they disappear.

---

## Style Presets Across Panels

Once you've set up the fill parameters for one panel — Trace at smoothing 60, Linear at 45°, Halftone at 2.5 mm — you want the same settings across every panel on the page (and every page in the book). Consistency is what makes a comic look professional rather than experimental.

Three approaches:

### 1. Clone Between Panels

Set up the first panel's fills. Clone them into each subsequent panel's group. The clones inherit structural parameters (angle, interval) while letting you adjust masks and thresholds per panel.

### 2. Style Templates

Save the first panel's .lines file as a template. Import it as a group into each new panel, then swap the source image. See [Building a Style Library](510-style-libraries.md).

### 3. Batch Processing

For maximum speed on a full issue, use the CLI tool (vexy-lines-cli) to apply a saved style to every panel source image in a folder. Each panel gets the same fill stack, individually rendered against its own source art. See the CLI documentation for batch workflow details.

---

## Speed Workflow: Page in Under an Hour

For artists under deadline pressure, here's the fastest viable workflow:

1. **Scan all pencils** for the page's panels. Clean up digitally (5 min per panel).
2. **Create the page document** in Vexy Lines. Set up panel groups and assign source images (5 min).
3. **Apply a saved style** to each panel — Trace + Linear + optional Halftone (2 min per panel via template import).
4. **Adjust masks per panel** — paint shadow areas for the Linear fill, mask regions for Halftone colour (5 min per panel).
5. **Export** the full page as SVG or PDF (1 min).

For a 6-panel page: roughly 5 + 5 + 12 + 30 + 1 = 53 minutes. Not as fast as a skilled hand inker on a simple page, but competitive — and the output is infinitely editable.

---

## Lettering and Sound Effects

Vexy Lines' **Text fill** can create large sound-effect text ("BOOM," "CRASH," "THWACK") where the letters themselves are filled with source-image-driven texture. The text appears to be made of the scene it represents — an explosion where the letters are filled with fire texture, a crash where the letters carry debris patterns.

For standard dialogue lettering (speech balloons, captions), do this in a dedicated lettering application or vector editor after exporting the inked art from Vexy Lines. Comic lettering has its own conventions (font choice, balloon placement, tail direction) that are better handled by specialised tools.

---

## Export for Print

| Output | Format | Notes |
|--------|--------|-------|
| Digital distribution | PDF, 300 DPI equivalent | Standard for digital comic platforms |
| Print (individual issue) | PDF at trim size + 3 mm bleed | US comic trim: 6.625 × 10.25 in |
| Print (collected edition) | PDF at book trim size | Varies by publisher |
| Web (webtoon format) | PNG, long vertical strip | Export each panel separately, stack vertically |

See [Preparing Files for Print](511-print-preparation.md) for detailed print production settings.

*Next: [Guilloche and Ornamental Patterns](509-guilloche.md)*
