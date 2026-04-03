# Angle and Rotation

Angle is deceptive. It looks like a single number — a rotation in degrees — and technically that is all it is. But the angle of a fill pattern changes the emotional register of the entire image. Horizontal lines whisper calm. Vertical lines shout strength. Diagonals hurl the eye forward. A fill that renders beautifully at 0° can become unsettling at 30° and dynamic at 45°, all from the same source image with the same thickness, interval, and threshold. Angle is the cheapest transformation in Vexy Lines, and one of the most consequential.

## The Basics

The **Angle** parameter rotates the fill pattern around the center of the canvas. It is measured in degrees, counter-clockwise from the horizontal:

- **0°** — Horizontal lines running left to right.
- **45°** — Diagonal lines running from lower-left to upper-right.
- **90°** — Vertical lines running top to bottom.
- **135°** — Diagonal lines running from upper-left to lower-right.
- **180°** — Horizontal again (identical to 0° for symmetrical patterns like Linear).

For most line-based fills (Linear, Wave, Wireframe, Fractal, Text), rotation between 0° and 180° covers the full range of orientations. Rotation from 180° to 360° mirrors the first half. For asymmetrical fills or when combined with Shift, the full 360° range can produce distinct results.

You can type an exact value into the field or drag the angle dial. For fine-tuning, type the number — the dial is imprecise below 5° of adjustment.

## Which Fills Respond to Angle

Not every fill type uses the Angle parameter. Here is the breakdown:

| Fill | Responds to Angle | Notes |
|------|-------------------|-------|
| **Linear** | Yes | Rotates the parallel lines |
| **Wave** | Yes | Rotates the wave propagation direction |
| **Halftone** | Yes | Rotates the dot grid |
| **Wireframe** | Yes | Rotates the mesh lattice |
| **Fractal** | Yes | Rotates the space-filling curve |
| **Text** | Yes | Rotates the text baseline |
| **Circular** | No | Concentric rings have no orientation |
| **Spiral** | No | Radial symmetry — angle is meaningless |
| **Radial** | No | Rays emanate from center in all directions |
| **Trace** | No | Follows image contours, not a fixed grid |
| **Scribble** | No | Randomised by nature — angle has no stable effect |
| **Handmade** | No | Follows your drawn strokes, not a grid |

For fills that do not respond to Angle, orientation effects come from the source image itself or from layer-level transforms (see below).

## Visual Psychology of Angle

This is not mysticism — it is how the human eye processes orientation:

### 0° — Horizontal

The eye tracks horizontal lines easily, left to right (or right to left in RTL cultures). Horizontal fills feel calm, stable, restful. They suggest horizon lines, water surfaces, and repose. Use 0° for landscapes, calm portraits, and any composition where you want the viewer to feel settled.

### 90° — Vertical

Vertical lines resist the eye's natural horizontal sweep, creating a sense of standing, rising, or confronting. Vertical fills feel formal, strong, and sometimes imposing. Use 90° for architecture, standing figures, tree trunks, and compositions that emphasise height or authority.

### 45° and 135° — Diagonal

Diagonal lines are inherently dynamic. They suggest motion, tension, and instability — nothing in nature rests at 45°. Diagonal fills feel energetic and active. Use 45° or 135° for action scenes, dramatic portraits, and compositions where you want the viewer's eye to move quickly across the image.

### Odd Angles — 15°, 30°, 60°, 75°

Slight tilts from the cardinal directions create subtle unease. A 15° fill looks like a horizontal that is falling over. A 75° fill looks like a vertical that cannot quite stand up straight. These odd angles are useful for artistic tension but can look like mistakes if the viewer expects a clean orientation. Use them deliberately, or not at all.

## Cross-Hatching: The Art of Angle Pairs

Stack two fills at different angles and you get cross-hatching — one of the oldest techniques in drawing and engraving. The angle difference between the two fills determines the character of the cross-hatch.

### Classic Pairs

| Fill 1 Angle | Fill 2 Angle | Difference | Character |
|-------------|-------------|------------|-----------|
| 0° | 90° | 90° | Grid. Clean, formal, architectural. The intersection of horizontal and vertical creates a precise mesh. |
| 0° | 45° | 45° | Classic engraving cross-hatch. Dense but airy. The most common pair in traditional illustration. |
| 15° | 75° | 60° | Open, elegant. The oblique angles avoid the stiffness of 0/90 while maintaining visual structure. |
| 0° | 60° | 60° | Triangular intersections. Less common, more distinctive. Creates a woven, textile-like texture. |
| 30° | 120° | 90° | Rotated grid. Same geometric relationship as 0/90 but tilted, adding dynamism. |

### Three-Angle Compositions

For richer tonal rendering, add a third fill at a third angle:

- **0° / 60° / 120°:** Equal 60° spacing produces a hexagonal intersection pattern. Dense, uniform, reminiscent of steel engraving.
- **0° / 45° / 90°:** Unequal spacing (45° and 45°) produces a denser pattern than two fills alone, with a grid-like undertone.
- **15° / 75° / 135°:** All oblique, no cardinal directions. The result feels handmade and organic despite being mathematically precise.

### Avoiding Moiré

When two fills have very similar angles (within 5°), their strokes run nearly parallel and create moiré interference patterns — shimmering bands of light and dark that are not in the source image. This is almost always unwanted. Keep angle differences above 15° between any two fills in the same document, unless you are deliberately seeking moiré as a visual effect.

## Angle and Subject Alignment

Sometimes the best angle is not a fixed number but a response to the subject.

### Aligning with Contours

A portrait with strong jawline and shoulder contours might benefit from a fill angle that follows the jaw — perhaps 20° on the left side and 160° on the right. You can achieve this by using two fills with different angles, each masked to cover one side of the face. The strokes then follow the subject's natural geometry rather than imposing an arbitrary grid.

### Perpendicular to Light

In engraving tradition, lines run perpendicular to the direction of light. If the light falls from the upper left (the classical default), lines at roughly 135° — running from upper-left to lower-right — will cross the light direction at right angles. This creates the most effective thickness variation because the strokes traverse the full range from lit to shadowed areas.

### Following Form

For cylindrical objects (bottles, columns, arms), horizontal lines wrap around the form convincingly. For flat surfaces (walls, tables), diagonal lines suggest perspective recession. For fabric, lines that follow the drape direction (usually curving) look natural — though you may need Trace or Handmade fills rather than angle-rotated Linear fills for true contour following.

## Angle vs. Layer Transform Rotation

Vexy Lines also offers layer-level rotation in the Transform section (not part of the fill's Properties Panel parameters). This rotates the entire fill output — strokes and all — as a rigid block, after the fill has been generated.

The difference matters:

- **Fill Angle** rotates the pattern before generation. The fill algorithm generates strokes at the new angle, and thickness, threshold, and interval all respond to the rotated grid.
- **Layer Transform Rotation** rotates the already-generated strokes as a group. Thickness mapping is not recalculated. The strokes were generated at their original angle and then physically rotated.

For most purposes, use Fill Angle. Use Layer Transform Rotation only when you want to reposition an already-perfect fill without regenerating it — for example, when arranging fills in a composition where rendering time is significant.

## Step-by-Step: Choosing the Right Angle for a Portrait

1. Start at 0° (horizontal). This is neutral and lets you evaluate the fill's thickness, interval, and threshold without angular distraction.
2. Try 45°. Does the diagonal energy suit the portrait's mood? For a casual, dynamic subject, it might. For a formal, quiet subject, it will fight the tone.
3. Try 90° (vertical). Does the formality suit the subject? Vertical lines often work well for standing figures and architectural elements in the background.
4. Consider the light direction in your source image. If the light comes from the upper left, try 135° — perpendicular to the light — and notice whether the thickness variation feels more convincing.
5. If cross-hatching, add a second fill at an angle 45–90° away from the first. Evaluate the intersection pattern at 100% zoom.
6. For a third fill, choose an angle that divides the remaining gap roughly equally. If fills 1 and 2 are at 0° and 60°, try 120° for the third.

## Further Reading

- [Interval and Spacing: Density Control](305-interval-spacing.md) — angle and interval together define the fill's visual grid.
- [Randomisation and Organic Feel](307-randomisation.md) — adding slight randomisation to an angled fill breaks the mechanical perfection.
- [Clones and Overlap Control](311-clones-overlap.md) — cloned fills at different angles with overlap cutting produce weave effects.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
