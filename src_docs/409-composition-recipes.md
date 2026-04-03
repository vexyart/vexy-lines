# Composition Recipes

Theory is useful. Recipes are faster. Here are five complete layer-stack blueprints — each with specific parameter values, mask instructions, and stacking order — that you can build in fifteen minutes and tweak for the rest of the afternoon.

Every recipe starts with a source photo, ends with an export-ready composition, and uses only techniques covered in Parts 1–4 of this manual. Think of them as templates: follow them exactly once, then break every rule the second time.

---

## Recipe 1: Classic Portrait Engraving

The look: a copper-plate engraving of a human face. Dense crosshatching in the shadows, delicate single lines in the highlights, clean contour outlines framing everything. The kind of illustration you'd find on currency or a vintage book frontispiece.

### Source Photo

A well-lit portrait with strong contrast. Front or three-quarter lighting. Avoid flat lighting — you need distinct shadow and highlight regions for the crosshatch to read.

### Layer Stack (Bottom to Top)

| Layer | Fill | Interval | Angle | Thickness Mode | Threshold | Mask |
|-------|------|----------|-------|---------------|-----------|------|
| 1 (bottom) | Linear | 2.5 mm | 15° | Linear | Highlights only (180–255) | Full canvas |
| 2 | Linear | 1.5 mm | 15° | Thick | Full range | Mask to face + neck |
| 3 | Linear | 1.5 mm | 75° | Thin | Shadows only (0–100) | Mask to face + neck |
| 4 | Scribble | 1.8 mm | — | Linear | Midtones (60–180) | Mask to hair only |
| 5 (top) | Trace | — | — | 0.3 mm fixed | Full range | Full canvas |

### Building It

1. Open your portrait. Add Layer 1 (Linear, 2.5 mm, 15°). Set Image Threshold to highlights only (drag left handle to 180). This creates the lightest background texture across the whole canvas.

2. Add Layer 2 (Linear, 1.5 mm, 15°, Thick mode). This is the primary shading layer. Mask it to the face and neck using auto-detection or the Brush. The Thick mode means dark areas get heavy strokes.

3. Add Layer 3 (Linear, 1.5 mm, 75°, Thin mode). Set threshold to shadows only (right handle to 100). Mask to the same face region. This creates crosshatching — Layer 2's strokes at 15° and Layer 3's strokes at 75° cross each other only in the darkest areas.

4. Add Layer 4 (Scribble, 1.8 mm). Mask to the hair. The chaotic strokes give hair an organic texture that straight lines can't match.

5. Add Layer 5 (Trace) on top. Keep smoothing at 70, min spot size at 3 px. The contour outlines frame the face and separate it from the background.

6. Export as SVG for scalable vector, PDF for print.

### Variations

- Replace the Scribble hair layer with a Wave fill for flowing, art-nouveau hair.
- Add a sixth layer: Circular fill centred behind the head, wide interval (4 mm), masked to the background. Creates a subtle radial halo.
- For a woodcut look: increase all intervals by 50%, set all thickness modes to Thick, add 15–20% Randomization to every layer.

---

## Recipe 2: Landscape with Atmospheric Depth

The look: a sweeping landscape where the background is soft and sparse, the midground is moderate, and the foreground is dense and detailed. The fill density creates the illusion of atmospheric perspective — distant objects rendered with less contrast and wider spacing.

### Source Photo

A landscape with clear foreground, midground, and background separation. A mountain scene, a field with distant trees, or a cityscape with depth layers all work.

### Layer Stack (Bottom to Top)

| Layer | Fill | Interval | Angle | Special | Threshold | Mask |
|-------|------|----------|-------|---------|-----------|------|
| 1 | Wave | 4.0 mm | 0° | Wave Height 5 mm, Length 15 mm | Full range | Mask to sky + distant mountains |
| 2 | Linear | 2.0 mm | 10° | Randomization 15% | Full range, low contrast | Mask to midground |
| 3 | Fractal | 1.5 mm | — | — | Full range | Mask to foreground vegetation |
| 4 | Linear | 0.8 mm | 45° | — | Shadows (0–120) | Mask to foreground objects |
| 5 | Trace | — | — | Smoothing 80 | Midtones (60–200) | Full canvas |

### Building It

1. **Sky and background** (Layer 1): Wave fill, wide interval, gentle amplitude. The flowing curves evoke clouds and atmospheric haze. Mask to the sky and any distant terrain. The wide spacing reads as "far away."

2. **Midground** (Layer 2): Linear fill at 10° (nearly horizontal — echoing the horizon line). Moderate interval. 15% randomization softens the mechanical precision. Mask to the midground band.

3. **Foreground vegetation** (Layer 3): Fractal fill at 1.5 mm. The space-filling Peano curves create organic complexity that mimics foliage, grass, or rocky texture. Mask to the foreground.

4. **Foreground shadows** (Layer 4): Linear fill at 45°, tight interval, shadow-only threshold. This adds dark structural weight to the foreground, grounding it. Mask to the main foreground objects (a rock, a tree trunk, a fence).

5. **Outlines** (Layer 5): Trace fill across the full canvas, but with a threshold that skips the subtlest edges. This adds definition without outlining every blade of grass.

### Water

If your landscape includes water (a lake, a river):

- Add a Wave fill masked to the water area: Wave Height 2 mm, Wave Length 20 mm, angle 0° (horizontal).
- Duplicate the fill, shift its phase by 50%, reduce opacity to 50%. The two overlapping wave patterns create a convincing shimmer.

---

## Recipe 3: Pop Art

The look: Roy Lichtenstein meets Andy Warhol. Bold halftone dots, thick outlines, flat colour areas, and aggressive contrast. The kind of image that belongs silk-screened on a gallery wall or printed as a poster.

### Source Photo

A close-up face or a single bold object. Simple composition with strong shapes — a face in profile, a soda can, a shoe. Complex scenes with many small elements don't pop-art well.

### Layer Stack (Bottom to Top)

| Layer | Fill | Interval | Special | Threshold | Mask |
|-------|------|----------|---------|-----------|------|
| 1 | Halftone | 3.0 mm | Shape: Circle, Grid mode, Dynamic Color ON | Full range | Full canvas |
| 2 | Linear | 0.6 mm | Colour: solid flat (e.g., cyan or magenta) | Shadows only (0–80) | Mask to shadow areas |
| 3 | Trace | — | Smoothing 40, Thickness 1.5 mm | Full range | Full canvas |

### Building It

1. **Halftone base** (Layer 1): Grid mode, circle shape, 3.0 mm interval. Enable **Dynamic Color** — the dots sample colours directly from the source photo, producing the characteristic pop-art dot-colour effect. The dots are large enough to be individually visible, creating the newsprint aesthetic.

2. **Shadow blocks** (Layer 2): Linear fill at tight interval, set to a bold flat colour (magenta, cyan, or black). Threshold locked to deep shadows. Mask to the darkest areas of the face (under the chin, beside the nose, in the hair). This creates the flat shadow blocks that define pop art's graphic punch.

3. **Bold outlines** (Layer 3): Trace fill at 1.5 mm thickness, smoothing reduced to 40 for slightly angular edges (pop art outlines aren't perfectly smooth — they have a printed, imperfect quality). Colour: pure black.

### Key Move

The entire pop-art look depends on the Halftone fill's Dynamic Color being enabled. Without it, you get monochrome dots. With it, each dot picks up the source photo's colour at that point — red dots on lips, blue dots on a denim jacket, skin-tone dots on the face. That colour sampling, at dot-grid resolution, *is* the pop-art effect.

---

## Recipe 4: Technical Drawing

The look: clean, precise, mechanical. No randomisation, no expressive texture — just disciplined parallel lines at exact intervals, masked to precise geometric regions. The visual language of architectural rendering, patent illustrations, and engineering diagrams.

### Source Photo

A product photo, an architectural facade, or a mechanical object. Clean lines and geometric shapes work best. The photo should be well-lit and shot straight-on (not at an angle).

### Layer Stack (Bottom to Top)

| Layer | Fill | Interval | Angle | Special | Mask |
|-------|------|----------|-------|---------|------|
| 1 | Linear | 1.2 mm | 0° | Randomization 0%, Smoothing 100 | Mask to horizontal surfaces |
| 2 | Linear | 1.2 mm | 90° | Randomization 0%, Smoothing 100 | Mask to vertical surfaces |
| 3 | Linear | 1.2 mm | 45° | Randomization 0%, Smoothing 100 | Mask to angled surfaces |
| 4 | Trace | — | — | Smoothing 100, Min Spot Size 5 px | Full canvas |

### Building It

The discipline here is in the masking. Each surface of the object gets a Linear fill at the angle that represents its orientation:

- Horizontal surfaces → 0° lines
- Vertical surfaces → 90° lines
- Angled surfaces → 45° (or match the surface angle)

All fills share the same interval (1.2 mm) and zero randomisation. The result is a drawing where line direction communicates surface orientation — a convention from technical illustration that viewers understand instinctively.

Mask each fill carefully with the Freeform tool (**S**) — technical illustrations demand clean geometric mask boundaries, not freehand brush painting. Use the Editor (**V**) to ensure corners are sharp.

The Trace fill on top provides clean outlines at the boundaries of every surface.

### Export Note

Export as SVG with high smoothing. Technical drawings are often used in documentation where they'll be scaled and printed at various sizes. The zero-randomisation, high-smoothing settings ensure the output is clean at any magnification.

---

## Recipe 5: Mixed Media Collage

The look: multiple visual textures colliding — scribbled backgrounds, hand-drawn details, typographic elements, and geometric halftone blocks. Controlled chaos that looks effortlessly artistic.

### Source Photo

Anything with strong shapes and varied tonal areas. A street scene, a still life, a portrait with an interesting background. The busier the source, the more textures you can justify.

### Layer Stack (Bottom to Top)

| Layer | Fill | Interval | Special | Mask |
|-------|------|----------|---------|------|
| 1 | Scribble | 3.0 mm | Randomization 80%, Dynamic Color ON | Full canvas |
| 2 | Linear | 1.5 mm | Angle 30° | Mask to main subject |
| 3 | Halftone | 2.5 mm | Shape: Diamond, Random mode | Mask to one specific area (e.g., clothing, a wall) |
| 4 | Handmade | — | Mode: Balanced | Mask to a secondary detail area |
| 5 | Text | 1.0 mm | Font: monospaced, content: descriptive words | Mask to a text-appropriate area (sky, flat wall) |
| 6 | Trace | — | Smoothing 50, Thickness 0.8 mm | Full canvas |

### Building It

The magic of mixed media is the *contrast between techniques*. Each fill type has its own visual vocabulary, and slamming them together creates tension and interest:

1. **Scribble background** (Layer 1): Loose, chaotic, warm. Dynamic Color samples the source so the scribbles carry the image's colour palette. This establishes the emotional tone.

2. **Linear subject** (Layer 2): Disciplined parallel lines on the main subject. The contrast between the chaotic background and the structured subject draws the eye to the subject.

3. **Halftone accent** (Layer 3): Diamond-shaped halftone dots on a specific area — a jacket, a building facade, a piece of furniture. This adds graphic punch in a localised region.

4. **Handmade detail** (Layer 4): If you've drawn custom strokes with the Handmade fill, apply them to a small detail area. Balanced mode repeats your strokes across the masked region with algorithmic modulation.

5. **Text layer** (Layer 5): Words related to the image — the subject's name, a location, descriptive adjectives, a poem. Masked to a flat area (sky, wall) so the text is legible against a simple background.

6. **Trace outlines** (Layer 6): Ties everything together. The consistent outline weight across all areas creates visual unity despite the variety of fill techniques below.

### The Glue

What keeps five different fill types from looking like a mess? Two things: the Trace outlines on top (visual unity) and the source photo underneath (tonal unity). Every fill reads from the same brightness data, so they all follow the same light-to-dark logic even though they express it differently.

---

## Adapting These Recipes

Every recipe here is a starting point. The fastest way to make it your own:

1. **Change one fill type.** Replace the Linear shading in the portrait recipe with Wave. Replace the Scribble background in the mixed-media recipe with Fractal. One substitution changes the character completely.

2. **Shift the threshold bands.** Push all fills toward shadows for a dark, brooding look. Push them toward highlights for a light, ethereal look.

3. **Add one more layer.** A seventh layer with a subtle Circular fill centred on the focal point creates a barely visible radial emphasis. Subtlety compounding over multiple layers produces richness.

4. **Change the mask shapes.** Rectangle masks produce formal compositions. Freeform masks produce organic compositions. Brush-painted masks produce loose, editorial compositions.

5. **Enable Dynamic Color on one layer.** Sampling source colours on even a single fill layer introduces colour variety that transforms a monochrome composition into something vibrant.

For more targeted workflows, see Part 5: [From Tool to Craft](501-part5-tldr.md).

*Next: [Cloning for Coordinated Systems](410-cloning-strategies.md)*
