# Portrait Engraving

A human face rendered entirely in parallel lines — thick where the shadows fall, thin where the light catches, crossing at angles to build density in the darkest regions. This is copper-plate engraving, a technique that took master printmakers weeks of hand-cutting with a burin. In Vexy Lines, it takes about twenty minutes and produces output that hangs comfortably next to the hand-cut originals.

This article walks through the entire project: choosing a photo, building the layer stack, masking each region, tweaking parameters, and exporting for both screen and print.

---

## Choosing the Source Photo

The engraving look lives and dies on contrast. Your source photo needs:

- **Strong directional lighting.** Three-quarter lighting (one side of the face brighter than the other) is ideal. It creates the shadow gradients that crosshatching needs to be expressive. Flat, even lighting produces flat, even engravings — technically correct but visually dull.

- **High tonal range.** Deep shadows under the chin, bright highlights on the forehead and cheekbones. If the histogram is clustered in the midtones, the engraving will lack punch. Consider increasing contrast in a photo editor before importing.

- **Clean background.** A busy background competes with the portrait. A simple gradient, a solid colour, or a slightly out-of-focus environment works best. You can always mask the background separately.

- **Resolution: at least 2000 px on the long side.** Vexy Lines reads brightness at the pixel level. Too few pixels mean too little detail for tight-interval fills to work with. 3000–4000 px is comfortable.

### Photo Prep Tips

Before importing into Vexy Lines:

1. **Convert to greyscale** in your photo editor. This lets you evaluate the tonal range without colour distraction. (Vexy Lines converts to greyscale internally, but seeing it yourself helps you make better threshold decisions.)

2. **Increase contrast slightly.** Pull the blacks down and the whites up in Levels or Curves. You want the shadow side of the face to be genuinely dark (brightness 20–60), not muddy grey (brightness 80–120).

3. **Crop tight.** Head and shoulders is the classic engraving frame. If the subject is small in the photo, crop before importing — this means more pixels for the face, which means more detail in the fill.

4. **Remove distracting elements.** A logo on a t-shirt, a stray hair across the forehead, a bright earring — these will all generate strokes. Clean them up or plan to mask around them.

---

## The Layer Stack

This is a six-layer composition. Build it from bottom to top.

| Layer | Fill | Interval | Angle | Thickness | Threshold | Mask | Purpose |
|-------|------|----------|-------|-----------|-----------|------|---------|
| 1 | Circular | 4.0 mm | — | Linear, 0.3 mm max | Highlights (170–255) | Background only | Subtle radial halo behind the head |
| 2 | Linear | 2.0 mm | 15° | Linear, 0.8 mm max | Full range (0–255) | Face + neck | Primary shading — the dominant visual |
| 3 | Linear | 1.8 mm | 75° | Thin, 0.5 mm max | Shadows (0–100) | Face + neck | Crosshatch — adds density in darks |
| 4 | Scribble | 2.0 mm | — | Linear, 0.6 mm max | Midtones (40–180) | Hair only | Organic hair texture |
| 5 | Linear | 1.0 mm | 15° | Thick, 1.2 mm max | Deep shadows (0–60) | Face + neck | Extreme shadow weight |
| 6 | Trace | — | — | Fixed 0.3 mm | Full range | Full canvas | Contour outlines |

---

## Building It: Step by Step

### Step 1: Open the Photo

File > New. Drag your portrait onto the canvas. The photo becomes the source image — the brightness map that every fill will read.

### Step 2: Background Halo (Layer 1)

Add a **Circular** fill. Set the center point behind the subject's head (drag the Center X/Y controls or click the canvas while holding the center-set modifier). Set interval to 4.0 mm — wide and airy. Set thickness to Linear mode with a max of 0.3 mm — barely visible.

Set Image Threshold to highlights only: drag the left (shadow) handle to 170. The Circular fill now only generates rings where the source image is bright — which, if the background is lighter than the face, means the rings appear behind the head as a gentle radial glow.

Mask this fill to the background area (everything except the subject). Use auto-detection on the background, or paint a mask with the Brush.

### Step 3: Primary Shading (Layer 2)

Add a **Linear** fill. This is the main event — the parallel lines that create the engraving look.

- **Interval: 2.0 mm.** Tight enough for detail, wide enough that individual lines remain distinct.
- **Angle: 15°.** Slightly off-horizontal. Pure 0° looks mechanical; 15° has the subtle diagonal that traditional engravers use.
- **Thickness: Linear mode, max 0.8 mm.** Dark areas get 0.8 mm strokes. Light areas get near-zero strokes. The smooth linear mapping is the most natural for portraiture.
- **Threshold: Full range (0–255).** This layer handles everything — it's the backbone of the portrait.
- **Smoothing: 60.** Enough to eliminate pixelation artefacts, not so much that the lines lose crispness.

Mask this fill to the face and neck. Use auto-detection to grab the skin area, then refine with the Brush (see [Painting Masks with the Brush](402-brush-mask.md)).

### Step 4: Crosshatch Layer (Layer 3)

Add another **Linear** fill. This one crosses Layer 2's strokes to create density in the shadows.

- **Interval: 1.8 mm.** Slightly tighter than Layer 2 for increased shadow density.
- **Angle: 75°.** The 60-degree difference from Layer 2's 15° creates the classic crosshatch pattern. The strokes cross visibly without being perpendicular (which can look too rigid).
- **Thickness: Thin mode, max 0.5 mm.** Thinner than Layer 2 so the crosshatch is subordinate to the primary shading.
- **Threshold: Shadows only (0–100).** Drag the right (highlight) handle to 100. This layer only activates in the darkest regions — under the chin, beside the nose, in the eye sockets. Midtones and highlights remain single-direction lines from Layer 2.

Mask to the same face region as Layer 2. Copy Layer 2's mask (right-click > Copy Mask, then right-click Layer 3 > Paste Mask).

### Step 5: Hair Texture (Layer 4)

Add a **Scribble** fill.

- **Interval: 2.0 mm.**
- **Thickness: Linear, max 0.6 mm.**
- **Randomization: 40%.** Enough to feel organic and hair-like, not so much that it becomes noise.
- **Threshold: Midtones (40–180).** Avoids the deepest shadows (which would over-darken) and the brightest highlights (which would scatter strokes into shiny areas).

Mask to the hair only. Auto-detect the hair area or paint it with the Brush. The Scribble fill's chaotic strokes contrast with the disciplined lines on the face, communicating the different textures of skin and hair.

### Step 6: Deep Shadow Weight (Layer 5)

Add one more **Linear** fill for the very darkest areas.

- **Interval: 1.0 mm.** Tight — this layer only activates in small regions, so the density won't overwhelm.
- **Angle: 15°.** Same as Layer 2. These strokes reinforce the primary direction in the deepest shadows, adding weight without introducing a new angle.
- **Thickness: Thick mode, max 1.2 mm.** Heavy strokes that create near-solid black in the deepest shadow pools.
- **Threshold: Deep shadows only (0–60).** Only the very darkest pixels trigger this layer.

Mask to the face. The tight threshold means this layer is mostly invisible — it only appears under the chin, in the deepest eye-socket shadows, and along the shadow side of the nose. But where it appears, it anchors the portrait with convincing darkness.

### Step 7: Contour Outlines (Layer 6 — Top)

Add a **Trace** fill on top of everything.

- **Smoothing: 70.** Clean curves without over-smoothing.
- **Min Spot Size: 3 px.** Ignores tiny noise contours.
- **Stroke Thickness: 0.3 mm fixed.** Thin, delicate outlines that frame features without competing with the shading.
- **Threshold: Full range.** Let the Trace algorithm decide which edges matter.

No mask — the outlines render across the entire canvas, framing the face, the hair, the background elements, and the silhouette.

---

## Evaluating the Result

Zoom out to see the full composition. You should see:

- **Face:** Dense parallel lines at 15° with crosshatching at 75° in the shadows. The nose, lips, and eyes are defined by both the shading density and the Trace outlines.
- **Hair:** Organic scribble texture, distinct from the structured face.
- **Background:** Subtle concentric rings creating a radial glow behind the head.
- **Shadows:** Near-solid black in the deepest areas, built by three layers (primary shading + crosshatch + deep shadow).
- **Highlights:** Delicate single-direction lines, widely spaced, on the forehead and cheekbones.

If the portrait looks too light overall, tighten the intervals on Layers 2 and 3 (try 1.5 mm and 1.3 mm). If it looks too dark, widen them (try 2.5 mm and 2.2 mm) or narrow the threshold ranges.

---

## Export

- **SVG** for further editing in Illustrator, Affinity Designer, or Inkscape. The vector paths are fully editable.
- **PDF** for print production. Set the canvas size to your target print size before exporting.
- **PNG at 300 DPI** for web display or social media. The raster output preserves every line but can't be scaled up.

For large-format printing (posters, gallery prints), see [Preparing Files for Print](511-print-preparation.md).

---

## Variations

| Variation | Change |
|-----------|--------|
| Woodcut style | Increase all intervals by 50%, set all thickness modes to Thick, add 20% Randomization |
| Fine-line engraving | Decrease all intervals by 30%, set all thickness modes to Thin, reduce max thickness to 0.3 mm |
| Single-line (no crosshatch) | Remove Layer 3 (crosshatch) and Layer 5 (deep shadow). Relies on Line 2 alone. Cleaner, simpler, less tonal range. |
| Dynamic Color portrait | Enable Dynamic Color on Layer 2. The primary shading strokes sample skin tones, lip colour, eye colour from the source photo. Striking with a colour source image. |
| Negative engraving | Invert thresholds on all layers. White strokes on a dark background. Set canvas colour to black. |

*Next: [Landscape and Nature](503-landscape-illustration.md)*
