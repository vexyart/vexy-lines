# Clones and Overlap Control

Most fills in Vexy Lines are independent. Each one reads the source image, generates strokes, and renders them without regard for what other fills are doing. Clones and Overlap Control break that independence. Clones create linked copies that inherit structural parameters from a parent while allowing independent colour and weight. Overlap Control choreographs how fills interact at their crossing points — who covers whom, who cuts whom, and who weaves with whom. Together, they turn a stack of flat layers into a coordinated system.

## Clones

### What a Clone Is

A clone is a new fill that inherits its parent's fill type, angle, and interval. Change the parent's angle from 0° to 15° and the clone's angle follows. Change the parent's interval from 2 mm to 1.5 mm and the clone tightens. The structural skeleton of the two fills stays synchronised.

But the clone's colour, stroke thickness, and other visual parameters are independent. You can make the parent black and the clone red. You can make the parent thick and the clone thin. The fills share geometry but diverge in appearance.

### Creating a Clone

1. Select a fill in the Layers Panel.
2. Click the **Clone** button in the Properties Panel (or use the context menu: right-click > Clone Fill).
3. A new fill appears above the original, linked to it.

The clone appears in the Layers Panel with a link icon indicating its parent relationship. The parent fill shows no special indicator — it does not "know" it has children.

### What Is Inherited

| Parameter | Inherited? | Notes |
|-----------|-----------|-------|
| Fill type | Yes | Clone is always the same algorithm as parent |
| Angle | Yes | Changes with parent |
| Interval | Yes | Changes with parent |
| Colour | No | Independent — this is the main reason to clone |
| Stroke Thickness (mode, min, max) | No | Independent |
| Image Threshold | No | Independent |
| Smoothing | No | Independent |
| Randomisation | No | Independent |
| Shift | No | Independent |
| Dash patterns | No | Independent |
| Emboss | No | Independent |
| Mask | No | Independent — clone can have its own mask |

### Why Clone Instead of Duplicate

Duplicating a fill (Cmd+D / Ctrl+D) creates an independent copy. Change the original's angle and the duplicate stays put. You have two unrelated fills that happened to start with the same values.

Cloning creates a live link. Change the parent's angle and the clone follows. This is essential when you want two fills that always share their geometric structure — same line direction, same spacing — but differ in colour or weight. If you later decide the angle should be 20° instead of 15°, you change it once on the parent and the clone updates automatically.

### Use Cases for Clones

**Tonal separation with coordinated geometry:**
Create a parent fill covering the shadow range (threshold 0–100) in black with heavy thickness. Clone it. Set the clone's threshold to 100–200 (midtones), colour to dark grey, thickness to medium. Clone again. Set the second clone's threshold to 200–255 (highlights), colour to light grey, thickness to thin. Three fills, three tonal bands, all sharing the same angle and interval so the lines align perfectly. Change the parent's angle and all three bands rotate together.

**Multi-colour hatching:**
Parent fill in blue, clone in red, second clone in gold. Each fill has its own mask exposing different regions of the image. The geometry is synchronised — lines are parallel and evenly spaced across all three — but each region gets its own colour. Useful for heraldic designs, flag illustrations, and colour-separated screen prints.

**Highlight and shadow pair:**
Parent fill in a medium tone covering the full threshold range. Clone it. Set the clone to cover only the highlights (threshold 180–255) in a lighter colour with thinner strokes. The clone's strokes are a lighter, finer version of the parent's, perfectly aligned, producing a two-tone rendering.

## Overlap Control

### The Three Checkboxes

Every fill in Vexy Lines has two overlap checkboxes:

1. **Can cut other fills** — when enabled, this fill's strokes interrupt (remove segments from) the strokes of other fills that have "Can be cut" enabled.
2. **Can be cut by other fills** — when enabled, other fills that have "Can cut" enabled will interrupt this fill's strokes.

The third state — both enabled — creates mutual cutting, which is the basis for weaving effects.

| This Fill | Other Fill | Interaction |
|-----------|-----------|-------------|
| Can cut: On, Can be cut: Off | Can cut: Off, Can be cut: On | This fill dominates. Its strokes are uninterrupted. The other fill's strokes are cut where they cross. |
| Can cut: Off, Can be cut: On | Can cut: On, Can be cut: Off | The other fill dominates. Same relationship, reversed. |
| Can cut: On, Can be cut: On | Can cut: On, Can be cut: On | Mutual cutting. Both fills interrupt each other. Combined with dash offsets, this produces weaving. |
| Can cut: Off, Can be cut: Off | Any | No interaction. Both fills render independently. This is the default. |

### How Cutting Works

When Fill A cuts Fill B:

1. Vexy Lines identifies every point where Fill A's strokes cross Fill B's strokes.
2. At each crossing point, Fill B's stroke is interrupted — a segment is removed.
3. The length of the removed segment is determined by Fill A's dash and gap pattern. If Fill A has no dash pattern (continuous strokes), the cut is continuous along the crossing — Fill B is interrupted for the entire width of Fill A's stroke at that point.
4. If Fill A has a dash pattern, the cuts occur only where Fill A's dashes fall. Where Fill A's gaps fall, Fill B's strokes remain intact.

The visual result: Fill A appears to pass over Fill B. Fill B's strokes disappear behind Fill A's strokes at every crossing.

### The Four Orientation Modes

The **Cut Orientation** dropdown controls the axis along which cuts are calculated:

| Mode | Behaviour | When to Use |
|------|-----------|-------------|
| **Auto** | Vexy Lines determines the cut direction based on the angle difference between the two fills. | Default. Works for most perpendicular or near-perpendicular fill pairs. |
| **Horizontal** | Cuts are calculated only along the horizontal axis. | When two fills have similar angles and Auto produces incorrect cuts. |
| **Vertical** | Cuts are calculated only along the vertical axis. | Same as Horizontal but for vertically-oriented fill pairs. |
| **Both** | Cuts are calculated along both axes simultaneously. | When you want maximum cutting at every possible crossing point. Can produce excessive fragmentation on complex fills. |

For the standard cross-hatching scenario (two fills at perpendicular angles), Auto is correct. Switch to a specific mode only when the automatic detection produces results you do not want.

## Building a Weave: Step by Step

Weaving is the most visually complex overlap effect. It requires two fills that mutually cut each other, with offset dash patterns that create alternating over-under illusions. Here is the complete process:

### Step 1: Create the First Fill

Add a Linear fill at 0° (horizontal). Set Interval to 2.0 mm, Thickness Linear mode with Min 0.3 mm and Max 1.2 mm. Set Colour to dark red (#8B2500).

### Step 2: Set Up Dashes

Set Dash Length to 4 mm and Gap Length to 4 mm. The stroke is now a repeating pattern: 4 mm visible, 4 mm invisible.

### Step 3: Enable Overlap

Check both "Can cut other fills" and "Can be cut by other fills."

### Step 4: Create the Second Fill

Clone the first fill (it inherits the angle and interval). Change the clone's Angle to 90° (vertical). Change its Colour to dark blue (#1A3A6A).

Note: Because angle is an inherited parameter, changing the clone's angle will break the inheritance for that parameter. This is expected — you want the two fills at different angles.

Alternatively, create a new independent fill at 90° with the same interval and dash values. The clone approach is faster but not required.

### Step 5: Offset the Dashes

On the second fill, set Shift X or Shift Y to 4 mm (equal to the dash length). This offsets the second fill's dash pattern so its dashes begin where the first fill's gaps are, and vice versa.

### Step 6: Enable Overlap on the Second Fill

Check both "Can cut other fills" and "Can be cut by other fills" on the second fill as well.

### Step 7: Refresh

Refresh All. At each intersection of the two fills:

- Where the first fill's dash is present and the second fill's gap falls, the first fill is visible — it appears to pass over.
- Where the first fill's gap falls and the second fill's dash is present, the second fill is visible — it appears to pass over.
- The alternation creates the woven illusion.

### Step 8: Refine

- **Tighten the weave:** Reduce Interval to 1.5 mm and Dash/Gap to 3 mm each.
- **Loosen the weave:** Increase Interval to 3 mm and Dash/Gap to 6 mm each.
- **Change the weave angle:** Set fills to 30° and 120° for a diamond pattern.
- **Add emboss:** Enable [Emboss](310-emboss.md) on one or both fills with Rise 15–25 to make the threads appear raised.

## Advanced Overlap Techniques

### Three-Fill Weave

Add a third fill at 60° (between the 0° and 120° fills in a three-angle composition). Enable overlap on all three. Offset each fill's dash pattern by one-third of the dash length. The result is a triaxial weave — three sets of threads interleaving, like a woven basket.

This is complex to set up and visually dense. Use wide intervals (3+ mm) and short dashes (2–3 mm) to keep the pattern legible.

### Selective Cutting (No Weave)

Not every overlap interaction needs to be mutual. Enable "Can cut" on a Trace fill (contour outlines) and "Can be cut" on a Linear fill (background hatching). The contour lines will interrupt the hatching wherever they cross, creating a clear separation between outlined regions and hatched background — like a technical drawing where the subject's outline is always visible above the shading.

### Cutting with Different Fill Types

The overlap system works between any two fill types, not just Linear pairs. A Halftone fill can cut a Wave fill. A Radial fill can cut a Circular fill. The visual results range from elegant to chaotic depending on the fill combination. Experiment — but start with two Linear fills to understand the mechanics before adding complexity.

## Clones and Overlap Together

Clones and overlap are natural partners. A common workflow:

1. Create a parent fill with your desired geometry.
2. Clone it twice, producing three fills with synchronised angle and interval.
3. Set each fill to a different colour and threshold range (shadow, midtone, highlight).
4. Enable overlap between the shadow and midtone fills so the shadow fill appears to pass over the midtone fill in the darkest regions.
5. The result: a tonal rendering where the visual layering reflects the tonal depth — darker fills are literally on top of lighter fills.

## Troubleshooting Overlap

| Problem | Cause | Solution |
|---------|-------|----------|
| No cutting visible | Overlap checkboxes not set on both fills | Enable "Can cut" on the cutting fill AND "Can be cut" on the victim fill |
| Cuts in wrong direction | Auto orientation chose incorrectly | Switch to Horizontal, Vertical, or Both manually |
| Weave looks like a grid with holes, not over-under | Dash offsets not applied | Shift one fill by exactly the dash length |
| Excessive fragmentation | "Both" orientation on dense fills | Switch to Auto or a single axis |
| Embossed fills have cut artefacts | Emboss offset strokes also being cut | Reduce Emboss Rise or widen Interval |

## Further Reading

- [Dashes, Gaps, and Overlap Cuts](309-dash-patterns.md) — dash patterns are the cutting mechanism within overlap interactions.
- [Angle and Rotation](306-angle-rotation.md) — the angle difference between fills determines the weave geometry.
- [Emboss and Bas-Relief](310-emboss.md) — adding depth to woven fills.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
