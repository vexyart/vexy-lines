# Batch Export and Style Transfer

The offline CLI commands from [The Command Line Tool](602-cli-basics.md) read `.lines` files without needing the app. The commands in this article go further: they talk to a running Vexy Lines instance, asking it to render, export, and restyle documents. The trade-off is simple --- you get the app's full rendering engine, but the app must be open and running while these commands execute.

If you have ever spent an evening manually exporting thirty files one by one, or wished you could give an entire folder the same visual treatment, this is the article that pays for itself.

---

## Prerequisites

Before using any of the commands below:

1. **Install the CLI** if you have not already: `pip install vexy-lines-cli`
2. **Launch Vexy Lines.** The app must be running. These commands send instructions to the app over its local MCP connection. If the app is not running, you will see a "connection refused" error.
3. **Open a terminal.** See [The Command Line Tool](602-cli-basics.md) if you need a refresher.

To confirm the connection is working:

```
vexy-lines mcp-status
```

If you see `Connected to Vexy Lines (version X.X)`, you are ready.

---

## Command: `export` --- Render and Save

The `export` command asks Vexy Lines to render a `.lines` file and save the output as SVG, PDF, or another format. It handles one file or an entire directory.

### Single File

```
vexy-lines export portrait.lines --format svg
```

This opens `portrait.lines` in the app, renders all fills at Best quality, and saves `portrait.svg` next to the original. The original `.lines` file is not modified.

### Choose Your Format

```
vexy-lines export portrait.lines --format pdf
vexy-lines export portrait.lines --format svg
vexy-lines export portrait.lines --format png
vexy-lines export portrait.lines --format jpg
```

SVG and PDF produce vector output --- scalable to any size. PNG and JPG produce raster output at the document's DPI.

### Export a Directory

```
vexy-lines export ./projects/ --format svg
```

Every `.lines` file in `./projects/` is opened, rendered, and exported. Files are processed one at a time. Progress prints to your terminal as each file completes.

### Output Directory

By default, exported files land next to the originals. To send them elsewhere:

```
vexy-lines export ./projects/ --format svg --output-dir ./exports/
```

The `./exports/` folder is created automatically if it does not exist.

### Dry Run

Not sure what will happen? Add `--dry-run`:

```
vexy-lines export ./projects/ --format svg --dry-run
```

This prints a list of what *would* be exported without actually doing it. Use this first when processing large folders.

**Example dry-run output:**

```
[DRY RUN] Would export: projects/landscape.lines → exports/landscape.svg
[DRY RUN] Would export: projects/portrait.lines  → exports/portrait.svg
[DRY RUN] Would export: projects/abstract.lines  → exports/abstract.svg
3 files would be exported.
```

### Force Overwrite

If an output file already exists, the CLI skips it by default. To overwrite:

```
vexy-lines export ./projects/ --format svg --force
```

### Timeout Multiplier

Some documents are complex --- hundreds of fills, dense intervals, mesh warping. Rendering can take minutes per file. If exports are timing out before they finish:

```
vexy-lines export complex-piece.lines --format pdf --timeout-multiplier 3
```

The default timeout is generous for most documents. A multiplier of 2 or 3 handles even the densest pieces. If you are still timing out, consider simplifying the document (see [Performance and Troubleshooting](609-performance.md)).

### Putting It All Together

A realistic batch export session:

```
# Check the connection
vexy-lines mcp-status

# Preview what will happen
vexy-lines export ./client-work/ --format pdf --output-dir ./deliverables/ --dry-run

# Run the export
vexy-lines export ./client-work/ --format pdf --output-dir ./deliverables/

# Also export SVGs for the web team
vexy-lines export ./client-work/ --format svg --output-dir ./web-assets/
```

Start the batch before lunch. Come back to a folder of finished exports.

---

## Command: `style-transfer` --- Apply One Look to Many Files

Style transfer is the headline feature of the CLI for production workflows. You take the visual "recipe" from one `.lines` document --- its fill types, parameters, angles, intervals, thresholds, colours --- and apply it to other documents or images. The source photo changes; the artistic treatment stays the same.

### How It Works

Every `.lines` document encodes a *style*: the specific combination of fills, their parameters, and their arrangement. The `style-transfer` command extracts that style from a reference document and applies it to one or more target files.

Think of it as a Instagram filter, except the filter is a complete Vexy Lines setup that you designed yourself.

### Basic Usage

```
vexy-lines style-transfer --style reference.lines --input photo.jpg
```

This:
1. Extracts the style (fill types, parameters, masks) from `reference.lines`.
2. Creates a new document from `photo.jpg`.
3. Applies the extracted style to the new document.
4. Renders and exports the result.

The output file is saved next to the input with `-styled` appended to the name.

### Style Transfer Across a Directory

```
vexy-lines style-transfer --style engraving-look.lines --input-dir ./portraits/
```

Every image in `./portraits/` receives the same treatment. JPEG, PNG, TIFF, and BMP inputs are supported.

### Choosing Output Format

```
vexy-lines style-transfer --style look.lines --input-dir ./photos/ --format svg --output-dir ./styled/
```

### Practical: Consistent Portfolio

You have designed a striking engraving style for a client portrait: Linear fill at 0.8 mm interval, 15-degree angle, crosshatch at 75 degrees, specific threshold settings, warm sepia colour. The client now wants the same treatment applied to twelve more portraits.

Without style transfer, you would open each photo, recreate the fill stack, and manually match every parameter. With style transfer:

```
vexy-lines style-transfer --style approved-portrait.lines --input-dir ./new-portraits/ --format pdf --output-dir ./deliverables/
```

One command. Twelve files. Identical treatment. Lunch.

---

## Style Interpolation

Style interpolation blends two styles together at a ratio you choose. It is the creative superpower hiding inside the CLI.

```
vexy-lines style-transfer --style start.lines --end-style finish.lines --interpolation 0.5 --input photo.jpg
```

The `--interpolation` value runs from 0.0 (entirely the first style) to 1.0 (entirely the second style). At 0.5, you get a 50/50 blend: parameters are averaged, and the result is a new style that lives halfway between the two references.

### Interpolation Values

| Value | Result |
|-------|--------|
| `0.0` | Identical to `--style` |
| `0.25` | Mostly the first style, with a quarter of the second mixed in |
| `0.5` | Equal blend of both styles |
| `0.75` | Mostly the second style |
| `1.0` | Identical to `--end-style` |

### Practical: Gradual Transition Across a Series

You are creating a series of ten prints that should gradually shift from a fine engraving look to a bold halftone look:

```
vexy-lines style-transfer --style fine-engraving.lines --end-style bold-halftone.lines --interpolation 0.0 --input img01.jpg --output print-01.svg
vexy-lines style-transfer --style fine-engraving.lines --end-style bold-halftone.lines --interpolation 0.11 --input img02.jpg --output print-02.svg
vexy-lines style-transfer --style fine-engraving.lines --end-style bold-halftone.lines --interpolation 0.22 --input img03.jpg --output print-03.svg
# ... and so on, incrementing by 0.11 each time
```

Each print in the series is a step along the spectrum from one style to the other. The progression is smooth and mathematically even.

Not all style pairs can be interpolated. If the two documents have different numbers of fills or incompatible fill types, the tool will warn you. For details on compatibility, see [Style Transfer and Interpolation](606-style-engine.md).

---

## Command: `style-video` --- Apply a Style to Video

The `style-video` command processes a video file frame by frame, applying a style to each frame and reassembling the result as a new video.

```
vexy-lines style-video --style engraving.lines --input clip.mp4 --output clip-styled.mp4
```

This is a slow operation --- each frame is a full render cycle. A 10-second clip at 30 fps means 300 renders. Plan accordingly. For a detailed discussion of video workflows, performance, and frame selection, see [Video to Vector Video](607-video-processing.md).

---

## MCP Utility Commands

The CLI includes a handful of commands for interacting with the running app directly. These are useful for quick checks and one-off operations.

| Command | What It Does |
|---------|-------------|
| `mcp-status` | Check whether the app is running and responding |
| `tree` | Print the current document's layer tree |
| `new-document` | Create a new blank document in the app |
| `open <file>` | Open a `.lines` file in the app |
| `add-fill <type>` | Add a fill to the current layer |
| `get-image-filters <fill-id>` | Read a fill's image-filter chain |
| `set-image-filters <fill-id> <filters-json>` | Replace a fill's image-filter chain |
| `add-image-filter <fill-id> <filter-type>` | Add one image filter |
| `remove-image-filter <fill-id> <index>` | Remove one image filter |
| `render` | Trigger a full render of the current document |

These are convenience wrappers around the MCP API. For full programmatic control, see [Controlling Vexy Lines via API](605-mcp-api.md).

---

## Tips for Batch Work

- **Close unnecessary documents in the app.** The export process opens each file, renders it, and closes it. Other open documents consume memory and slow rendering.
- **Use Fast quality for proofs, Best for finals.** The `--quality` flag (where supported) lets you choose rendering quality. Fast is much quicker and good enough to check composition.
- **Run big batches off-hours.** A batch of 50 complex documents can take an hour or more. Start it before you leave for the day.
- **Check `--dry-run` first.** Especially when using `--force`. A dry run costs nothing and prevents surprises.
- **Keep your style reference files organised.** Create a `styles/` folder with well-named `.lines` files: `fine-engraving.lines`, `bold-halftone.lines`, `watercolour-wash.lines`. These become your reusable presets.

---

## Error Handling

| Error Message | What It Means | Fix |
|---------------|---------------|-----|
| `Connection refused` | The Vexy Lines app is not running | Launch the app, then retry |
| `File not found` | The specified `.lines` file does not exist at that path | Check the path; use drag-and-drop to avoid typos |
| `Export timed out` | Rendering took longer than the allowed time | Add `--timeout-multiplier 3` or simplify the document |
| `Styles not compatible` | The two style files cannot be interpolated | Use styles with matching fill types and counts |
| `Output file exists` | An exported file already exists and `--force` was not used | Add `--force` or change the output directory |

---

*Previous: [The Command Line Tool](602-cli-basics.md) | Next: [Reading .lines Files with Python](604-python-parser.md)*
