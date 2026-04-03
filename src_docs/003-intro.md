# What Is Vexy Lines?

Drop a portrait photo into Vexy Lines. Sixty seconds later, you're looking at a copper-plate engraving that could have taken a master printmaker three weeks to cut by hand. Change two sliders, and it becomes a halftone poster. Change the fill type, and it's a wireframe sculpture. The source photo never leaves your machine, never appears in the output — it's just the map that tells the algorithms where to put ink.

Vexy Lines is a desktop application for macOS and Windows that transforms raster images — photographs, illustrations, scans, anything made of pixels — into scalable vector artwork. Not by tracing edges or converting pixels to vectors one-for-one, but by *interpreting* image tone through algorithmic fills that generate entirely new vector patterns.

## How It Works

The core concept is simple enough to fit in a sentence: **Vexy Lines reads the brightness of each pixel in your source image and uses that brightness to control vector pattern generation.**

Where a pixel is dark, strokes are thicker, denser, or more numerous. Where a pixel is bright, strokes thin out, spread apart, or vanish entirely. The result is a vector image — made entirely of mathematically defined paths — that *represents* your photograph without containing a single pixel from it.

This is fundamentally different from what auto-trace tools do. Adobe Illustrator's Image Trace, for instance, tries to find the edges in your image and draw vector shapes that match them. It's conversion: pixel shapes in, vector shapes out, aiming for fidelity. Vexy Lines isn't trying to reproduce your photo — it's *reinterpreting* it through a completely different visual language.

Think of it this way: Image Trace is like photocopying a painting. Vexy Lines is like asking a printmaker, a typographer, or a mathematician to recreate that painting using their own medium.

## The Twelve Fills

Vexy Lines ships with twelve fill algorithms, each producing a distinct visual language:

**Line-based fills** generate strokes that run in defined directions. **Linear** produces parallel lines like a copperplate engraving — the classic Vexy Lines look. **Wave** bends those lines into flowing sinusoidal curves. **Circular** draws concentric rings radiating from a center point. **Spiral** creates a continuous winding path from center outward. **Radial** fires rays from a center like a starburst.

**Shape-based fills** work with discrete elements rather than continuous lines. **Halftone** places dots, squares, or other shapes on a grid, sizing each by the brightness of the pixel beneath it — the same principle behind newspaper printing, now under your precise control. **Trace** detects edges in the source image and draws contour lines along them, producing a topographic-map effect.

**Texture fills** generate complex, organic patterns. **Wireframe** drapes a 3D lattice mesh over your image as though the brightness values were elevation data. **Scribble** produces chaotic, energetic strokes that cluster in dark regions and scatter in light ones. **Fractal** weaves space-filling Peano curves through the image with mathematical precision.

**Special fills** break the mould. **Text** paints with letters and words, packing characters densely in dark areas and spacing them in light ones. **Handmade** lets you draw your own strokes, then repeats and modulates them across the image — three sub-modes (Manual, Blend, and Balanced) control how much the algorithm intervenes.

Each fill has its own set of parameters, but they share a common core: **Interval** (how far apart the strokes sit), **Angle** (the rotation of the pattern), and **Image Threshold** (which brightness values produce strokes at all). These three controls alone give you enormous range.

## What You Can Make

The range of output is genuinely broad:

- **Fine art prints.** Stack a Linear fill at 0 degrees with another at 90 degrees and you have crosshatching indistinguishable from hand-engraved work.
- **Pop art and posters.** A Halftone fill with Dynamic Color turned on produces Roy Lichtenstein dots that sample colors from your source photo.
- **Typographic portraits.** A Text fill turns any face into a wall of words, dense where the shadows fall.
- **Topographic abstractions.** Trace fills produce contour maps of faces, landscapes, and architecture.
- **Generative textures.** Fractal and Scribble fills generate patterns that work beautifully as background textures, fabric prints, or packaging elements.
- **Screen printing separations.** Export individual fill layers as separate SVGs, each becoming a colour plate.

Because the output is vector — SVG, PDF, or EPS — it scales to any size. A portrait rendered at screen resolution looks just as sharp printed on a building-sized banner. The strokes are mathematical curves, not pixel grids.

## Layers, Masks, and Composition

A single fill applied to an entire image is impressive but limited. The real power comes from composition.

Vexy Lines organises work in **layers** — transparent sheets stacked on top of each other, each containing a fill. You control which fill covers which area using **masks**: paint white to reveal a fill, black to hide it. This lets you apply different algorithms to different regions of the same image. A portrait might use Linear fills for the face, Scribble for the hair, and Halftone for the background.

Layers live inside **groups**, which work like folders. Each group can have its own source image, so a single document can composite multiple photographs into one vector artwork. Groups inherit the source image from their parent unless overridden — a chain of inheritance that keeps complex documents manageable.

## Mesh Warping

For three-dimensional effects, Vexy Lines includes **mesh warping** — deformation grids that bend your flat vector patterns into curved surfaces. Six built-in templates (Rectangle, Donut, Rising, Falling, Ribbon, and one more) handle common shapes, and **Hidden Strokes Removal** simulates 3D occlusion so that strokes on the "back" of a surface disappear behind the "front." The result can look convincingly like a label wrapped around a bottle or text embossed into a curved surface.

## A Brief History

Vexy Lines began life in 2007 as **Strokes Maker**, created by Dmitry Apanovich. Strokes Maker earned a dedicated following among illustrators, printmakers, and currency designers — people who understood the painstaking craft of engraving and saw that software could replicate its visual language while removing weeks of manual labour.

FontLab Ltd., known for professional font editing software, eventually took the project under its wing and rebuilt it from the ground up as **Vexy Lines**. The rewrite modernised the interface, expanded the fill library, added mesh warping and the MCP automation API, and brought the application to both macOS (12 and later) and Windows (10 and later).

The name? "Vexy" is a playful nod to "vex" — to puzzle, to challenge — and to "vector." Lines, because that's what the software makes: lines, curves, strokes, paths. Things with edges and no pixels.

## Platform and Pricing

Vexy Lines runs on **macOS 12+** and **Windows 10+**. It wants at least **4 GB of RAM** (8 GB recommended) and works best with a display large enough to see your canvas and Properties Panel side by side.

The installer weighs approximately **150 MB**. Download it from [vexy.art](https://vexy.art).

A **free demo** lets you use every feature except export — you can see exactly what Vexy Lines produces before spending anything. When you're ready, a **lifetime license costs $99**, covers **two computers**, and works offline after activation. No subscriptions, no recurring charges, no cloud dependency.

## What This Manual Covers

This manual walks through Vexy Lines from first launch to advanced technique:

- **[Part 1: Getting Started](101-part1-tldr.md)** covers installation, the workspace, navigation, creating documents, your first fill, adjusting parameters, basic masks, layers, exporting, saving, and refresh controls.

- **Part 2: The Twelve Fills** dedicates a full article to each fill type, with parameter tables, visual examples, and practical use cases.

- **Part 3: Tools and Interaction** covers each of the seven tools in the toolbar.

- **Part 4: Advanced Techniques** goes deep on Dynamic Color, mesh warping, Hidden Strokes Removal, multi-fill compositions, groups, and the Image Threshold histogram.

- **Part 5: Output and Workflow** covers export for print, export for web, integration with Illustrator and Affinity, batch processing, and screen-print separation.

- **Part 6: Reference** provides keyboard shortcuts, fill parameter tables, format specifications, system requirements, troubleshooting, and a glossary.

The [Table of Contents](001-toc.md) lists every article. The [One-Page Manual](002-tldr.md) compresses the whole workflow into a single page you can pin above your desk.

Start wherever makes sense for you. If you've never opened the app, [Part 1](101-part1-tldr.md) is waiting. If you already know your way around and want to understand a specific fill, jump to Part 2. If you need to export something for a print shop in the next ten minutes, go directly to [Getting Your Art Out](110-exporting.md).

The software is the instrument. This manual is the sheet music. Your images are the performance.
