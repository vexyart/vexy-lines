# Wireframe: Dimensional Lattice

Take your photograph. Drape a grid over it. Now push the grid upward where the image is dark and let it sink where the image is light. The flat lattice becomes a three-dimensional terrain, and your photograph has become a topographic surface rendered in vector lines. That is Wireframe.

It looks like something from the early days of computer graphics --- the luminous green grids of Tron, the terrain visualisations of 1980s scientific computing, the elevation maps that predated satellite imagery. Applied to photographs, Wireframe transforms faces into landscapes, landscapes into data surfaces, and everything into something that feels simultaneously retro and futuristic.

---

## What It Looks Like

A rectangular grid of intersecting horizontal and vertical lines deforms in three dimensions. At each grid intersection, the image brightness displaces the grid point upward (or downward). Dark pixels push the grid high. Light pixels leave it flat. The result: a wireframe surface that rises and falls with the tonal contours of your source image.

From one angle it looks like a 3D elevation model viewed in perspective. From another it looks like a sheet of graph paper draped over invisible terrain. The density of the grid determines how much detail survives --- a dense grid preserves subtle facial features; a sparse grid reduces everything to broad topographic slopes.

---

## When to Use Wireframe

- **Retro computing and Tron aesthetics:** Sparse grid, bright colour on black background. Instant 1982.
- **Scientific visualisation:** Dense grid, technical palette. Makes any photograph look like data output from an electron microscope.
- **Vaporwave and synthwave art:** Wireframe grid receding to a horizon, neon colours, sunset gradients. The defining visual of the genre.
- **Terrain and elevation map art:** Applied to actual landscape photographs, the wireframe echoes real topography.
- **Architectural visualisation:** Buildings become geometric surfaces. The grid emphasises the planar structure of architecture.
- **Music and album art:** The dimensional grid reads as "electronic" and "digital" --- natural territory for electronic music visuals.

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Interval** | Spacing between grid lines, in mm. Controls grid density. | 1 mm for dense, detailed surface. 3 mm for visible grid structure. 6--10 mm for sparse, graphic lattice. |
| **Angle** | Rotation of the grid pattern. | 0° for axis-aligned grid. 30--45° for dynamic diamond orientation. |
| **Stroke Thickness** | Weight of the grid lines. Can be uniform or brightness-mapped. | Uniform for clean wireframe. Brightness-mapped for lines that thicken over dark regions. |
| **Smoothing** | Controls how smoothly the grid surface deforms between sample points. | Low (10--20) for angular, faceted terrain. High (50--80) for smooth, undulating surface. |
| **Image Threshold** | Histogram handles controlling which brightness range drives displacement. | Full range for maximum displacement contrast. Narrow to flatten less-important tonal regions. |
| **Randomization** | Adds noise to grid point positions. | 0% for clean mathematical grid. 5--10% for subtle imperfection. 30%+ for distressed, glitchy surface. |
| **Dispersion** | Vertical displacement magnitude. Controls how dramatically the grid rises and falls. | Low (5--10) for subtle relief. Medium (20--40) for visible 3D surface. High (60+) for extreme terrain. |
| **Dynamic Color** | Grid lines sample source image colours at each point. | Off for monochrome wireframe. On for colour-mapped surface. |
| **Multiplier** | Scales overall stroke width. | 1.0 default. 0.5 for delicate grid. 2.0 for bold structural lines. |

---

## Step-by-Step: Portrait as Topographic Surface

This walkthrough transforms a portrait into a 3D wireframe surface where the face rises from the grid like terrain.

### 1. Choose your image

Select a portrait with strong lighting. Side-lit faces work best --- the gradient from illuminated cheek to shadowed cheek creates dramatic 3D displacement. The nose, brow ridge, and chin should have distinct shadow patterns. Avoid flat, evenly-lit subjects.

### 2. Add a Wireframe fill

Click **+** in the Layers Panel. Select **Wireframe**. A deforming grid appears over your image.

### 3. Set the grid density

- **Interval:** 2 mm. Dense enough to capture the nose, eyes, and mouth as distinct surface features. Sparse enough to see individual grid cells.

### 4. Configure the displacement

- **Dispersion:** 30. Moderate displacement that clearly shows the 3D surface without distorting the face beyond recognition.
- **Smoothing:** 50. Smooth enough to produce rolling surface contours rather than jagged angular facets.

### 5. Set the stroke weight

- **Stroke Thickness:** Uniform mode, moderate weight.
- **Multiplier:** 1.0.

### 6. Adjust the threshold

Full range Image Threshold. The entire tonal range of the face should drive the displacement. If the background is flat and uninteresting, narrow the threshold to suppress it, leaving a flat grid in the background and a displaced surface on the face.

### 7. Evaluate

Zoom out. The face should rise from the grid as a recognisable topographic surface. The nose ridge should be the highest point (darkest shadow). The forehead and cheeks should form gentle slopes. The eyes should be recessed contours. If the face is not sufficiently three-dimensional, increase Dispersion. If it is too extreme, reduce it.

### 8. Optional: Add colour

Enable Dynamic Color. The grid lines pick up skin tones, eye colour, and hair. The wireframe becomes a colour-coded elevation map of the human face.

---

## Creative Variations

### Tron Aesthetic

Sparse grid, bright lines, dark background. The distilled retro-computing look.

- **Interval:** 5--8 mm. Wide grid cells for the classic coarse wireframe.
- **Dispersion:** 40. Enough displacement to create visible terrain.
- **Smoothing:** 20. Angular facets, not smooth curves. Facets are more "computer graphics 1982."
- **Stroke Thickness:** Uniform, medium-bold weight.
- **Colour:** Bright cyan or green on a black background. Set the fill colour to #00FFFF or #00FF00.
- **Randomization:** 0%. Perfect mathematical grid.
- **Dynamic Color:** Off.

Apply to a face or a landscape. The sparse grid reduces everything to broad geometric planes. Export on a black canvas for maximum Tron impact.

### Dense Terrain Visualisation

Maximum detail, scientific feel.

- **Interval:** 0.8--1.2 mm. Tight grid that captures fine surface detail.
- **Dispersion:** 20. Moderate displacement for a data-visualisation register rather than an artistic one.
- **Smoothing:** 70. Smooth surface.
- **Colour:** Single muted colour (grey, dark blue, or brown).
- **Dynamic Color:** Off.

The result resembles the output of a 3D scanner or a LIDAR elevation map. Apply to a landscape photograph for doubled resonance --- the wireframe terrain echoes the actual terrain.

### Vaporwave Horizon

The signature vaporwave visual: a wireframe grid receding into a sunset horizon.

- Apply Wireframe to a gradient image (dark at bottom, light at top) or a landscape with a clear horizon.
- **Interval:** 4 mm.
- **Angle:** 0°.
- **Dispersion:** 15. Subtle displacement, mostly flat with gentle undulations.
- **Colour:** Magenta or hot pink (#FF00FF).
- **Dynamic Color:** Off.

The grid appears to recede into depth (the perspective is an illusion created by the image gradient). Add a flat background fill in dark purple or black. Layer a [Circular](204-circular.md) fill (large interval, centred at the horizon, colour gradient from orange to pink) for a setting sun. The composition screams 1986.

### Glitch Grid

Deliberately broken, digitally corrupted wireframe.

- **Interval:** 3 mm.
- **Randomization:** 40--60%. Grid points scatter from their intended positions.
- **Dispersion:** 50. High displacement amplifies the chaos.
- **Smoothing:** 5. Extreme angular facets.

The result: a wireframe that looks like it is malfunctioning. Grid lines spike and collapse unpredictably. The photograph is still encoded in the displacement, but the surface is shattered. Works well for glitch art, cyberpunk aesthetics, and album covers for aggressive electronic music.

### Wireframe + Flat Background

Use Wireframe for the subject and a flat [Linear](202-linear.md) fill for the background:

- Wireframe fill: Applied to the full canvas. Mask the background area (paint it out).
- Linear fill: Interval 2 mm, Angle 0°, applied only to the background area.

The subject rises as a 3D wireframe surface from a field of flat parallel lines. The contrast between dimensional and flat makes the subject pop dramatically.

---

## Tips

- **Interval determines the trade-off between detail and legibility.** A grid too dense looks like noise. A grid too sparse loses the subject. Start at 2--3 mm and adjust based on your image's complexity. Faces need denser grids than landscapes.
- **Dispersion is the "height" control.** Think of it as the altitude range of your terrain. Low dispersion = gentle hills. High dispersion = jagged mountains. Match it to the tonal contrast of your image --- high-contrast images can handle high dispersion; low-contrast images look better with restrained displacement.
- **Smoothing determines geology.** Low smoothing produces angular, faceted surfaces --- like a crystal or a low-polygon 3D model. High smoothing produces rolling, organic surfaces --- like sand dunes or skin. The choice depends on whether you want "digital" or "natural."
- **Wireframe is the most computationally expensive fill.** The grid deformation calculations are heavier than simple stroke generation. Turn off Auto Refresh while adjusting parameters. Use Refresh Fill when ready to evaluate.
- **Black backgrounds are Wireframe's best friend.** The grid lines stand out dramatically against black, creating the classic computer-graphics aesthetic. If your canvas background is white, consider inverting the composition: bright grid lines on a dark fill.
- **Wireframe is the only fill that creates the illusion of depth.** All other fills are inherently flat (even if they vary stroke weight). Wireframe's displacement grid genuinely suggests a three-dimensional surface. This makes it uniquely powerful --- and uniquely easy to overuse. One Wireframe fill per composition is usually enough.

---

*Previous: [Trace: Finding Edges](208-trace.md) | Next: [Scribble: Controlled Chaos](210-scribble.md)*
