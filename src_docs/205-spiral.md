# Spiral: The Continuous Wind

One line. Just one. It starts at a center point and winds outward in an ever-expanding spiral, never lifting, never breaking, never intersecting itself. That single continuous stroke traverses your entire image, thickening over dark regions, thinning over light ones, carrying the full tonal range of your photograph in a single unbroken path.

Spiral is the most meditative fill in Vexy Lines. Where Linear is industrial and Circular is geometric, Spiral is organic --- closer to a fingerprint, a nautilus shell, or the grooves of a vinyl record.

---

## What It Looks Like

A single line coils outward from a center point like a watchspring unwinding. The spacing between coils is governed by the Interval parameter. The weight of the line fluctuates as it crosses lighter and darker areas of your source image. From a distance, the spiral reconstructs the photograph's tones with remarkable fidelity. Up close, the single unbroken path is visible --- and its continuity is part of the aesthetic appeal.

At tight intervals, the spiral fills the canvas so densely that the coils are barely distinguishable from concentric circles. At wide intervals, the spiral path is clearly visible and the gaps between coils become a design element.

---

## When to Use Spiral

- **Vinyl record and turntable art:** The most literal visual match. Place the center, tighten the interval, monochrome.
- **Fingerprint aesthetics:** Tight spiral on a portrait, centered on a fingertip or an eye. Forensic meets artistic.
- **Hypnotic and psychedelic imagery:** The continuous winding path naturally draws the eye inward (or outward, depending on the viewer's state of mind).
- **Single-stroke novelty:** The entire image rendered as one continuous line has an intrinsic wow factor. Useful for pen-plotter art, CNC engraving, and laser cutting where a single continuous path is mechanically advantageous.
- **Meditative and contemplative compositions:** The spiral is ancient symbolism --- growth, journey, return. Use it when the subject matter warrants that resonance.

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Center X** | Horizontal origin of the spiral, in pixels from the left. | Click the canvas to place interactively. Typically on the subject's focal point. |
| **Center Y** | Vertical origin of the spiral, in pixels from the top. | Click the canvas to place interactively. |
| **Interval** | Distance between adjacent coils, in mm. | 0.5 mm for dense, record-like spirals. 1.5 mm for balanced detail. 4--6 mm for visible coil structure. |
| **Direction** | Clockwise (CW) or counter-clockwise (CCW). | CW default. CCW for left-handed energy. Layer both for a double-spiral. |
| **Stroke Thickness** | Brightness-to-weight mapping. Linear, Thick, or Thin modes. | Linear for balanced tonal reproduction. |
| **Smoothing** | Controls how smoothly the stroke weight transitions. | 30--50 for general use. Higher for gentle, flowing weight changes. |
| **Image Threshold** | Histogram handles for brightness range. | Full range default. Narrow to isolate tones. |
| **Randomization** | Adds irregularity to the spiral path. | 0% for perfect mathematical spiral. 5--10% for organic wobble. |
| **Dynamic Color** | Strokes sample source image colours. Segment length controls fidelity. | On with 2--4 mm segments for colour work. Off for monochrome. |
| **Multiplier** | Scales overall stroke width. | 1.0 default. Increase for bolder presence. |

---

## Step-by-Step: Eye Close-Up as a Single Unbroken Spiral

This walkthrough transforms a close-up photograph of an eye into a single continuous spiral line, creating a hypnotic, fingerprint-like image.

### 1. Choose your image

Select a tight close-up of an eye --- ideally filling most of the frame. The image should have strong contrast: a dark pupil, coloured iris, bright sclera, and defined eyelashes. Crop tightly if needed. The drama of this technique depends on the eye dominating the composition.

### 2. Add a Spiral fill

Click **+** in the Layers Panel. Select **Spiral**. A spiral appears immediately, likely centered on the canvas midpoint.

### 3. Place the center on the pupil

Click the **Center** target, then click directly on the center of the pupil. The spiral now winds outward from the darkest part of the eye.

### 4. Set the coil density

- **Interval:** 0.8 mm. Dense enough to capture iris detail and eyelash texture but open enough to see the spiral structure.

### 5. Choose direction

- **Direction:** CW (clockwise). This is a creative choice. Try both and see which feels right for the composition. CW spirals typically feel like expansion; CCW feels like contraction.

### 6. Configure weight mapping

- **Stroke Thickness:** Linear mode.
- **Smoothing:** 40. The eye has sharp transitions (pupil to iris to sclera), and moderate smoothing prevents the spiral from looking choppy at those boundaries.

### 7. Adjust the threshold

Keep the Image Threshold at full range. The eye's natural contrast --- black pupil, coloured iris, white sclera, dark eyelashes --- provides all the tonal information the spiral needs.

### 8. Evaluate

Zoom out. The spiral should render the eye recognisably: heavy coils through the pupil, medium weight through the iris, thin coils across the sclera, heavy again at the eyelashes. The continuous winding path creates a fingerprint-like quality that transforms the eye from a photograph into something almost forensic.

If the iris detail is muddy, tighten the interval to 0.5 mm. If the spiral looks too dense overall, widen to 1.2 mm.

### 9. Optional: Dynamic Color

Enable Dynamic Color with a segment length of 3 mm. The spiral picks up the iris colour as it crosses, then shifts to skin tone outside the eye, creating a colour map embedded in the single continuous line.

---

## Creative Variations

### Tight Fingerprint

Interval at 0.3--0.5 mm. The coils pack so tightly that the spiral structure almost disappears, leaving what looks like a fingerprint pressed into the image. Apply to a portrait for forensic surrealism. The subject is recognisable, but every contour of their face is rendered in the language of biometric identification.

### Wide Topographic Spiral

Interval at 4--6 mm. Applied to a landscape, the wide coils resemble contour lines on a topographic map, but with a spiral origin point. Place the center on a mountain peak or a lake. The result suggests a map made by someone who measures distance in revolutions rather than straight lines.

### Double Spiral (CW + CCW)

Two Spiral fills sharing the same center point, one clockwise and one counter-clockwise:

- Fill 1: Direction CW, Interval 1.5 mm, colour black.
- Fill 2: Direction CCW, Interval 1.5 mm, colour dark grey (or a second colour).

The two spirals intersect, creating a lattice of diamond-shaped cells that shrink toward the center and expand outward. The overall pattern suggests a rope or cable cross-section. Where image darkness increases, both spirals thicken, and the lattice becomes denser.

### Offset Dual Spirals

Two Spiral fills with *different* center points --- one on each eye of a portrait, for example. Each spiral claims its territory, and where they overlap, the density doubles. The composition suggests two competing forces, two gravitational wells, two focal points fighting for attention. Mask each to its respective half of the face for cleaner separation, or let them overlap for controlled chaos.

### Pen-Plotter Optimised

Spiral is the ideal fill for pen-plotter output because it is a single continuous path. Set Interval to 1.0--1.5 mm (matching your pen tip width), disable Randomization (plotters prefer clean geometry), and export as SVG. The plotter draws the entire image without ever lifting the pen. Total draw time depends on canvas size and interval, but the continuous path eliminates the start-stop hesitation marks that multi-stroke fills produce on plotters.

---

## Tips

- **Spiral is inherently single-stroke.** Unlike Linear (which draws hundreds of independent lines) or Circular (which draws hundreds of independent rings), Spiral draws exactly one path. This has practical implications: it exports as a single SVG path element, it plots in one continuous motion, and it has a natural start-to-end narrative.
- **Center placement determines density distribution.** Coils are tightest near the center and widest at the edges. If you place the center on the subject's eye, the eye gets the finest detail and the background gets the coarsest. If you place it in a corner, the opposite corner gets the least detail.
- **Interval below 0.3 mm creates extremely long paths.** A spiral covering a 200x200 mm canvas at 0.2 mm interval produces a single path that is kilometres long. This can slow rendering and choke SVG editors. If you need extreme density, consider Circular instead (which produces separate rings and handles better in downstream tools).
- **Direction is subtle but real.** Most viewers cannot consciously distinguish CW from CCW spirals, but the choice affects how the stroke weight pattern aligns with the image. Try both directions and compare. One will usually "fit" the image's tonal gradients better.
- **Spiral + Circular combines beautifully.** A Spiral fill for the main image with a [Circular](204-circular.md) fill (same center, wider interval, different colour) adding emphasis creates depth. The spiral provides continuous flow; the circles provide periodic punctuation.
- **Export considerations:** Because the spiral is one continuous path, some vector editors may display it as a single selectable object. This is usually an advantage (easy to recolour, scale, or move) but can be surprising if you expect per-ring editing like Circular provides.

---

*Previous: [Circular: Concentric Rings](204-circular.md) | Next: [Radial: Exploding Rays](206-radial.md)*
