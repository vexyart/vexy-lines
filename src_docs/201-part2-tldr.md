# Twelve Ways to See

Pick a photograph. Any photograph. Vexy Lines can transform it into parallel engravings, concentric ripples, radiating sunbeams, spiralling fingerprints, dot-matrix newspaper prints, edge-detected contour maps, chaotic charcoal sketches, mathematical mazes, typographic mosaics, hand-drawn textures, dimensional wireframes, or flowing rivers of curve. Twelve fill algorithms, each reading the same pixels, each producing something entirely different.

This chapter is your map to all twelve.

---

## The Brightness Rule

Every fill in Vexy Lines obeys the same fundamental principle: **dark pixels produce thick, dense strokes; light pixels produce thin, sparse strokes.** A black area in your source photo becomes a heavy cluster of lines. A white area becomes delicate wisps or empty space. Middle grays fall somewhere between.

This single rule drives everything. Once you internalise it, every fill becomes intuitive. The differences between fills are not *what* they respond to (always brightness) but *how* they draw their response.

The Image Threshold histogram lets you override which brightness range matters. Drag the shadow handle right to ignore light areas. Drag the highlight handle left to ignore dark areas. Isolate midtones by squeezing both inward. Stack multiple fills, each responding to a different brightness slice, and you get layered compositions where shadows receive one treatment and highlights another.

---

## Fill Families

The twelve fills group into five families based on their drawing strategy.

### Line-Based: Linear and Wave

These fills draw parallel strokes across your entire image. Linear uses straight lines. Wave bends them into flowing curves. Both respond to brightness by varying stroke thickness and spacing.

**Use when:** You want a consistent directional texture across the whole image. Engravings, woodcuts, banknote illustrations, Art Nouveau posters.

### Radial: Circular, Spiral, and Radial

These fills emanate from a center point. Circular draws concentric rings. Spiral winds a single continuous line outward. Radial shoots rays outward like a starburst.

**Use when:** You want the viewer's eye pulled toward (or pushed away from) a focal point. Portraits with eye contact, sunbursts, vinyl records, propaganda posters.

### Pattern-Based: Halftone, Fractal, and Text

These fills arrange discrete elements (dots, curves, or characters) in a grid or field. Halftone varies the size of shapes. Fractal fills space with mathematical Peano curves. Text paints with letters.

**Use when:** You want a pattern of individual marks rather than continuous lines. Newspaper reproduction, stippling, maze art, typographic portraits.

### Detection: Trace

Trace ignores the idea of "filling" altogether. Instead, it detects edges in your image and converts boundaries between light and dark into clean vector paths. It traces rather than fills.

**Use when:** You want contour lines, silhouettes, logo vectorisation, or cutting paths. Combine with other fills for outline-plus-fill compositions.

### Freeform: Scribble, Handmade, and Wireframe

These fills use unconventional stroke strategies. Scribble generates chaotic hand-drawn marks. Handmade lets you draw or import your own strokes and distributes them across the image. Wireframe drapes a 3D grid over your image like a topographic surface.

**Use when:** You want expressive textures, total creative control, or a dimensional effect that none of the geometric fills provide.

---

## The Comparison Table

| Fill | Visual Character | Best For | Key Parameters |
|------|-----------------|----------|----------------|
| [Linear](202-linear.md) | Parallel straight lines | Engravings, crosshatch, banknotes | Interval, Angle, Shift, Randomization |
| [Wave](203-wave.md) | Flowing parallel curves | Art Nouveau, landscapes, fabric | Wave Height, Wave Length, Curviness, Phase Shift |
| [Circular](204-circular.md) | Concentric rings | Ripples, tree rings, topographic maps | Center X/Y, Interval |
| [Spiral](205-spiral.md) | Single continuous winding line | Vinyl records, fingerprints, hypnotic effects | Center X/Y, Interval, Direction |
| [Radial](206-radial.md) | Rays from a center point | Sunbursts, propaganda, starbursts | Center X/Y, Distance, Random Distance |
| [Halftone](207-halftone.md) | Dots or shapes on a grid | Newspaper print, pop art, stippling | Shape, Grid/Random, Morphing |
| [Trace](208-trace.md) | Edge-detection contour paths | Logos, silhouettes, contour maps | Smoothing, Min Spot Size, Image Threshold |
| [Wireframe](209-wireframe.md) | 3D deforming grid | Retro computing, vaporwave, terrain | Grid density, Depth |
| [Scribble](210-scribble.md) | Chaotic hand-drawn strokes | Charcoal sketches, gesture drawing | Density, Stroke length, Randomization |
| [Fractal](211-fractal.md) | Space-filling Peano curves | Maze art, mathematical patterns | Fractal depth/iteration |
| [Text](212-text.md) | Characters forming images | Typographic portraits, ASCII art | Character set, Font, Size |
| [Handmade](213-handmade.md) | User-drawn strokes repeated | Custom textures, calligraphy | Mode (Manual/Blend/Balanced), Source strokes |

---

## Decision Flowchart

Not sure which fill to start with? Follow these questions:

**Do you want parallel lines?**
Yes, straight --> [Linear](202-linear.md)
Yes, curved --> [Wave](203-wave.md)

**Do you want lines radiating from a point?**
Outward rays --> [Radial](206-radial.md)
Concentric rings --> [Circular](204-circular.md)
Continuous spiral --> [Spiral](205-spiral.md)

**Do you want dots or shapes?**
Yes --> [Halftone](207-halftone.md)

**Do you want edge detection?**
Yes --> [Trace](208-trace.md)

**Do you want chaos and energy?**
Yes --> [Scribble](210-scribble.md)

**Do you want mathematical precision?**
Yes --> [Fractal](211-fractal.md)

**Do you want text forming the image?**
Yes --> [Text](212-text.md)

**Do you want your own custom strokes?**
Yes --> [Handmade](213-handmade.md)

**Do you want a 3D surface effect?**
Yes --> [Wireframe](209-wireframe.md)

**Do you want multiple techniques combined?**
Yes --> [Combining Fills](214-combining-fills.md)

---

## Shared Parameters

Most fills share a common set of parameters. Understanding these once means understanding them everywhere.

| Parameter | What It Does | Range | Notes |
|-----------|-------------|-------|-------|
| **Interval** | Spacing between strokes | 0.1--100 mm | Small = dense, detailed. Large = sparse, bold. |
| **Angle** | Rotation of the fill pattern | 0--360° | 0° = horizontal, 90° = vertical, 45° = diagonal. |
| **Stroke Thickness** | How brightness maps to line weight | Linear / Thick / Thin modes | Dark pixels = thick lines. Three curve shapes control the mapping. |
| **Image Threshold** | Which brightness range the fill responds to | Histogram handles | Drag to isolate shadows, midtones, or highlights. |
| **Randomization** | Breaks mechanical perfection | 0--100% | Low = precise. High = organic, hand-drawn. |
| **Smoothing** | Curve refinement | 0--100 | Low = angular/pixelated. High = flowing. |
| **Shift** | Offsets pattern perpendicular to stroke direction | mm | Essential for layering multiple fills without overlap. |
| **Dynamic Color** | Strokes sample source image colours | On/Off + segment length | Short segments = rapid colour shifts. Long = smooth gradients. |

### Emboss / Bas-Relief

Any fill can simulate a 3D raised or recessed appearance:

| Parameter | What It Does |
|-----------|-------------|
| **bsrf_rise** | Height of the emboss effect |
| **bsrf_smoothness** | How gradually the 3D shading transitions |
| **bsrf_random** | Adds irregularity to the embossed surface |

### Overlap Control

When multiple fills coexist, overlap parameters choreograph their interactions:

- **Can cut other fills:** This fill's strokes slice through fills below it.
- **Can be cut by other fills:** Other fills' strokes slice through this one.
- **Dash / Gap:** Create dotted or dashed cut patterns instead of clean slices.

See [Combining Fills](214-combining-fills.md) for detailed layering strategies.

---

## Where to Go Next

Read the fills in order if you want the full tour. Or jump to whichever fill caught your eye in the table above. Each article follows the same structure: what it looks like, when to reach for it, a parameter reference, a step-by-step walkthrough, creative variations, and practical tips.

Start with [Linear](202-linear.md) --- it is the simplest fill and the foundation everything else builds on.

*Next: [Linear: The Engraver's Line](202-linear.md)*
