# The One-Page Manual

If you read nothing else, read this. The entire Vexy Lines workflow fits on a single page.

## The Workflow in Four Sentences

Load a raster image. Add one or more fills — algorithms that read pixel brightness and generate vector strokes. Shape each fill with masks. Export as SVG, PDF, or PNG.

That's it. Everything else is refinement.

## Step by Step

1. **Open an image.** File > New, then drag a photo onto the canvas. PNG, JPEG, TIFF, BMP, SVG, and PDF all work. This becomes your *source image* — the blueprint that fills read from. It never appears in your export.

2. **Add a fill.** Click the **+** button in the Layers Panel and choose a fill type. [Linear](106-first-fill.md) is the classic starting point: parallel lines whose thickness maps to image brightness.

3. **Adjust the fill.** In the Properties Panel on the right, drag **Interval** to control line spacing (small = fine detail, large = bold strokes). Rotate with **Angle**. Open the **Image Threshold** histogram to control which tones produce strokes.

4. **Mask areas.** Select the Brush tool (**B**) and paint white to reveal, black to hide. Use the Rectangle (**I**) or Ellipse (**O**) mask tools for geometric shapes. Alt+click a region for auto-detection.

5. **Stack more fills.** Add a second fill at a different angle for crosshatching. Add a Halftone fill for dot patterns in specific areas. Each fill is a separate layer — you control them independently.

6. **Export.** File > Export. Choose SVG for scalable vector, PDF for print, PNG for raster. Done.

## The 12 Fill Types at a Glance

| Fill | What It Does | Best For |
|------|-------------|----------|
| **Linear** | Parallel lines, thickness varies with tone | Engraving, banknote illustration, woodcuts |
| **Wave** | Flowing sinusoidal curves | Organic portraits, water effects, fabric |
| **Circular** | Concentric rings from a center point | Targets, ripple effects, medallions |
| **Spiral** | Continuous winding path outward from center | Hypnotic effects, vinyl record art |
| **Radial** | Rays emanating from center | Sunburst patterns, dramatic emphasis |
| **Halftone** | Dots or shapes on a grid, sized by brightness | Pop art, newsprint, retro printing |
| **Trace** | Contour lines following image edges | Topographic maps, edge-based abstraction |
| **Wireframe** | 3D lattice mesh draped over the image | Elevation maps, retro-digital, sci-fi |
| **Scribble** | Chaotic strokes, dense in darks | Sketch effects, nervous energy, texture |
| **Fractal** | Space-filling Peano curves | Mathematical art, intricate detail |
| **Text** | Letters and words following tone | Typographic portraits, word art |
| **Handmade** | Your own strokes, repeated and modulated | Custom textures, artistic brushwork |

## The 7 Tools

| Tool | Shortcut | Purpose |
|------|----------|---------|
| Editor | **V** | Select, move, and transform fill regions |
| Pencil | **P** | Draw precise vector paths |
| Knife | **K** | Split fills and cut paths |
| Brush | **B** | Paint masks freehand (white = show, black = hide) |
| Rectangle Mask | **I** | Draw rectangular mask areas |
| Ellipse Mask | **O** | Draw elliptical mask areas |
| Freeform Mask | **S** | Draw irregular mask boundaries point by point |

## Navigation Shortcuts

| Action | Shortcut |
|--------|----------|
| Zoom in | **Z** |
| Zoom out | **X** |
| Zoom at cursor | **Alt + scroll wheel** |
| Pan | **Spacebar + drag** |
| Frame selection | **Cmd+2** (macOS) / **Ctrl+2** (Windows) |
| Show all | **Cmd+3** (macOS) / **Ctrl+3** (Windows) |

## Export Formats

| Format | Type | When to Use |
|--------|------|-------------|
| **SVG** | Vector | Web, Illustrator, Affinity, scalable output |
| **PDF** | Vector | Print, sharing, archival |
| **EPS** | Vector | Legacy print workflows |
| **PNG** | Raster | Web with transparency, social media |
| **JPEG** | Raster | Web without transparency, email |

## Key Properties Panel Controls

| Control | What It Does |
|---------|-------------|
| **Interval** | Spacing between strokes — the most impactful single parameter |
| **Angle** | Rotation of the fill pattern in degrees |
| **Image Threshold** | Histogram with handles for shadows, midtones, highlights — controls which brightness values generate strokes |
| **Stroke Thickness** | Maps brightness to stroke weight; three modes: Linear, Thick, Thin |
| **Smoothing** | Reduces jagged edges in generated strokes |
| **Randomization** | Adds controlled chaos (0–100%) to stroke placement |
| **Shift** | Offsets the pattern origin |
| **Dynamic Color** | Strokes sample colors from the source image instead of using a flat fill |

## One More Thing

Turn off **Auto Refresh** (in the toolbar) when your document gets complex. Manually trigger **Refresh Fill** for the selected fill or **Refresh All** when you're ready to see changes. Your computer will thank you.

For everything else, there's the [rest of this manual](001-toc.md).
