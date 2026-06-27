# Batch Export and Style Transfer

These commands use the running Vexy Lines app. Launch the app first, then check the connection:

```bash
vexy-lines-cli mcp-status
```

## Export

`export` uses the macOS app export menu without save dialogs. It supports PDF, SVG, and PNG:

```bash
vexy-lines-cli export artwork.lines --format svg
vexy-lines-cli export ./projects --format pdf --output ./exports
vexy-lines-cli export ./projects --format png --dry-run
vexy-lines-cli export ./projects --format svg --force --timeout-multiplier 2
```

## Export Bundle

`export-bundle` exports several formats in one pass and can also extract the embedded source image:

```bash
vexy-lines-cli export-bundle artwork.lines
vexy-lines-cli export-bundle ./projects --output ./bundle-out
vexy-lines-cli export-bundle artwork.lines --formats pdf,svg --source=False
```

The default bundle formats are `pdf,svg,png`.

## Style Transfer

Apply a `.lines` style to images:

```bash
vexy-lines-cli style-transfer --style reference.lines --input-dir ./photos --output-dir ./styled --format svg
vexy-lines-cli style-transfer --style reference.lines --images a.jpg b.jpg c.jpg --format png
```

Interpolate two compatible styles across an image sequence:

```bash
vexy-lines-cli style-transfer \
  --style start.lines \
  --end-style finish.lines \
  --input-dir ./frames \
  --output-dir ./styled \
  --format svg
```

Style commands create a persistent job folder next to the output so interrupted jobs can resume. Use `--force` to start over and `--cleanup` to remove the job folder after successful completion.

## Interpolation Commands

```bash
vexy-lines-cli interpolate start.lines end.lines --t 0.5 --output mid.lines
vexy-lines-cli interpolate-video start.lines end.lines --output blend.mp4 --frames 120 --fps 30
vexy-lines-cli record-interpolation-screen start.lines end.lines --output ./screens --frames 60 --video screen.mp4
```

`interpolate` works offline. The video and screen-recording commands render through the app.

## AI Rename

```bash
pip install "vexy-lines-cli[ai]"
vexy-lines-cli ai-rename artwork.lines
vexy-lines-cli ai-rename artwork.lines --dry-run --json-output
```

AI rename renders fills in isolation, asks a vision model for short descriptive names, and writes a renamed copy. Configure the OpenAI-compatible endpoint with `VEXY_LINES_LLM_API_URL`, `VEXY_LINES_LLM_API_KEY`, `VEXY_LINES_LLM_MODEL_VISION`, and `VEXY_LINES_VLM_MODEL`, or pass the matching `--llm-*` flags.

*Previous: [The Command Line Tool](602-cli-basics.md) | Next: [Reading .lines Files with Python](604-python-parser.md)*
