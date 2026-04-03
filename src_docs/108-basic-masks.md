# Hiding and Revealing

A single fill applied to an entire image is a good start. But the moment you want a Linear fill on the face and a Halftone fill on the background — or a Scribble fill only in the shadows — you need masks.

Masks are the answer to the question: "Where does this fill appear?"

## How Masks Work

Every fill layer can have a mask attached to it. The mask is a greyscale image the same size as your canvas, where:

- **White** means the fill is fully visible.
- **Black** means the fill is completely hidden.
- **Grey** means the fill is partially visible — the darker the grey, the more transparent the fill becomes.

By default, a new fill has no mask, which is equivalent to a fully white mask: the fill appears everywhere. The moment you start painting black areas, you're cutting holes in the fill, revealing whatever is beneath it (another fill, the canvas background, or nothing).

This is the same masking model used in Photoshop, Illustrator, and virtually every professional design tool. If you've used masks before, everything works as you'd expect. If you haven't, think of it like this: the mask is a stencil. White areas are cut out (strokes show through). Black areas are solid (strokes are blocked).

## The Brush Tool (B)

The Brush tool is your primary masking instrument. Press **B** to activate it, then paint on the canvas.

### Basic Painting

- **Paint with white** to reveal the fill (make strokes visible).
- **Paint with black** to hide the fill (remove strokes).
- **Alt + drag** to erase — this switches to the opposite colour temporarily. If you're painting white, Alt+drag paints black, and vice versa.

When you activate the Brush tool and select a fill layer that has a mask, the mask becomes visible as a semi-transparent red overlay on the canvas. The red areas are where the mask is hiding the fill. As you paint white, the red overlay disappears and strokes appear. As you paint black, red overlay covers the strokes.

### Brush Size

- **Ctrl + drag left/right** (or the equivalent on your platform) resizes the brush. Drag right to make it bigger, left to make it smaller. A circle preview follows your cursor showing the current brush size.
- Alternatively, use the brush size control in the Properties Panel when the Brush tool is active.

### Brush Hardness and Opacity

The Properties Panel shows additional brush settings when the Brush tool is selected:

- **Hardness** controls the edge of the brush. 100% hardness gives a sharp, crisp edge. Lower values produce a soft, feathered edge where the mask transitions gradually from white to black. Soft edges create smooth transitions between areas where a fill is visible and areas where it's hidden.
- **Opacity** controls how much paint you lay down per stroke. At 100%, one stroke paints pure white or pure black. At lower opacities, you build up the mask gradually with multiple strokes, which gives you finer control over partial-visibility effects.

### Practical Brush Workflow

A typical masking workflow looks like this:

1. Add two fill layers — say, a Linear fill and a Halftone fill.
2. Select the top fill (Halftone) in the Layers Panel.
3. Add a mask to it (if one doesn't exist yet, right-click the layer and choose **Add Mask**, or use the mask button in the Layers Panel).
4. Press **B** to activate the Brush tool.
5. Paint black over the areas where you want the Halftone fill hidden (revealing the Linear fill beneath).
6. Switch to white and paint over any areas you want to bring the Halftone back.
7. Use **Alt + drag** to quickly erase mistakes.

The result: two different fill types covering different regions of the same image, blending at their boundaries.

## Rectangle Mask Tool (I)

Press **I** to activate the Rectangle Mask tool. Click and drag on the canvas to draw a rectangular mask area.

- The rectangle fills with **white** inside the mask (revealing the fill) and **black** outside (hiding the fill), or vice versa, depending on your current mask mode.
- Hold **Shift** while dragging to constrain the rectangle to a perfect square.

This is faster than painting a rectangular area freehand with the Brush. Use it for architectural compositions, grid layouts, or any time you need a crisp rectangular boundary.

**Tips:**
- Draw multiple rectangles to create complex geometric masks.
- Combine Rectangle masks with Brush painting for shapes that are mostly rectangular but need organic edges in some areas.

## Ellipse Mask Tool (O)

Press **O** for the Ellipse Mask tool. It works exactly like the Rectangle tool, but draws ellipses.

- Click and drag to draw an elliptical mask area.
- Hold **Shift** to constrain to a perfect circle.

Ellipses are natural masks for faces, eyes, medallions, and any circular or oval composition. A portrait with a Linear fill inside an elliptical mask and a different fill outside it is a classic Vexy Lines composition.

## Freeform Mask Tool (S)

Press **S** for the Freeform Mask tool. Click point by point on the canvas to define an irregular polygon. Each click adds a vertex. Close the shape by clicking on the first point (or double-click to auto-close).

The Freeform tool is for shapes that aren't rectangles or ellipses: a silhouette outline, a country border, an irregular region that follows the contours of your subject. It's more precise than the Brush for hard-edged complex shapes, but less fluid for organic forms.

**Tips:**
- Use fewer points for smoother boundaries. Each point creates a straight edge between it and the next point. For curves, place points closer together along the curve.
- The Freeform mask and the Pencil tool (**P**) serve different purposes: the Freeform tool creates mask shapes; the Pencil creates vector paths. Don't confuse them.

## Auto-Detection

This is the feature that saves the most time and gets the least attention.

With a mask tool or the Brush active, **click on a distinct shape** in your source image — a face, a building, an object with clear edges against its background. Vexy Lines analyses the image and automatically creates a mask boundary around the detected shape.

The auto-detection works by looking at contrast edges in the source image. It works best when:

- The subject has clear edges against a contrasting background.
- The shape is a closed region (not a wispy, transparent element).
- The source image is reasonably sharp.

It works less well when:

- The subject blends into the background with similar tones.
- The edge is soft or blurred.
- Multiple overlapping elements create ambiguous boundaries.

When auto-detection nails it, it saves minutes of careful brush painting. When it misses, you can refine the result with the Brush tool — paint white to expand the detected area, black to shrink it.

**The workflow:** Click to auto-detect, then refine with the Brush. This combination handles most masking tasks faster than either approach alone.

## Mask Strategies

### Strategy 1: Paint on Top

The simplest approach. Add your fills, then paint masks to hide fills in areas where you don't want them.

- Fill 1 (Linear, full coverage, no mask) — the base layer.
- Fill 2 (Halftone, masked) — paint black to hide it everywhere except the background.
- Fill 3 (Scribble, masked) — paint black to hide it everywhere except the shadow regions.

Each mask is a simple "show here, hide there" stencil.

### Strategy 2: Inverse Masking

Sometimes it's easier to define where a fill *shouldn't* be than where it should. Start with a white mask (fill visible everywhere), then paint black on the areas to exclude.

For a portrait where you want a fill only on the face: paint black on the background, the clothing, the hair. What's left — the face — is where the fill appears.

### Strategy 3: Graduated Masks

Use a soft brush (low Hardness) at reduced Opacity to create gradual transitions. A mask that fades from white to black creates a fill that fades from fully visible to invisible. This produces smooth blends between different fill types — Linear fading into Wave, for instance — without hard edges.

### Strategy 4: Multiple Masks

A layer can have one mask, but you can achieve multi-mask effects by grouping layers. A group can have its own mask, and the layers inside it can have individual masks. The final visibility is the intersection — a pixel is only visible if both the layer mask and the group mask allow it.

This is advanced and covered more fully in [Organising Your Work](109-layers-groups.md). For now, know that the capability exists when your masking needs grow complex.

## Viewing and Editing Masks

- **Red overlay:** When the Brush or a mask tool is active and a masked layer is selected, the mask appears as a semi-transparent red overlay on the canvas. Red = hidden, clear = visible.
- **Mask thumbnail:** In the Layers Panel, each mask appears as a small greyscale thumbnail next to its layer. White areas are visible, black areas are hidden.
- **Disable mask:** You can temporarily disable a mask to see the full, unmasked fill. Right-click the mask thumbnail and choose **Disable Mask** (or the equivalent toggle). This is useful for comparing masked and unmasked states without deleting the mask.
- **Delete mask:** Right-click the mask thumbnail and choose **Delete Mask** to remove it entirely. The fill returns to full visibility.

## Common Mistakes

**Painting on the wrong layer.** Before painting a mask, check which layer is selected in the Layers Panel. If you paint a mask on the wrong fill, you're hiding the wrong thing. The Layers Panel selection and the red overlay should confirm which mask you're editing.

**Forgetting to add a mask first.** If you activate the Brush and start painting but nothing happens (no red overlay, no masking effect), the selected layer may not have a mask yet. Add one first.

**Using 100% Hardness everywhere.** Hard edges look sharp but unnatural when fills transition abruptly. A bit of feathering (70–80% Hardness) usually produces more pleasing boundaries.

**Over-painting.** If you're spending twenty minutes painting a precise mask around a complex shape, consider auto-detection first, or using the Freeform tool for the main shape and the Brush only for refinement.

## Next Steps

Masks let you control *where* fills appear. [Organising Your Work](109-layers-groups.md) covers the structural side: how layers stack, how groups work, and how source images inherit through the layer hierarchy. Together, masks and layers give you complete compositional control.
