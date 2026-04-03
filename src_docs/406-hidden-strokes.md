# Hidden Strokes Removal

Fold a piece of paper in half. The back surface disappears — you only see the front. Now imagine that paper is covered in engraved lines. Where the paper folds behind itself, the lines vanish. That's Hidden Strokes Removal. It makes mesh-warped fills behave like physical objects instead of flat projections.

---

## The Problem HSR Solves

Without Hidden Strokes Removal, a mesh-warped fill is a mathematical projection. If you twist a ribbon mesh so it folds over itself, both the front-facing and back-facing strokes render on top of each other. The result is a tangled mess of overlapping lines — the "ribbon" looks like a transparent sheet of cellophane, not a solid surface.

Enable Hidden Strokes Removal and the back-facing strokes vanish behind the front-facing ones. The ribbon suddenly looks *real*. It has a front and a back, and your eyes understand the three-dimensional form without any additional cues.

HSR is purely a mesh feature. It has no effect on fills without a mesh, because there's nothing to fold.

---

## Enabling HSR

1. Select a fill layer that has a mesh applied.
2. In the Properties Panel, find the **Hidden Strokes Removal** section (it only appears when a mesh is active).
3. Toggle HSR **On**.
4. Choose a precision mode.
5. Refresh the fill to see the result.

---

## The Four Precision Modes

HSR calculates which parts of the mesh surface face toward the viewer and which face away. Higher precision means cleaner occlusion boundaries but slower rendering.

| Mode | Speed | Quality | Best For |
|------|-------|---------|----------|
| **Low** | Fastest | Visible artifacts at fold edges; some back-facing strokes leak through | Quick previews, initial mesh shaping |
| **Medium** | Moderate | Clean folds with occasional minor leakage on tight bends | Most everyday work; good balance |
| **High** | Slow | Very clean occlusion; rare artifacts only on extremely tight folds | Final renders, portfolio pieces |
| **Maximum** | Slowest | Pixel-perfect occlusion on all folds | Print production, close-up detail work |

The differences are most visible at fold edges — where front and back surfaces meet. At Low precision, you might see a few stray strokes from the back surface poking through the fold line. At Maximum, the fold is knife-clean.

**Recommendation:** Work at Low or Medium while editing the mesh. Switch to High or Maximum for the final render before export. There's no visual difference in areas far from folds, so the precision mode only matters at the occlusion boundaries.

---

## How HSR Determines "Front" and "Back"

HSR uses the mesh surface normals — mathematical arrows perpendicular to each mesh face — to determine orientation. A face whose normal points toward the viewer is front-facing and renders normally. A face whose normal points away from the viewer is back-facing and its strokes are hidden.

You don't need to understand the maths. The practical effect is:

- **Unfolded areas** always render. The mesh face points at you; the strokes appear.
- **Folded-over areas** are hidden where the fold puts the surface facing away from you. The strokes behind the fold disappear.
- **Edge areas** (where the surface turns sideways) may partially render depending on the precision mode.

If a fold looks wrong — strokes appear where they should be hidden, or disappear where they should be visible — it usually means the mesh points need adjustment. Drag mesh points to make the fold cleaner, and HSR will respond correctly.

---

## When to Use HSR

**Always use HSR when:**

- A mesh folds over itself (Ribbon template, complex custom meshes).
- You want the illusion of a solid 3D surface (labels on bottles, text on curved objects).
- Two or more mesh faces overlap in the viewport.

**Skip HSR when:**

- The mesh is a simple perspective distortion (Rectangle template, no folds). There's no back-facing surface, so HSR does nothing.
- Speed matters more than realism during editing. HSR adds computation to every refresh.
- The fill is intentionally transparent or ghostly — the overlapping-strokes look might be what you want.

---

## HSR and Layer Stacking

HSR operates per-layer. Each fill layer with a mesh computes its own hidden strokes independently. If you have two fill layers with meshes stacked on top of each other, each layer hides its own back-facing strokes, but they don't occlude *each other*.

To create the illusion that one meshed fill passes behind another:

1. Apply meshes to both layers.
2. Enable HSR on both.
3. Use masks to hide the portion of the back layer where the front layer's surface covers it.

This requires some manual masking but produces convincing results — a red ribbon spiralling in front of a blue ribbon, for instance.

---

## Visual Examples

### Ribbon Without HSR

A Ribbon-mesh Linear fill renders both sides of the twist. Front-facing lines and back-facing lines overlap, creating an X-ray transparency effect. The ribbon has no visual depth — your brain reads it as a flat tangle.

### Ribbon With HSR

The same fill, same mesh. HSR hides the back-facing strokes. Now the ribbon's front surface is solid, the back surface is invisible, and the twist looks like a physical object turning in space. The fold edge is sharp and clean (at High or Maximum precision).

### Donut Without HSR

A Donut-mesh Linear fill renders the full 360° of the ring. Strokes from the far side of the cylinder show through the near side. The result looks more like a spiral viewed from above than a solid cylinder.

### Donut With HSR

HSR hides the far side. The cylinder looks solid. Strokes on the front surface render normally; strokes on the back surface vanish. The visual reads as a label physically wrapped around a can.

---

## Troubleshooting

**Back-facing strokes leak through at fold edges.**
Increase the precision mode. If you're at Medium, try High. If folds are still leaky at High, try Maximum.

**Entire mesh areas disappear unexpectedly.**
The mesh face normals may be flipped — the surface thinks "front" is "back." This usually happens when mesh points are dragged past each other, inverting a face. Undo (Cmd+Z) the last mesh edit and check that no faces are inside-out.

**Performance is unacceptable.**
- Reduce precision mode while editing.
- Increase the fill's Interval to reduce stroke count.
- Turn off Auto Refresh and use manual Refresh.
- Simplify the mesh (fewer points, fewer faces).

**HSR toggle is greyed out.**
The selected fill doesn't have a mesh. Add a mesh first (see [Mesh Warping: Bending Fills in 3D](405-mesh-warping.md)).

---

## HSR and Export

HSR is calculated before export. The exported SVG, PDF, or PNG contains only the visible (front-facing) strokes. Back-facing strokes are not included in the output file — they're genuinely removed, not just hidden. This means exported files are also smaller, since they contain fewer paths.

One note: if you open the exported SVG in Illustrator and expect to find the hidden strokes still there (just invisible), they aren't. HSR is destructive at export time. If you need both front and back strokes preserved, export without HSR, then re-export with HSR — you'll have two versions.

---

## Summary

| Action | How |
|--------|-----|
| Enable HSR | Properties Panel → Hidden Strokes Removal → On |
| Choose precision | Low / Medium / High / Maximum dropdown |
| Disable HSR | Toggle Off |

| Precision | Speed | Use Case |
|-----------|-------|----------|
| Low | Fast | Previewing mesh shapes |
| Medium | Moderate | General work |
| High | Slow | Final renders |
| Maximum | Slowest | Print production, extreme close-ups |

| Situation | Use HSR? |
|-----------|----------|
| Ribbon or twisted mesh | Yes |
| Donut (cylindrical wrap) | Yes |
| Simple perspective (Rectangle, no fold) | No |
| Speed-critical editing | No (enable for final render) |

*Next: [Groups: Source Images and Inheritance](407-groups-advanced.md)*
