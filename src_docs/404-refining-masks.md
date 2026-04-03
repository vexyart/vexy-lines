# Editing Mask Paths

Auto-detection got you 80% of the way. The Brush cleaned up another 15%. That last 5% — the clean curve around a jawline, the precise corner where a building meets the sky, the smooth arc of a wheel rim — requires node editing. This is where masks stop being approximate and start being surgical.

---

## From Pixels to Paths

Every mask in Vexy Lines exists in two forms simultaneously. At the rendering level, it's a greyscale bitmap: white pixels reveal, black pixels hide. But when you draw a mask with the shape tools (Rectangle, Ellipse, Freeform) or auto-detection, Vexy Lines also stores the *vector path* that defines the mask boundary. This path is made of nodes connected by straight or curved segments — the same building blocks as any vector illustration.

The Editor tool (**V**) lets you manipulate these nodes directly. The Knife tool (**K**) lets you cut paths into pieces. Between them, you can reshape any mask boundary with complete precision.

Brush-painted masks don't have a vector path — they're pure bitmap. If you need node-level control, start with a shape tool or auto-detection, then refine with the Editor. If you've already painted a mask with the Brush, you can convert it to a path (right-click the layer > Trace Mask Outline), though the result may have more nodes than a hand-drawn path.

---

## The Editor Tool (V)

Press **V** to activate the Editor. Click on a mask boundary — the path highlights and nodes appear as small squares on the outline.

### Selecting Nodes

- **Click a node** to select it. It becomes filled (solid) instead of hollow.
- **Shift+click** additional nodes to add them to the selection.
- **Click and drag** an empty area to draw a selection rectangle. All nodes inside are selected.
- **Cmd+A** selects all nodes on the current path.

### Moving Nodes

Click a selected node and drag it to a new position. The mask boundary reshapes in real time. If multiple nodes are selected, they all move together, maintaining their relative positions.

**Practical tip:** Moving a single node at a corner is usually more effective than trying to drag the entire segment. Corners are the control points; segments follow.

### Adding Nodes

**Alt+click** on a segment (the line between two existing nodes) to insert a new node at that point. The path shape doesn't change — you've simply added a new control point that you can now drag independently.

When to add nodes:

- The existing path is too coarse and you need a sharper turn or tighter curve between two distant nodes.
- Auto-detection produced a straight segment where you need a bulge or indentation.
- You need finer control in a specific area without affecting the rest of the path.

### Deleting Nodes

Select a node and press **Delete** (or Backspace). The node vanishes and the path reconnects the two neighbouring nodes with a single segment.

When to delete nodes:

- Auto-detection or Trace Mask Outline produced too many nodes, making the path jittery.
- You want to simplify a curve — fewer nodes mean smoother, more predictable segments.
- A stray node is creating an unwanted bump.

**Warning:** Deleting a node changes the path shape. The new segment between the remaining neighbours may not follow the same curve. Always check the result after deleting.

### Handles and Curves

Some nodes have **handles** — small lines extending from the node that control the curvature of adjacent segments. Drag a handle to change the curve's shape without moving the node itself.

- **Symmetric handles:** Both handles are the same length and point in opposite directions. Moving one affects both. This creates smooth, flowing curves.
- **Asymmetric handles:** Each handle moves independently. This creates cusps — smooth on one side, sharp on the other.
- **No handles:** The node connects straight-line segments. The path has a sharp corner at that point.

To convert between types:

| From | To | How |
|------|----|-----|
| Corner (no handles) | Smooth curve | Alt+click the node and drag outward — handles appear |
| Smooth curve | Corner | Alt+click the node — handles retract |
| Symmetric | Asymmetric | Hold Cmd and drag one handle independently |

---

## The Knife Tool (K)

The Knife cuts paths. Press **K** to activate, then click on a mask path at the point where you want to cut. The path splits into two separate open paths at that point.

### Why cut?

- **Remove a section.** Cut at two points, select the segment between them, and delete it. The mask now has a gap.
- **Open a closed path.** A mask boundary is typically a closed loop. Cutting it once opens the loop, giving you two endpoints you can drag to reshape the boundary more dramatically.
- **Create complex topology.** Two cuts and a deletion can turn a simple oval mask into a crescent.

### Cutting workflow

1. Press **K**.
2. Click the first cut point on the path.
3. Click the second cut point (if you need to isolate a section).
4. Press **V** to switch back to the Editor.
5. Click the segment between the cuts to select it.
6. Press **Delete** to remove it.

The mask now has an opening. The fill disappears in the area that was bounded by the deleted segment.

---

## Smoothing Edges

Rough mask edges — from auto-detection, hasty Brush painting, or too-few Freeform nodes — undermine even the best fill settings. Two approaches to clean them up:

### Node-Level Smoothing

1. Select nodes along the rough section (Shift+click or drag-select).
2. Convert corners to smooth curves (Alt+click and drag to create handles).
3. Adjust handles until the curve flows naturally.

This is precise but slow. Best for short sections with 5–10 nodes.

### Path Simplification

If the path has far too many nodes (common after auto-detection or Trace Mask Outline), simplification reduces node count while preserving the general shape:

1. Select all nodes on the path (Cmd+A).
2. Use Edit > Simplify Path (or the toolbar simplification control).
3. Adjust the tolerance: higher tolerance removes more nodes (smoother but less accurate), lower tolerance keeps more nodes (rougher but more faithful).

For most masks, a tolerance that reduces node count by 50–70% produces visibly smoother edges without losing the shape's character. Always compare before and after — Cmd+Z to undo if the simplification went too far.

### Post-Refinement with the Brush

After node editing, switch to the Brush (**B**) with a small size and 80–100% hardness. Zoom in and paint or erase along the mask edge to fix any remaining irregularities. The Brush and Editor target the same mask data, so changes made with either tool are immediately visible to the other.

---

## Practical Workflow: Auto-Detect Then Refine

The most common mask-editing workflow combines auto-detection (fast, rough) with Editor refinement (precise, slow):

### Step 1: Auto-Detect

With a mask tool active, click the subject in your source photo. Shift+click additional regions. Alt+click to subtract unwanted areas. You now have a rough mask covering approximately the right area.

### Step 2: Assess

Zoom to 200–300%. Slowly pan around the mask boundary. Look for:

- **Bumps** where the auto-detection grabbed a bit of background.
- **Indentations** where it missed a bit of subject.
- **Jagged staircases** where the pixel-level detection created non-smooth edges.
- **Thin tendrils** where a narrow colour bridge caused the detection to leak into an adjacent area.

### Step 3: Coarse Fixes with the Brush

Switch to the Brush (**B**). Paint white (reveal) in areas the auto-detection missed. Alt+paint (hide) in areas it over-included. This fixes the major shape errors without the overhead of node editing.

### Step 4: Convert and Edit Nodes

If the mask boundary needs smooth, professional-quality edges:

1. Right-click the layer > Trace Mask Outline (if not already a vector path).
2. Switch to Editor (**V**). The path appears with nodes.
3. Delete excess nodes to simplify.
4. Convert remaining nodes to smooth curves (Alt+click+drag).
5. Drag nodes and handles until the boundary flows cleanly.

### Step 5: Final Brush Pass

Zoom to 400%+. Brush (**B**) with 5–10 px size. Clean up any last pixel-level irregularities. The combination of vector path editing and pixel-level brushwork produces masks that look hand-crafted.

---

## Converting Corners to Curves (and Back)

This conversion is worth emphasising because it transforms mask quality more than any other single operation.

Auto-detected paths and Freeform polygons are made of straight segments with corner nodes. These produce mask boundaries with visible angles — a face mask looks like a polygon instead of a smooth silhouette.

Converting key corners to curves fixes this:

1. **V** to activate the Editor.
2. Click a corner node.
3. **Alt+click** and drag outward. Handles appear. The adjacent segments become curves.
4. Adjust the handle length and angle until the curve matches the subject's contour.
5. Repeat for each corner that should be smooth.

Leave corners as corners where the subject actually has sharp angles (building edges, table corners, geometric objects). Convert to curves where the subject has organic contours (faces, bodies, natural forms, fabric folds).

A 20-node polygon with 15 corners converted to curves looks dramatically better than the original. Spend two minutes on this step and your masks will look like they were drawn by an illustrator.

---

## Tips

**Fewer nodes = smoother curves.** Resist the urge to add nodes. Instead, use handle length and angle to control curvature between existing nodes. A smooth curve through 4 well-placed nodes looks better than a wobbly path through 20.

**Work at zoom.** Node editing at overview zoom is like threading a needle in the dark. Zoom to at least 200%. The nodes are easier to grab, the curves easier to evaluate.

**Save before editing.** Major path edits are hard to undo piecemeal. Save your document (Cmd+S) before starting a refining session, so you can revert entirely if needed.

**Combine tools in sequence, not in parallel.** Do all your Brush work, then all your node editing, then a final Brush pass. Switching constantly between tools breaks your rhythm and usually produces worse results.

---

## Summary

| Action | Tool | How |
|--------|------|-----|
| Select nodes | Editor (V) | Click, Shift+click, or drag-select |
| Move node | Editor (V) | Drag selected node |
| Add node | Editor (V) | Alt+click on a segment |
| Delete node | Editor (V) | Select → Delete key |
| Corner → curve | Editor (V) | Alt+click node and drag |
| Curve → corner | Editor (V) | Alt+click node |
| Cut path | Knife (K) | Click on path |
| Simplify path | Editor (V) | Select all → Edit > Simplify Path |
| Final pixel cleanup | Brush (B) | Paint/erase at high zoom |

*Next: [Mesh Warping: Bending Fills in 3D](405-mesh-warping.md)*
