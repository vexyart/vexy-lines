# Combining Fills: The Art of the Stack

A single fill is a technique. Multiple fills are a composition. This is where Vexy Lines stops being a clever filter and becomes an instrument --- where you move from "I applied an effect" to "I built an illustration." Every professional Vexy Lines artwork you have admired uses more than one fill. The fills interact: they layer, they mask each other, they cut through each other, they divide the tonal range between them. Understanding how to combine fills is the difference between using the software and mastering it.

---

## The Stacking Principle

Fills in Vexy Lines stack vertically, like transparent sheets. The fill at the top of the Layers Panel draws on top of everything below it. Each fill is independent --- its own type, its own parameters, its own colour, its own brightness range. They do not blend like Photoshop layers (no opacity, no blend modes). They simply coexist on the same canvas, each contributing its strokes to the final composition.

This independence is the key to powerful combinations. Each fill can target a different aspect of the image. One handles shadows. Another handles midtones. A third handles highlights. One provides outlines. Another provides shading. A third provides texture. The division of labour creates results that no single fill could achieve.

---

## Five Combination Strategies

### Strategy 1: Crosshatching (Same Fill Type, Different Angles)

The simplest and most classical combination. Two or more [Linear](202-linear.md) fills at different angles, layered on the same image.

**The recipe:**

| Fill | Type | Angle | Interval | Threshold |
|------|------|-------|----------|-----------|
| Fill 1 | Linear | 15° | 1.2 mm | Full range |
| Fill 2 | Linear | 75° | 1.5 mm | Shadows + midtones only (drag highlight handle left to ~60%) |
| Fill 3 (optional) | Linear | 135° | 1.5 mm | Shadows only (drag highlight handle left to ~30%) |

**How it works:** Fill 1 covers the entire tonal range with primary-direction lines. Fill 2 adds cross-lines in the mid-to-dark tones, creating the diamond-shaped crosshatch pattern. Fill 3 (if used) adds a third direction in the deepest shadows only. The buildup creates rich tonal gradation:

- Highlights: single-direction lines only (Fill 1).
- Midtones: two-direction crosshatch (Fills 1 + 2).
- Shadows: three-direction dense mesh (Fills 1 + 2 + 3).

**Key detail:** Give each fill a different **Shift** value (even 0.2 mm) to prevent lines from landing on top of each other. Without Shift offsets, overlapping lines merge into illegible bands.

This approach works with [Wave](203-wave.md) fills too. Two Wave fills at different angles with different Phase Shift values create flowing crosshatch with moiré interference patterns.

---

### Strategy 2: Mixed Media (Different Fill Types for Structure + Texture)

Combine fill types that serve different visual roles. The most powerful version: [Trace](208-trace.md) for outlines plus another fill for shading.

**The classic Trace + Linear recipe:**

| Fill | Type | Role | Key Settings |
|------|------|------|-------------|
| Fill 1 (bottom) | Linear | Shading / tonal rendering | Interval 1.5 mm, Angle 45°, threshold excluding brightest 20% |
| Fill 2 (top) | Trace | Outlines / structural definition | Smoothing 50, Min Spot Size 20, Multiplier 2.0, black colour |

The Linear fill renders the photograph's tones as parallel strokes. The Trace fill draws bold outlines around every major shape. Together, they produce an illustration that looks like an inker and a shading artist collaborated.

**Variations on mixed media:**

| Outline Fill | Shading Fill | Result |
|-------------|-------------|--------|
| Trace | Linear | Classic illustration |
| Trace | Halftone | Comic book / pop art |
| Trace | Scribble | Expressive sketch with clean edges |
| Trace | Wave | Art Nouveau illustration |
| Trace | Text | Editorial illustration with typographic fill |

**The Trace + Linear + Halftone triple:**

| Fill | Type | Role | Key Settings |
|------|------|------|-------------|
| Fill 1 | Linear | Shadow shading | Interval 1 mm, Angle 0°, threshold: shadows only |
| Fill 2 | Halftone | Midtone texture | Grid, circles, Interval 2 mm, threshold: midtones only |
| Fill 3 | Trace | Outlines | Smoothing 50, bold weight |

Shadows get dense parallel lines. Midtones get halftone dots. Highlights get nothing (white space). Outlines tie everything together. The result is a rich multi-technique illustration that looks hand-crafted.

---

### Strategy 3: Tonal Stacking (Same or Different Types Targeting Different Brightness Bands)

Divide the image into tonal bands and assign a separate fill to each. This is the most precise way to control how different parts of the image are rendered.

**The principle:** The Image Threshold histogram has two handles. The left handle sets the shadow boundary. The right handle sets the highlight boundary. Each fill only generates strokes for pixels within its threshold range.

**Three-band portrait recipe:**

| Fill | Targets | Type | Settings |
|------|---------|------|----------|
| Shadow fill | Darkest 30% | Linear | Interval 0.8 mm, Angle 30°, colour black |
| Midtone fill | Middle 40% | Wave | Interval 1.2 mm, Wave Height 5, colour dark grey |
| Highlight fill | Lightest 30% | Halftone | Grid, circles, Interval 2 mm, colour light grey |

Each fill renders only its tonal band. Shadows become dense linear strokes. Midtones become flowing waves. Highlights become scattered dots. The three textures coexist without overlapping, creating a composition that reads differently at every tonal level.

**Threshold handle positions for three bands:**

- Shadow fill: Left handle at 0%, right handle at 30%.
- Midtone fill: Left handle at 30%, right handle at 70%.
- Highlight fill: Left handle at 70%, right handle at 100%.

Overlap the bands slightly (by 5--10%) for smoother transitions. Sharply separated bands create visible tonal "steps."

---

### Strategy 4: Colour Separation for Screen Printing

Each fill becomes a separate colour plate. This is the professional workflow for screen printing, risograph, and multi-colour letterpress.

**CMYK separation recipe:**

| Fill | Colour | Type | Angle | Notes |
|------|--------|------|-------|-------|
| Cyan plate | Cyan | Halftone (Grid, circles) | 15° | |
| Magenta plate | Magenta | Halftone (Grid, circles) | 75° | |
| Yellow plate | Yellow | Halftone (Grid, circles) | 0° | |
| Black plate | Black | Halftone (Grid, circles) | 45° | |

The different angles prevent moiré patterns when the plates overlap in printing. These are the traditional screen angles used in commercial printing for decades.

**Export each fill separately:** Hide all fills except one. Export as SVG or PDF. Repeat for each colour. Each file becomes a printing plate.

**Spot colour variation:** For screen printing with custom spot colours (not CMYK), replace the Halftone fills with Linear fills:

| Fill | Colour | Type | Angle |
|------|--------|------|-------|
| Dark ink | Navy blue | Linear | 30° |
| Light ink | Gold | Linear | 120° |

Set each fill's threshold to target the tonal range appropriate for that ink. The dark ink covers shadows and midtones. The light ink covers midtones and highlights. Where they overlap, the inks mix on the print.

---

### Strategy 5: Overlap Control Weaving

Overlap Control is the most sophisticated combination technique. It allows fills to physically cut through each other, creating interwoven patterns where one fill's strokes interrupt another's.

**The controls:**

- **Can cut other fills:** This fill's strokes slice gaps in fills below it.
- **Can be cut by other fills:** Fills above this one can slice gaps in its strokes.

**Enable both** on two fills, and they weave: each cuts through the other at intersection points, like warp and weft threads on a loom.

**Basic weave recipe:**

| Fill | Type | Angle | Can Cut Others | Can Be Cut |
|------|------|-------|----------------|------------|
| Fill 1 (bottom) | Linear | 0° | Yes | Yes |
| Fill 2 (top) | Linear | 90° | Yes | Yes |

Horizontal lines and vertical lines cross each other. At each intersection, one line passes "over" and the other passes "under," creating a woven fabric effect. The over/under alternation is determined by the stacking order and the dash/gap parameters.

**Dash and gap parameters** control the cut pattern:

- **Dash:** Length of the visible stroke segment at each cut.
- **Gap:** Length of the invisible gap at each cut.

Short dashes with short gaps create a dense, tightly woven pattern. Long dashes with short gaps create long strokes with brief interruptions. Experiment with asymmetric values (long dash on one fill, short dash on the other) for complex over-under patterns.

**Four orientation modes** control the angle at which cuts happen relative to the strokes. The default works for most situations. Experiment with alternatives when the cut angles do not align with your composition.

---

## Complete Walkthrough: Multi-Technique Portrait

This walkthrough builds a rich, layered portrait using four fills working together.

### 1. Choose your image

A high-contrast portrait with strong lighting. Clear shadows, defined features, a distinct separation between subject and background.

### 2. Layer 1: Trace outlines (top layer)

Add a [Trace](208-trace.md) fill.

- **Smoothing:** 50.
- **Min Spot Size:** 25 px.
- **Multiplier:** 2.0. Bold outlines.
- **Colour:** Black.
- **Image Threshold:** Full range.

This fill provides the structural skeleton of the illustration. Every major edge --- face outline, eyes, nose, lips, hair boundary --- gets a clean vector outline.

### 3. Layer 2: Linear primary shading

Add a [Linear](202-linear.md) fill. Drag it below the Trace fill in the Layers Panel.

- **Interval:** 1.2 mm.
- **Angle:** 0° (horizontal).
- **Smoothing:** 30.
- **Stroke Thickness:** Linear mode.
- **Image Threshold:** Full range.
- **Colour:** Black.

This fill provides the primary tonal rendering. Horizontal lines varying in thickness carry the portrait's light-to-dark gradients.

### 4. Layer 3: Linear crosshatch for shadows

Add another [Linear](202-linear.md) fill. Place it below the first Linear fill.

- **Interval:** 1.5 mm.
- **Angle:** 90° (vertical).
- **Smoothing:** 30.
- **Stroke Thickness:** Linear mode.
- **Image Threshold:** Narrow to the darkest 50%. Drag the highlight handle left so this fill only appears in the shadow regions.
- **Shift:** 0.3 mm.
- **Colour:** Black.

This fill adds perpendicular crosshatch only in the shadows. Highlights retain single-direction lines from Layer 2. Shadows gain the dense, diamond-pattern crosshatch from both layers working together.

### 5. Layer 4: Halftone highlight texture

Add a [Halftone](207-halftone.md) fill. Place it at the bottom of the stack.

- **Mode:** Random.
- **Shape:** Circle.
- **Interval:** 2.5 mm.
- **Image Threshold:** Narrow to the lightest 30%. Drag the shadow handle right so this fill only appears in highlights.
- **Colour:** Light grey (60% black).

The lightest areas of the portrait --- the forehead catch light, the tip of the nose, the whites of the eyes --- receive a scattering of small dots. This adds texture to areas that the Linear fills leave mostly empty, preventing the highlights from looking like blank paper.

### 6. Evaluate the stack

Toggle each fill on and off individually:

- Trace only: clean outlines, no shading.
- Linear (0°) only: horizontal shading, full tonal range.
- Linear (90°) only: vertical crosshatch, shadows only.
- Halftone only: scattered dots, highlights only.
- All together: a rich, multi-technique illustration with bold outlines, crosshatched shadows, clean midtone shading, and textured highlights.

### 7. Refine

Adjust each fill's threshold handles to control the tonal boundaries. If the crosshatch appears too high into the midtones, push its threshold darker. If the halftone dots appear too deep into the shadows, push its threshold lighter. The goal: smooth transitions between techniques across the tonal range.

### 8. Optional: Dynamic Color

Enable Dynamic Color on the Linear fills (both of them). Set segment length to 4 mm. The shading strokes now carry the source image's colours --- skin tones, hair colours, background hues --- while the Trace outlines remain solid black and the Halftone dots remain light grey. The result: a colour illustration with black outlines, reminiscent of a hand-coloured engraving.

---

## Additional Recipes

### Spiderweb: Radial + Circular

Two fills sharing a center point:

- [Radial](206-radial.md): default density, colour dark grey.
- [Circular](204-circular.md): Interval 3 mm, colour black.

The radial rays and concentric rings intersect to form a web-like lattice. Both fills respond to image brightness, so the web is dense in dark areas and sparse in light areas. Place the shared center on the subject's eye for maximum effect.

### Topographic Portrait: Multiple Circular Fills

Three [Circular](204-circular.md) fills with the same center but different threshold bands and colours:

- Fill 1: Shadows, Interval 1 mm, colour black.
- Fill 2: Midtones, Interval 1.5 mm, colour medium grey.
- Fill 3: Highlights, Interval 2 mm, colour light grey.

The concentric rings create a topographic map of the face, with denser rings in the shadows (steep terrain) and sparser rings in the highlights (flat terrain).

### Sketch + Clean: Scribble + Trace

- [Scribble](210-scribble.md): Interval 1 mm, Randomization 60%, full tonal range.
- [Trace](208-trace.md): Smoothing 60, bold outlines, full range.

The Scribble fill provides chaotic, energetic texture throughout the image. The Trace fill overlays clean outlines that define shapes. The combination reads as "an artist's energetic sketch with confident ink outlines" --- the kind of illustration you find in high-end editorial magazines.

### Maze Portrait: Fractal + Trace

- [Fractal](211-fractal.md): Interval 1.5 mm, Smoothing 10, full range.
- [Trace](208-trace.md): Smoothing 50, Min Spot Size 30, bold outlines.

The fractal space-filling curve provides maze-like interior texture. The traced outlines contain the maze within recognisable shapes. The face is a maze. The outlines tell you it is a face.

---

## Principles for Effective Combinations

### 1. Assign each fill a role

Before adding a fill, know what it is for. "This fill handles outlines." "This fill shades the shadows." "This fill textures the highlights." A fill without a clear role adds visual noise.

### 2. Separate fills by tonal range

The Image Threshold is your most powerful combination tool. Fills that target the same brightness range compete. Fills that target different ranges cooperate. Divide the tonal spectrum and assign territories.

### 3. Vary the visual language

A crosshatch (two Linear fills at different angles) is a valid combination, but the visual language is uniform --- parallel lines in both cases. Mixing fill types (Trace + Linear + Halftone) creates richer visual texture because each fill contributes a different mark language.

### 4. Use Shift to prevent muddy overlap

When two fills of the same type share similar parameters, their strokes can land on top of each other and merge into illegible thick bands. The Shift parameter offsets each fill's pattern, ensuring their strokes interleave rather than overlap.

### 5. Build from the bottom up

Start with the broadest, lowest fill. Add refinements on top. A typical build order:

1. Base shading fill (Linear or Wave, full tonal range).
2. Secondary shading (crosshatch fill, shadows only).
3. Texture fill (Halftone or Scribble, highlights or midtones).
4. Outline fill (Trace, on top of everything).

### 6. Toggle fills on and off while working

Evaluate each fill's contribution independently. If hiding a fill does not noticeably change the composition, the fill is redundant. Remove it. Every fill should earn its place.

### 7. Match density to the fill's role

Outline fills need bold weight and low density. Shading fills need moderate weight and moderate density. Texture fills need light weight and high density. If every fill is dense and bold, the composition becomes a dark, illegible mass.

---

## Tips

- **Start with two fills.** The jump from one fill to two teaches you everything about combination. The jump from two to three refines it. Do not start with four fills --- you will not know which one to adjust when something looks wrong.
- **Trace belongs on top.** In almost every multi-fill composition, the Trace outlines should be the topmost layer. Outlines drawn under shading fills get partially obscured and lose their defining clarity.
- **Crosshatch angles matter.** A 60° difference between Linear fills produces classic diamond crosshatch. A 90° difference produces square grid crosshatch. A 30° difference produces tight, compressed diamonds. The angle *difference* matters more than the absolute angles.
- **Overlap Control is advanced.** Master basic stacking and threshold separation before attempting overlap weaving. The dash/gap/orientation parameters add complexity quickly.
- **Fewer fills, better tuned, beat more fills, poorly tuned.** Three fills with carefully adjusted thresholds, intervals, and weights will always look better than six fills thrown together. Quality over quantity.
- **Save your best combinations as .lines templates.** Once you develop a combination you like, save the document (without the source image) as a template. Apply different source images to the same fill stack for consistent results across a series.

---

*Previous: [Handmade: Your Strokes, Your Rules](213-handmade.md)*

*Return to [Twelve Ways to See](201-part2-tldr.md) | Back to [Table of Contents](001-toc.md)*
