# Fractal: Space-Filling Curves

In 1890, the Italian mathematician Giuseppe Peano discovered a curve that passes through every point in a square. A single continuous line, never crossing itself, filling an entire two-dimensional area. The mathematical community was stunned. Over a century later, Vexy Lines uses that same principle to turn your photographs into maze-like vector art where a single winding path fills space with mathematical precision, thickening in the dark areas and thinning in the light.

Fractal fill draws Peano-style space-filling curves modulated by your source image's brightness. The result looks like a labyrinth, a circuit board, a fingerprint magnified a thousand times, or a maze designed by someone who does not believe in dead ends.

---

## What It Looks Like

A continuous curve snakes back and forth in a recursive pattern, filling the canvas without crossing itself. At low iteration depth, the path makes broad, simple turns --- a chunky maze with wide corridors. At high iteration depth, the path folds in on itself repeatedly, creating an intricate pattern that approaches solid fill in dark areas while remaining loose and open in light areas.

The stroke weight varies with image brightness throughout the path: thick through shadows, thin through highlights. From a distance, the tonal variations reconstruct the source photograph. Up close, the recursive geometric pattern is visible and mesmerising.

---

## When to Use Fractal

- **Maze art:** The literal visual metaphor. Every image becomes a navigable maze.
- **Mathematical and scientific illustration:** The Peano curve carries intellectual weight. Use it for subjects where mathematical precision is thematically appropriate.
- **Circuit board and technology aesthetics:** The right-angle turns and space-filling pattern echo PCB traces and chip layouts.
- **Fingerprint and biometric imagery:** At high iteration, the dense winding pattern resembles magnified skin ridges.
- **Novelty and conversation pieces:** "It is a photograph rendered as a single space-filling curve" is a guaranteed conversation starter.
- **Pen-plotter and CNC work:** Like [Spiral](205-spiral.md), the continuous path is mechanically efficient for plotters and engravers that prefer not to lift the tool.

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Interval** | Spacing between adjacent curve segments, in mm. Controls overall density. | 0.8 mm for dense, detailed filling. 2 mm for visible maze structure. 5 mm for bold, graphic paths. |
| **Angle** | Rotation of the fractal pattern. | 0° for axis-aligned curves. 45° for diagonal orientation. |
| **Stroke Thickness** | Brightness-to-weight mapping. Linear, Thick, or Thin modes. | Linear for balanced tonal reproduction. Thick for stronger contrast. |
| **Smoothing** | Controls how rounded the curve corners are. Low = sharp right-angle turns. High = flowing rounded turns. | 0--10 for crisp maze aesthetic (sharp corners). 30--50 for softened curves. 80+ for flowing, organic paths. |
| **Image Threshold** | Histogram handles for brightness range. | Full range for complete tonal rendering. Narrow for high-contrast maze effect. |
| **Randomization** | Adds irregularity to the curve path. | 0% for perfect mathematical precision. 5--15% for subtle organic variation. 30%+ for increasingly random winding. |
| **Dynamic Color** | The curve samples source image colours as it traverses the canvas. | Off for monochrome maze. On with 2--4 mm segments for colour-mapped path. |
| **Multiplier** | Scales overall stroke width. | 1.0 default. 0.5 for delicate tracery. 2.0 for bold labyrinth walls. |
| **Dispersion** | Random offset applied perpendicular to the curve path. | 0 for clean geometry. 5--10 for subtle path wobble. |

---

## Step-by-Step: High-Contrast Image Becoming a Maze

This walkthrough transforms a high-contrast photograph into a maze-like composition where the space-filling curve is clearly visible.

### 1. Choose your image

Select a photograph with strong, simple tonal contrast. A face with dramatic lighting, a silhouette, or a graphic design with clear black-and-white regions. The Fractal fill is most visually striking when there are large areas of distinct brightness --- the maze structure is clearly visible in light areas and becomes dense texture in dark areas.

### 2. Add a Fractal fill

Click **+** in the Layers Panel. Select **Fractal**. (Note: in the fill selector, this may appear as "Fractals" or "Peano" --- both refer to the same space-filling curve algorithm.) A winding path appears across the canvas.

### 3. Set the density

- **Interval:** 2 mm. Wide enough to see the individual turns of the curve clearly. This is a maze, and mazes need visible corridors.

### 4. Shape the curve character

- **Smoothing:** 5. Keep the corners sharp and angular. The mathematical precision of the Peano curve is part of the aesthetic. Rounded corners soften the maze into something more organic, which may or may not be what you want.
- **Randomization:** 0%. Let the mathematical pattern speak.

### 5. Configure the weight mapping

- **Stroke Thickness:** Linear mode.
- **Multiplier:** 1.5. Slightly bold strokes make the maze walls visible and satisfying.

### 6. Adjust the threshold

For a maze effect, consider narrowing the Image Threshold to compress the tonal range. Push the shadow handle to 30% and the highlight handle to 80%. This creates a more binary dark/light distinction in the curve's weight --- the maze has "walls" (thick sections) and "paths" (thin sections) rather than a continuous gradient.

### 7. Evaluate

Zoom in. You should see the Peano curve winding back and forth in a recursive pattern. In dark areas, the curve is thick and the "corridors" narrow. In light areas, the curve is thin and the corridors wide. Zoom out. The brightness variations should reconstruct the source photograph recognisably.

If the maze structure is not visible enough, increase Interval. If the image is not recognisable, decrease Interval for more tonal resolution. The balance point is where both the maze pattern and the image content are simultaneously legible.

### 8. Optional: Add colour

Enable Dynamic Color with a segment length of 3 mm. The curve picks up source colours as it winds across the canvas. The maze becomes a coloured path threading through the image, each section tinted by the pixel beneath it.

---

## Creative Variations

### Bold Maze

Maximum maze visibility. The space-filling curve is the dominant visual element; the source image is secondary.

- **Interval:** 4--6 mm. Wide corridors.
- **Smoothing:** 0. Sharp right-angle turns.
- **Multiplier:** 2.5. Bold, wall-like strokes.
- **Randomization:** 0%.
- **Image Threshold:** Narrowed aggressively. Only the darkest 30% of the image produces thick strokes.

The result looks like a maze puzzle printed on a poster, with the faint ghost of a photograph encoded in the wall thickness. From across a room, you see the face (or landscape, or subject). Up close, you see only the maze. Print large.

### Intricate Near-Random

At the opposite extreme: the fractal iteration is pushed high and the interval pulled tight.

- **Interval:** 0.5--0.8 mm. Dense packing.
- **Smoothing:** 40. Slightly rounded corners soften the density.
- **Multiplier:** 0.8.

The curve packs so tightly that its recursive structure becomes almost invisible. The result resembles an extremely fine hatching or a fingerprint texture. The mathematical origin is hidden beneath the density. Only on close inspection does the viewer notice the path never crosses itself.

### Organic Fractal

Smoothing at 70--90. Randomization at 15%. The sharp mathematical character dissolves into something more biological --- the winding curves of intestinal villi, the branching of blood vessels, the meander of a river delta. The Peano origin is still there, but disguised as nature.

- **Smoothing:** 80.
- **Randomization:** 15%.
- **Interval:** 1.5 mm.
- **Dispersion:** 8.

### Fractal Confined by Mask

Apply the Fractal fill to the full canvas, then mask it to appear only within a specific shape (a circle, a letter, the outline of the subject's silhouette). The space-filling curve fills the masked area while the rest of the canvas is empty. The curve respects the mask boundary, creating a maze within a shape.

Use a [Trace](208-trace.md) fill to generate the silhouette outline, then use that same boundary as a mask for the Fractal fill. The result: a silhouette filled with maze, outlined with clean vector edges.

### Multi-Colour Fractal Layers

Three Fractal fills, each targeting a different brightness range, each in a different colour:

- Fill 1: Threshold for shadows only. Colour: dark navy. Interval 1.5 mm.
- Fill 2: Threshold for mid-tones. Colour: medium teal. Interval 1.5 mm. Shift 0.5 mm.
- Fill 3: Threshold for highlights. Colour: light gold. Interval 1.5 mm. Shift 1.0 mm.

Each Peano curve fills its tonal band independently. The three colour layers overlap in the mid-range and separate at the extremes, creating a rich, multi-toned maze composition.

---

## Tips

- **Fractal is computationally heavy at high density.** The recursive path calculation is more intensive than Linear or Circular. Turn off Auto Refresh before adjusting parameters. Render once when ready.
- **The curve never crosses itself.** This is a mathematical guarantee of the Peano construction. Every apparent crossing is an illusion of proximity. This property is useful for pen plotters and CNC machines --- the tool path never needs to negotiate an intersection.
- **Smoothing is the personality switch.** At 0, Fractal is mathematical, angular, and mechanical. At 100, it is organic, flowing, and biological. The same fill, the same algorithm, two completely different visual registers. Try both extremes before settling on a value.
- **Fractal + Trace is surprisingly effective.** Use Trace for the outlines of major shapes, and Fractal for the shading within them. The clean edges from Trace contain the maze-like texture from Fractal, producing an illustration that is structured but textured.
- **Print large.** The recursive detail of the Peano curve rewards close inspection. At poster size or larger, viewers can lean in and trace the path with their eyes. At postcard size, the detail compresses into texture and the maze structure is lost. Design for the viewing distance that serves the content.
- **Fractal is the fill for people who like puzzles.** The visual promise of a maze --- the suggestion that there is a path to follow, a solution to find --- creates engagement that purely aesthetic fills do not. Use it when you want the viewer to spend time with the piece.

---

*Previous: [Scribble: Controlled Chaos](210-scribble.md) | Next: [Text: Painting with Letters](212-text.md)*
