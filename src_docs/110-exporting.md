# Getting Your Art Out

The artwork exists inside Vexy Lines. Now it needs to exist outside it — as a file you can print, publish, email, or open in another design application. Exporting is the last step in every project and the one where format choices actually matter.

## The Export Command

**File > Export** opens the export dialog. Choose a format, choose a destination, click Export. That's the simple version.

The thoughtful version: which format depends on what you're doing with the file.

## Vector Formats

Vector exports contain the actual mathematical curves that Vexy Lines generates. They scale to any size without quality loss, can be edited in other vector applications, and are the primary reason you're using Vexy Lines instead of a Photoshop filter.

### SVG (Scalable Vector Graphics)

**Best for:** Web, Illustrator, Affinity Designer, Inkscape, general-purpose vector exchange.

SVG is the universal vector format. Every web browser renders it. Every vector design application opens it. If you're not sure which format to use, use SVG.

SVG files from Vexy Lines contain path elements — one `<path>` per stroke — with stroke attributes (colour, width) preserved. The source image is never included. The file is XML text, so it's human-readable (if you enjoy reading XML) and compressible.

**File size considerations:** A document with thousands of fine strokes at a small Interval produces a large SVG — potentially tens of megabytes. This is the nature of detailed vector artwork: each stroke is a path definition with control points. If file size matters (web delivery, email), consider increasing Interval slightly to reduce stroke count, or use raster export for web display.

### PDF (Portable Document Format)

**Best for:** Print shops, sharing with non-designers, archival.

PDF wraps vector content in a format that every computer can display, regardless of installed software. Print shops universally accept PDF. Recipients who don't have Illustrator or Inkscape can still view and print a PDF.

Vexy Lines PDF exports contain the same vector path data as SVG, wrapped in the PDF container format. The quality is identical — no rasterisation occurs during export.

**When to choose PDF over SVG:** When the recipient needs to view or print the file without vector editing software. When submitting to a print service. When archiving, since PDF is an ISO standard with long-term preservation guarantees.

### EPS (Encapsulated PostScript)

**Best for:** Legacy print workflows, older versions of design software.

EPS is the veteran format of professional printing. It's been around since the 1980s and some established print workflows still require it. If your print shop asks for EPS, Vexy Lines can deliver.

For any new project where you have a choice, SVG or PDF is preferable. EPS doesn't support some modern features (like transparency), and it's gradually being retired across the industry.

## Raster Formats

Raster exports render your vector artwork into a pixel grid at a specific resolution. The output is a conventional image file — useful for web display, social media, and contexts where vector files aren't supported.

### PNG (Portable Network Graphics)

**Best for:** Web images with transparency, social media, digital display.

PNG supports transparency, so areas of your canvas without strokes export as transparent rather than white. This is valuable when you want to composite your vector artwork over a background in another application.

PNG is lossless — no compression artifacts. The trade-off is larger file size compared to JPEG.

**Resolution matters for raster exports.** Your document's DPI setting (in document properties) and dimensions determine the pixel dimensions of the exported PNG. A 10-inch-wide document at 300 DPI exports as a 3000-pixel-wide PNG. At 96 DPI, the same document exports at 960 pixels wide. Set your DPI appropriately before exporting. See [Creating a New Document](105-new-document.md) for guidance on resolution.

### JPEG (Joint Photographic Experts Group)

**Best for:** Web images without transparency, email attachments, contexts where file size matters.

JPEG doesn't support transparency — empty areas export as white (or whatever your canvas background colour is). It uses lossy compression, which reduces file size at the cost of slight quality loss. For vector artwork with clean, high-contrast strokes, JPEG compression artifacts can be visible along stroke edges at lower quality settings. Use a quality setting of 90% or higher for clean results.

**When to choose JPEG over PNG:** When file size matters more than transparency. When uploading to platforms that don't handle PNG transparency well. When emailing to recipients who might struggle with PNG files (increasingly rare, but it happens).

## Export Formats Comparison

| Format | Type | Transparency | Scalable | Editable | Best For |
|--------|------|-------------|----------|----------|----------|
| **SVG** | Vector | Yes | Yes | Yes | Web, design apps, general use |
| **PDF** | Vector | Yes | Yes | Limited | Print, sharing, archival |
| **EPS** | Vector | No | Yes | Yes | Legacy print |
| **PNG** | Raster | Yes | No | No | Web, social media, compositing |
| **JPEG** | Raster | No | No | No | Web, email, small file size |

## Exporting Layers Separately

By default, Vexy Lines exports the entire visible document — all visible layers composited together into one file.

You can also export individual layers or groups as separate files. This is essential for:

- **Screen printing:** Each fill layer becomes a separate colour plate. Export each layer as its own SVG, and each file represents one pass of the press.
- **Design flexibility:** Export each fill separately, then composite them in Illustrator or Affinity Designer with additional design elements.
- **Experimentation:** Export several variations (with different layers visible) to compare them side by side.

To export a single layer: hide all other layers (click their eye icons in the Layers Panel), then export. Only visible layers appear in the export.

To export a group: hide everything outside the group, then export. All visible layers within the group composite into the exported file.

## Clipboard Export

This is the fastest path from Vexy Lines to another design application.

1. Select the layers you want to copy (or ensure the right layers are visible).
2. Press **Cmd+C** (macOS) / **Ctrl+C** (Windows).
3. Switch to Illustrator, Affinity Designer, or another application.
4. Press **Cmd+V** / **Ctrl+V** to paste.

The clipboard contains vector data. Pasted strokes arrive as editable vector paths in the destination application. You can then edit individual strokes, apply different styles, or integrate them into a larger composition.

**Clipboard vs. file export:** Clipboard is faster for quick transfers to an open application. File export is better for archival, sending to others, and workflows where you need a persistent file.

**Compatibility notes:** Clipboard vector transfer works well with Adobe Illustrator and Affinity Designer on both macOS and Windows. Other applications may receive pasted content as a raster image instead of vector paths — this depends on the receiving application's clipboard handling, not on Vexy Lines.

## Screen-Print Separation

Vexy Lines is unusually well-suited to screen printing because each fill layer is already a discrete set of single-colour strokes — which is exactly what a screen-printing plate needs.

**Basic separation workflow:**

1. Create your document with multiple fill layers, each in a different colour.
2. For each layer:
   a. Hide all other layers.
   b. Export as SVG.
   c. Name the file by its colour: `portrait-black.svg`, `portrait-red.svg`, etc.
3. Send the set of SVGs to your screen printer. Each file is one plate.

For more sophisticated separation — including halftone screens, registration marks, and overprint simulation — see Part 5 of this manual.

## Export Checklist

Before you click Export, verify:

- [ ] **Correct layers visible.** Hidden layers don't export. Unhidden layers you meant to hide *do* export.
- [ ] **Resolution appropriate** (for raster exports). Check DPI in document properties.
- [ ] **Format matches purpose.** Vector for editing/scaling/printing. Raster for display/web.
- [ ] **File name and destination.** Don't overwrite a previous export you want to keep.
- [ ] **Refresh completed.** If Auto Refresh is off, run **Refresh All** before exporting to ensure the output matches your current parameter settings. See [Controlling When Vexy Recalculates](112-refresh-controls.md).

## What Doesn't Export

- **The source image.** It's the brightness map fills read from — it never becomes part of the output.
- **Hidden layers.** Only visible layers export.
- **Masks themselves.** Masks control where fills appear, but the mask image doesn't export. The export contains only the masked result — strokes that are visible after masking.
- **The canvas background** (in vector exports). SVG, PDF, and EPS exports have a transparent background. The strokes float on nothing. In raster exports, the background fills with white (PNG with transparency preserves the transparency; JPEG fills with the canvas background colour).

## Next Steps

Your artwork is exported. Before you close the document, make sure it's saved — [Save, Backup, Recover](111-saving.md) covers the `.lines` file format, Auto Save, and backup strategies. And if your exports look different from what you see on screen, check [Controlling When Vexy Recalculates](112-refresh-controls.md) to ensure your renders are up to date.
