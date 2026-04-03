# Dashes, Gaps, and Overlap Cuts

A continuous stroke is the default in Vexy Lines — an unbroken path from one side of the fill region to the other. But continuity is not always what you want. Dashed lines simulate stitching. Dotted lines suggest boundaries without asserting them. And when two fills interact through the Overlap Control system, dashes become the mechanism for cutting, weaving, and interleaving — turning flat layers into the illusion of interlocked fabric. This article covers dash patterns on their own and as the cutting tool within overlap interactions.

## Basic Dash Patterns

The Dash Patterns section of the Properties Panel has two controls:

### Dash Length

The length of each visible stroke segment, in the current document units. A dash length of 3 mm means each visible mark is 3 mm long before a gap begins.

### Gap Length

The length of each invisible break between dashes, in the current document units. A gap length of 2 mm means 2 mm of empty space separates each dash.

The pattern repeats along the entire stroke: 3 mm visible, 2 mm invisible, 3 mm visible, 2 mm invisible, all the way across the canvas.

### Common Patterns

| Dash | Gap | Result | Use Case |
|------|-----|--------|----------|
| 3.0 mm | 3.0 mm | Even dashes. Equal mark and space. | General-purpose dashed lines, stitching guides. |
| 1.0 mm | 1.0 mm | Fine dashes. A subtle broken line. | Fold lines, construction marks, secondary contours. |
| 0.3 mm | 1.5 mm | Dots (short dash, long gap). | Dotted borders, gentle boundaries, stipple approximation. |
| 8.0 mm | 2.0 mm | Long dashes. Mostly continuous with brief interruptions. | Highway-style road markings, casual break effects. |
| 5.0 mm | 1.0 mm | Long dash, short gap. Almost continuous. | Subtle texture variation within otherwise solid lines. |
| 2.0 mm | 0.5 mm | Short dash, tiny gap. A quick rhythm. | Fabric stitching, embroidery path guides. |

### Dashes and Stroke Thickness

Dashes interact with [Stroke Thickness](303-stroke-thickness.md) in a visually important way. Each dash segment inherits the stroke weight at its position in the image. A dash crossing from a dark region to a lighter region will start thick and end thinner. If the dash is short (under 2 mm), the weight change within a single dash is negligible. If the dash is long (8+ mm), the weight variation within each dash is visible and creates a tapered, calligraphic quality.

### Dashes and Dynamic Colour

When [Dynamic Colour](302-colour.md) is enabled, each dash segment samples colour from the source image at its position. Short dashes with short segment lengths produce a confetti of coloured marks. Long dashes with long segment lengths produce coloured strokes that happen to have gaps in them. The gap itself carries no colour — it is empty space — so the colour of the underlying background or lower fill shows through.

## Overlap Control: Where Dashes Become Architecture

Dash patterns take on a completely different role when combined with the Overlap Control system. In the Overlap section of the Properties Panel, three checkboxes determine how fills interact:

- **Can cut other fills** — this fill's strokes interrupt the strokes of fills beneath it.
- **Can be cut by other fills** — other fills' strokes can interrupt this fill's strokes.
- Both enabled — mutual cutting, the basis for weaving.

When cutting is active, the dash and gap values define where the cuts happen. The cutting fill's dash pattern determines which segments of the victim fill are removed and which survive.

### How Cutting Works

Imagine two fills stacked:

- **Fill A** (bottom): Linear, 0°, no dashes.
- **Fill B** (top): Linear, 90°, dash 4 mm, gap 4 mm.

If Fill B has "Can cut other fills" enabled and Fill A has "Can be cut by other fills" enabled:

1. Fill B's dashes are generated normally — 4 mm visible segments separated by 4 mm gaps.
2. Where Fill B's visible dash segments cross Fill A's strokes, Fill A's strokes are interrupted. The portions of Fill A that lie beneath Fill B's dashes are removed.
3. Where Fill B's gaps fall, Fill A's strokes remain intact.

The result: Fill A's horizontal lines are broken wherever Fill B's vertical dashes cross them. Fill B's vertical dashes are fully visible. The composite looks like Fill B passes over Fill A.

### Four Orientation Modes

The **Cut Orientation** dropdown controls the direction in which cuts are applied:

| Mode | Behaviour |
|------|-----------|
| **Horizontal** | Cuts are applied only along the horizontal axis. Vertical crossings are ignored. |
| **Vertical** | Cuts are applied only along the vertical axis. Horizontal crossings are ignored. |
| **Both** | Cuts are applied in both directions. Every crossing point creates a cut. |
| **Auto** | Vexy Lines chooses the orientation based on the angle difference between the fills. This is the default and works well for most cross-hatching scenarios. |

For simple two-fill interactions, Auto is usually correct. Switch to a specific orientation when the automatic choice produces unwanted cuts — for example, when two fills are at similar angles and Auto cannot determine a clean cut direction.

## Weaving: The Full Effect

Weaving is the crown jewel of the overlap system. It creates the illusion that two fills physically interleave — one passing over, then under, then over the other — like threads in a fabric.

### How to Create a Weave

1. **Fill A:** Linear, Angle 0°, Interval 2 mm. Dash length 4 mm, Gap length 4 mm. Enable "Can cut other fills" and "Can be cut by other fills."

2. **Fill B:** Linear, Angle 90°, Interval 2 mm. Dash length 4 mm, Gap length 4 mm. Enable "Can cut other fills" and "Can be cut by other fills." **Offset the dash pattern** using Shift so Fill B's dashes begin at a different point than Fill A's.

3. The critical detail is the offset. If both fills start their dash patterns at the same position, the cuts align and you get a simple grid with holes. If Fill B's dashes are offset by half a period (shift by 4 mm — one dash length), the over-under pattern alternates at each intersection:

   - At intersection 1: Fill A's dash is present, Fill B's gap falls here → Fill A is visible (appears "on top").
   - At intersection 2: Fill A's gap falls here, Fill B's dash is present → Fill B is visible (appears "on top").
   - At intersection 3: Fill A's dash is present again, Fill B's gap → Fill A on top.

   The alternation creates the illusion of weaving.

### Weave Parameters

| Parameter | Effect on Weave |
|-----------|----------------|
| Dash length | Controls how long each "over" segment is. Longer dashes = longer visible runs before the thread dips under. |
| Gap length | Controls how long each "under" segment is. Longer gaps = longer hidden runs. |
| Interval | Controls the thread spacing. Tighter interval = denser weave. |
| Thickness | Controls the thread weight. Thicker strokes = heavier fabric appearance. |
| Angle difference | Controls the weave angle. 0/90 = plain weave. 0/45 = twill. Other combinations produce exotic patterns. |

### Weave Variations

| Fill A Angle | Fill B Angle | Weave Type |
|-------------|-------------|------------|
| 0° | 90° | Plain weave (like burlap or canvas) |
| 0° | 45° | Twill weave (like denim) |
| 0° | 60° | Oblique weave (decorative, less naturalistic) |
| 30° | 120° | Diamond weave (rotated plain weave) |

## Dashes for Physical Output

Beyond visual aesthetics, dash patterns have practical applications in physical production:

### Stitching Guides

Export a dashed fill as SVG and import it into embroidery software. The dash-gap pattern maps directly to stitch-space rhythm. A 2 mm dash with a 1 mm gap at 0.3 mm thickness produces a guide that resembles running stitch at common embroidery scales.

### Cut Marks and Fold Lines

A fine dashed line (0.5 mm dash, 1.0 mm gap, 0.1 mm thickness) placed along a boundary indicates a fold or cut line without being mistaken for a design element. Use a distinct colour (light blue is the convention in print production) and place the dashed fill on its own layer for easy removal before final export.

### Perforation Lines

For die-cut or laser-perforation work, a dashed fill defines the perforation pattern directly. The dash length becomes the cut length; the gap length becomes the uncut bridge. A 3 mm dash with a 1 mm gap produces a tearable perforation. A 1 mm dash with a 3 mm gap produces a weakened fold line.

### Laser Engraving Texture

Dashed fills sent to a laser engraver produce a textured surface — short burns separated by untouched material. Varying the dash and gap lengths across different fills creates multiple texture zones on the same piece. Tight dashes (1 mm) in shadow areas and loose dashes (4 mm) in highlight areas add a tactile dimension that mirrors the visual tone.

## Step-by-Step: Creating a Basic Weave

1. Add a Linear fill at 0°. Set Interval to 2.5 mm, Thickness to Linear mode with Min 0.3 mm and Max 1.5 mm.
2. Set Dash Length to 5 mm and Gap Length to 5 mm.
3. Enable both "Can cut other fills" and "Can be cut by other fills."
4. Clone the fill (see [Clones and Overlap Control](311-clones-overlap.md)). The clone inherits all parameters.
5. Change the clone's Angle to 90°.
6. Change the clone's Colour to a contrasting value — dark blue against the original's dark red, for example.
7. Shift the clone's dash offset: set Shift X or Shift Y to 5 mm (one dash length). This creates the alternating over-under alignment.
8. Refresh. The two fills should now weave visually — each appearing to pass over and under the other at alternating intersections.
9. Fine-tune by adjusting Dash and Gap lengths. Shorter values produce a tighter weave. Longer values produce a looser, more open fabric.

## Further Reading

- [Clones and Overlap Control](311-clones-overlap.md) — the full overlap system, including the three checkboxes and clone creation.
- [Interval and Spacing: Density Control](305-interval-spacing.md) — interval determines thread spacing in woven effects.
- [Angle and Rotation](306-angle-rotation.md) — the angle difference between two fills determines the weave geometry.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
