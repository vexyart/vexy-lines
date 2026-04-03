# Radial: Exploding Rays

Picture a flashlight beam caught on film: rays shooting outward from a single brilliant point, fanning across everything they touch. Radial fill draws exactly that --- lines radiating from a center point like spokes on a wheel, like sunbeams through clouds, like the propaganda poster you have seen a hundred times and still find compelling. Each ray's thickness responds to the brightness beneath it, thickening through dark regions and thinning through light ones.

Where [Circular](204-circular.md) draws rings and [Spiral](205-spiral.md) draws coils, Radial draws rays. Same center point concept, completely different geometry, completely different emotional register. Circular is meditative. Spiral is hypnotic. Radial is explosive.

---

## What It Looks Like

Straight lines extend outward from a single origin, evenly distributed around 360 degrees. Near the center, the rays converge and the density is extreme. As they fan outward, the gaps between rays widen. Each ray's stroke weight fluctuates as it crosses lighter and darker areas of the source image.

At the default density, the effect resembles a woodcut sunburst: bold radiating lines that carry tonal information in their weight variations. At high density, the rays pack tight enough to reproduce the photograph with near-photographic fidelity near the center, fading to loose strokes at the edges. At low density, each ray is a distinct bold slash from center to periphery.

---

## When to Use Radial

- **Sunburst and starburst imagery:** The literal visual metaphor. Light source at center, rays expanding outward.
- **Propaganda and political poster aesthetics:** The Soviet sunburst, the Japanese rising sun, the campaign rally flyer. Radial is inherently dramatic, assertive, and commanding.
- **Portrait with dramatic lighting:** Place the center at the light source position (a lamp, a window, the sun behind the subject) and the rays emanate from the actual source of illumination.
- **Spiderweb compositions:** Layer Radial with [Circular](204-circular.md) at the same center point for a web-like pattern. See [Combining Fills](214-combining-fills.md).
- **Religious and spiritual iconography:** Halos, auras, divine light. Radial is the fill type of revelation.
- **Eye and iris close-ups:** The natural radial structure of the iris aligns perfectly with radial rays.

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Center X** | Horizontal origin of the rays, in pixels from the left. | Click the canvas to place. For sunbursts: the light source. For portraits: the dominant eye or the face center. |
| **Center Y** | Vertical origin of the rays, in pixels from the top. | Click the canvas to place. |
| **Distance** | Radius of empty space around the center point, in mm. Creates a clear circle at the origin where no rays are drawn. | 0 mm for rays starting at the center. 5--10 mm for a visible "pupil" or hub. 20+ mm for a wide open core. |
| **Auto Distance** | When enabled, Vexy Lines calculates the optimal empty-center radius to prevent extreme density where rays converge. | Enable for most uses. Disable when you want rays packed tight at the origin. |
| **Random Distance** | Varies the starting position of each ray randomly, so rays do not all begin at the same radius. | 0 for uniform starts. 5--15 for organic, staggered ray origins. 30+ for dramatically varied starts. |
| **Stroke Thickness** | Brightness-to-weight mapping. Linear, Thick, or Thin modes. | Thick mode works well for dramatic subjects. Linear for balanced rendering. |
| **Smoothing** | Reduces abrupt weight changes along each ray. | 20--40 for general use. Higher for smooth gradients. |
| **Image Threshold** | Histogram handles for brightness range. | Full range default. Narrow to target specific tones. |
| **Randomization** | Adds angular jitter to ray placement, breaking the even distribution. | 0% for precise, mechanical rays. 5--15% for natural scatter. 40%+ for explosive chaos. |
| **Dynamic Color** | Rays sample source image colours. Segment length controls fidelity. | On with 3--5 mm segments for colour work. Off for monochrome. |
| **Multiplier** | Scales overall stroke width. | 1.0 default. 1.5--2.0 for poster-bold rays. |

---

## Step-by-Step: Portrait with Light-Source Origin

This walkthrough creates a dramatic portrait where radial rays emanate from the position of the light source, as if the illumination itself is made visible.

### 1. Choose your image

Select a portrait with dramatic side lighting --- strong light from one direction, deep shadows on the opposite side. Studio portraits with a single key light work perfectly. The light source should be implied (off-camera) or visible (a lamp, a window).

### 2. Add a Radial fill

Click **+** in the Layers Panel. Select **Radial**. Rays appear from the canvas center.

### 3. Place the center at the light source

Determine where the light is coming from. If it is a window on the left side, place the center just off the left edge of the canvas --- or at the brightest point on the subject's face (the cheekbone catching the light). Click the **Center** target, then click that position.

The rays now radiate from the implied light source, reinforcing the photograph's natural illumination.

### 4. Set the Distance parameter

- **Distance:** 0 mm if the center is off-canvas or at the edge (rays will start from outside the visible area, appearing as near-parallel lines entering the frame).
- **Distance:** 10 mm if the center is on-canvas, creating a small clear hub.
- **Auto Distance:** Enable. This prevents extreme density congestion at the origin.

### 5. Configure the rays

- **Stroke Thickness:** Thick mode. The dramatic lighting deserves weight.
- **Smoothing:** 30.
- **Randomization:** 5%. Just enough irregularity to prevent the mechanical look.
- **Random Distance:** 8. Staggered starting points add organic quality.

### 6. Adjust the threshold

Open the Image Threshold. For dramatic portraits, consider pulling the highlight handle left to about 80%. This suppresses the brightest areas, letting the rays focus on mid-to-dark tones. The lightest skin (where the light hits directly) stays relatively open, while shadows and mid-tones receive thick, bold rays.

### 7. Evaluate

Zoom out. The rays should emanate from the light source direction, thickening through the shadowed side of the face and thinning on the illuminated side. The composition should feel like the light itself has been made tangible --- frozen beams radiating from their origin.

### 8. Optional: Add background contrast

If the background is distracting, add a second fill --- a [Linear](202-linear.md) fill at a contrasting angle with a wide interval (5 mm) and its threshold narrowed to just the background tones. Mask it to exclude the face. The background gets a different texture, separating the subject from the environment.

---

## Creative Variations

### Soviet Propaganda Poster

Bold, high-contrast, unapologetic. Start with a high-contrast portrait or figure.

- **Interval parameters:** Default (ray density is controlled by Vexy Lines' automatic distribution).
- **Distance:** 15 mm (visible empty circle at the center).
- **Randomization:** 0%. Perfect mechanical precision is part of the propaganda aesthetic.
- **Random Distance:** 0. All rays start at exactly the same radius.
- **Stroke Thickness:** Thick mode, Multiplier 2.0.
- **Image Threshold:** Narrow to the darkest 50%. Eliminate all subtlety.
- **Colour:** Red rays on white, or white rays on red. Two fills: one for the figure (black), one for the background rays (red).

Place the center behind the figure's head. The subject becomes a silhouette backlit by radiating beams. Export. Print. Foment.

### Sunburst Background

Radial as background texture, not as the primary fill.

- Place the center at the top-center of the canvas, or at a corner.
- Set Distance to 0 mm, Random Distance to 0.
- Use a very wide threshold (full range) with a muted colour (pale yellow, light gold).
- Layer a different fill type (Linear, Trace, or Halftone) on top for the subject matter.

The Radial rays become a subtle background pattern --- the classic "rising sun" behind a foreground illustration. Mask the Radial fill to exclude the subject area for clean separation.

### Spiderweb: Radial + Circular

Layer a Radial fill and a [Circular](204-circular.md) fill using the same center point:

- Radial: default density, colour dark grey.
- Circular: Interval 3 mm, colour black.

The crossing of radial spokes and concentric rings creates a web-like lattice. Both fills respond to the source image's brightness, so the web is dense in dark areas and sparse in light areas. The visual metaphor is irresistible for photographs of insects, abandoned spaces, or anything tangled.

### Iris Close-Up

Apply Radial to a macro photograph of an eye, centered directly on the pupil. The radial rays align with the natural radial fibres of the iris. Set Distance to match the pupil radius (so the dark pupil remains empty). The result: a vector recreation of the iris structure, each ray carrying the colour and tonal variations of the actual eye.

- **Distance:** 8--15 mm (matching pupil size).
- **Interval-equivalent density:** Default, letting rays fan naturally.
- **Dynamic Color:** On, segment length 2 mm.
- **Smoothing:** 50 (irises have smooth tonal gradients).

### Explosive Burst

Maximum energy. Randomization at 40%. Random Distance at 30. Multiplier at 2.5. Apply to a high-contrast action photograph. The rays scatter and vary wildly, creating an explosion of line emanating from the center. More expression than representation --- the image is there, encoded in the ray weights, but the dominant impression is kinetic energy.

---

## Tips

- **Distance prevents center congestion.** Where all rays converge, density approaches infinity. The Distance parameter (and Auto Distance) solve this by creating a clear zone at the center. If your center area looks like a solid blob, increase Distance or enable Auto Distance.
- **Random Distance adds natural quality.** Real sunbeams do not all start at the same point. Setting Random Distance to 5--15 staggers the ray origins, which is particularly important when the center is visible on the canvas.
- **Radial works best with a clear focal point.** An image with a natural center of interest (a face, a light source, a circular object) gives the radial rays a logical origin. An image with distributed interest (a crowd, a cityscape) has no natural center, and the radial pattern can feel arbitrary. In those cases, consider [Linear](202-linear.md) or [Halftone](207-halftone.md) instead.
- **Off-canvas center creates directional light.** Move the center far off to one side. The rays enter the canvas as near-parallel lines converging from that direction. The effect suggests directional illumination without the bullseye concentration of an on-canvas center.
- **Radial rays thin toward the edges.** Because rays fan apart as they travel outward, edge areas of the canvas naturally receive less ink coverage than areas near the center. This is physically accurate (light falls off with distance) but can leave canvas corners looking empty. If that bothers you, add a subtle secondary fill (Linear or Wave) to fill the sparse edges.
- **Combine with masks for dramatic reveals.** Mask the Radial fill to only appear in the background behind a subject. The subject itself gets a different fill (Trace for outlines, Linear for shading). The radial rays become a dramatic halo or backdrop.

---

*Previous: [Spiral: The Continuous Wind](205-spiral.md) | Next: [Halftone: Dots and Shapes](207-halftone.md)*
