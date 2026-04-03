# Wave: Rivers of Line

Straight lines are dignified. Curves are alive. Wave takes Linear's parallel strokes and bends them into flowing sinusoidal rivers that roll across your image like water across stone. The same brightness-to-thickness rule applies --- dark areas swell, light areas thin --- but the lines themselves undulate, creating movement where Linear creates stillness.

If Linear is a copperplate engraving, Wave is Art Nouveau: organic, rhythmic, and slightly intoxicating.

---

## What It Looks Like

Picture your photograph rendered entirely in flowing curves, like hair caught in wind or contour lines on a topographic map. Each stroke follows a sinusoidal path while varying its weight according to the brightness beneath it. At gentle settings, the curves add subtle life to what would otherwise be rigid parallel lines. At extreme settings, the curves dominate and the image becomes a secondary texture embedded in pure wave motion.

---

## When to Use Wave

- **Art Nouveau illustration:** Low wave height, high curviness, tight interval. Mucha would approve.
- **Landscape and water imagery:** The natural subject matter for natural curves. Rivers, oceans, clouds, rolling hills.
- **Hair and fabric:** Wave follows the organic logic of flowing materials better than any straight-line fill.
- **Op Art and moiré effects:** Stack multiple Wave fills with different phase shifts and watch interference patterns emerge.
- **Psychedelic posters:** High wave height, high curviness, Dynamic Color enabled, vivid source image.
- **Topographic map aesthetics:** Moderate wave height, tight interval, muted earth-tone colours.

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Interval** | Spacing between adjacent wave strokes, in mm. | 1 mm for detailed. 3 mm for graphic. 8 mm for bold waves. |
| **Angle** | Rotation of the wave pattern. | 0° for horizontal flow. 90° for vertical cascade. 45° for diagonal energy. |
| **Wave Height** | Amplitude of the sinusoidal curve, controlling how far each stroke swings from its centre line. | 2 for gentle undulation. 10 for visible waves. 20 for dramatic motion. 50--100 for pure abstraction. |
| **Wave Length** | Distance between wave peaks along each stroke. | Short (5--10) for nervous, rippling energy. Medium (20--30) for balanced flow. Long (50--100) for ocean-swell calm. |
| **Curviness** | Smoothness of the wave shape, from angular zigzags to perfect sine curves. 0--100%. | 0% for angular zigzags (sawtooth feel). 50% for soft undulations. 100% for pure sine curves. |
| **Phase Shift** | Slides the wave pattern sideways along the stroke direction. | 0 default. Vary between stacked fills to create interference. |
| **Randomization** | Adds jitter to the wave paths. | 0% for mechanical precision. 10--20% for organic variation. 50%+ for chaotic turbulence. |
| **Shift** | Offsets the pattern perpendicular to stroke direction. | Non-zero when layering multiple Wave fills. |
| **Stroke Thickness** | Brightness-to-weight mapping. Linear, Thick, or Thin modes. | Start with Linear. Switch to Thick for high-contrast subjects. |
| **Image Threshold** | Histogram handles for brightness range. | Full range for general use. Narrow to isolate specific tones. |
| **Dynamic Color** | Strokes sample source image colours. Segment length controls fidelity. | Off for monochrome. On with 3--5 mm segments for rich colour. |

---

## Step-by-Step: Landscape Flowing Like Water

This walkthrough transforms a landscape photograph into flowing wave patterns that echo the natural movement of water and terrain.

### 1. Choose your image

Select a landscape with strong tonal contrast: dark foreground trees, bright sky, a distinct horizon. Mountain scenes and coastal photographs work particularly well because the natural subject matter aligns with the wave aesthetic.

### 2. Add a Wave fill

Click **+** in the Layers Panel. Select **Wave**. The image transforms into flowing curves immediately.

### 3. Set the wave character

- **Interval:** 1.5 mm. Tight enough to capture landscape detail but loose enough to see individual wave strokes.
- **Angle:** 0°. Horizontal flow mirrors the natural horizon in the landscape.
- **Wave Height:** 8. Visible undulation without overwhelming the image content.
- **Wave Length:** 30. Moderate peaks produce a calm, rolling quality.
- **Curviness:** 80%. Smooth curves, not zigzags.

### 4. Adjust thickness mapping

- **Stroke Thickness:** Linear mode.
- **Smoothing:** 40. Landscapes benefit from gradual weight transitions.

### 5. Add a second Wave fill for the sky

Click **+**, select **Wave** again. This fill will handle the sky separately.

- **Interval:** 2.5 mm. Slightly wider spacing for the open sky area.
- **Angle:** 5°. A slight tilt from horizontal, suggesting wind.
- **Wave Height:** 15. More dramatic movement for the sky.
- **Wave Length:** 50. Longer wavelength for a sense of expansive atmosphere.
- **Curviness:** 90%.

### 6. Mask each fill

Select the first fill's layer. Use the Brush tool (B) or Freeform tool (S) to mask away the sky --- paint black over the upper portion. This fill now renders only the foreground and terrain.

Select the second fill's layer. Invert the approach: mask away the ground, keeping only the sky visible.

### 7. Enable Dynamic Color

Turn on Dynamic Color for both fills. Set segment length to 5 mm. The wave strokes now pick up greens from foliage, blues from sky, and earth tones from the terrain. The landscape comes alive with colour while retaining the flowing wave texture.

### 8. Fine-tune

Toggle fills on and off individually. Adjust wave height and wavelength until the foreground feels grounded and the sky feels expansive. If the horizon transition looks abrupt, soften the masks with a large, soft brush.

---

## Creative Variations

### Art Nouveau Portrait

Low wave height (3), high curviness (100%), tight interval (0.8 mm). The portrait becomes a Mucha-style illustration where every contour flows. Set angle to follow the dominant direction of the subject's hair or pose --- 15° for a tilted head, 80° for flowing hair.

- **Wave Height:** 3
- **Wave Length:** 15
- **Curviness:** 100%
- **Interval:** 0.8 mm
- **Smoothing:** 60

### Op Art Moiré Stacking

Three Wave fills, identical parameters except Phase Shift:

- Fill 1: Phase Shift 0, colour black.
- Fill 2: Phase Shift 33%, colour dark blue.
- Fill 3: Phase Shift 66%, colour dark red.

Use Wave Height 12, Wave Length 20, Interval 1.5 mm for all three. The offset phases create shimmering interference patterns. Where the waves align, density increases. Where they diverge, gaps open. The result is a vibrating optical illusion modulated by your source image.

### Turbulent Water

High wave height (25--40), short wavelength (8--12), curviness at 60% (not fully smooth --- slightly angular waves feel more like choppy water). Randomization at 15%. Angle at 0°. Apply to a water photograph and the wave strokes echo the actual wave patterns beneath.

### Zigzag Energy

Curviness at 0% transforms sine curves into angular zigzags. Combined with a high wave height (20) and short wavelength (10), this produces aggressive, electric energy. Works well for music posters, sports graphics, and anything that needs to scream rather than whisper. Add Randomization at 5--10% to prevent the zigzags from looking too computer-generated.

### Vertical Cascade

Angle at 90°. Wave Height at 12. Everything flows downward like rain or falling fabric. Particularly effective on portraits where the subject is looking up --- the downward wave direction creates dramatic tension against the upward gaze.

---

## Tips

- **Wave Height and Wave Length interact.** A high wave with short wavelength packs intense energy (choppy seas). A high wave with long wavelength produces majestic rolling motion (ocean swells). A low wave with short wavelength creates gentle ripples (calm water). Experiment with the ratio, not just individual values.
- **Curviness at 50% is often the sweet spot.** Fully angular (0%) looks digital. Fully smooth (100%) can feel too perfect. The middle range produces waves that feel natural, like hand-drawn curves.
- **Phase Shift is your moiré weapon.** Two identical Wave fills with different Phase Shift values create interference patterns that are impossible to achieve any other way. Start with a 50% shift difference and adjust from there.
- **Wave + Linear = the best of both.** Use a Wave fill for the main image texture and a Linear fill (different angle) for crosshatch in the shadows. The contrast between flowing and straight creates visual richness.
- **Keep Wave Height proportional to Interval.** A wave height of 50 with an interval of 1 mm means adjacent waves overlap dramatically. This can be intentional (dense, chaotic texture) or accidental (illegible mess). If your result looks muddy, either reduce Wave Height or increase Interval.
- **Horizontal subjects want horizontal waves.** Match the angle to the dominant direction of your subject. Landscapes: 0°. Portraits: 80--90°. Diagonal compositions: 30--60°. Fighting the natural grain usually looks wrong (unless that tension is the point).

---

*Previous: [Linear: The Engraver's Line](202-linear.md) | Next: [Circular: Concentric Rings](204-circular.md)*
