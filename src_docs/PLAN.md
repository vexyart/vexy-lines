# Vexy Lines User Manual -- Plan

this_file: src_docs/PLAN.md

---

## 1. Overview

This document is the production plan for the Vexy Lines end-user manual: a 60-article reference that teaches graphic designers, illustrators, and printmakers how to turn raster images into expressive vector artwork using Vexy Lines.

The manual covers the desktop application (macOS 12+ / Windows 10+), the `.lines` file format, and the Python SDK ecosystem. It assumes zero programming knowledge through Part 5 and introduces technical tools gently in Part 6.

**Primary audience:** Graphic designers, illustrators, fine artists, printmakers, tattoo artists, embroidery digitizers, laser-cutter operators -- anyone who needs to convert photographs or illustrations into scalable vector line art.

**Secondary audience:** Developers and technical artists who want to automate Vexy Lines workflows via CLI, Python SDK, or MCP API.

**Deliverable:** 60 Markdown files (`.md`), each 800-2500 words, numbered `001` through `612`, ready for static-site generation (MkDocs or similar).

---

## 2. Design Principles

### Voice and tone

- **Plain language.** Write for a designer who has never opened a terminal. No jargon without immediate definition. No passive voice. No corporate fluff.
- **Friendly intelligence.** Respect the reader's visual skill. Assume they understand colour, composition, and print production -- just not this particular software.
- **Show the transformation.** Every section should make the reader see the result before explaining the controls. "Your portrait becomes a copper-plate engraving" before "drag the Interval slider to 0.5 mm."
- **First line sells the second.** Every article opens with a sentence that earns the reader's attention. No "In this section we will discuss..." throat-clearing.
- **Concise and concrete.** Every sentence must carry weight. Specific numbers over vague descriptions ("0.5 mm for fine detail, 10 mm for bold stripes" not "adjust to taste").
- **Enter late, leave early.** Start mid-action, end before over-explaining. Trust the reader to experiment.

### Structure conventions

- Each article is a standalone unit. A reader landing from search should understand the article without reading the previous one.
- Cross-references use `[article title](filename.md)` links, never "see above" or "as mentioned earlier."
- Every fill-algorithm article (Part 2) follows the same skeleton: what it looks like, when to use it, the parameter table, a step-by-step walkthrough, creative variations, and tips.
- Keyboard shortcuts appear inline in parentheses on first mention: "the Editor tool (V)."
- Parameter names match the Properties Panel labels exactly. If the app says "Wave Height," the manual says "Wave Height." No synonyms.

### Stephen King's rules applied

- Kill your darlings. If a paragraph survives only because it sounds clever, delete it.
- Write with the door closed, edit with the door open. Drafts can be messy; finals must be tight.
- Use the first word that comes to mind, if it's appropriate and colourful. Don't reach for the thesaurus.
- Omit needless words (Strunk via King). "The reason for this is that" becomes "because."
- Avoid adverbs. "The slider responds quickly" becomes "the slider responds in real time."

---

## 3. Numbering and File Naming

| Range | Part | Pattern |
|-------|------|---------|
| 001-003 | Front matter | `00X-slug.md` |
| 101-112 | Part 1: Getting Started | `1XX-slug.md` |
| 201-214 | Part 2: The Fill Parade | `2XX-slug.md` |
| 301-312 | Part 3: Properties and Controls | `3XX-slug.md` |
| 401-410 | Part 4: Masks, Meshes, and Composition | `4XX-slug.md` |
| 501-512 | Part 5: Creative Workflows | `5XX-slug.md` |
| 601-612 | Part 6: Power Tools | `6XX-slug.md` |

---

## 4. Part Summaries

### Front Matter (001-003)

Three gateway articles. The table of contents provides fast navigation. The TL;DR condenses the entire manual into one page for impatient readers. The introduction establishes what Vexy Lines is, who it's for, and what makes it different from tracing tools like Adobe Illustrator's Image Trace or Vector Magic.

### Part 1: Getting Started (101-112)

Takes a new user from download to finished artwork in twelve articles. Covers installation, activation, the intro tour, workspace layout, navigation, creating a first document, adding and adjusting a fill, basic masks, layers, exporting, and saving. The goal: within one hour of reading, the user has produced a real piece of vector art and exported it.

### Part 2: The Fill Parade (201-214)

Deep dive into all twelve fill algorithms, one article each, plus a comparison guide and a combinations article. Each article explains what the fill looks like, which creative problems it solves, every parameter with its range and visual effect, a step-by-step project, and creative variations. This is the reference core of the manual -- designers will return to these articles repeatedly.

### Part 3: Properties and Controls (301-312)

Horizontal topics that apply across multiple fill types: colour (static and dynamic), stroke thickness mapping, the image threshold histogram, interval and spacing, angle and rotation, randomisation, smoothing, dash patterns, the Emboss effect, clones and overlap control, and document/canvas settings. These articles explain the "how it works" beneath the sliders.

### Part 4: Masks, Meshes, and Composition (401-410)

Advanced composition tools: painting masks with Brush, geometric masks (Rectangle, Ellipse, Freeform), auto-detection masks, refining mask paths, mesh warping templates, editing mesh control points, hidden strokes removal, groups and source image inheritance, and layer ordering / blend strategies. This part transforms single-fill experiments into multi-layer compositions.

### Part 5: Creative Workflows (501-512)

Real-world projects and production workflows: portrait engraving, landscape illustration, creating a screen-print separation, tattoo design, laser-cut preparation, botanical illustration, comic/graphic-novel inking, guilloche and ornamental patterns, style libraries and reuse, batch processing, preparing files for print shops, and a gallery of techniques with recipes.

### Part 6: Power Tools (601-612)

Technical tools for automation and advanced users: the CLI (`vexy-lines-cli`), Python `.lines` file parser (`vexy-lines-py`), MCP API client (`vexy-lines-apy`), style transfer and interpolation, video processing, the GUI batch app (`vexy-lines-run`), AI-assisted workflows (Claude Desktop + MCP bridge), performance tuning, troubleshooting, keyboard shortcut reference, the `.lines` file format spec, and a glossary.

---

## 5. Complete Article List

### Front Matter

#### 001-toc.md -- Table of Contents

The complete manual map. Lists every part, every article, with one-line descriptions. Designed for scanning: a reader should find any topic in under ten seconds. Includes a "Quick paths" section: "New to Vexy Lines? Start at 103. Want a specific fill? Jump to Part 2. Need to export for print? See 511."

#### 002-tldr.md -- The One-Page Manual

The entire Vexy Lines workflow compressed into a single article. Covers: load image, add fill, adjust interval/angle/threshold, mask areas, export. Includes the twelve fill types in a comparison table (name, one-line description, best use case). Lists the seven tools with shortcuts. Summarises export formats. This page exists for returning users who need a quick refresher, and for impatient new users who learn by doing.

#### 003-intro.md -- What Is Vexy Lines?

Opens with a concrete transformation: "Drop a portrait photo into Vexy Lines. Sixty seconds later, you're looking at a copper-plate engraving that could hang in a museum." Explains the core concept: the software reads pixel brightness and generates vector patterns that respond to the image's tonal range. Distinguishes Vexy Lines from auto-tracers (Illustrator Image Trace, Vector Magic) -- those trace edges; Vexy Lines interprets tone. Covers the history briefly (Strokes Maker 2007, rewritten as Vexy Lines by FontLab). States platform requirements (macOS 12+ / Windows 10+), pricing ($99 lifetime, 2 machines, free demo without export), and what the manual covers.

---

### Part 1: Getting Started

#### 101-part1-tldr.md -- Getting Started in Five Minutes

Part 1 condensed to one page. Download, install, open a photo, add a Linear fill, drag two sliders, export as SVG. Five numbered steps, each with one screenshot description. Ends with: "Now you understand the foundation. The rest of Part 1 fills in the details."

#### 102-installing.md -- Download, Install, Activate

Where to download (vexy.art). Installer size (~150 MB). macOS installation (drag to Applications, Gatekeeper approval). Windows installation (standard MSI). Activation: serial number entry, or Continue Demo for watermarked output. System requirements: macOS 12+ or Windows 10+, 4 GB RAM minimum, 8 GB recommended for complex projects. First launch: the interactive intro tour starts automatically -- yellow tooltips walk through the workspace. Mention that Help > Intro Tour replays it.

#### 103-workspace.md -- The Workspace

Anatomy of the screen. Centre: the Canvas where artwork lives. Left: the Toolbar with seven tools (Editor V, Pencil P, Knife K, Brush B, Rectangle I, Ellipse O, Freeform S). Right: the Properties Panel (context-sensitive -- changes based on selection). Bottom or side: the Layers Panel showing the document tree. Top: menu bar and refresh controls. Explain each zone's purpose without going deep into any single feature. This is the "map of the territory" article.

#### 104-navigating.md -- Zoom, Pan, and Navigate

All navigation methods: Z to zoom in, X to zoom out, Alt+mouse wheel to zoom at cursor position, Spacebar+drag to pan, Cmd+2 (Ctrl+2) to frame selection, Cmd+3 (Ctrl+3) to show entire document. Touch gestures on trackpad (pinch to zoom, two-finger scroll to pan). How the zoom level affects rendering speed. The View menu options. Tips: "Zoom to 100% to see actual stroke thickness. Zoom out to judge overall composition."

#### 105-new-document.md -- Creating a New Document

File > New. Two paths: start with a photo (drag/drop or browse) or start blank with a preset. Photo path: accepted formats (PNG, JPEG, TIFF, BMP, SVG, PDF), pasting from clipboard, canvas auto-sizing to image dimensions. Blank path: presets (Basic square, A4, Letter, Web, Card, HDTV 16:9), custom dimensions, resolution (96 dpi for screen, 150 for web, 300 for print). Explain that resolution affects source image display, not vector output. The source image concept: it never exports, it's the blueprint that fills read from.

#### 106-first-fill.md -- Your First Fill

The "hello world" of Vexy Lines. Step by step: open a high-contrast portrait photo, click + in the Layers Panel, select Linear. The photo transforms into parallel black lines instantly. Drag the Interval slider (0.5 mm for fine engraving, 2 mm for bold, 10 mm for dramatic). Rotate with Angle. Toggle Dynamic Color on: lines now sample actual photo colours segment by segment. Turn on Auto Refresh to see changes live. This article should produce a genuine "wow" moment -- the reader's first vector artwork.

#### 107-adjusting-fills.md -- Tuning Your Artwork

Building on 106. Introduces the Properties Panel controls that apply to most fills: Interval (line spacing), Angle (rotation), Image Threshold (which brightness range matters), Stroke Thickness (how brightness maps to line weight). The three thickness modes: Linear, Thick, Thin. Smoothing. Randomisation (0-100%, breaks mechanical perfection). Shift (offsets the pattern). Each control gets a one-sentence explanation plus a concrete visual effect description. Ends with the concept of layering: "One fill is a sketch. Two fills with different angles become an engraving."

#### 108-basic-masks.md -- Hiding and Revealing

Why masks matter: you rarely want a fill covering the entire canvas. Select a layer, grab the Brush (B). Paint white to reveal, black to hide. Alt+drag to erase. Ctrl+drag to resize brush. Rectangle (I) and Ellipse (O) for geometric masks. Shift constrains to square/circle. The magic: click once on a distinct shape in the photo and Vexy auto-detects its edges. Click a face, get a face-shaped mask. This is the article where artwork goes from "interesting texture" to "intentional composition."

#### 109-layers-groups.md -- Organising Your Work

Layers stack like transparent sheets. Each layer holds fills and an optional mask. Groups are folders: select layers, Cmd+G. Rename by double-clicking. Drag layers between groups. Toggle group visibility. Lock groups to prevent accidental edits. The key insight: each group can reference a different source image. Face group reads a portrait, background group reads a landscape. Groups without their own source inherit from their parent, cascading up to the document root. Nesting groups for complex hierarchies.

#### 110-exporting.md -- Getting Your Art Out

Vector formats: SVG (web, print, cutting machines -- works everywhere), PDF (portable, embeds fonts), EPS (legacy print shops). Raster formats: PNG (transparency), JPEG (small files for web). Choosing dimensions for raster export. Exporting individual layers vs. the whole document. Combining same-coloured layers for screen-print separations. Clipboard: Cmd+C to copy, paste directly into Illustrator, Affinity Designer, or any vector editor. The paths stay as vectors -- no rasterisation.

#### 111-saving.md -- Save, Backup, Recover

The `.lines` file format: everything in one file (layers, fills, masks, meshes, source image, preview). Auto Save interval (configurable). Save Backup creates `.~lines` files -- your previous version, always preserved. Recent files list for quick reopening. Where files are stored. File size considerations: embedded source images increase file size; high-res sources can make files large. Tips: save versions at milestones ("portrait-v1.lines", "portrait-v2.lines").

#### 112-refresh-controls.md -- Controlling When Vexy Recalculates

Three refresh modes and why they matter. Auto Refresh: recalculates constantly as you adjust -- ideal for simple projects, sluggish on complex ones. Refresh Fill: updates only the selected fill -- surgical precision. Refresh All: rebuilds everything after multiple changes. When to turn Auto Refresh off: complex documents, dense fills, slow hardware. Rendering Quality: Fast for working, Best for final export. Parameter limits in View preferences: cap Interval at 0.1-100 mm, Thickness at 0-10 to prevent accidental density bombs that freeze the machine.

---

### Part 2: The Fill Parade

#### 201-part2-tldr.md -- Twelve Ways to See

Part 2 overview. A comparison table of all twelve fills: name, visual character, best use case, key parameters. A decision flowchart: "Want parallel lines? Linear or Wave. Want concentric patterns? Circular or Spiral. Want dots? Halftone. Want edges? Trace. Want chaos? Scribble. Want custom? Handmade." Groups the fills by family: line-based (Linear, Wave), radial (Circular, Spiral, Radial), pattern-based (Halftone, Fractal, Text), detection-based (Trace), freeform (Scribble, Handmade, Wireframe). Explains that fills respond to the source image's brightness: dark areas get thicker/denser strokes, light areas get thinner/sparser ones.

#### 202-linear.md -- Linear: The Engraver's Line

**What it looks like:** Parallel straight lines across the canvas, varying in thickness based on image brightness. Classic copper-plate engraving, banknote illustration, crosshatch shading.

**Parameters:**
- Interval (0.1-100 mm): line spacing. 0.5 mm = fine engraving, 2 mm = bold graphic, 10 mm = dramatic stripes.
- Angle (0-360 deg): pattern rotation. 0 = horizontal, 45 = diagonal energy, 90 = vertical drama.
- Randomisation (0-100%): breaks mechanical perfection. 5-10% for subtle organic feel, 50%+ for hand-drawn texture.
- Shift: offsets the pattern perpendicular to line direction. Essential when layering multiple Linear fills to avoid perfect alignment.
- Stroke Thickness: maps brightness to line weight. Dark = thick, light = thin (or reversed).

**Walkthrough:** Load a high-contrast portrait. Add Linear fill. Set Interval to 1 mm, Angle to 0. Observe horizontal lines. Rotate to 15 degrees for classic engraving angle. Enable Dynamic Color. Add a second Linear fill at 75 degrees. The crosshatch creates depth.

**Creative variations:** Single-direction for minimalist illustration. Cross-hatched (two fills, 60 degrees apart) for classical engraving. Three fills at 0/60/120 for dense tonal coverage. Randomisation at 80% for charcoal-sketch texture.

**When to use:** Portraits, banknote-style illustrations, editorial illustrations, anything that benefits from the authority of engraved lines.

#### 203-wave.md -- Wave: Rivers of Line

**What it looks like:** Parallel flowing curves, like lines reflected in water. Sigmoid-based undulation creates organic movement.

**Parameters:**
- Wave Height (0-100): amplitude. 2 = gentle undulation, 20 = dramatic surf, 100 = pure abstraction.
- Wave Length: peak spacing. Short = nervous energy, long = ocean swells.
- Curviness (0-100%): smoothness. 0% = angular zigzags, 100% = perfect sine curves.
- Phase Shift: slides the wave pattern sideways. Stack multiple Wave fills with different phase shifts to create moire and interference effects.
- Interval, Angle, Randomisation, Shift, Stroke Thickness: same as Linear.

**Walkthrough:** Load a landscape photo. Add Wave fill. Set Wave Height to 8, Wave Length to medium, Curviness to 80%. The landscape flows like it's reflected in a river. Reduce Wave Height to 2 for subtle movement. Increase to 40 for psychedelic distortion.

**Creative variations:** Low Wave Height + high Curviness = Art Nouveau elegance. High Wave Height + low Curviness = Op Art energy. Multiple Wave fills with different Phase Shifts = moire interference patterns. Wave + Linear crosshatch = textured engraving with movement.

**When to use:** Landscapes, water scenes, hair, fabric, anything that benefits from organic flow. Also for Op Art and psychedelic poster aesthetics.

#### 204-circular.md -- Circular: Concentric Rings

**What it looks like:** Concentric circles radiating from a centre point, like ripples in a pond or tree rings.

**Parameters:**
- Centre (X, Y): click the canvas to place the origin. Typically on eyes, faces, focal points.
- Interval: ring spacing.
- Stroke Thickness: brightness-to-weight mapping.
- Other standard parameters.

**Walkthrough:** Load a portrait. Add Circular fill. Click the centre target on one eye. Rings radiate outward, thickening in dark areas (eye sockets, nostrils, hair), thinning in highlights (forehead, cheeks). Move the centre to the other eye. Compare the shift in composition. Place it on the nose bridge for symmetrical balance.

**Creative variations:** Centre on the subject's eye for a mesmerising portrait. Centre off-canvas for a partial-arc effect. Two Circular fills centred on each eye with different colours. Tight interval for dense wood-grain texture.

**When to use:** Portraits (centred on face), target/bullseye graphics, topographic map aesthetics, wood-grain textures, zen/meditative compositions.

#### 205-spiral.md -- Spiral: The Continuous Wind

**What it looks like:** A single continuous line winding outward from a centre point, like a vinyl record groove or fingerprint.

**Parameters:**
- Centre (X, Y): spiral origin.
- Interval: spacing between windings.
- Direction: clockwise or counterclockwise.
- Stroke Thickness, standard parameters.

**Walkthrough:** Load a circular subject (eye close-up, flower, target). Add Spiral. Place centre on the focal point. The image emerges from a single unbroken line, thickening and thinning as it crosses light and dark areas. Adjust Interval: tighter = more detail, wider = bolder graphic.

**Creative variations:** Tight spiral on eye close-ups creates hypnotic portraits. Wide spiral on landscapes creates topographic maps. Spiral + mask = the pattern confined to a specific shape. Two spirals (clockwise + counterclockwise) layered = interference patterns.

**When to use:** Vinyl record art, fingerprint effects, hypnotic portraits, single-line-drawing challenges, CNC/plotter art where a single continuous path is required.

#### 206-radial.md -- Radial: Exploding Rays

**What it looks like:** Lines radiating from a centre point outward, like sunbeams, starburst, or the spokes of a wheel.

**Parameters:**
- Centre (X, Y): burst origin.
- Distance: creates an empty circle around the centre (like a pupil). Prevents line bunching at convergence.
- Auto Distance: automatically prevents excessive convergence.
- Random Distance: varies where each ray begins. 0 = mechanical precision, high values = organic bursts.
- Number of rays, standard parameters.

**Walkthrough:** Load a portrait with strong light source. Add Radial. Place centre where the light appears to originate. Rays explode outward, thickening through dark areas, disappearing in highlights. Enable Random Distance for organic scatter. Add Distance to create an empty circle at the centre.

**Creative variations:** Centre on a light source for dramatic sunburst. Centre on a face for propaganda-poster aesthetic. Combined with mask: rays contained within a shape. Radial + Circular layered = spiderweb effect. Low ray count = bold graphic. High ray count = detailed burst.

**When to use:** Sunburst backgrounds, propaganda/poster art, religious iconography (halos, divine light), firework effects, any composition with a strong focal point.

#### 207-halftone.md -- Halftone: Dots and Shapes

**What it looks like:** Dots or shapes arranged in a grid or random scatter, varying in size based on image brightness. Classic newspaper print, Ben-Day dots, stippling.

**Parameters:**
- Grid mode vs. Random mode: grid = newspaper rows, random = stippled scatter.
- Shape: circles (traditional), squares (digital/modern), diamonds (Art Deco), stars (playful). Custom SVG shapes (hearts, skulls, logos).
- Morphing: shapes transform based on brightness. Light areas show tiny circles; dark areas become fat stars. The transition flows smoothly between the two extremes.
- Size range: minimum and maximum shape size.
- Interval: spacing between shapes.

**Walkthrough:** Load a photo. Add Halftone with Grid mode, circles. Classic newspaper effect appears. Increase interval for bold pop art. Switch to Random mode for stippling. Import a custom SVG (a heart shape). Enable Morphing: light areas show small hearts, dark areas show large ones. The portrait becomes a field of hearts.

**Creative variations:** Grid circles for Lichtenstein/pop art. Random circles for pointillism. Diamonds for Art Deco poster. Custom SVG for themed illustrations (stars for night sky, music notes for concert poster). Morphing between circle and star = shapes that respond to the image.

**When to use:** Pop art, newspaper/retro aesthetics, stipple illustration, custom-shape pattern fills, any design that calls for dot-based textures.

#### 208-trace.md -- Trace: Finding Edges

**What it looks like:** Clean vector outlines extracted from boundaries between light and dark areas. Not a pattern fill -- an edge detector that converts boundaries into paths.

**Parameters:**
- Smoothing (0-100): 0 preserves every pixel edge (rough, digital), 100 flows everything into smooth curves.
- Minimum Spot Size: kills dust and noise. 5 pixels for basic cleanup, 50 pixels to capture only major shapes.
- Image Threshold: decides what counts as an edge. Low = trace everything, high = only strong contrasts.

**Walkthrough:** Load a high-contrast logo or silhouette. Add Trace. Outlines appear around every boundary. Increase Minimum Spot Size to remove small speckles. Increase Smoothing for flowing paths. Adjust Image Threshold to isolate the main shapes. The result is clean vector outlines suitable for cutting machines or logo work.

**Creative variations:** Low smoothing for pixel-art aesthetic. High smoothing for fluid illustration. Multiple Trace fills at different threshold levels = layered contour maps (like topographic lines). Trace combined with Linear fill = outlined shapes filled with engraving.

**When to use:** Logo vectorisation, silhouette extraction, creating cutting paths for vinyl/laser, contour mapping, preparing images for screen printing where clean edges are required.

#### 209-wireframe.md -- Wireframe: Dimensional Lattice

**What it looks like:** A 3D wireframe/mesh grid overlaid on the image, where the grid deforms based on brightness to create a dimensional surface appearance.

**Parameters:**
- Grid density (horizontal and vertical divisions).
- Depth/displacement amount: how much brightness affects the 3D appearance.
- Standard parameters.

**Walkthrough:** Load a portrait or landscape with strong depth. Add Wireframe. A lattice appears that rises over bright areas and dips into dark areas, creating a topographic surface. Adjust grid density: sparse for bold architectural look, dense for detailed terrain.

**Creative variations:** Sparse grid for retro-computing/Tron aesthetic. Dense grid for scientific visualisation. Combined with flat-colour background for vaporwave. Wireframe + Trace = outlined wireframe.

**When to use:** Retro 3D aesthetics, scientific/topographic visualisation, album covers, tech-themed designs, virtual-reality imagery.

#### 210-scribble.md -- Scribble: Controlled Chaos

**What it looks like:** Chaotic, hand-drawn strokes that create energy and texture. Like aggressive sketching with a ballpoint pen.

**Parameters:**
- Density/coverage controls.
- Stroke length and direction variance.
- Randomisation.
- Standard parameters (thickness, colour, threshold).

**Walkthrough:** Load a textured photo (tree bark, fabric, animal fur). Add Scribble. Chaotic strokes fill the image, thickening in dark areas, thinning in light. The result looks hand-drawn, energetic, alive. Adjust density: sparse for sketch-like, dense for charcoal-drawing effect.

**Creative variations:** Sparse Scribble for quick gesture drawing. Dense Scribble for expressive charcoal. Scribble + mask confined to hair/fur areas with Linear fill for skin = mixed-media portrait. Multiple Scribble fills in different colours for coloured pencil effect.

**When to use:** Textured backgrounds, hair and fur, expressive portraits, editorial illustration, anything that benefits from hand-drawn energy and imperfection.

#### 211-fractal.md -- Fractal: Space-Filling Curves

**What it looks like:** Peano curve-based space-filling fractal patterns. A single continuous line that bends and folds to fill an area, with stroke weight responding to image brightness.

**Parameters:**
- Fractal depth/iteration level: higher = more detailed folding.
- Standard parameters (interval, thickness, colour, threshold).

**Walkthrough:** Load a simple, high-contrast image. Add Fractal. A space-filling curve appears, like a maze that reveals the image. Increase fractal depth for finer detail. The mathematical precision creates an intellectual aesthetic.

**Creative variations:** Low iteration for bold maze-like patterns. High iteration for intricate, almost-random textures that reveal themselves at distance. Fractal + mask = fractal pattern confined to a shape. Fractal at very tight interval = solid-looking texture that dissolves on zoom.

**When to use:** Mathematical/scientific illustrations, maze art, space-filling patterns, abstract backgrounds, generative art aesthetics.

#### 212-text.md -- Text: Painting with Letters

**What it looks like:** Characters and letters arranged to form the image, like ASCII art rendered in vector. Brightness determines character size or density.

**Parameters:**
- Character set / text string: which letters or symbols to use.
- Font selection.
- Size mapping: how brightness maps to character size.
- Layout mode (grid vs. flow).

**Walkthrough:** Load a portrait. Add Text fill. Type a meaningful phrase (the subject's name, a poem, song lyrics). The text arranges itself to form the portrait -- larger characters in dark areas, smaller in light. Choose a bold sans-serif for graphic impact, a serif for elegance, a monospace for digital aesthetics.

**Creative variations:** Single repeated character for minimalist pattern. Full sentences that are legible up close but form an image from distance. Different fonts for different layers. Text + mask = words confined to a shape. Meaningful text in a portrait (biography text forming the subject's face).

**When to use:** Typographic art, poster design, word-cloud portraits, memorial art (text of a speech forming the speaker's face), conceptual illustration.

#### 213-handmade.md -- Handmade: Your Strokes, Your Rules

**What it looks like:** User-drawn or imported strokes distributed across the image. Total creative control -- you draw the pattern elements.

**Three modes:**
- **Manual:** Strokes placed exactly where you draw them. No algorithmic distribution. Total control.
- **Blend:** Multiple drawn strokes morph into each other across the image. Draw a thick stroke and a thin one; the algorithm interpolates between them based on brightness.
- **Balanced:** Strokes added or removed to maintain even density. The algorithm ensures consistent coverage -- fills gaps, thins crowds.

**Parameters:**
- Mode selection (Manual, Blend, Balanced).
- Source of strokes: draw with Pencil tool (P), import SVG, paste from Illustrator.
- Distribution controls (Blend and Balanced modes only).

**Walkthrough:** Select Handmade fill. Switch to Pencil tool. Draw a short wavy stroke. Switch to Balanced mode. The stroke replicates across the image, scaling with brightness. Import an SVG brushstroke for professional quality. Switch to Blend mode with two contrasting strokes: the fill morphs between them.

**Creative variations:** Hand-drawn calligraphic strokes for artisanal feel. Imported SVG patterns for consistent quality. Blend mode with geometric vs. organic strokes = smooth transition. Manual mode for precise hand-placement of specific elements.

**When to use:** Custom brush effects, calligraphic illustration, when no built-in fill matches your vision, importing strokes from Illustrator, creating unique pattern libraries.

#### 214-combining-fills.md -- Combining Fills: The Art of the Stack

**What it looks like:** Multiple fills layered, masked, and interacting. This is where Vexy Lines transcends single-effect tools.

**Topics covered:**
- Layering strategy: bottom fills cover the full image, top fills add detail.
- Crosshatching: two Linear fills at different angles.
- Mixed-media: Trace for outlines + Linear for shading + Halftone for highlights.
- Colour separation: each fill in a different colour for screen-print-ready output.
- Overlap Control: fills cutting through each other for weaving effects.
- Clone relationships: parent-child properties for coordinated changes.
- Threshold stacking: three fills responding to shadows, midtones, highlights respectively.

**Walkthrough:** Build a portrait with four layers: Trace (outlines, threshold high), Linear at 0 degrees (shadows, threshold low), Linear at 90 degrees (midtones), Halftone circles (highlights). Each fill handles a different tonal band. The result is a rich, multi-technique illustration.

**When to use:** Any serious artwork. Single fills are sketches; combinations are finished pieces.

---

### Part 3: Properties and Controls

#### 301-part3-tldr.md -- The Control Surface

Part 3 overview. Every slider and dropdown in the Properties Panel mapped and categorised. A visual diagram of the panel layout. Quick-reference table: parameter name, what it does, range, which fills it applies to. This article answers "I see a slider called X -- what does it do?" in five seconds.

#### 302-colour.md -- Colour: Static and Dynamic

Two colour modes. Static: pick one colour. Colour wheel, HSB/RGB sliders, hex input, swatch library, eyedropper (sample any colour on screen). Dynamic: strokes sample actual colours from the source image. Segment Length controls colour fidelity: short segments capture rapid shifts (every few pixels), long segments smooth into gradual transitions. When to use each: static for graphic/illustrative work, dynamic for photorealistic colour mapping. Combining both: static fill for outlines, dynamic fill for colour areas. Opacity / alpha channel support.

#### 303-stroke-thickness.md -- Stroke Thickness: Weight from Light

How brightness maps to line weight. The fundamental relationship: dark pixels produce thick strokes, bright pixels produce thin ones (or reversed). Three modes explained with diagrams: Linear (proportional scaling), Thick (emphasises heavy strokes, compresses thin end), Thin (emphasises delicate strokes, compresses thick end). Min and max thickness values. Smoothing: reduces jagged thickness transitions. The relationship between thickness, interval, and visual density. Practical settings: fine engraving (thickness 0.1-0.5 mm), bold graphic (0.5-3 mm), dramatic illustration (1-10 mm).

#### 304-image-threshold.md -- Image Threshold: Choosing What Matters

The histogram and its draggable handles. What the histogram shows: the brightness distribution of your source image. Left handle = shadows cutoff, right handle = highlights cutoff. Pixels outside the range are ignored. Practical uses: isolate just the shadow areas for a fill that renders only dark tones. Isolate highlights for a fill that renders only bright areas. Layer three fills with non-overlapping threshold ranges: each handles a different tonal band. The Invert option. Relationship to Stroke Thickness: threshold defines which pixels participate; thickness defines how they appear.

#### 305-interval-spacing.md -- Interval and Spacing: Density Control

Interval is the distance between repeating elements (lines, dots, curves). Measured in current units (mm, pixels, inches, points). The visual impact: tight interval = dense, detailed, slow to render. Wide interval = sparse, bold, fast. Interaction with Stroke Thickness: when interval is tight and strokes are thick, dark areas become solid black. Finding the balance. Per-fill differences: Interval in Linear = line-to-line distance, in Halftone = dot-to-dot distance, in Spiral = winding spacing. Practical ranges for common use cases.

#### 306-angle-rotation.md -- Angle and Rotation

Pattern rotation for line-based fills (Linear, Wave). 0 degrees = horizontal, 90 = vertical, 45 = diagonal. The visual psychology: horizontal lines suggest calm, verticals suggest strength, diagonals suggest movement and energy. Cross-hatching angles: classic engraving uses 15/75 or 0/60/120-degree combinations. Angle in Radial and Spiral fills vs. line-based fills. Per-fill rotation vs. layer transform rotation (different operations). Using angle strategically: align fills with the subject's contours for natural flow, cross against them for tension.

#### 307-randomisation.md -- Randomisation and Organic Feel

The Randomisation slider (0-100%). At 0%: perfect mechanical precision. At 5-10%: subtle imperfection that reads as "handmade." At 30-50%: clearly organic, like hand-drawn illustration. At 80-100%: chaotic, expressive. What gets randomised: line position, stroke start/end points, spacing irregularity. Random Distance in Radial fill (varies ray starting points). Shift parameter as a deterministic offset vs. Randomisation as stochastic variation. When to add randomness: almost always, unless you specifically want mechanical precision (blueprints, technical drawing, guilloche).

#### 308-smoothing.md -- Smoothing and Curve Quality

Smoothing controls how rough or fluid the generated paths are. At 0: paths follow pixel boundaries exactly, creating angular/stepped appearance. At 100: maximum smoothing, curves flow elegantly. The tradeoff: over-smoothing loses fine detail; under-smoothing looks digital. Smoothing in Trace fill (critical for clean outlines vs. pixelated edges). Smoothing in other fills (affects thickness transitions). Point reduction: higher smoothing = fewer control points = smaller file size. Recommended settings by use case: laser cutting (medium, 40-60 for clean paths), fine art print (high, 70-90 for elegant curves), pixel art style (low, 0-20).

#### 309-dash-patterns.md -- Dashes, Gaps, and Overlap Cuts

Dash pattern controls: dash length and gap length turn continuous strokes into dashed or dotted lines. Dash patterns in the context of Overlap Control: when "Can cut other fills" is enabled, dashes define where cuts occur. Gap parameters in cutting. The four cut orientation modes. Creating weaving effects: two fills that cut each other, with dashes offset so they appear to weave over and under. Dotted lines for stitching/embroidery guides. Dashed outlines for cut-here marks.

#### 310-emboss.md -- Emboss and Bas-Relief

The Emboss effect simulates raised or recessed 3D appearance on vector strokes. How it works: creates paired offset strokes in light and dark colours, mimicking directional lighting on a sculpted surface. Light direction control. Depth/intensity. Combined with thick strokes for dramatic relief. Combined with thin strokes for subtle texture. Best source images for emboss: images with clear depth (faces in 3/4 view, coins, architectural details). Limitations: works best on single-colour fills; dynamic colour complicates the illusion.

#### 311-clones-overlap.md -- Clones and Overlap Control

**Clones:** linked copies that inherit parent properties but allow independent colour and thickness. Cloning workflow: select fill, click Clone. Child appears with "Clone of..." label. Change parent's angle: all children rotate. Change child's colour: only that child changes. Use case: coordinated fill systems that evolve together while varying in colour or weight.

**Overlap Control:** three checkboxes that choreograph fill interactions.
- "Can cut other fills": this fill slices through fills below it.
- "Can be cut by other fills": other fills slice through this one.
- Both enabled: mutual cutting creates weaving.
Dash and gap parameters on cuts. The four orientation modes. Step-by-step weaving effect: two Linear fills at perpendicular angles, both with cut-and-be-cut enabled, with offset dash patterns.

#### 312-document-settings.md -- Document and Canvas Settings

Canvas dimensions (width, height) in chosen units. DPI setting and what it affects (source image display, not vector output). Units of measurement: Pixels, Millimeters, Inches, Points. Switching units mid-project. Global thickness/interval min and max limits (preventing accidental extreme values). Background colour. Document metadata (caption/project name). Preferences: auto-save interval, backup behaviour, rendering quality defaults, parameter range limits.

---

### Part 4: Masks, Meshes, and Composition

#### 401-part4-tldr.md -- Composing Complex Artwork

Part 4 overview. Masks control where fills appear. Meshes bend fills in 3D. Groups organise and isolate. Layer order determines stacking. Together, these tools transform single-fill experiments into multi-layer compositions with spatial depth and intentional focal points. Quick reference: mask tools (B, I, O, S), mesh templates (6 types), group powers (visibility, lock, overlay, source image).

#### 402-brush-mask.md -- Painting Masks with the Brush

The Brush tool (B) in detail. Paint white to reveal, black to hide. It's not painting colour -- it's painting visibility. Alt+drag to erase (switches to black). Ctrl+drag to resize brush mid-stroke. Brush hardness and opacity. Building gradual masks: light pressure = partial transparency. Workflow: select a layer, press B, paint over the area where you want the fill to appear. Everything unpainted remains hidden. Refining: zoom in, reduce brush size, paint carefully around edges. Erasing mistakes. The mask as a separate entity from the fill: you can change the fill without losing the mask.

#### 403-shape-masks.md -- Rectangle, Ellipse, and Freeform Masks

Rectangle (I): click and drag for rectangular mask areas. Shift constrains to square. Ellipse (O): click and drag for oval areas. Shift constrains to circle. Freeform (S): trace complex shapes manually -- click to place points, close the shape. All three support compound operations: Shift+click adds shapes (union), Alt+click subtracts shapes (difference). Building complex masks from simple shapes.

**Auto-detection:** Click once on any distinct shape in the photo. Vexy analyses edges and creates a mask matching that shape. Click a face, get a face-shaped mask. Click a building, get the building's outline. Tolerance controls detection sensitivity. This feature transforms masking from tedious manual work to one-click precision.

#### 404-refining-masks.md -- Editing Mask Paths

Switch to Editor (V). Click a mask edge. Nodes (control points) appear. Drag nodes to reshape. Alt+click to add new nodes. Delete key removes selected nodes. The Knife tool (K) cuts mask paths at any point. Smoothing mask edges. Converting corners to curves and back. Practical workflow: auto-detect a shape (403), then refine with node editing. Tips for clean masks: fewer nodes = smoother edges; use the Knife to split complex paths; check mask at 100% zoom before exporting.

#### 405-mesh-warping.md -- Mesh Warping: Bending Fills in 3D

What meshes do: deform fills as if draped over a 3D surface. Six templates: Rectangle (perspective correction), Donut (wrap around a cylinder), Rising (wave lifting), Falling (wave dipping), Ribbon (spiral wrap). Applying a mesh: click the Mesh button on a layer, select a template. The fill bends to match the mesh shape. Edit precisely: click edges to activate, drag points to reshape, Alt+click to add control points, + buttons to add edge divisions. Deleting edges to create holes (with limitation: original template structure stays). Practical uses: wrap engraving around a bottle, drape waves over a landscape, create impossible geometries.

#### 406-hidden-strokes.md -- Hidden Strokes Removal

When a mesh folds, parts of the fill may overlap. Hidden Strokes Removal makes the mesh behave like a physical surface: parts that fold behind other parts disappear. Four modes controlling what's "front." Higher precision = cleaner overlaps but slower processing. When to use: any mesh with folds or overlaps. When to turn off: flat meshes where speed matters. The visual effect: a ribbon fill that genuinely appears to twist in 3D, with correct occlusion.

#### 407-groups-advanced.md -- Groups: Source Images and Inheritance

Advanced group features beyond basic organisation (covered in 109). Source image per group: assign a different photo to each group. The inheritance chain: a group without its own source inherits from its parent, cascading up to the document root. Practical use: portrait's face group reads the face photo, body group reads a different texture, background reads a third image. Importing `.lines` files as groups: previous projects become reusable components. Group overlay mode: masks cut through layers outside their group. Lock behaviour. Visibility toggles applied to entire hierarchies.

#### 408-layer-ordering.md -- Layer Order and Stacking Strategy

Layers render bottom to top. Lower layers appear behind higher ones. Drag to reorder. Strategic stacking: background fills (wide interval, subtle colour) at bottom, detail fills (tight interval, strong colour) on top, outline fills (Trace) at very top. How Overlap Control interacts with stacking order. How masks interact with stacking order (each layer's mask is independent). Planning a layer stack before building: sketch the hierarchy on paper first for complex pieces.

#### 409-composition-recipes.md -- Composition Recipes

Five ready-to-follow composition blueprints:

1. **Classic Portrait Engraving:** Trace outlines + Linear crosshatch (0/60 deg) + mask isolating face from background. Three layers, two source images.
2. **Landscape with Depth:** Wave fill for background (wide interval), Linear for midground (medium), Halftone dots for foreground (tight). Each layer masked to its depth zone.
3. **Pop Art Portrait:** Halftone grid circles at large scale + bold Trace outlines + flat colour backgrounds. Two layers per colour.
4. **Technical Drawing:** Linear fill at 0 degrees, no randomisation, precise masks for each component. Export as SVG for CAD.
5. **Mixed Media:** Scribble for textured background + Handmade imported brushstrokes for detail + Text fill for integrated typography.

#### 410-cloning-strategies.md -- Cloning for Coordinated Systems

Clones in depth. When to clone vs. when to duplicate. Building a clone tree: parent fill, three child clones with different colours but shared angle/interval. Practical example: RGB separation for screen printing -- one parent fill, three clones in red, green, blue, each with slightly offset angle. Modifying the parent updates all children. Clone independence: which properties can be overridden (colour, thickness) and which are always inherited (angle, interval, fill type). Clone performance: clones render faster than independent fills because they share calculation data.

---

### Part 5: Creative Workflows

#### 501-part5-tldr.md -- From Tool to Craft

Part 5 overview. The tools are learned; now we apply them to real creative problems. Each article presents a complete project from concept to export, with specific parameter values and layer structures. These are recipes, not rules -- starting points for the reader's own experiments. Covers: portraiture, landscapes, screen printing, tattoo design, laser cutting, botanical illustration, comics, guilloche, style libraries, batch processing, and print preparation.

#### 502-portrait-engraving.md -- Portrait Engraving

A complete portrait project from photo to finished engraving. Photo selection: high-contrast, well-lit face, clean background. Step-by-step: import photo, create face group with face-shaped auto-mask, add Linear fill at 15 degrees (interval 0.8 mm, thickness mode Thick), add second Linear fill at 75 degrees (interval 1.2 mm, thickness mode Thin) for crosshatch. Background group: Circular fill centred off-canvas for radial texture. Hair: Scribble fill masked to hair area. Final: Trace fill on top for outlines. Export as SVG and PDF. Specific parameter values throughout. Tips on photo preparation: increase contrast, convert to grayscale first for clarity.

#### 503-landscape-illustration.md -- Landscape and Nature

Landscapes present unique challenges: depth, atmospheric perspective, texture variety. Layer strategy: sky (Wave, wide interval, light colour), distant mountains (Linear, fine interval, low contrast), midground vegetation (Fractal or Scribble, medium interval, dynamic colour), foreground detail (Handmade imported brushstrokes or dense Linear). Mask each depth zone. Use threshold stacking: background fills respond to highlights only, foreground fills respond to full range. Water reflections: Wave fill with high Wave Height, phase-shifted duplicate. Atmospheric perspective: fills get sparser and thinner as they recede.

#### 504-screen-printing.md -- Preparing for Screen Printing

Screen printing requires colour-separated layers. Workflow: one fill per colour. Export layers separately (each as a single-colour SVG). Combining same-coloured layers in export. Registration marks. Halftone considerations: screen printing loves halftone dots -- choose sizes compatible with mesh count. Trapping: slight overlap between colour areas to prevent white gaps. Practical example: three-colour poster (black outlines via Trace, red fill via Linear masked to specific area, blue fill via Circular for background). Export settings for screen-print shops. File naming conventions.

#### 505-tattoo-design.md -- Tattoo Design

Tattoo artists need clean vectors with specific properties: no tiny details (they blur when inked), strong outlines, appropriate line weights for skin. Photo to tattoo workflow: start with reference photo, Trace for outlines (high minimum spot size to eliminate fine detail), Linear or Wave for shading areas (wider interval than usual -- skin needs breathing room). Testing at actual size: export and print at 1:1 to check line weights. Placement considerations: how designs wrap around body curves (use Mesh warping to preview). Styles: traditional (bold lines, limited colours), fine-line (thin Linear, tight interval), dot-work (Halftone random circles).

#### 506-laser-cutting.md -- Laser Cutting and CNC

Laser cutters and CNC machines read vector paths. What they need: clean, non-overlapping paths with appropriate kerf. Vexy Lines workflow: Trace fill for cutting outlines, Linear or Halftone for engraving areas. Export as SVG. Smoothing settings: medium (40-60) for clean paths that aren't over-simplified. Minimum spot size: set high enough to eliminate details smaller than the laser beam width. Stroke vs. fill: laser cutters distinguish between "cut" (stroke) and "engrave" (fill). Layer colour coding for cut/engrave separation. Material considerations: wood (wider spacing), acrylic (finer detail possible), paper (finest detail). Testing on cardboard first.

#### 507-botanical-illustration.md -- Botanical Illustration

Scientific botanical illustration has strict conventions: clear detail, accurate proportion, specific line weights for different structures. Photo preparation: shoot against white background, harsh directional lighting for maximum shadow detail. Fill strategy: Trace for outlines (high smoothing, 80+), Linear fill at angle following leaf veins for shading, Circular centred on flower centres for petal shading, Handmade for specific botanical symbols (trichomes, cross-sections). Using masks to isolate each plant structure (petal, leaf, stem). Dynamic colour for hand-coloured botanical style. Export at high resolution for scientific publication.

#### 508-comics-graphics.md -- Comics and Graphic Novels

Comics need bold outlines, expressive shading, and speed. The Vexy Lines workflow for comic artists: photograph or scan pencil drawings, use Trace for clean inking (saves hours of hand-inking), add shading with Linear fills in shadow areas. Panel-by-panel workflow: each panel as a group with its own source image. Speed techniques: build a style preset (save as .lines template), apply across all panels. Cross-hatching for shadow: classic comic shading uses 45-degree Linear fills with high threshold (shadows only). Halftone for grey tones (Ben-Day dots like classic comics). Export for print: CMYK considerations, bleed marks, page size.

#### 509-guilloche.md -- Guilloche and Ornamental Patterns

The Guilloche plugin creates complex ornamental patterns used in banknotes, certificates, and security documents. Ribbon patterns, stripe patterns, component patterns. Building a certificate border: concentric guilloche ribbons with overlapping wave patterns. Security features: patterns that are impossible to photocopy accurately. Parameter combinations for classic banknote aesthetics. Guilloche + Overlap Control for weaving ribbon effects. Exporting guilloche for print: high smoothing, precise line weights, spot colours. Historical context: traditional rose engine lathes vs. digital generation.

#### 510-style-libraries.md -- Building a Style Library

Saving and reusing fill configurations. A "style" is the complete parameter set of a .lines document: all fills, their types, intervals, angles, thresholds, colours. Saving template .lines files. Organising by category: portrait styles, landscape styles, abstract styles, print-ready styles. Building a personal library over time. Sharing styles with colleagues. The style transfer concept (CLI/SDK): extract a style from one document, apply to a different source image. Style interpolation: blend between two styles (50% engraving, 50% wave). Practical: create five go-to styles and name them.

#### 511-print-preparation.md -- Preparing Files for Print

Everything between "export" and "printed piece." Resolution considerations for raster export (300 dpi for offset, 150 for large format). Vector export: SVG vs. PDF vs. EPS and which print shops prefer. Colour management: RGB source to CMYK output considerations. Bleed and trim marks for commercial printing. Proofing: print a test page at 100% scale to verify line weights. Large format: poster-size artwork needs wider intervals to maintain visual density. Packaging files: include fonts if Text fill is used, embed images in PDF. Screen printing specifics: colour separation layers, halftone line frequency. File naming for print shops.

#### 512-gallery-recipes.md -- Gallery of Techniques

A visual cookbook. Twelve techniques, each as a concise recipe card: name, visual description, source image type, layer stack, key parameter values, export format. Techniques include: copper-plate portrait, fingerprint spiral, pop-art halftone, topographic landscape, wood-grain texture, newspaper photo, calligraphic brushwork, geometric abstraction, photo-mosaic text, neon wireframe, contour map, woven crosshatch. Each recipe fits on one page. The reader can reproduce any technique in under ten minutes.

---

### Part 6: Power Tools

#### 601-part6-tldr.md -- Beyond the GUI

Part 6 overview. Vexy Lines has a Python SDK ecosystem for automation, batch processing, and AI-assisted workflows. Four packages: `vexy-lines-py` (file parser), `vexy-lines-apy` (API client), `vexy-lines-cli` (command-line tool), `vexy-lines-run` (batch GUI app). The MCP API lets Claude Desktop or Cursor control Vexy Lines directly. This part introduces each tool, shows practical use cases, and provides enough information for a designer to start automating repetitive tasks -- even without programming experience.

#### 602-cli-basics.md -- The Command Line Tool

What the CLI is: a text-based interface that lets you run Vexy Lines operations without clicking through the GUI. Installing: `pip install vexy-lines-cli` (or `uv pip install`). Core commands: `info` (inspect a .lines file), `file-tree` (browse layer structure), `extract-source` (pull out the embedded photo), `extract-preview` (pull out the rendered thumbnail), `export` (export to PDF/SVG/PNG/JPEG), `batch-convert` (bulk extract previews). Each command with example output. The `--help` flag. Running on macOS Terminal or Windows PowerShell. No programming required -- just type commands.

#### 603-cli-advanced.md -- Batch Export and Style Transfer

Advanced CLI workflows. Batch export: `vexy-lines-cli export ./artwork/ --format svg --output ./exports/` processes an entire folder. Dry-run mode: preview what will happen without exporting. Force re-export with longer timeouts for complex files. Style transfer: extract the style from one .lines file and apply it to a folder of photos. Style interpolation: blend between two styles across a sequence (first image gets style A, last gets style B, everything between is a linear blend). Video processing: apply a Vexy Lines style to a video clip frame-by-frame. Practical example: batch-process a photographer's portfolio into a consistent engraving style.

#### 604-python-parser.md -- Reading .lines Files with Python

The `vexy-lines-py` package: a pure Python parser that reads .lines files without the Vexy Lines app. Installing: `pip install vexy-lines-py`. Basic usage: `from vexy_lines import parse; doc = parse("artwork.lines")`. What you get: `LinesDocument` with project metadata, layer tree (`GroupInfo`, `LayerInfo`, `FillNode`), fill parameters (`FillParams`), embedded images. Extracting source and preview images. Traversing the layer tree. Reading fill parameters. Use cases: cataloguing a library of .lines files, building a web gallery of previews, analysing parameter patterns across projects, migrating between Vexy Lines versions.

#### 605-mcp-api.md -- Controlling Vexy Lines via API

The MCP API: 29 tools that let any program control Vexy Lines in real time. Connection: JSON-RPC 2.0 over TCP on localhost:47384. The `MCPClient` Python class handles connection, handshake, and method calls. Five tool groups: Document (new/open/save/export/info), Structure (tree/group/layer/fill/delete), Fill params and image filters (get/set fill params, get/set/add/remove image filters), Visual (source image/caption/visibility/mask/transform/warp), Control (render/status/undo/redo/selection). Code examples: open a document, add a fill, change parameters, render, export. Coordinates: pixels at document DPI, origin top-left. Error handling: `MCPError` exceptions with descriptive messages.

#### 606-style-engine.md -- Style Transfer and Interpolation

The style engine in `vexy-lines-apy`: extract the complete visual recipe from one .lines document and apply it to another. `extract_style()` captures every fill type, parameter, colour, and threshold. `apply_style()` applies a style to a document via the MCP API. `interpolate_style()` blends two styles: useful for animated sequences where the look evolves over time. Practical example: create a "house style" .lines file and apply it to every new project. Style as data: styles are dictionaries of parameters, making them easy to save, share, and version-control.

#### 607-video-processing.md -- Video to Vector Video

Processing video through Vexy Lines: each frame becomes vector art, then reassembled into video. The `style-video` command. Input: any video file (MP4, MOV, AVI). Output: vector-styled video. Style interpolation across video: the style evolves from start to end. Frame selection: process every frame, every Nth frame, or a specific range. Performance: each frame requires a full render cycle, so processing is slow -- plan hours for long clips. The GUI batch app (`vexy-lines-run`) with its frame-range slider. Practical use cases: music videos, art installations, social media content, title sequences.

#### 608-ai-workflows.md -- AI-Assisted Workflows (Claude + MCP)

Using Claude Desktop or Cursor with the Vexy Lines MCP bridge. Setup: install the `vexy-lines-mcp` bridge binary, add to `claude_desktop_config.json`. What Claude can do: open documents, add fills, adjust parameters, render, export -- all through conversation. Practical example: "Open portrait.lines, add a Linear fill at 45 degrees with interval 1 mm, then export as SVG." Claude handles the API calls. Iterative design: "Make the lines thicker," "Add more randomisation," "Try a Circular fill instead." The AI as creative partner: describe what you want in plain language, the software executes. Limitations: Claude suggests, you decide. The AI doesn't see the artwork (yet) -- it manipulates parameters based on your description.

#### 609-performance.md -- Performance and Troubleshooting

When Vexy Lines gets slow and what to do. Common causes: dense fills (tight interval + thick strokes), high-resolution source images, many layers, mesh warping with Hidden Strokes Removal. Solutions: turn off Auto Refresh, reduce rendering quality to Fast, increase interval temporarily, work on one layer at a time, reduce source image resolution for working (swap to high-res for final export). Memory management: large .lines files with embedded images. Crash recovery: auto-save and backup files (.~lines). Common error messages and their solutions. Platform-specific issues: macOS Gatekeeper blocking, Windows Defender quarantine, display scaling on high-DPI monitors.

#### 610-shortcuts.md -- Keyboard Shortcuts Reference

Complete shortcut table organised by category. Tools: V (Editor), P (Pencil), K (Knife), B (Brush), I (Rectangle mask), O (Ellipse mask), S (Freeform mask). Navigation: Z (zoom in), X (zoom out), Spacebar+drag (pan), Cmd+2 (frame selection), Cmd+3 (show all), Alt+wheel (zoom at cursor). Editing: Cmd+Z (undo), Cmd+Shift+Z (redo), Cmd+C (copy to clipboard), Cmd+G (group), Delete (remove). View: Cmd+Space (preview). Refresh: keyboard triggers for Auto Refresh, Refresh Fill, Refresh All. Modifier keys: Shift (constrain), Alt (alternate function), Ctrl (brush resize).

#### 611-file-format.md -- The .lines File Format

Technical reference for the XML-based .lines format. Root `<Project>` element with attributes (app, version, caption, dpi). `<Document>` element with canvas dimensions and parameter limits. Layer tree in `<Objects>`: groups as `<LrSection>`, layers as `<FreeMesh>`. Fill elements: each algorithm has its own XML tag (`LinearStrokesTmpl`, `SigmoidStrokesTmpl`, `CircleStrokesTmpl`, etc.). Colour encoding: `#AARRGGBB` format (alpha first, normalised to standard `#RRGGBB`). Embedded images: source image as base64 of 4-byte size header + zlib-compressed JPEG, preview as base64 of raw PNG. Mesh data in `<row_grid_edge>` and `<col_grid_edge>`. Href references for clone pointers. This article serves developers and power users who want to manipulate .lines files programmatically or understand what the parser does.

#### 612-glossary.md -- Glossary

Every term used in the manual, alphabetically. Each entry: term, one-sentence definition, cross-reference to the article where it's explained in depth. Includes: Auto Refresh, Blend mode (Handmade), Brush tool, Canvas, Circular fill, Clone, Crosshatch, Dash pattern, Document, Dynamic Color, Editor tool, Ellipse mask, Emboss, EPS, Export, Fill, Fractal fill, Freeform mask, Group, Guilloche, Halftone, Handmade fill, Hidden Strokes Removal, Histogram, Image Threshold, Interval, Knife tool, Layer, Linear fill, Mask, Mesh, MCP API, Morphing, Node, Overlap Control, Pencil tool, Phase Shift, Plist, Preview image, Properties Panel, Radial fill, Randomisation, Rectangle mask, Refresh, Rendering Quality, Resolution (DPI), Scribble fill, Shift, Smoothing, Source image, Spiral fill, Static Color, Stroke, Stroke Thickness, Style, SVG, Text fill, Trace fill, Units, Warp, Wave fill, Wave Height, Wave Length, Wireframe fill.

---

## 6. Cross-Cutting Themes

These motifs recur throughout the manual. Every article should reinforce them where relevant.

### Start simple, layer complexity

The manual teaches one thing at a time. Part 1 uses one fill. Part 2 explores each fill alone. Part 3 shows how controls interact. Part 4 combines fills. Part 5 builds complete projects. Part 6 automates. The reader is never overwhelmed. This same philosophy applies to using Vexy Lines itself: start with one fill, add complexity gradually.

### The brightness-to-stroke relationship

Every fill type reads pixel brightness and translates it into stroke weight, density, or shape size. This is the fundamental concept. Dark = thick/dense/large. Light = thin/sparse/small. Understanding this relationship unlocks all twelve fills. The manual should reinforce it in every fill article and every workflow.

### Source image quality matters

The quality of the source image directly determines the quality of the vector output. High contrast, good lighting, clean edges produce better results. The manual should include photo preparation tips wherever relevant: increase contrast, convert to grayscale for clarity, crop tightly, remove busy backgrounds.

### Masks transform chaos into composition

Without masks, fills cover the entire canvas. Masks are what turn "interesting texture" into "intentional artwork." The manual should treat masks as essential (not optional) from Part 1 onward.

### Export format matches purpose

SVG for web and cutting machines. PDF for print shops. EPS for legacy workflows. PNG for raster with transparency. JPEG for web sharing. The manual should recommend the right format for each workflow, not leave the reader guessing.

### Naming and organisation prevent future pain

Name your layers. Name your groups. Save versions at milestones. Build a style library. These habits save hours later. The manual should model good naming in every example.

---

## 7. Technical Accuracy Notes

The following items must be verified against the Vexy Lines application and source code before publication. Do not write from memory or assumption -- verify each claim.

### Parameter ranges and defaults

- Exact slider ranges for every parameter (Interval, Angle, Wave Height, Wave Length, Curviness, Smoothing, Randomisation, etc.). Check the Properties Panel in the app.
- Default values when a fill is first created.
- Units for each parameter (mm, degrees, percent, pixels).
- Whether ranges are hard limits (slider won't go beyond) or soft limits (can type larger values).

### Fill algorithm names

- The twelve fill types and their exact names as shown in the UI when clicking the + button.
- XML tag names for each fill type (verify against `parser.py` in `vexy-lines-py`).
- Whether "Wireframe" and "Text" fills exist in the current version or are planned. The reference code mentions `linear, wave, circular, radial, spiral, scribble, halftone, handmade, fractals, trace` as the confirmed set. "Wireframe" and "Text" need verification.

### Keyboard shortcuts

- Verify every shortcut against the current macOS and Windows builds.
- Check for differences between macOS and Windows (Cmd vs. Ctrl, etc.).
- Verify Cmd+Space (preview) doesn't conflict with Spotlight on macOS.

### Mesh templates

- Verify the six template names: Rectangle, Donut, Rising, Falling, Ribbon. That's five -- confirm the sixth.
- Verify Hidden Strokes Removal modes and their names.

### Export formats

- Confirm all supported export formats: SVG, PDF, EPS, PNG, JPEG.
- Check whether EPS export is still supported in current versions.
- Verify clipboard copy behaviour (vectors vs. raster).

### Colour encoding

- Verify `#AARRGGBB` format in .lines files (alpha byte first).
- Verify the parser's normalisation to `#RRGGBB` / `#RRGGBBAA`.
- Verify whether decimal ARGB integers still appear in current files.

### MCP API

- Verify the 29 tools and their exact parameter names against the running server.
- Verify the port number (47384) is still current.
- Verify the MCP bridge binary name (`vexylines-mcp` or `vexy-lines-mcp`).
- Verify JSON-RPC protocol version (`2024-11-05`).

### Guilloche plugin

- Verify whether Guilloche is a built-in feature or a separate plugin.
- Verify available guilloche pattern types and their parameters.
- Verify whether it's available on both macOS and Windows.

### System requirements

- Verify minimum macOS version (12+ or different).
- Verify minimum Windows version (10+ or different).
- Verify RAM recommendation.
- Verify installer size.
- Verify pricing and licensing terms (may change -- check vexy.art).

### Auto-detection masking

- Verify the auto-detection feature works as described (click on a shape in the photo to auto-mask).
- Verify which tools support it (Brush, Rectangle, Ellipse, Freeform, or a subset).
- Verify tolerance controls.

### Handmade fill modes

- Verify the three mode names: Manual, Blend, Balanced.
- Verify what each mode actually does vs. the descriptions in the TLDR.
- Verify SVG import into Handmade fills.

### Emboss effect

- Verify Emboss is a per-fill effect, a per-layer effect, or a global effect.
- Verify its controls and parameters.
- Verify which fill types support it.

### History panel

- Verify History panel exists with thumbnail previews.
- Verify click-to-revert behaviour.
- Verify whether it's undo-based or snapshot-based.

### Preferences domain

- Verify the current macOS plist domain (`com.fontlab.vexy-lines` or `com.vexy-art.lines`).
- Verify the middle-dot separator character in preference keys.

---

## 8. Production Notes

### File structure

All articles live in `/src_docs/manual/` with flat numbering:

```
src_docs/
  PLAN.md          (this file)
  manual/
    001-toc.md
    002-tldr.md
    003-intro.md
    101-part1-tldr.md
    102-installing.md
    ...
    612-glossary.md
```

### Image placeholders

Articles should include image placeholders using the format:

```
![Description of what the image should show](images/XXX-description.png)
```

Actual screenshots and diagrams will be produced separately.

### Estimated word counts

| Part | Articles | Est. words per article | Est. total |
|------|----------|----------------------|------------|
| Front matter | 3 | 800-1500 | 3,000 |
| Part 1 | 12 | 1000-1500 | 15,000 |
| Part 2 | 14 | 1500-2500 | 28,000 |
| Part 3 | 12 | 1000-2000 | 18,000 |
| Part 4 | 10 | 1000-2000 | 15,000 |
| Part 5 | 12 | 1500-2500 | 24,000 |
| Part 6 | 12 | 1000-2000 | 18,000 |
| **Total** | **75** | | **~121,000** |

### Review process

1. Draft each article following the plan description.
2. Verify all parameter names, ranges, and shortcuts against the app.
3. Cross-check against reference implementation source code.
4. Edit for voice consistency (plain language, no jargon, no passive voice).
5. Peer review for technical accuracy.
6. Final proof for typos and dead links.
