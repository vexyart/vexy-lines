# Building a Style Library

You just spent ninety minutes crafting a seven-layer composition with perfectly tuned crosshatch angles, carefully balanced thresholds, and a Trace outline layer with exactly the right smoothing value. It looks magnificent. Now you need to apply the same look to thirty more images for a client's annual report.

You could rebuild those seven layers from memory for each image. Or you could save the style once and transfer it to every image in seconds.

A **style** in Vexy Lines is the complete set of fill layers, parameters, masks, and groups in a .lines document — everything except the source image. Swap the source image and the style reinterprets the new photograph through the same algorithmic lens. This is style transfer, and it's how you turn a one-off experiment into a repeatable creative tool.

---

## What a Style Contains

When you save a .lines file, it stores:

| Element | Stored | Transferred |
|---------|--------|------------|
| Fill layers (type, parameters) | Yes | Yes |
| Layer order | Yes | Yes |
| Masks | Yes | Yes (but may need adjustment for different compositions) |
| Groups and nesting | Yes | Yes |
| Mesh warping | Yes | Yes |
| Clone relationships | Yes | Yes |
| Source image | Yes | Replaced during transfer |
| Canvas size | Yes | Adjusted to match new source |

The source image is the only element that changes during style transfer. Everything else — the fill recipe — stays intact.

---

## Saving a Style Template

1. Build your composition on any source image. Get every parameter exactly right.
2. **File > Save As** with a descriptive name: `portrait-engraving-crosshatch.lines`, `landscape-atmospheric-depth.lines`, `pop-art-halftone-bold.lines`.
3. Store the file in a dedicated folder: `~/Vexy Styles/` or whatever naming convention you prefer.

That's it. The .lines file *is* the style template. No separate "style format" — the document itself carries all the information.

### Naming Conventions

As your library grows, naming matters. A recommended pattern:

```
[subject]-[technique]-[variant].lines
```

Examples:

- `portrait-crosshatch-classic.lines`
- `portrait-crosshatch-fine.lines`
- `portrait-halftone-pop.lines`
- `landscape-wave-atmospheric.lines`
- `landscape-fractal-dense.lines`
- `product-linear-technical.lines`
- `texture-scribble-organic.lines`

### Folder Organisation

```
~/Vexy Styles/
├── Portraits/
│   ├── portrait-crosshatch-classic.lines
│   ├── portrait-crosshatch-fine.lines
│   ├── portrait-halftone-pop.lines
│   └── portrait-trace-minimal.lines
├── Landscapes/
│   ├── landscape-wave-atmospheric.lines
│   └── landscape-fractal-dense.lines
├── Products/
│   ├── product-linear-technical.lines
│   └── product-halftone-catalog.lines
├── Textures/
│   ├── texture-scribble-organic.lines
│   └── texture-fractal-mathematical.lines
└── Screen Print/
    ├── screenprint-2color-bold.lines
    └── screenprint-3color-cmyk.lines
```

---

## Style Transfer: The Manual Method

The simplest way to apply a saved style to a new image:

1. **Open the style template** (.lines file).
2. **Replace the source image.** Drag your new photo onto the canvas (or use File > Replace Source Image). The fills immediately recalculate against the new photo's brightness data.
3. **Adjust masks.** The masks from the template were shaped for the original photo. If the new photo has a different composition (subject in a different position, different framing), you'll need to repaint or adjust the masks.
4. **Fine-tune thresholds.** Different photos have different tonal distributions. A template built on a high-contrast portrait may need threshold adjustments on a low-contrast portrait.
5. **Save As** with a new name (to preserve the template).

This takes 2–10 minutes per image depending on how much mask and threshold adjustment is needed.

---

## Style Transfer: The SDK/CLI Method

For batch processing — applying the same style to dozens or hundreds of images — use the command-line tools:

### Extract a Style

```bash
vexy-lines-cli style extract portrait-engraving.lines --output portrait-style.json
```

This extracts the fill parameters, layer structure, and mask data into a portable format.

### Apply a Style

```bash
vexy-lines-cli style apply portrait-style.json --source new-photo.jpg --output result.lines
```

The CLI creates a new .lines document with the extracted style applied to the new source image. The fills recalculate against the new photo automatically.

### Batch Apply

```bash
vexy-lines-cli style apply portrait-style.json --source-dir ./photos/ --output-dir ./results/
```

Every image in `./photos/` gets the style applied. The output directory fills with .lines files, each ready for export.

### Batch Export

```bash
vexy-lines-cli export --input-dir ./results/ --format svg --output-dir ./svgs/
```

All .lines files in the results directory export to SVG. The entire pipeline — style transfer + export — runs unattended.

---

## Style Interpolation

What happens when you blend two styles together? Style interpolation takes two style templates and generates a hybrid, with a blend factor controlling how much of each style appears in the result.

### How It Works

```bash
vexy-lines-cli style interpolate style-a.lines style-b.lines --blend 0.5 --output hybrid.lines
```

At blend 0.0, the result is 100% Style A. At blend 1.0, it's 100% Style B. At 0.5, it's a 50/50 mix.

The interpolation blends **numeric parameters**: intervals, angles, thresholds, thickness values, randomization, smoothing. Non-numeric properties (fill type, masks, colours) are taken from Style A when blend < 0.5 and Style B when blend ≥ 0.5.

### Practical Uses

- **Gradual transitions in a series.** For a set of 10 images (a gallery wall, an animation sequence, a book chapter), interpolate from Style A (sparse, light) to Style B (dense, dark) across the series. Each image gets a slightly different blend value, creating a visual progression.

- **Finding the sweet spot.** You built a bold engraving style and a delicate fine-line style. Neither is quite right. Interpolate at 0.3 (mostly bold with some delicacy) or 0.7 (mostly delicate with some weight) to find a hybrid that combines the best qualities.

- **Animation.** For video style transfer, interpolate across frames to create evolving visual textures. The style shifts gradually over time, creating a living, breathing aesthetic. See the video documentation for details.

---

## Your First Five Styles

If you're starting a style library from scratch, build these five first. They cover the most common use cases and give you a foundation to build variants from.

### 1. Classic Engraving

Based on the [Portrait Engraving](502-portrait-engraving.md) recipe. Linear at 15° + Linear at 75° for crosshatch + Trace outlines. Universal starting point for portraits and figurative work.

### 2. Atmospheric Landscape

Based on [Landscape and Nature](503-landscape-illustration.md). Wave for sky + Linear for midground + Fractal for foreground + Trace outlines. The interval gradient (wide-to-tight, top-to-bottom) creates depth in any landscape.

### 3. Pop Art Halftone

Based on the [Composition Recipes](409-composition-recipes.md) pop-art recipe. Halftone with Dynamic Color + bold Trace outlines. Works on any bold, simple composition.

### 4. Technical Line Drawing

Linear at 0° and 90° with zero randomization + Trace outlines at max smoothing. Clean, precise, mechanical. Works for product photography, architecture, and engineering subjects.

### 5. Organic Texture

Scribble background + Handmade detail + Fractal midlayer. The all-organic style — no straight lines, no grid patterns, no mechanical precision. Works for natural subjects, abstracts, and textures.

---

## Sharing Styles

A .lines file is a complete, self-contained style. To share:

- **Email or file share** the .lines file. The recipient opens it in Vexy Lines and replaces the source image with their own.
- **Publish to a shared folder** (Dropbox, Google Drive, network share). Team members pull templates as needed.
- **Include in a project repository.** If your team uses version control, styles can be committed alongside other project assets.

The only dependency is Vexy Lines itself. No plugins, no fonts, no external resources — everything is in the .lines file.

---

## Maintaining a Library

As your library grows past twenty or thirty styles, maintenance matters:

- **Delete styles you never use.** If you haven't touched `texture-fractal-experiment-7.lines` in six months, it's clutter.
- **Version your favourites.** When you improve a style, save it as a new version (`portrait-crosshatch-v2.lines`) rather than overwriting the original. You may want to go back.
- **Add notes.** Keep a text file (`style-notes.md`) alongside your library with one-line descriptions: "Classic engraving for high-contrast portraits, 6 layers, works best with faces lit from upper-left."
- **Test on diverse images.** A style built on one portrait may not work on all portraits. Test each template on at least 3–5 different source images before considering it "library-ready."

---

## Summary

| Action | How |
|--------|-----|
| Save style | File > Save As (the .lines file *is* the style) |
| Apply style manually | Open template → replace source image → adjust masks → Save As |
| Apply style via CLI | `vexy-lines-cli style apply style.json --source photo.jpg` |
| Batch apply | `vexy-lines-cli style apply style.json --source-dir ./photos/` |
| Interpolate styles | `vexy-lines-cli style interpolate a.lines b.lines --blend 0.5` |
| Extract style | `vexy-lines-cli style extract template.lines --output style.json` |

*Next: [Preparing Files for Print](511-print-preparation.md)*
