# Circular: Concentric Rings

Drop a stone into still water. Watch the ripples expand outward in perfect circles, each ring carrying the energy of the impact. Circular fill does the same thing to your photograph: it reads pixel brightness and draws concentric rings radiating from a center point, with stroke thickness responding to the tones beneath. Dark regions produce thick, heavy rings. Light regions produce thin, delicate ones. The result looks like a topographic map, a cross-section of a tree trunk, or a vinyl record --- depending entirely on where you place the center and how tight you set the spacing.

---

## What It Looks Like

Imagine your photograph printed on the surface of a pond, then watching ripples expand across it from a single point. Each ring traces a full circle (or partial arc, if the center is near an edge), and the weight of each ring fluctuates as it passes through lighter and darker areas of the image. From a distance, the concentric pattern reconstructs the photograph's tonal range. Up close, each ring is an independent vector path with smoothly varying thickness.

The visual effect is inherently focal. The viewer's eye is pulled toward the center point, then guided outward along the expanding rings. This makes Circular uniquely powerful for portraits, where the center sits on an eye, or for compositions where you want to emphasise a single point of interest.

---

## When to Use Circular

- **Portraits with eye contact:** Place the center on an eye. The rings radiate outward from the pupil, creating an almost hypnotic focal pull.
- **Ripple and water effects:** The concentric pattern inherently suggests water. Apply to water photography for doubled resonance.
- **Tree ring and wood grain aesthetics:** Off-center placement with tight interval mimics the natural growth rings in timber.
- **Topographic map illustration:** Moderate interval, muted colours, applied to terrain photographs or elevation data.
- **Vinyl record and retro music art:** Tight interval, center on a round subject, monochrome palette.
- **Target and bullseye compositions:** The rings naturally suggest a target. Lean into it or subvert it.

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Center X** | Horizontal position of the ring origin, in pixels from the left edge. | Click the canvas to place interactively. For portraits: the pupil of the dominant eye. |
| **Center Y** | Vertical position of the ring origin, in pixels from the top edge. | Click the canvas to place interactively. |
| **Interval** | Distance between adjacent concentric rings, in mm. | 0.5 mm for fine ripples. 2 mm for visible rings. 5--8 mm for bold, graphic circles. |
| **Stroke Thickness** | Brightness-to-weight mapping. Linear, Thick, or Thin modes. | Linear for balanced rendering. Thick to punch up shadows. |
| **Smoothing** | Reduces jagged weight transitions around each ring. | 20--40 for general use. Higher for smooth gradients across the face. |
| **Image Threshold** | Histogram handles controlling which brightness range the fill responds to. | Full range default. Narrow to isolate specific tonal regions. |
| **Randomization** | Adds irregularity to ring spacing. | 0% for perfect circles. 5--10% for organic wobble. 30%+ for distressed texture. |
| **Dynamic Color** | Strokes sample source image colours. Segment length controls fidelity. | On with 3--5 mm segments for colour portraits. Off for monochrome. |
| **Multiplier** | Scales overall stroke width. | 1.0 default. Increase for bolder rings. |

---

## Step-by-Step: Portrait with Rings Radiating from the Eye

This walkthrough creates a portrait where concentric rings emanate from the subject's eye, pulling the viewer into the gaze.

### 1. Choose your image

Select a portrait with direct eye contact. The subject should be looking at the camera. High contrast helps --- strong shadows around the eyes, clear separation between face and background. Black-and-white portraits are easiest for a first attempt.

### 2. Add a Circular fill

Click **+** in the Layers Panel. Select **Circular**. Concentric rings appear immediately, centred on the canvas midpoint by default.

### 3. Place the center on the eye

Click the **Center** target control in the Properties Panel, then click directly on the subject's dominant eye (whichever eye is more prominent or better-lit). The rings reorient around this new origin point. The pupil should sit at the exact center.

### 4. Set the ring spacing

- **Interval:** 1.0 mm. Tight enough to capture the contours of the face but open enough to see individual rings clearly.

### 5. Configure the weight mapping

- **Stroke Thickness:** Linear mode.
- **Smoothing:** 35. Facial features require gentle weight transitions to read correctly at this density.
- **Multiplier:** 1.0.

### 6. Adjust the threshold

Open the Image Threshold histogram. For this single-fill composition, keep the full range active. If the background is distractingly busy, drag the highlight handle left to suppress the lightest areas (typically the background if it is a light backdrop).

### 7. Evaluate and refine

Zoom in on the eye. The rings should be densest and thickest around the dark pupil and iris, thinning as they cross the white sclera. Across the cheeks and forehead, ring weight fluctuates with the play of light and shadow. Zoom out to check that the portrait reads as a face at normal viewing distance.

If the face lacks definition, tighten the interval to 0.7 mm. If individual rings are too indistinct, widen to 1.5 mm. The balance point depends on your image's tonal range.

### 8. Optional: Enable Dynamic Color

Turn on Dynamic Color. Set segment length to 4 mm. Each ring now transitions through the skin tones, eye colour, and hair as it sweeps across the face. The effect is subtle but adds warmth and lifelike quality.

---

## Creative Variations

### Two-Eye Composition

Place a Circular fill centered on each eye. Use two separate fills on two separate layers, each with its own center point.

- Fill 1: Center on the left eye. Interval 1.2 mm.
- Fill 2: Center on the right eye. Interval 1.2 mm.

Mask each fill so it covers only its half of the face --- paint a vertical dividing line down the bridge of the nose. The rings from each eye radiate outward and meet at the center of the face, creating a symmetrical composition with dual focal points. Where the ring patterns overlap at the nose bridge, the density doubles, naturally emphasising the center of the face.

### Off-Canvas Partial Arcs

Move the center point outside the canvas boundaries entirely --- 200 pixels above the top edge, for instance. The rings become partial arcs that sweep across the canvas in gentle curves, resembling contour lines on a topographic map rather than bullseye circles. The further off-canvas the center, the more the arcs flatten toward straight lines (at extreme distances, they approach Linear fill behaviour).

- Center X: canvas width / 2 (centred horizontally)
- Center Y: -300 (above the canvas)
- Interval: 2 mm

The result: a landscape-like topographic rendering with no obvious focal point, just flowing contour lines.

### Tree Ring Close-Up

Apply to a macro photograph of wood grain or a tree cross-section. Place the center slightly off-center (mimicking the natural eccentricity of tree rings). Interval at 0.8 mm. Randomization at 8%. The fill echoes the natural pattern of the subject, doubling the organic texture. Dynamic Color on, with short segments (2 mm), picks up the warm ambers and dark knot colours.

### Ripple Portrait

Same as the eye-centered portrait, but with wide interval (4--6 mm) and Randomization at 15--20%. The rings become loose, wobbly ripples --- as if the portrait were a reflection in disturbed water. The face is recognisable but dreamlike. Add a second fill (Linear, angle 0°, interval 3 mm, threshold narrowed to highlights only) as a subtle horizontal texture in the light areas, suggesting the flat surface of the water between ripples.

### Dense Vinyl Record

Interval at 0.3--0.5 mm. Center placed precisely on a round subject (a face, a clock, a ball). The rings pack so tightly that from normal viewing distance they merge into a smooth tonal reproduction --- but zoom in and every ring is a distinct vector path. Export at high resolution for large-format prints where viewers will approach closely and discover the concentric structure.

---

## Tips

- **Center placement is everything.** More than any other fill, Circular's visual impact depends on where you put the center point. Spend time experimenting with placement before adjusting any other parameter. Move the center and the entire composition transforms.
- **Off-center creates more interest than dead-center.** A center on the subject's eye is more engaging than a center in the middle of the canvas. Asymmetry generates visual tension.
- **Tight intervals can choke.** Below 0.3 mm, the rings are so dense they blur into solid tone, defeating the purpose of vector line art. If you want that density, consider enabling it only in select areas via masking.
- **Circular + Radial = spiderweb.** Layer a Circular fill (concentric rings) with a [Radial](206-radial.md) fill (outward rays) using the same center point. The two patterns intersect to form a web-like grid. See [Combining Fills](214-combining-fills.md) for the full technique.
- **Circular works better than Linear for round subjects.** Faces, eyes, clocks, wheels, balls --- anything with circular geometry resonates with the concentric ring pattern. Linear would fight the subject's natural curves. Circular amplifies them.
- **The center does not have to be visible.** Place it behind a masked area, under another fill, or off-canvas. The rings still radiate from that hidden origin, creating structure without revealing the source.

---

*Previous: [Wave: Rivers of Line](203-wave.md) | Next: [Spiral: The Continuous Wind](205-spiral.md)*
