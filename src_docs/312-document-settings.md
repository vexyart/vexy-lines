# Document and Canvas Settings

Before you touch a fill, before you choose an angle or drag a slider, your document has already made decisions for you. Canvas dimensions determine how much space your fills have to work in. DPI affects how the source image maps to that space. Units dictate whether you think in millimetres or inches. Global limits prevent you from accidentally setting an interval so tight it freezes your machine. These settings live in the Document Settings panel, and getting them right at the start saves you from reworking everything later.

## Accessing Document Settings

Open Document Settings via **File > Document Settings** or the gear icon at the bottom of the Properties Panel. The panel opens as a modal dialog — you set values, confirm, and the document updates.

Some settings (canvas size, DPI, background colour) can also be set during document creation in the **File > New** dialog. Changing them later in Document Settings is always possible, but changing canvas size after you have placed fills may shift fill positions relative to the source image.

## Canvas Dimensions

### Width and Height

The canvas is the rectangular area where your fills render. Width and height are specified in the current document units.

| Preset | Width | Height | Use Case |
|--------|-------|--------|----------|
| A4 Portrait | 210 mm | 297 mm | Standard European print, illustration boards |
| A4 Landscape | 297 mm | 210 mm | Panoramic compositions, landscape prints |
| A3 | 297 mm | 420 mm | Large prints, posters |
| Letter Portrait | 8.5 in | 11 in | Standard US print |
| Letter Landscape | 11 in | 8.5 in | US landscape format |
| Square 200 | 200 mm | 200 mm | Instagram, album covers, tile designs |
| Square 300 | 300 mm | 300 mm | Large square prints |
| Custom | Any | Any | Enter exact dimensions for your output |

You can type any dimensions. There is no maximum, but very large canvases (above 1000 mm in either dimension) combined with tight fill intervals will generate enormous files. See the performance notes in [Interval and Spacing: Density Control](305-interval-spacing.md).

### Resizing an Existing Canvas

Changing the canvas dimensions after creating fills does not rescale the fills. It changes the boundary. If you shrink the canvas, fills that extended beyond the new boundary are clipped. If you enlarge the canvas, fills that stopped at the old boundary now have empty space around them that is not filled until you refresh.

To resize and rescale proportionally, use **Edit > Scale Document** (if available) or manually adjust fill parameters to match the new dimensions.

## DPI (Dots Per Inch)

DPI in Vexy Lines controls one thing: the resolution at which the source image is mapped onto the canvas. It does not affect the vector output — SVG and PDF are resolution-independent. It affects how many pixels of the source image correspond to each unit of canvas space.

### What DPI Changes

- **High DPI (300–600):** Each unit of canvas space maps to more source image pixels. Fills read finer image detail. Rendering is slower because more pixel data is processed per stroke. Use for final-quality output where you want fills to respond to the finest tonal variations in your source image.

- **Medium DPI (150–200):** A balanced default. Fills capture the main tonal structure without responding to pixel-level noise. Rendering is moderate. Good for most working sessions.

- **Low DPI (72–100):** Each unit of canvas space maps to fewer source image pixels. Fills read a coarser version of the image. Rendering is fast. Use for initial exploration and composition planning, then increase DPI before final export.

### What DPI Does Not Change

- Vector output resolution. SVG and PDF are infinitely scalable regardless of DPI.
- The physical size of the canvas. DPI does not resize the canvas — it changes the source image sampling resolution.
- Raster export resolution. When exporting to PNG or JPEG, you set the export resolution separately in the Export dialog.

### Recommended DPI by Workflow Stage

| Stage | DPI | Why |
|-------|-----|-----|
| Exploration (trying fills, angles, compositions) | 72–100 | Fast rendering, quick iteration |
| Refinement (adjusting parameters, fine-tuning) | 150–200 | Good detail without excessive render time |
| Final export preparation | 300 | Maximum source image fidelity in the generated strokes |
| Fine art / large format | 300–600 | Captures the finest tonal detail in high-resolution source images |

## Units

Vexy Lines supports four unit systems:

| Unit | Abbreviation | When to Use |
|------|-------------|-------------|
| **Millimetres** | mm | Default for European users, metric print workflows, laser cutting |
| **Inches** | in | US print workflows, American paper sizes |
| **Pixels** | px | Screen-first work, web output, matching source image dimensions |
| **Points** | pt | Typography-adjacent work, matching Illustrator/InDesign values |

### Switching Units

Change the unit in Document Settings and every parameter in the Properties Panel updates its displayed value. An interval of 2 mm becomes approximately 5.67 pt or 0.079 in. The actual physical spacing does not change — only the numeric representation.

**Important:** When you change units, values may display with many decimal places (e.g., 0.07874 in instead of 2 mm). Vexy Lines preserves the exact value rather than rounding, which can look untidy but ensures precision. If you prefer round numbers, re-enter the values after switching units.

### Units and Collaboration

If you share .lines files with collaborators, the unit setting travels with the document. A file created in millimetres opens in millimetres regardless of the recipient's preference. The recipient can change units in Document Settings without affecting the actual dimensions or parameter values.

## Global Limits

Document Settings includes minimum and maximum constraints for several parameters. These are safety rails that prevent accidental extreme values across all fills in the document.

### Global Thickness Limits

- **Global Thickness Minimum:** The lowest stroke weight any fill in the document can use. Default: 0.01 mm. Setting this to 0.1 mm prevents accidental hairlines that vanish in print or cause plotter problems.
- **Global Thickness Maximum:** The highest stroke weight any fill can use. Default: 50 mm. Setting this to 5 mm prevents fills from producing strokes so wide they cover the entire canvas.

If a fill's Thickness Min is set lower than the global minimum, the global minimum overrides. Same for the maximum. This is useful in complex documents with many fills — you can set sensible bounds once and trust that no fill will exceed them, even if you accidentally drag a slider too far.

### Global Interval Limits

- **Global Interval Minimum:** The tightest spacing any fill can use. Default: 0.1 mm. Setting this to 0.5 mm prevents the density bombs described in [Interval and Spacing: Density Control](305-interval-spacing.md). This is the single most useful safety setting in the application.
- **Global Interval Maximum:** The widest spacing any fill can use. Default: 100 mm. Rarely needs adjustment.

### Setting Limits for Your Workflow

| Workflow | Recommended Interval Min | Recommended Thickness Min | Why |
|----------|--------------------------|---------------------------|-----|
| General illustration | 0.3 mm | 0.05 mm | Prevents extreme density while allowing fine work |
| Laser cutting | 0.5 mm | 0.1 mm | Laser kerf prevents thinner lines from cutting cleanly |
| Screen printing | 0.8 mm | 0.2 mm | Ink flow through mesh requires minimum width and spacing |
| Pen plotter | 0.5 mm | Pen width (e.g., 0.3 mm) | Plotter cannot draw thinner than its pen |
| Web SVG | 0.5 mm | 0.1 mm | Prevents enormous file sizes from over-dense fills |
| Fine art (giclée) | 0.1 mm | 0.02 mm | High-resolution print can render the finest detail |

## Background Colour

The canvas background colour is the colour of "empty space" — areas where no fill generates strokes. By default, this is white (#FFFFFF).

### Changing the Background

In Document Settings, click the background colour swatch to open a colour picker. Choose any colour. The canvas updates immediately.

### When to Change the Background

- **Dark backgrounds:** Set the background to black or dark grey for white-on-dark compositions. Remember to set your fill colours to light values, and consider enabling [Thickness Invert](303-stroke-thickness.md) so that light image areas produce the thickest (most visible) strokes.
- **Tinted backgrounds:** A cream (#FFFFF0) or warm grey (#E8E0D8) background simulates aged paper. A light blue (#E8F0FE) simulates engineering paper.
- **Coloured backgrounds for screen printing:** Set the background to match your paper or substrate colour so the on-screen preview approximates the final print appearance.

### Background and Export

- **SVG / PDF:** The background colour is included as a rectangle behind all paths. Some applications (Illustrator, Affinity) may import this as a separate object. Delete it if you want transparency.
- **PNG:** You can choose to export with the background colour or with transparency (alpha channel). Transparent PNG has no background rectangle.
- **JPEG:** Always includes the background colour. JPEG does not support transparency.

## Auto-Save and Backup

### Auto-Save

When enabled, Vexy Lines automatically saves your document at a configurable interval (default: every 5 minutes). The save overwrites the current .lines file. If you have not yet saved the document (it has no file path), auto-save prompts you for a location on the first trigger.

**Recommendation:** Leave auto-save on. The .lines format is compact and saves quickly, even for complex documents. The risk of losing work from a crash far outweighs the minor interruption of a save operation.

### Backup Files

When backup is enabled, each save creates a timestamped copy in a backup folder alongside your .lines file. The backup folder is named `[filename]_backups/` and contains files named `[filename]_YYYYMMDD_HHMMSS.lines`.

Backups accumulate over time. Vexy Lines does not automatically prune old backups. Periodically review the backup folder and delete versions you no longer need, especially for large documents.

### Recovery

If your working file becomes corrupted or you need to revert to an earlier state:

1. Open the backup folder next to your .lines file.
2. Sort by date. Find the backup from before the problem occurred.
3. Copy it to a new location and open it. Do not open backups in place — the auto-save might overwrite them.

## Rendering Quality

Document Settings may include a rendering quality preference that controls how fills are calculated during interactive editing:

| Quality | Behaviour | When to Use |
|---------|-----------|-------------|
| **Draft** | Fills are calculated at reduced resolution and with simplified algorithms. Fast, approximate. | Initial exploration with many fills or tight intervals |
| **Normal** | Full calculation with standard precision. | General working |
| **High** | Maximum precision calculation. Slower but produces the most accurate stroke placement. | Final verification before export |

Rendering quality affects the on-screen preview only. Export always uses the highest quality regardless of this setting.

## Preferences vs. Document Settings

Some settings are document-specific (canvas size, DPI, units, background colour, global limits). Others are application preferences that apply to all documents (auto-save interval, backup location, default rendering quality, default units for new documents).

Document settings travel with the .lines file. Preferences stay on your machine.

If you find yourself changing the same document settings for every new file — always switching to millimetres, always setting interval minimum to 0.5 mm — configure those as application-level defaults in **Vexy Lines > Preferences** (macOS) or **Edit > Preferences** (Windows). New documents will inherit your preferred values.

## Step-by-Step: Setting Up a New Document for Print

1. **File > New.** Choose Custom dimensions.
2. Set Width to 210 mm, Height to 297 mm (A4). Or match your actual print output size.
3. Set DPI to 150 for working, with the intention of increasing to 300 before final export.
4. Set Units to mm (or your preferred unit).
5. Open Document Settings. Set Global Interval Minimum to 0.5 mm. Set Global Thickness Minimum to 0.1 mm.
6. Set Background to white (#FFFFFF) or your paper colour.
7. Enable Auto-Save at 5-minute intervals. Enable Backup.
8. Drop your source image onto the canvas.
9. Begin adding fills. Your safety limits are in place, your auto-save is protecting your work, and your canvas matches your output dimensions.

## Further Reading

- [Interval and Spacing: Density Control](305-interval-spacing.md) — understanding why global interval limits matter.
- [Stroke Thickness: Weight from Light](303-stroke-thickness.md) — understanding the thickness limits.
- [Getting Your Art Out](110-exporting.md) — export settings that interact with document settings.
- [Save, Backup, Recover](111-saving.md) — more detail on the .lines file format and backup strategies.
- [The Control Surface](301-part3-tldr.md) — the full parameter map.
