# Mesh Warping: Bending Fills in 3D

Flat vector patterns are elegant. Flat vector patterns bent around a bottle, draped over a waving flag, or spiralling through a twisted ribbon are *spectacular*. Mesh warping takes any fill — Linear, Wave, Halftone, all twelve — and maps it onto a deformable surface, turning two-dimensional line work into something that looks and feels three-dimensional.

---

## What a Mesh Does

A mesh is an invisible grid of connected points that sits on top of your fill. In its default state, the grid is flat and regular — the fill looks exactly as it would without a mesh. But drag a mesh point upward and the fill bulges. Drag it sideways and the fill stretches. Fold an edge over and the fill wraps behind itself.

The mesh doesn't change your fill parameters. Interval is still 1.5 mm, Angle is still 45 degrees, Randomization is still 12%. The mesh changes *where those strokes end up* after generation — it warps the output geometry, not the input algorithm.

Think of it as placing your fill artwork on a sheet of rubber, then pushing and pulling that rubber into a new shape. The art stretches and compresses with the surface.

---

## Adding a Mesh

1. Select a fill layer in the Layers Panel.
2. Click the **Mesh** button in the Properties Panel (or toolbar — it looks like a grid icon).
3. A dialog offers six templates. Choose one.
4. The mesh appears over your fill, and the fill immediately warps to match the template's shape.

You can also start from scratch with a flat Rectangle template and edit it into any shape you want.

---

## The Six Templates

Each template is a starting point. After applying, you edit freely.

### Rectangle

A four-cornered perspective grid. The default mesh — a flat rectangle that does nothing until you drag its corner or edge points.

**Best for:** Perspective distortion. Drag the top-right corner upward and the top-left corner downward to simulate a surface tilted away from the viewer. Product mockups, book covers, screen displays, angled signage.

**Quick recipe:** Apply Rectangle mesh → drag top-left and top-right corners inward by about 20% → drag top edge upward slightly. The fill now looks like it's printed on a surface receding into the distance.

### Donut

A circular ring. The fill wraps around the ring as if applied to the surface of a cylinder seen from above — or a coin, a medallion, a jar lid.

**Best for:** Cylindrical label wraps, coin engravings, medallion borders, circular sticker mockups. The curvature is inherent in the template — you don't need to manually bend anything.

**Quick recipe:** Apply Donut mesh to a Linear fill at 0° angle, interval 1.5 mm. The straight parallel lines immediately become concentric arcs following the donut's curvature. Adjust the inner and outer radii by dragging edge points.

### Rising

A wave that curves upward — like a flag caught in an updraft or a banner blowing in the wind.

**Best for:** Flags, banners, ribbons ascending, dynamic motion effects. The wave amplitude and frequency are controlled by how aggressively you drag the mesh points after applying.

**Quick recipe:** Apply Rising mesh to a Linear fill at 0° angle. The lines undulate with the wave. Increase the wave height by dragging the peak points upward. The fill looks like engraved lines on a waving surface.

### Falling

The inverse of Rising — a wave that curves downward. Same principle, opposite direction.

**Best for:** Drooping fabric, descending scrolls, gravitational effects. Often used in combination with Rising on a different layer to create opposing wave directions that suggest complex cloth movement.

### Ribbon

A spiralling band that twists through space. This is the most dramatic template — the fill appears to wrap around a Möbius-strip-like form that folds over itself.

**Best for:** Twisted ribbons, spiral banners, decorative scrollwork, certificate ornaments. Combined with [Hidden Strokes Removal](406-hidden-strokes.md), the ribbon looks genuinely three-dimensional — the back face disappears behind the front.

**Quick recipe:** Apply Ribbon mesh to a Linear fill at 15° angle, interval 1.0 mm. Enable Hidden Strokes Removal. The fill now looks like an engraved ribbon spiralling through space, with the far side hidden behind the near side.

### Custom (Editing Any Template)

Every template is just a starting configuration of points and edges. Once applied, you can reshape any template into anything. The "custom" mesh is whatever you make of the starting template.

---

## Editing Mesh Points

After applying a template, the mesh appears as a grid of points connected by edges. Editing is immediate and intuitive:

### Selecting Points

- **Click a point** to select it (it highlights).
- **Shift+click** to add points to the selection.
- **Drag a selection rectangle** to select multiple points at once.

### Moving Points

Drag a selected point to a new position. The mesh surface deforms smoothly, and the fill re-warps in real time (if Auto Refresh is on) or on the next Refresh (if it's off).

Moving points near each other compresses the fill in that area — strokes bunch together. Moving points apart stretches the fill — strokes spread. This compression and stretching is the entire visual mechanism of mesh warping.

### Adding Points

**Alt+click** on a mesh edge to insert a new point. This subdivides the edge into two segments and gives you finer control in that area.

When to add points:

- You need a sharper bend than the existing point spacing allows.
- A large face of the mesh needs independent control in its interior.
- The template's default resolution is too coarse for your deformation.

### Deleting Edges

Select an edge and press **Delete**. The mesh face that relied on that edge becomes a hole — the fill doesn't render in that area.

**Use for:** Creating windows, cutouts, or irregular mesh shapes. A donut with deleted inner edges becomes a disc. A rectangle with a deleted centre face becomes a frame.

---

## Practical Projects

### Wrapping an Engraving Around a Bottle

You have a product photo of a wine bottle and want the label to look like it was engraved directly onto the glass.

1. Create a new fill layer with Linear fill: angle 0°, interval 1.0 mm, thickness mode Thick.
2. Mask the fill to the label area using auto-detection or the Freeform tool.
3. Click Mesh → choose **Donut** (for a cylinder, the donut's curvature matches).
4. Reshape the donut to match the bottle's curvature: drag the left and right edges to align with the label's visible boundaries. Drag the top and bottom edges to match the label height.
5. The linear strokes now curve with the bottle's surface. Strokes at the edges compress (the cylinder curves away from the viewer), creating a convincing 3D wrap.
6. Enable [Hidden Strokes Removal](406-hidden-strokes.md) if the mesh folds over itself.

### Draping Waves Over a Landscape

You have a landscape photo and want the fill to feel like it rolls over the hills.

1. Create a Wave fill layer: wave height 3 mm, wave length 8 mm, interval 2.0 mm.
2. Click Mesh → choose **Rising** (it matches rolling terrain).
3. Drag the mesh points to follow the contour of the hillscape: peaks where the hills peak, valleys where the terrain dips.
4. Add points (Alt+click on edges) where the terrain has complex curvature that the default grid can't capture.
5. The Wave fill now appears to flow *over* the terrain, compressing on the near sides of hills and stretching on the far sides.

### Creating a Spiralling Ribbon

For certificate designs, decorative borders, or ornamental illustration:

1. Create a Linear fill: angle 15°, interval 0.8 mm, thickness mode Linear.
2. Mask to a horizontal band across the canvas.
3. Click Mesh → choose **Ribbon**.
4. Adjust the ribbon's width by moving edge points inward or outward.
5. Adjust twist tightness by moving interior points closer together (tighter spiral) or farther apart (gentler spiral).
6. Enable Hidden Strokes Removal for physical realism.
7. Add a second fill (same parameters, different colour or angle) with the same mesh for a two-tone ribbon effect.

---

## Performance Considerations

Mesh warping is computationally expensive. Every stroke in the fill must be transformed through the mesh's geometry. Dense fills (small interval, many strokes) on complex meshes (many points, tight folds) can slow rendering significantly.

**Tips for speed:**

- **Turn off Auto Refresh** while editing mesh points. Edit several points, then manually Refresh to see the result.
- **Increase interval temporarily** while shaping the mesh. Once the mesh is right, reduce interval to the final value.
- **Reduce canvas size** if you're experimenting. A 1000×1000 px source image renders mesh-warped fills much faster than a 5000×5000 px one. Scale up after the mesh is finalised.
- **Simplify the mesh.** Fewer points and edges mean faster warping. Only add points where you genuinely need finer control.

---

## Mesh + Mask Interaction

The mesh warps the fill *after* the mask is applied. This means:

- If you mask a fill to a rectangle and then apply a Rising mesh, the rectangular region of fill bends with the wave. The mask boundary itself deforms.
- If you change the mask after applying the mesh, the new mask region is warped by the existing mesh.

This is usually what you want — the mask and fill move together as a unit on the mesh surface. But be aware that a mask painted on the flat canvas will look different once the mesh bends it. Paint your mask, *then* apply the mesh — or accept that you'll need to adjust the mask after warping.

---

## Summary

| Action | How |
|--------|-----|
| Add mesh | Select fill → Mesh button → choose template |
| Select mesh point | Click point |
| Move mesh point | Drag selected point |
| Add mesh point | Alt+click on a mesh edge |
| Delete mesh edge | Select edge → Delete key |
| Remove mesh entirely | Select fill → Mesh button → Remove Mesh |

| Template | Shape | Primary Use |
|----------|-------|-------------|
| Rectangle | Perspective grid | Angled surfaces, product mockups |
| Donut | Circular ring | Cylindrical wraps, coins, medallions |
| Rising | Upward wave | Flags, banners, ascending motion |
| Falling | Downward wave | Drooping fabric, gravity effects |
| Ribbon | Spiralling band | Twisted ribbons, decorative scrollwork |

*Next: [Hidden Strokes Removal](406-hidden-strokes.md)*
