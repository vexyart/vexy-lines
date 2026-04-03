# Composing Complex Artwork

A single fill on a single layer makes a good demo. A dozen fills, shaped by masks, bent through meshes, and stacked inside groups — that makes art.

Part 4 is where Vexy Lines stops being a filter and starts being a compositing engine. Everything you learned in Parts 1–3 about fills, parameters, and tools now becomes raw material for layered compositions that rival hand-engraved illustration, multi-plate screen prints, and dimensional packaging mockups. This overview maps the territory so you can navigate the chapters that follow.

---

## The Four Powers

Complex artwork in Vexy Lines rests on four capabilities:

| Capability | What It Controls | Key Shortcuts / Tools |
|------------|-----------------|----------------------|
| **Masks** | *Where* a fill appears | Brush (B), Rectangle (I), Ellipse (O), Freeform (S) |
| **Meshes** | *How* a fill bends in 3D | Mesh button → 6 templates |
| **Groups** | *How* layers are organised and sourced | Cmd+G to group |
| **Layer Order** | *What* sits on top of what | Drag in the Layers Panel |

Masks are the most frequently used. If fills are paint, masks are stencils — they define the shape of each fill region without altering the fill itself. You can repaint a mask without touching a single fill parameter.

Meshes are the most dramatic. They take a flat vector pattern and warp it onto a curved surface: a bottle label, a waving flag, a spiralling ribbon. Combined with Hidden Strokes Removal, the result looks genuinely three-dimensional.

Groups are the most structural. They let you assign different source images to different parts of a document, nest sub-compositions inside each other, and keep a fifty-layer project manageable.

Layer order is the simplest yet most consequential. Vexy Lines renders bottom-to-top, so the fill at the bottom of the Layers Panel draws first and can be obscured by everything above it. A Trace outline on the very top layer creates crisp borders around every fill beneath it.

---

## Quick-Reference: Mask Tools

| Tool | Shortcut | What It Creates | Modifier Keys |
|------|----------|----------------|---------------|
| Brush | **B** | Painted soft or hard-edged masks | Alt+drag = erase, Ctrl+drag = resize brush |
| Rectangle | **I** | Rectangular mask regions | Shift = constrain to square |
| Ellipse | **O** | Elliptical mask regions | Shift = constrain to circle |
| Freeform | **S** | Irregular polygonal masks | Click to place nodes, close to finish |
| Editor | **V** | Refine existing mask paths | Alt+click = add node, Delete = remove node |
| Knife | **K** | Cut mask paths | Click start + click end on a path |

**Compound masks:** Shift+click to *add* a new shape to an existing mask. Alt+click to *subtract*. These combine to create complex regions without manual path editing.

**Auto-detection:** With any mask tool active, click a distinct shape in your photo — Vexy Lines attempts to isolate it automatically. Adjust tolerance if the selection grabs too much or too little, then refine with the Editor.

---

## Quick-Reference: Mesh Templates

| Template | Shape | Typical Use |
|----------|-------|-------------|
| Rectangle | Four-corner perspective grid | Flat-to-angled surface — book covers, signs, screens |
| Donut | Circular ring | Labels wrapped around cylinders, coins, medallions |
| Rising | Wave curving upward | Flags, banners, rising ribbons |
| Falling | Wave curving downward | Drooping fabric, descending scrolls |
| Ribbon | Spiralling band | Twisting ribbons, Möbius-strip effects |
| (Custom) | User-edited from any template | Anything else — edit points and edges freely |

**Hidden Strokes Removal** makes mesh folds physically convincing: strokes on the "back" of a folded surface disappear behind the "front." Four precision modes trade accuracy for render speed.

---

## Quick-Reference: Group Powers

| Feature | How to Access | What It Does |
|---------|--------------|--------------|
| Create group | Select layers → Cmd+G | Wraps selected layers in a folder |
| Per-group source image | Drag image onto group header | Group's fills read from *this* image, not the document root |
| Inheritance | (Automatic) | Groups without a source image inherit from their parent group, up to the document root |
| Import .lines as group | File > Import or drag .lines file | Entire document becomes a sub-group in the current document |
| Overlay mode | Toggle in group properties | Masks in this group cut through all layers outside it |
| Lock | Click lock icon | Prevents edits to all layers inside |
| Visibility | Click eye icon | Hides all layers inside, cascading to sub-groups |

---

## The Composition Mindset

Building a complex piece in Vexy Lines is less like drawing and more like assembling a sandwich. You decide what goes on each layer, shape it with a mask, and stack it in the right order. The ingredients:

1. **Plan your layers.** Sketch on paper or mentally divide your image into regions: background, midground, foreground, outlines. Each region gets its own fill (or fills) and mask.

2. **Work bottom-to-top.** Start with the widest, least detailed fill at the bottom of the stack. Add detail layers above. Put outlines (Trace) on top.

3. **One fill per visual idea.** Don't try to make a single Linear fill do everything. Use two or three Linear fills at different angles and intervals for crosshatching. Use a separate Halftone for dot patterns. Each fill is cheap — add freely.

4. **Mask aggressively.** The more precisely you mask each fill, the more control you retain when tweaking parameters later. A fill that covers the entire canvas is hard to adjust without affecting everything.

5. **Group by source.** If your composition uses multiple source images (a face, a texture, a background photo), wrap each image's fills in a group and assign the source to the group. The fills inside will read from their group's image automatically.

---

## What's in Part 4

| Article | What You'll Learn |
|---------|-------------------|
| [Painting Masks with the Brush](402-brush-mask.md) | Freehand mask painting in detail: brush size, hardness, opacity, erase, and gradual reveals |
| [Rectangle, Ellipse, and Freeform Masks](403-shape-masks.md) | Geometric and polygonal masks, compound operations, and auto-detection |
| [Editing Mask Paths](404-refining-masks.md) | Node editing, the Knife tool on masks, smoothing edges, and converting corners to curves |
| [Mesh Warping: Bending Fills in 3D](405-mesh-warping.md) | All six templates, editing mesh points, practical warping projects |
| [Hidden Strokes Removal](406-hidden-strokes.md) | 3D occlusion simulation, the four precision modes, and when to use them |
| [Groups: Source Images and Inheritance](407-groups-advanced.md) | Per-group sources, inheritance chains, importing sub-documents, overlay mode |
| [Layer Order and Stacking Strategy](408-layer-ordering.md) | Bottom-to-top rendering, strategic stacking blueprints, overlap interactions |
| [Composition Recipes](409-composition-recipes.md) | Five complete blueprints: portrait engraving, landscape, pop art, technical drawing, mixed media |
| [Cloning for Coordinated Systems](410-cloning-strategies.md) | Clone trees, RGB separation, inherited vs. overrideable properties |

Start with [Painting Masks with the Brush](402-brush-mask.md) if you want hands-on technique, or jump to [Composition Recipes](409-composition-recipes.md) if you learn best from finished examples.

*Next: [Painting Masks with the Brush](402-brush-mask.md)*
