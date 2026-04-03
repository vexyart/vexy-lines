# Painting Masks with the Brush

The Brush tool turns your cursor into a can of spray paint — except instead of colour, you're spraying *permission*. White paint says "the fill is allowed here." Black paint says "the fill is forbidden here." Everything in between is a gradient of transparency.

Press **B** and start painting. That's the entire learning curve. The nuance is in how you paint, what you paint over, and how you combine brushwork with other mask tools to carve out exactly the region your fill should occupy.

---

## The Basics: White Reveals, Black Hides

Every fill layer in Vexy Lines has a mask — a greyscale image the same size as your canvas. Where the mask is white (255), the fill renders at full strength. Where the mask is black (0), the fill vanishes completely. Grey values produce partial transparency: a mask value of 128 renders the fill at roughly 50% density.

When you activate the Brush tool (**B**) and paint on a fill layer:

- **Default stroke = white.** You're revealing the fill in the painted area.
- **Alt+drag = black.** You're erasing — hiding the fill in the painted area.

That's the two-mode system. Paint to show, Alt+paint to hide. Every mask interaction in Vexy Lines reduces to this binary.

A brand-new fill starts with a *full white mask* — the fill renders everywhere. If you want the fill only in specific areas, you have two approaches:

1. **Additive:** Start with a black (empty) mask. Paint white where the fill should appear. To create a black mask, select the fill layer, then use Edit > Clear Mask (or right-click the layer and choose Clear Mask). Now the fill is invisible everywhere, and you paint it into existence.

2. **Subtractive:** Keep the default white mask. Alt+paint (erase) where the fill should *not* appear. This is faster when the fill should cover most of the canvas and you only need to remove small areas.

Choose the approach that requires less painting. If the fill covers 80% of the canvas, start white and erase the 20%. If it covers 20%, start black and paint the 20%.

---

## Brush Controls

With the Brush tool active, the toolbar shows several controls. Here's what each does:

| Control | What It Does | How to Adjust |
|---------|-------------|---------------|
| **Size** | Diameter of the brush circle | Ctrl+drag left/right on canvas, or type a value in the toolbar |
| **Hardness** | Edge sharpness: 0% = soft feathered edge, 100% = crisp solid edge | Toolbar slider or numeric input |
| **Opacity** | Maximum paint density per stroke: 100% = full white or full black, 50% = semi-transparent | Toolbar slider |

### Size

Small brushes (5–20 px) for detail work around edges. Large brushes (100–500 px) for broad regions. The resize shortcut — **Ctrl+drag horizontally** on the canvas — is the fastest way to adjust mid-stroke. Drag right to enlarge, left to shrink. The circle preview updates in real time.

### Hardness

At 100% hardness, the brush has a knife-sharp boundary: inside the circle is fully painted, outside is untouched. This is good for geometric regions, text boundaries, and any mask edge that should look deliberate.

At 0% hardness, the brush feathers from full opacity at the center to zero at the edge. This produces soft, blended transitions — useful for gradually revealing a fill, creating vignette effects, or blending two fill regions together without a visible seam.

A hardness of 50–70% is a versatile middle ground: edges are visible but not stark.

### Opacity

Brush opacity controls the maximum density of a single stroke. At 100%, one pass of white paint creates a fully white mask region. At 30%, one pass creates a 30% grey region — the fill renders at 30% density there. Paint over the same area again and it builds to about 51%. A third pass reaches roughly 66%. This is how you build gradual masks.

**Practical use:** Set opacity to 20–30% and make several passes over an area to gradually introduce a fill. The result is a smooth gradient of fill density that looks hand-crafted, not mechanically on-or-off.

---

## The Painting Workflow

Here's the step-by-step process for masking a fill with the Brush:

### Step 1: Select the Fill Layer

Click the fill layer in the Layers Panel. The Properties Panel shows that fill's parameters. Any mask painting you do now affects *this layer's mask only*. Other fills are untouched.

This is a crucial point: **masks are per-layer.** Each fill has its own independent mask. Painting on one layer's mask has zero effect on any other layer.

### Step 2: Activate the Brush

Press **B** or click the Brush icon in the toolbar. Your cursor becomes a circle showing the brush size.

### Step 3: Paint

Click and drag on the canvas to paint white (reveal). The fill appears inside the painted region as you drag. If the fill was already visible everywhere (default white mask), you won't see a change — you're painting white on white.

To see the effect clearly, first clear the mask (Edit > Clear Mask), then paint. Now you're painting the fill into existence on a blank canvas.

### Step 4: Erase Mistakes

Hold **Alt** and drag to erase. The brush switches to black paint, hiding the fill wherever you touch. Release Alt to return to white paint.

### Step 5: Refine

Zoom in (**Z** or Alt+scroll) to the mask edge. Reduce the brush size (Ctrl+drag left) and clean up jagged boundaries. Switch between paint and erase with Alt to push the edge exactly where you want it.

---

## Techniques for Better Masks

### The Outline-Then-Fill Approach

For complex shapes (faces, hands, objects with irregular boundaries):

1. Set a small brush size (10–15 px), hardness 80–100%.
2. Carefully trace the outline of the region you want to mask.
3. Once the boundary is closed, switch to a large brush (200+ px).
4. Fill in the interior with quick sweeping strokes.

This is far faster than trying to paint the whole region with a small brush, and far cleaner than trying to do it all with a large one.

### Feathered Transitions

Where two fills meet — say, a Linear fill for the face and a Scribble fill for the hair — a hard mask boundary creates an abrupt visual break. To soften it:

1. Paint both masks with hardness 0% (fully feathered).
2. Let the feathered edges overlap slightly.
3. Both fills render at partial density in the overlap zone, creating a smooth transition.

Alternatively, paint hard masks for both fills, then go back with a large, soft brush at 30% opacity and gently erase the edge on each side. This sculpts a gradient at the boundary.

### Zoom-and-Paint

The single most important habit for good masks: **zoom in.** At 100% zoom, a face is a small region and it's nearly impossible to paint a precise mask around the nose, lips, or jawline. At 300–400% zoom, you can see individual stroke endpoints and paint around them.

Use **Spacebar+drag** to pan while zoomed in. Paint a section of the mask edge, pan to the next section, paint again. It's methodical but the results are dramatically cleaner.

### Building Density Gradually

Instead of painting at 100% opacity and hoping for the best:

1. Set brush opacity to 25%.
2. Make one pass over the region. The fill appears at quarter strength.
3. Evaluate. Is the fill visible enough here? Too much?
4. Add another pass where you want more density.
5. Leave areas with a single pass as subtle background texture.

This technique is especially powerful with Dynamic Color enabled. A fill at 25% mask density with Dynamic Color produces watercolour-like washes of sampled source colour.

---

## Mask Independence

One of the least obvious but most powerful features of Vexy Lines masks: **the mask and the fill are completely independent.**

Change the fill type from Linear to Halftone — the mask stays. Change the Interval from 1 mm to 5 mm — the mask stays. Change the Angle, the Colour, the Randomization — the mask stays.

This means you can:

- Paint a mask once, then experiment freely with fill parameters.
- Copy a mask from one layer to another (right-click > Copy Mask, then right-click the target > Paste Mask).
- Invert a mask (Edit > Invert Mask) to create a layer that fills *everywhere except* where another layer fills.

Think of the mask as a reusable stencil. You cut it once. Then you can spray any fill through it.

---

## Combining Brush Masks with Other Tools

The Brush is one of four mask tools. They all write to the same mask data, so you can combine them freely:

1. **Start with a Rectangle mask** (I) to define a rough region.
2. **Refine with the Brush** (B) to paint in the areas the rectangle missed, or Alt+paint to carve away areas it included.
3. **Use Auto-Detection** to grab a distinct shape, then **switch to the Brush** to clean up the auto-detected boundary.

The mask is just a greyscale image. It doesn't care which tool painted which pixel. Mix tools within a single mask however you like.

For more on combining mask tools, see [Rectangle, Ellipse, and Freeform Masks](403-shape-masks.md). For editing mask paths as vector nodes, see [Editing Mask Paths](404-refining-masks.md).

---

## Common Mistakes

**Painting on the wrong layer.** Always check the Layers Panel before you start painting. It's easy to accidentally mask the wrong fill, especially in documents with many layers. The active layer is highlighted in the Layers Panel.

**Forgetting Alt to erase.** If you paint too far, you don't need to undo — just hold Alt and paint the excess away. Undo works too (Cmd+Z), but erase-painting is often faster and more precise.

**Brush too large for the detail.** If you're fighting the mask edge, your brush is probably too big. Ctrl+drag left to shrink it. Precision always wins.

**Skipping the zoom.** Painting masks at overview zoom is like signing your name wearing oven mitts. Zoom in. Your masks will thank you.

---

## Summary

| Action | How |
|--------|-----|
| Activate Brush | **B** |
| Paint (reveal fill) | Click and drag |
| Erase (hide fill) | **Alt** + click and drag |
| Resize brush | **Ctrl** + drag left/right |
| Soft edges | Set Hardness to 0% |
| Hard edges | Set Hardness to 100% |
| Gradual reveal | Set Opacity to 20–30%, paint multiple passes |
| Clear entire mask | Edit > Clear Mask |
| Invert mask | Edit > Invert Mask |
| Copy mask to another layer | Right-click > Copy Mask → right-click target > Paste Mask |

*Next: [Rectangle, Ellipse, and Freeform Masks](403-shape-masks.md)*
