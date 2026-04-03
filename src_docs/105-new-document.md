# Creating a New Document

Every Vexy Lines project starts the same way: **File > New**. What happens next depends on whether you're starting from a photograph or a blank canvas. Both paths lead to the same place — a document ready for fills — but they get there differently.

## Two Paths to a New Document

### Path 1: Start with a Photo

This is the most common workflow. You have a photograph, a scan, an illustration, or any raster image, and you want to transform it into vector artwork.

**Drag and drop** your image file directly onto the Vexy Lines window or onto the application icon. Vexy Lines creates a new document sized to match your image, sets the image as the source, and you're ready to add fills.

Alternatively, use **File > New**, then drag your image onto the empty canvas, or use the import option to browse for a file.

**Supported image formats:**

| Format | Extension | Notes |
|--------|-----------|-------|
| JPEG | `.jpg`, `.jpeg` | The most common starting point. Slight compression artifacts won't affect fill generation. |
| PNG | `.png` | Lossless quality. Transparency is ignored — fills read brightness, not alpha. |
| TIFF | `.tif`, `.tiff` | Full quality, often from scanners. Large files are fine. |
| BMP | `.bmp` | Windows bitmap. Works, but you'll rarely encounter these outside legacy workflows. |
| SVG | `.svg` | Vector input is rasterised at the document DPI to create the source image. |
| PDF | `.pdf` | First page is rasterised at the document DPI. |

When you drop a photo, Vexy Lines auto-sizes the document to match the image dimensions and sets a default resolution. You can adjust the dimensions and DPI in the Properties Panel afterward (click on the canvas background with nothing selected to see document properties).

**Clipboard import:** You can also paste an image from your clipboard. Copy an image in any application (**Cmd+C** / **Ctrl+C**), switch to Vexy Lines, and paste (**Cmd+V** / **Ctrl+V**). Vexy Lines creates a new document sized to the clipboard image. This is the fastest path when you're grabbing a screenshot or an image from a web page.

### Path 2: Start with a Blank Preset

If you need specific dimensions — say, an A4 page for a print project, or an HD canvas for a video frame — use the preset system.

**File > New** opens the new document dialog. Choose from built-in presets:

| Preset | Dimensions | Typical Use |
|--------|-----------|-------------|
| **Basic** | 1000 x 1000 px | General experimentation |
| **A4** | 210 x 297 mm | Print (European standard) |
| **Letter** | 8.5 x 11 in | Print (US standard) |
| **Web** | 1920 x 1080 px | Screen graphics, social media |
| **Card** | 3.5 x 2 in | Business cards, postcards |
| **HDTV** | 1920 x 1080 px | Video frames, broadcast graphics |

You can also type custom dimensions directly. Enter width and height in pixels, millimetres, or inches, depending on the unit selector.

After creating a blank document, you'll need to add a source image before fills have anything to work with. Drag a photo onto the canvas, or use the source image controls in the Layers Panel to assign one to a group. Without a source image, fills generate uniform patterns with no tonal variation — technically valid but visually flat.

## Resolution (DPI)

Every Vexy Lines document has a **resolution** setting, measured in dots per inch (DPI). This affects two things:

1. **How imported vector and PDF files are rasterised** when used as source images. A 300 DPI document rasterises a PDF at higher fidelity than a 96 DPI document.

2. **How raster exports (PNG, JPEG) are sized.** A 10-inch-wide document at 300 DPI exports as a 3000-pixel-wide PNG.

Resolution does **not** affect vector exports. SVG, PDF, and EPS files are resolution-independent — that's the whole point of vector output.

Typical values:

| DPI | When to Use |
|-----|------------|
| **96** | Screen-only projects, web graphics. Default for pixel-dimensioned presets. |
| **150** | Draft prints, proofs, inkjet output. |
| **300** | Professional print, offset lithography, fine art reproduction. |

You can change the DPI at any time in the document properties (click the canvas background with nothing selected, then adjust in the Properties Panel). Changing DPI doesn't alter your fills or masks — it only affects how the document maps to physical units.

## The Source Image Concept

This is the single most important concept to understand about Vexy Lines, and it trips up nearly everyone on their first day:

**The source image is not part of your output.**

When you drag a photo into your document, Vexy Lines does not trace it, does not embed it, and does not export it. The photo sits behind your fills as a luminance map — a set of brightness values that the fill algorithms read to decide where to place strokes, how thick to make them, and (with Dynamic Color) what colour to use.

Think of it like a topographic survey: the surveyor walks the terrain, takes measurements, and draws a map. The map is the output. The terrain stays where it is.

This means:

- **Your source image is private.** If you export an SVG and send it to someone, they cannot reconstruct your original photo from it. They see the vector strokes, not the source.
- **You can change the source image** after adding fills. Swap in a different photo and all your fills instantly recalculate to match the new image's brightness. Same algorithms, same parameters, completely different result.
- **Source images can be per-group.** Different groups in the same document can reference different source images. A portrait group uses a face photo; a background group uses a texture. See [Organising Your Work](109-layers-groups.md).
- **File size includes the source.** The `.lines` file embeds the source image as base64 data, so large source images increase your file size. See [Save, Backup, Recover](111-saving.md).

## Choosing the Right Source Image

Not every photo produces great results. Here's what works well:

**Good source images have strong tonal contrast.** A portrait with clearly defined shadows and highlights gives fills something to work with. A foggy landscape where everything is mid-grey produces flat, uniform strokes.

**Sharpness helps.** Fills read brightness at the pixel level. A sharp photo with crisp edges produces clean stroke transitions. A blurry photo produces softer gradations — which can be beautiful, but in a different way.

**Resolution matters, but not as much as you'd think.** A 2000 x 3000 pixel photo gives you plenty of detail for most projects. You don't need 50-megapixel images — Vexy Lines generates vector output that's resolution-independent anyway. The source image just needs enough detail for the fill algorithm to read meaningful brightness variations.

**Colour doesn't matter (usually).** Fills read luminance — the brightness component — not hue or saturation. A colour photo and its greyscale equivalent produce identical Linear fills. The exception is **Dynamic Color**, which samples actual pixel colours from the source. If you plan to use Dynamic Color, your source image's colours become directly relevant.

## After Creating Your Document

Once you have a document open with a source image loaded, you're ready to add your first fill. Head to [Your First Fill](106-first-fill.md) for the satisfying part.

If you opened a blank document and need to understand the interface before going further, see [The Workspace](103-workspace.md).

If you already know what you're doing and just want to confirm the export formats, skip to [Getting Your Art Out](110-exporting.md).
