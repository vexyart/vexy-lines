# Linear: The Engraver's Line

Hold a banknote up to the light. Those portraits built entirely from parallel lines of varying thickness --- that is engraving. Linear fill does the same thing in seconds. It reads your source image, lays down straight parallel strokes across the entire canvas, and varies their weight according to pixel brightness. Dark areas become thick, ink-heavy lines. Light areas thin to near-invisibility. The result looks like it took a master engraver months. It took you two sliders.

Linear is the simplest fill in Vexy Lines and the one you should learn first. Every concept here --- Interval, Angle, Image Threshold, Stroke Thickness, Randomization --- carries over to every other fill type. Master Linear and you have mastered the vocabulary of the entire application.

---

## What It Looks Like

Imagine your photograph sliced into horizontal strips. Each strip becomes a single line whose weight reflects the brightness beneath it. Where the image is dark, the line swells. Where it is light, the line thins. From a distance, these thickness variations reconstruct the photograph's tonal range with startling fidelity.

At tight intervals (0.5 mm), the effect resembles copper-plate etching: fine, precise, classical. At moderate intervals (2 mm), the lines become graphic and bold, suitable for posters. At wide intervals (10 mm), individual lines dominate --- dramatic stripes that hint at the image underneath rather than reproducing it.

---

## When to Use Linear

- **Engraving-style portraits:** The classic use. One Linear fill, tight interval, zero randomization.
- **Crosshatch illustration:** Two or three Linear fills at different angles. See the walkthrough below.
- **Banknote and currency aesthetics:** Tight interval, slight angle variation between layers, emboss enabled.
- **Minimalist one-direction art:** A single fill at a single angle. Let the stroke thickness do all the work.
- **Charcoal and pencil texture:** Moderate interval, high randomization, low smoothing.
- **Screen-print separations:** One Linear fill per colour channel, each at a different angle to avoid moiré.

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Interval** | Distance between adjacent lines, in mm. | 0.5 mm for fine engraving. 2 mm for bold graphics. 5--10 mm for dramatic stripes. |
| **Angle** | Rotation of the line pattern, in degrees. | 0° horizontal. 45° diagonal energy. 90° vertical drama. 15° or 75° for subtle tilt. |
| **Randomization** | Adds perpendicular jitter to each line, breaking mechanical precision. 0--100%. | 0% for clean engraving. 5--10% for subtle organic feel. 30--50% for hand-drawn look. 80%+ for chaotic texture. |
| **Shift** | Offsets the entire line pattern perpendicular to the stroke direction, in mm. | 0 mm default. Use non-zero values when stacking multiple Linear fills to prevent exact overlap. |
| **Stroke Thickness** | Maps brightness to line weight. Three modes: Linear (proportional), Thick (emphasises weight), Thin (emphasises delicacy). | Start with Linear mode. Switch to Thick for high-contrast subjects. |
| **Smoothing** | Reduces jagged thickness transitions along each line. | 0 for pixel-precise response. 20--40 for gentle softening. 80+ for flowing weight changes. |
| **Image Threshold** | Histogram handles controlling which brightness range the fill responds to. | Full range for general use. Drag shadow handle right to skip light areas. Drag highlight handle left to skip dark areas. |
| **Dynamic Color** | When enabled, strokes sample colours from the source image instead of using a single static colour. Segment length controls how often colour changes along each stroke. | Off for monochrome engraving. On with 2--5 mm segments for detailed colour. On with 10--20 mm segments for smooth colour blending. |
| **Dispersion** | Random perpendicular offset applied to individual strokes. | 0 for precise lines. 1--3 for subtle roughness. |
| **Multiplier** | Scales overall stroke width. | 1.0 default. Increase to 1.5--2.0 for bolder weight. Decrease to 0.5 for lighter touch. |

---

## Step-by-Step: A Crosshatched Portrait

This walkthrough builds a classical crosshatch portrait using two Linear fills at complementary angles.

### 1. Open your image

File > New, drag in a high-contrast portrait. Black-and-white photographs work best for your first attempt. The image should have clear shadows and highlights --- avoid flat, evenly-lit subjects.

### 2. Add the first Linear fill

Click **+** in the Layers Panel. Select **Linear**. Your portrait transforms into horizontal parallel lines instantly.

### 3. Set the base parameters

- **Interval:** 1.2 mm. Dense enough to capture facial detail, open enough to see individual lines.
- **Angle:** 15°. A slight tilt from horizontal gives more energy than pure 0°.
- **Stroke Thickness:** Linear mode.
- **Smoothing:** 30. Enough to prevent choppy weight transitions across the face.
- **Randomization:** 0%. Keep the first layer clean and precise.

### 4. Adjust the Image Threshold

Open the histogram. For this first fill, drag the shadow handle slightly right (to about 20%) so the fill responds primarily to the darker half of the image. The lightest areas of the face will have no strokes --- that is intentional.

### 5. Add the second Linear fill

Click **+** again. Select **Linear**. A second set of lines appears, stacking on top of the first.

### 6. Configure the crosshatch angle

- **Interval:** 1.5 mm. Slightly wider than the first fill to create visual hierarchy.
- **Angle:** 75°. This crosses the first fill's 15° lines at roughly 60°, producing the classic diamond-shaped crosshatch pattern.
- **Stroke Thickness:** Linear mode.
- **Smoothing:** 30.
- **Randomization:** 0%.
- **Shift:** 0.3 mm. This small offset prevents the second fill's lines from landing exactly on top of the first fill's lines, which would create visual muddiness.

### 7. Narrow the threshold

For the second fill, squeeze the Image Threshold to respond only to the darkest 40% of the image. The crosshatch pattern now appears only in the deepest shadows --- under the chin, beside the nose, in the eye sockets. Lighter areas retain only the single-direction lines from the first fill.

### 8. Refine

Toggle each fill's visibility on and off to evaluate its contribution independently. Adjust intervals and angles until the crosshatch pattern feels balanced. The goal: deep shadows show both line directions (crosshatch), middle tones show only the primary direction, and highlights show nothing or near-nothing.

---

## Creative Variations

### Single-Direction Minimalist

One Linear fill. Interval at 3 mm. Angle at 0°. Randomization at 0%. Smoothing at 50. Let the stroke thickness do all the expressive work. The result is clean, modern, and reads as "sophisticated graphic design" rather than "illustration." Works beautifully for corporate portraits and editorial art.

### Classical Three-Angle Crosshatch

Three Linear fills at 0°, 60°, and 120° (or 0°, 45°, and 90° for a squared grid). Each successive fill responds to a progressively darker brightness range. The lightest fill covers the whole image. The middle fill appears in mid-to-dark tones. The darkest fill appears only in the deepest shadows. The buildup creates rich tonal gradation that rivals pencil rendering.

- Fill 1: Interval 1.5 mm, Angle 0°, threshold full range.
- Fill 2: Interval 1.5 mm, Angle 60°, threshold shadows + midtones only.
- Fill 3: Interval 1.5 mm, Angle 120°, threshold shadows only.

### Randomised Charcoal Sketch

One Linear fill. Interval at 2 mm. Angle at roughly 70° (the natural angle of a right-handed person sketching). Randomization at 40--60%. Smoothing at 10. The mechanical precision vanishes. What emerges looks like charcoal dragged across textured paper. Adding a second fill at 160° with Randomization at 50% and a wider interval (3 mm) creates the crosshatch energy of a quick life-drawing.

### Tight Engraving with Emboss

One Linear fill at 0.5 mm interval, 0° angle, 0% randomization. Enable the Emboss effect: set **bsrf_rise** to 3, **bsrf_smoothness** to 40, **bsrf_random** to 5. The lines gain a subtle three-dimensional quality, as if pressed into paper from a copper plate. Works especially well when exported as a dark stroke colour on cream or off-white backgrounds.

### Dramatic Wide Stripes

Interval at 8--12 mm. Angle at 45°. The image becomes bold diagonal stripes, each one carrying a thick-to-thin weight profile that encodes the photograph. From far away, the subject is recognisable. Up close, it is pure geometry. Add a second fill at 135° with the same interval for a plaid effect.

---

## Tips

- **Start simple.** One fill, two sliders (Interval and Angle). Resist the temptation to stack multiple fills until you understand how one behaves.
- **Shift prevents muddy stacking.** When layering two or more Linear fills, give each a different Shift value (even 0.2 mm makes a difference). Without Shift offsets, lines from different fills can land on top of each other and merge into illegible thick bands.
- **Angle differences matter more than absolute angles.** A crosshatch at 10° and 70° looks the same as one at 40° and 100°. What matters is the *difference* between angles. A 60° difference produces the classic diamond crosshatch. A 90° difference produces a square grid. A 30° difference produces tighter, more compressed diamonds.
- **Randomization interacts with Interval.** High randomization with tight intervals creates a dense, textured mass. High randomization with wide intervals creates scattered, sketch-like marks. The combination determines the feel more than either parameter alone.
- **Dynamic Color with Linear is underrated.** Enable it on an engraving-style portrait and each line picks up the skin tones, hair colour, and background hues from the source. The result looks hand-coloured. Set segment length to 3--5 mm for natural colour transitions.
- **Turn off Auto Refresh for dense fills.** An interval below 0.5 mm on a large canvas generates thousands of paths. Turn off Auto Refresh, make your adjustments, then hit Refresh Fill to recalculate once.

---

*Previous: [Twelve Ways to See](201-part2-tldr.md) | Next: [Wave: Rivers of Line](203-wave.md)*
