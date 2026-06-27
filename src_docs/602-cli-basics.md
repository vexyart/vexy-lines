# The Command Line Tool

`vexy-lines-cli` is the terminal interface for Vexy Lines. Some commands parse `.lines` files directly and do not need the app. Others use the running app through MCP.

## Install

```bash
pip install vexy-lines-cli
vexy-lines-cli --help
```

If the command is not on your PATH, this also works:

```bash
python -m vexy_lines_cli --help
```

## Parser Commands

These commands work without launching Vexy Lines:

```bash
vexy-lines-cli info artwork.lines
vexy-lines-cli info artwork.lines --json-output
vexy-lines-cli file-tree artwork.lines
vexy-lines-cli extract-source artwork.lines --output source.jpg
vexy-lines-cli extract-sources artwork.lines --output-dir ./sources/
vexy-lines-cli extract-preview artwork.lines --output preview.png
vexy-lines-cli batch-convert --input-dir ./art --output-dir ./thumbs --what preview --format png
```

Use `--json-output` on parser commands when you want machine-readable output.

## What They Return

- `info` reports caption, version, DPI, dimensions, group/layer/fill counts, image-filter count, and embedded image flags.
- `file-tree` prints the group/layer/fill hierarchy, including image-filter names.
- `extract-source` writes the document-level embedded source image.
- `extract-sources` writes the document source plus group-owned source images.
- `extract-preview` writes the embedded preview image.
- `batch-convert` extracts previews or sources from every `.lines` file in a directory.

## Paths

Paths can be relative or absolute:

```bash
vexy-lines-cli info artwork.lines
vexy-lines-cli info /Users/you/Documents/artwork.lines
```

Wrap paths with spaces in quotes:

```bash
vexy-lines-cli info "My Artwork.lines"
```

*Previous: [Beyond the GUI](601-part6-tldr.md) | Next: [Batch Export and Style Transfer](603-cli-advanced.md)*
