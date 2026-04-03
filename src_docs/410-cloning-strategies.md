# Cloning for Coordinated Systems

Duplicate a layer and you get two independent fills that happen to share the same parameters — for now. Change one and the other doesn't notice. Clone a layer and you get a family: a parent and children who share structural DNA while expressing individual differences. Change the parent's angle and every child's angle follows. Change a child's colour and only that child changes.

Clones are how you build coordinated multi-fill systems — crosshatch engines, colour-separated plates, and parameter-locked grids — without managing a spreadsheet of values across a dozen independent layers.

---

## Clone vs. Duplicate

| | Duplicate | Clone |
|---|----------|-------|
| Created by | Copy + Paste (Cmd+C, Cmd+V) or right-click > Duplicate | Clone button in Properties Panel, or right-click > Clone |
| Relationship to original | None. Fully independent. | Parent–child link. Child inherits specified properties. |
| Changing parent's Angle | No effect on duplicate | Child's Angle updates to match |
| Changing child's Colour | Independent | Independent (Colour is overrideable) |
| Changing parent's Interval | No effect on duplicate | Child's Interval updates to match |
| Performance | Each duplicate recalculates independently | Clones share the parent's calculation where properties match — faster |

Use **duplicate** when you want two fills that diverge completely. Use **clone** when you want fills that stay coordinated on some properties while differing on others.

---

## Creating Clones

1. Select a fill layer in the Layers Panel.
2. In the Properties Panel, click the **Clone** button (or right-click the layer > Clone).
3. A new layer appears directly above the original. It's visually identical but linked.
4. Repeat to create additional clones. All share the same parent.

The parent layer shows a small chain-link icon. Each clone shows a corresponding child icon. The Layers Panel makes the relationship visible at a glance.

---

## What's Inherited, What's Overrideable

This is the core of the clone system. Some properties flow from parent to child automatically. Others can be independently set on each clone.

| Property | Inherited from Parent | Overrideable per Clone |
|----------|----------------------|----------------------|
| **Fill type** | Yes | No — clones must be the same fill type as the parent |
| **Angle** | Yes | No |
| **Interval** | Yes | No |
| **Smoothing** | Yes | No |
| **Image Threshold** | Yes | No |
| **Colour** | No — independent by default | Yes |
| **Stroke Thickness** | No — independent by default | Yes |
| **Opacity** | No — independent by default | Yes |
| **Mask** | No — each clone has its own mask | Yes |
| **Shift** | No — independent by default | Yes |
| **Dash / Gap** | No — independent by default | Yes |

The logic: **structural** properties (what the fill draws, where, and how often) are inherited. **Visual** properties (what it looks like — colour, weight, opacity) are independent. This lets you build a family of fills that share the same geometric structure but express different visual treatments.

Change the parent's Angle from 15° to 30° and all clones rotate together. Change Clone 2's colour from black to red and only Clone 2 turns red. The structural unity remains; the visual diversity expands.

---

## Clone Trees

A parent with multiple clones forms a **clone tree**. The parent is the root; each clone is a branch. There's no limit to how many clones a parent can have.

**Example: Four-Colour Crosshatch**

```
Parent: Linear, Angle 15°, Interval 1.5 mm, Colour Black
├── Clone 1: Colour Red, Shift X +0.4 mm
├── Clone 2: Colour Blue, Shift Y +0.4 mm
└── Clone 3: Colour Green, Shift X +0.4 mm, Shift Y +0.4 mm
```

All four fills share the same angle (15°) and interval (1.5 mm). They differ in colour and shift — each is offset slightly so the strokes don't overlap exactly. The result is four interleaved colour layers at the same angle, creating a rich multi-colour line system.

Change the parent's angle to 45° and all four rotate together. The colour assignments and shifts remain unchanged.

---

## RGB Separation for Screen Printing

Clones are the natural tool for colour separation workflows. In screen printing, each colour gets its own plate (layer). The plates must be structurally aligned but visually independent.

### Step-by-Step: Three-Colour Separation

1. **Create the parent fill.** Linear, angle 0°, interval 1.5 mm, colour black. This will be the black (key) plate.

2. **Clone the parent twice.** You now have three layers: parent + Clone 1 + Clone 2.

3. **Assign colours:**
   - Parent: Black
   - Clone 1: Cyan (or your first spot colour)
   - Clone 2: Magenta (or your second spot colour)

4. **Mask each layer to its colour region:**
   - Parent (black): mask to the outline and shadow areas.
   - Clone 1 (cyan): mask to the sky, water, cool-toned areas.
   - Clone 2 (magenta): mask to the warm-toned areas — skin, clothing, accents.

5. **Adjust thresholds per clone** (overrideable) so each plate emphasises different tonal ranges.

6. **Export each layer separately** for individual colour plates. See [Preparing for Screen Printing](504-screen-printing.md).

Because the clones share the parent's angle and interval, the three plates are structurally registered — the lines align across colours. When printed in sequence, the layers build into a unified multi-colour image with no moiré or misalignment.

### Avoiding Moiré

In traditional CMYK printing, each colour plate is rotated to a different angle to avoid moiré patterns (the interference pattern when two regular grids overlap). With clones, you might *want* the same angle for all plates (for the aligned registration look) or different angles (for the traditional offset look).

To use different angles, you can't use clones (since angle is inherited). Instead, use **duplicates** and manually set each to a standard screen angle:

- Black: 45°
- Cyan: 15°
- Magenta: 75°
- Yellow: 0°

But if you want the simpler aligned-registration approach — where all colour plates share the same angle and interval — clones are the efficient choice.

---

## Clone Performance Benefits

Clones aren't just a convenience feature — they're a performance feature. Because clones share the parent's structural properties, Vexy Lines can optimise their calculation:

- The parent's stroke geometry is calculated once.
- Each clone reuses that geometry, only recalculating the visual properties (colour, thickness, opacity).
- In a four-clone tree, this means roughly 4x less computation than four independent duplicate layers.

For complex documents with many layers, switching from duplicates to clones (where appropriate) can noticeably improve refresh speed.

---

## Overlap Control with Clones

Clones and Overlap Control combine to create **weave effects** — fills that appear to pass over and under each other like woven fabric.

### Basic Weave Setup

1. Create a Linear parent: angle 0°, interval 2.0 mm.
2. Clone it once. Set the clone's colour to a different hue.
3. Set the clone's Shift to offset it by half the interval (1.0 mm) so the strokes interleave rather than overlap.
4. On the parent: enable "Can Cut Other Fills."
5. On the clone: enable "Can Be Cut By Other Fills."
6. Set Dash Length to 4 mm and Gap Length to 4 mm on both.

The parent's strokes now cut through the clone's strokes in a regular dashed pattern. Visually, the parent strokes appear to pass *over* the clone strokes where they're solid, and *under* where the gaps are. The result is a woven-textile appearance.

### Crosshatch Weave

For a true woven crosshatch:

1. Parent: Linear, angle 0°, interval 2.0 mm.
2. Clone 1: angle is inherited (0°), colour red, shift 1.0 mm.
3. Create a second independent parent: Linear, angle 90°, interval 2.0 mm.
4. Clone the second parent: colour blue, shift 1.0 mm.
5. Enable overlap cutting between the 0° and 90° fill families.
6. Set dashes and gaps.

The horizontal and vertical fill families weave through each other, creating a four-colour plaid effect: black horizontal, red horizontal (shifted), black vertical, blue vertical (shifted), all interlacing.

---

## When Not to Clone

Clones are the wrong tool when:

- **You need different angles.** Angle is inherited and can't be overridden per clone. If each fill needs its own angle (e.g., CMYK separation at traditional screen angles), use duplicates.
- **You need different fill types.** A clone must be the same fill type as its parent. If you want a Linear and a Halftone to coordinate, they can't be clones — use independent layers and manage the shared parameters manually.
- **You need total independence.** If two fills share nothing except a starting configuration, duplicates are simpler and carry no baggage.

---

## Tips

**Start with the parent, perfect it, then clone.** Since structural properties are inherited, getting the parent's angle, interval, and threshold right before cloning saves you from propagating corrections.

**Name your clones.** "Clone 1" and "Clone 2" are unhelpful. "Cyan Plate" and "Magenta Plate" tell you exactly what each clone represents.

**Use Shift to separate clones visually.** Clones with identical parameters (except colour) produce strokes that land exactly on top of each other — only the topmost clone's colour shows. Offset each clone with a small Shift value so all clones are visible.

**Break the link when you must.** If a clone outgrows its parent relationship — you need a different angle, a different interval, a different threshold — right-click the clone and choose "Detach Clone." It becomes an independent layer with its current parameters, and changes to the parent no longer propagate.

---

## Summary

| Action | How |
|--------|-----|
| Create clone | Select layer → Properties Panel → Clone button |
| Detach clone | Right-click clone → Detach Clone |
| Change parent's angle | All clones follow |
| Change clone's colour | Only that clone changes |
| Create weave | Enable Overlap Control + Dash/Gap on clone family |

| Inherited (Locked) | Overrideable (Per-Clone) |
|-------------------|------------------------|
| Fill type | Colour |
| Angle | Stroke Thickness |
| Interval | Opacity |
| Smoothing | Mask |
| Image Threshold | Shift X / Shift Y |
| | Dash / Gap |

*Next: [From Tool to Craft](501-part5-tldr.md)*
