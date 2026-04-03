# Layer Order and Stacking Strategy

The fill at the bottom of your Layers Panel draws first. Everything above draws on top of it. Miss this principle and you'll spend an hour wondering why your detailed Trace outlines are invisible behind a solid wall of Linear shading. Respect it and you can build compositions where every fill plays its role without stepping on the others.

---

## Bottom-to-Top Rendering

Vexy Lines renders layers in the order they appear in the Layers Panel, from bottom to top:

1. The bottommost layer draws first, laying down strokes on a blank canvas.
2. The next layer draws on top, its strokes covering or interleaving with the first.
3. This continues upward through every layer and group.
4. The topmost layer draws last, on top of everything else.

This is the same model used by Photoshop, Illustrator, and every other layer-based application. But in Vexy Lines, where every layer contains vector strokes rather than pixels, the stacking order has some specific implications:

- **Strokes don't blend by default.** A thick Linear stroke on a higher layer simply obscures the stroke beneath it. There's no transparency blending unless you've used mask opacity or the fill's opacity parameter.
- **Colour determines visual priority.** A black stroke on top of a white area is visible. A white stroke on top of a black area is also visible. But a black stroke on top of another black stroke — from a different fill — is invisible. Plan your colours with stacking in mind.
- **Overlap Control changes the interaction.** When two fills have overlap cutting enabled, the higher fill's strokes can slice through the lower fill's strokes, creating weave patterns. See [Cloning for Coordinated Systems](410-cloning-strategies.md) for details.

---

## The Strategic Stack

After working with hundreds of compositions, a consistent stacking pattern emerges. Here's the blueprint that works for most artwork:

### Layer 1 (Bottom): Background Fill

Wide interval (3–5 mm), low contrast, subtle. This fills the canvas with a gentle texture — Linear at a diagonal, Circular centred off-canvas, or Wave with low amplitude. It provides visual interest in areas not covered by more specific fills.

**Parameters:** Interval 3–5 mm, Randomization 10–20%, Thickness mode Linear, Threshold biased toward highlights (light areas generate strokes, dark areas are left for upper layers).

### Layer 2–3: Mid-Ground Fills

Medium interval (1.5–2.5 mm), moderate contrast. These fills handle the bulk of the tonal rendering — the face in a portrait, the trees in a landscape, the product in a still life.

**Parameters:** Interval 1.5–2.5 mm, Angle chosen for visual direction (15° and 75° for crosshatching), Thickness mode Thick for drama or Thin for delicacy.

Mask these fills to the mid-ground regions. Leave the background and foreground to their own layers.

### Layer 4: Detail/Foreground Fill

Tight interval (0.5–1.2 mm), high contrast, dense. This fill handles the areas with the most visual weight — deep shadows, focal-point details, close-up textures.

**Parameters:** Interval 0.5–1.2 mm, Threshold biased toward shadows (only dark pixels generate strokes), high smoothing (60–80) for clean curves.

### Layer 5 (Top): Outline Fill

Trace fill at the very top of the stack. It detects edges in the source image and draws clean contour lines on top of everything below. Because it renders last, the outlines are never obscured by shading fills.

**Parameters:** Smoothing 60–100, Min Spot Size set to avoid tiny noise contours, Thickness thin (0.2–0.5 mm) for delicate outlines or thick (0.8–1.5 mm) for bold comic-book edges.

---

## The Stacking Table

| Position | Role | Typical Fill | Interval | Threshold Bias |
|----------|------|-------------|----------|----------------|
| Top | Outlines | Trace | — | Full range |
| Upper-mid | Foreground detail | Linear, Halftone | 0.5–1.2 mm | Shadows |
| Middle | Mid-ground shading | Linear, Wave | 1.5–2.5 mm | Midtones |
| Lower-mid | Secondary texture | Scribble, Fractal, Halftone | 2–3 mm | Varies |
| Bottom | Background texture | Linear, Circular, Wave | 3–5 mm | Highlights |

This is a starting point, not a rule book. Swap fills, add layers, remove layers. The principle holds: **coarse at the bottom, fine at the top, outlines on top of everything.**

---

## Reordering Layers

Drag a layer up or down in the Layers Panel to change its position. The canvas updates immediately (or on next Refresh if Auto Refresh is off).

**Keyboard shortcuts:**

- **Cmd+\[** (macOS) or **Ctrl+\[** (Windows): Move selected layer down one position.
- **Cmd+\]** or **Ctrl+\]**: Move selected layer up one position.

When reordering inside groups, the layer moves within the group. To move a layer out of a group, drag it above or below the group boundary.

---

## Overlap Interactions

When two fills share the same spatial region and have Overlap Control enabled, the stacking order determines which fill cuts which:

- A higher fill with "Can Cut Other Fills" enabled will cut strokes from fills below it.
- A lower fill with "Can Be Cut By Other Fills" enabled will have its strokes interrupted by fills above it.

Both checkboxes must participate for the interaction to occur. The visual result depends on the relative angles:

| Angle Difference | Visual Effect |
|-----------------|---------------|
| 0° (parallel) | Clean erasure — higher fill removes lower fill's strokes along parallel lines |
| 45° | Diagonal cutting — creates diamond-shaped gaps |
| 90° (perpendicular) | Crosshatch weave — one fill appears to pass over and under the other |

Play with the Dash and Gap parameters to control the cut pattern. Short dashes with short gaps create a woven fabric effect. Long dashes with short gaps create occasional interruptions.

See [Cloning for Coordinated Systems](410-cloning-strategies.md) for how clones use overlap to create coordinated crosshatch systems.

---

## Mask Independence Across Layers

Each layer's mask is completely independent. A mask on Layer 3 has no effect on Layers 1, 2, 4, or 5. This means:

- You can mask Layer 3 (mid-ground) to the portrait's face and mask Layer 2 (background) to everything *except* the face, and the two fills will tile the canvas without overlap.
- You can intentionally overlap masks so two fills render in the same region — the stacking order determines which appears on top.
- You can leave some layers unmasked (full canvas) and mask others tightly. The unmasked layers provide a continuous background; the masked layers add targeted detail.

**Inverted mask pairs:** A powerful technique for clean layer separation. Paint a mask on Layer A (say, the portrait subject). Copy the mask (right-click > Copy Mask). Paste it to Layer B (right-click > Paste Mask). Then invert Layer B's mask (Edit > Invert Mask). Now Layer A covers the subject and Layer B covers everything else. No gaps, no overlaps.

---

## Planning Before Building

The difference between a mediocre composition and a great one is often the plan, not the parameters. Before adding your first fill:

1. **Identify regions.** Look at your source image and mentally divide it into 3–5 areas: background, midground, foreground, highlights, shadows. Each area will get its own fill (or fills) and mask.

2. **Assign fills to regions.** Which algorithm suits each region? Linear for structured areas, Scribble for chaotic textures, Halftone for graphic punch, Trace for outlines. Write it down if the composition is complex.

3. **Decide on stacking order.** Which fills go on top? Usually: outlines on top, details above shading, shading above background. But creative inversions work too — a subtle Trace layer *behind* a bold Linear fill creates ghost outlines.

4. **Estimate intervals.** Background: wide. Midground: medium. Foreground: tight. This prevents density competition between layers.

5. **Choose threshold bands.** If two fills share the same spatial region, give them different threshold ranges so they respond to different brightness bands. This prevents duplicate strokes in the same tonal zone.

6. **Build bottom-up.** Start with the background layer, get it right, then add the next layer above. This way, each new layer is evaluated in context of everything below it.

---

## Common Stacking Mistakes

**Outlines buried in the middle.** Trace fills belong on top. If a Trace fill is below shading layers, the outlines get covered by thick strokes and become invisible. Always drag Trace to the top.

**All fills at the same interval.** If every fill has a 1.5 mm interval, the composition looks monotonous and dense. Vary intervals across the stack for visual depth — the eye reads wide intervals as "far" and tight intervals as "close."

**Forgetting to mask.** An unmasked shading fill renders everywhere, including areas where another fill should dominate. If your foreground fill is fighting the background for visual space, one or both need masks.

**Overlapping dark strokes.** Two black fills at high density rendering in the same area create an impenetrable dark region. Separate them with masks or threshold bands so each handles different tones.

**Random stacking order.** Dragging new fills wherever they land and never reorganising. Spend thirty seconds reordering after adding a new fill. Future-you will be grateful.

---

## Summary

| Principle | Rule |
|-----------|------|
| Rendering order | Bottom-to-top in the Layers Panel |
| Background | Bottom of stack, wide interval, subtle |
| Shading | Middle of stack, medium interval, masked to regions |
| Detail | Upper-middle, tight interval, shadow-biased threshold |
| Outlines | Top of stack, Trace fill |
| Overlap cutting | Higher fill cuts lower fill (both must opt in) |
| Mask independence | Each layer's mask is entirely separate |

| Action | How |
|--------|-----|
| Move layer down | Cmd+\[ (macOS) / Ctrl+\[ (Windows) |
| Move layer up | Cmd+\] / Ctrl+\] |
| Drag to reorder | Click and drag in the Layers Panel |

*Next: [Composition Recipes](409-composition-recipes.md)*
