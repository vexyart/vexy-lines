# Rectangle, Ellipse, and Freeform Masks

Three clicks and a drag. That's all it takes to confine a fill to a perfect rectangle, a clean ellipse, or any irregular polygon you can imagine. Where the Brush paints masks with freehand imprecision, the shape tools stamp them with geometric authority.

---

## The Three Shape Tools

| Tool | Shortcut | What It Creates |
|------|----------|----------------|
| Rectangle | **I** | Rectangular mask regions with straight edges and right angles |
| Ellipse | **O** | Elliptical mask regions from circles to stretched ovals |
| Freeform | **S** | Irregular polygons defined by clicked points |

All three tools write to the same mask data as the Brush. You can draw a rectangle, refine its edge with the Brush, and cut a hole in it with the Freeform tool — they're interchangeable at the mask-pixel level. The only difference is the *drawing interface*.

---

## Rectangle Mask (I)

Press **I** to activate. Click on the canvas where you want one corner, then drag to the opposite corner. Release the mouse. A white rectangle appears in the layer's mask — the fill now renders inside that rectangle and nowhere else.

**Shift+drag** constrains the rectangle to a perfect square.

### Practical uses

- **Confine a fill to a print region.** If your artwork needs a 5×7-inch boundary, draw a rectangle mask at those dimensions. The fill stops at the edge.
- **Create panel layouts.** Multiple fills, each masked to a different rectangle, create a comic-panel or grid composition.
- **Quick crop for testing.** While experimenting with fill parameters, draw a small rectangle mask so the fill only renders in that region. This speeds up refresh dramatically on large canvases.

---

## Ellipse Mask (O)

Press **O** to activate. Click and drag to define the bounding box of the ellipse. The mask fills the elliptical region inscribed within that bounding box.

**Shift+drag** constrains the ellipse to a perfect circle.

### Practical uses

- **Vignettes.** An elliptical mask with feathered edges (refine with the Brush at low hardness afterwards) creates a classic vignette effect.
- **Medallion compositions.** Circular masks are natural frames for portrait engravings, coin designs, and seal illustrations.
- **Spotlights.** Mask a highlight fill (wide interval, subtle) to an ellipse centred on a focal point. The fill creates a pool-of-light effect.

---

## Freeform Mask (S)

Press **S** to activate. Click to place the first point. Click again for the second point. Keep clicking to add points. Close the polygon by clicking the first point again (or double-click to auto-close). The interior fills with white mask.

The Freeform tool draws straight-edged polygons by default. For curves, place points close together along the desired boundary, or draw the polygon roughly and refine with the Editor tool afterward (see [Editing Mask Paths](404-refining-masks.md)).

### Practical uses

- **Masking irregular regions.** A face in a crowd photo, an architectural element, a silhouette with angles — anywhere that rectangles and ellipses don't fit.
- **Multi-region masks.** Draw several freeform shapes on the same layer to create a mask with multiple isolated regions.
- **Precise geometric shapes.** Triangles, hexagons, stars — anything you can define with straight edges and corner points.

---

## Compound Masks: Union and Subtraction

Shape tools become genuinely powerful when you combine them. This is where "compound masks" come in.

### Adding shapes (Union)

Hold **Shift** and draw a new shape. The new shape *adds to* the existing mask rather than replacing it. The mask becomes the union of the old region and the new shape.

**Example:** Draw a rectangle, then Shift+draw a circle that overlaps one corner. The mask now covers the rectangle plus the circular bulge.

### Subtracting shapes

Hold **Alt** and draw a new shape. The new shape *subtracts from* the existing mask, punching a hole.

**Example:** Draw a large circle (the medallion border), then Alt+draw a smaller circle inside it. The result is a ring-shaped mask — the fill appears in the ring, not the center.

### Combining union and subtraction

You can chain these operations:

1. Draw a rectangle (the base).
2. Shift+draw a circle extending beyond one edge (adds a rounded end).
3. Shift+draw another circle on the opposite edge (adds the other rounded end).
4. Alt+draw a small rectangle in the centre (punches a window).

The result is a stadium shape with a rectangular cutout — and you built it without touching a vector editor.

**Tip:** If you accidentally add or subtract the wrong shape, **Cmd+Z** undoes the last operation without losing the rest of the compound mask.

---

## Auto-Detection: One-Click Masking

This is the feature that saves the most time and gets the least attention.

With any mask tool active — Rectangle, Ellipse, Freeform, or even the Brush — **click on a distinct shape in your source photo.** Vexy Lines analyzes the colour and brightness boundaries around that click point and attempts to generate a mask that isolates the shape.

### How it works

1. Select a fill layer.
2. Activate a mask tool (B, I, O, or S).
3. Click inside a visually distinct area — a white shirt against a dark background, a bright sky above a treeline, a coloured object on a neutral surface.
4. Vexy Lines floods outward from your click point, stopping at colour or brightness boundaries.
5. A mask appears that roughly isolates the shape.

### Adjusting tolerance

The auto-detection algorithm uses a tolerance setting that controls how aggressively it expands from the click point:

- **Low tolerance:** Stops at subtle colour changes. Produces tight, conservative masks. Good for high-contrast subjects with clear edges.
- **High tolerance:** Ignores subtle colour changes and expands further. Produces broader masks. Good for subjects with gradual transitions.

Adjust the tolerance slider in the toolbar when the auto-detection result is too tight (low tolerance — it missed parts of the shape) or too loose (high tolerance — it grabbed the background too).

### Compound auto-detection

Auto-detection respects Shift and Alt modifiers:

- **Shift+click** another area to *add* it to the existing mask.
- **Alt+click** an area to *subtract* it from the existing mask.

This is the fastest way to build complex masks:

1. Click the subject's face → auto-detects the skin area.
2. Shift+click the neck → adds the neck to the mask.
3. Shift+click the ear → adds the ear.
4. Alt+click the nostril → subtracts the dark nostril interior that got included.

Each click takes a fraction of a second. In thirty seconds you can rough out a mask that would take three minutes with the Brush.

### After auto-detection

The auto-detected mask is rarely perfect. Common issues:

- **Ragged edges.** Auto-detection works at the pixel level and doesn't produce smooth boundaries. Use the Editor (V) to smooth the resulting path, or paint over jagged regions with the Brush.
- **Missed areas.** Shift+click missed regions, or switch to the Brush and paint them in.
- **Over-included areas.** Alt+click to subtract, or Alt+Brush to erase.

Auto-detection is a starting point, not an ending point. Use it to get 80% of the mask in seconds, then spend your time refining the remaining 20%. See [Editing Mask Paths](404-refining-masks.md) for detailed refinement techniques.

---

## Shape Tools vs. Brush: When to Use What

| Situation | Best Tool |
|-----------|-----------|
| Geometric region (card, panel, frame) | Rectangle (I) or Ellipse (O) |
| Irregular but angular region | Freeform (S) |
| Distinct shape in photo | Auto-detection (click with any mask tool) |
| Organic, curved boundary | Brush (B) — see [Painting Masks with the Brush](402-brush-mask.md) |
| Soft, feathered edge | Brush (B) with low hardness |
| Quick compound shape | Shape tools with Shift/Alt |
| Precise node-level control | Freeform (S) → Editor (V) — see [Editing Mask Paths](404-refining-masks.md) |

In practice, most masks use a combination. Auto-detect the subject, add missed regions with Shift+click, subtract over-included areas with Alt+click, then switch to the Brush for edge cleanup. The tools don't compete — they collaborate.

---

## Tips

**Start loose, refine tight.** Get the rough shape with auto-detection or a quick Freeform polygon. Then zoom in and refine with the Brush or Editor. Working from coarse to fine is always faster than trying to be precise from the start.

**Use Shift to constrain.** Shift+drag with Rectangle gives you a square. Shift+drag with Ellipse gives you a circle. It's a small modifier key that prevents a lot of "close enough" frustration.

**Invert after subtracting.** Sometimes the region you want to mask is easier to define by its *complement*. If your subject is complex but the background is simple, auto-detect the background, then invert the mask (Edit > Invert Mask). Now the subject is masked.

**Watch for stacked auto-detections.** Each Shift+click adds to the mask. If you lose track of what's included, press Cmd+Z a few times to step back, then rebuild. Or clear the mask entirely (Edit > Clear Mask) and start fresh. Masks are cheap.

---

## Summary

| Action | How |
|--------|-----|
| Rectangle mask | **I** → click and drag |
| Square mask | **I** → Shift + click and drag |
| Ellipse mask | **O** → click and drag |
| Circle mask | **O** → Shift + click and drag |
| Freeform mask | **S** → click points → close polygon |
| Add to mask | **Shift** + draw shape or click |
| Subtract from mask | **Alt** + draw shape or click |
| Auto-detect shape | Click a distinct region with any mask tool active |
| Adjust tolerance | Toolbar slider (when auto-detection is active) |

*Next: [Editing Mask Paths](404-refining-masks.md)*
