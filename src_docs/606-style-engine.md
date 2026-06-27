# Style Transfer and Interpolation

The style engine in `vexy-lines-apy` treats a `.lines` document as a reusable visual recipe: group/layer/fill structure, fill parameters, colors, masks, document properties, and image-filter chains.

## Core Functions

```python
from vexy_lines_api import (
    MCPClient,
    apply_style,
    extract_style,
    interpolate_lines,
    interpolate_style,
    styles_compatible,
)
```

| Function | Purpose |
|---|---|
| `extract_style(path)` | Parse a `.lines` file into a `Style` |
| `apply_style(client, style, source_image, dpi=72)` | Apply a style to an image through MCP and return SVG |
| `interpolate_style(a, b, t)` | Blend two compatible `Style` objects |
| `styles_compatible(a, b)` | Check whether two styles have matching structure |
| `interpolate_lines(start, end, output, t)` | Write one offline intermediate `.lines` file |

## Apply A Style To An Image

```python
from pathlib import Path
from vexy_lines_api import MCPClient, apply_style, extract_style

style = extract_style("engraving-look.lines")

with MCPClient() as vl:
    svg = apply_style(vl, style, "portrait.jpg", dpi=72)

Path("portrait-styled.svg").write_text(svg, encoding="utf-8")
```

## Interpolate Styles

```python
from vexy_lines_api import extract_style, interpolate_style, styles_compatible

style_a = extract_style("fine-engraving.lines")
style_b = extract_style("bold-halftone.lines")

if styles_compatible(style_a, style_b):
    mid = interpolate_style(style_a, style_b, t=0.5)
```

Numeric fill parameters and matching image-filter numeric values interpolate linearly. Colors blend. Discrete values are preserved or switch at the midpoint.

## Write An Intermediate .lines File

```python
from vexy_lines_api import interpolate_lines

interpolate_lines("start.lines", "end.lines", "mid.lines", t=0.5)
```

This is offline: it edits XML directly and does not require the app.

## CLI Equivalent

```bash
vexy-lines-cli style-transfer --style start.lines --end-style end.lines --input-dir ./frames --output-dir ./styled
vexy-lines-cli interpolate start.lines end.lines --t 0.5 --output mid.lines
vexy-lines-cli interpolate-video start.lines end.lines --output blend.mp4 --frames 120 --fps 30
```

*Previous: [Controlling Vexy Lines via API](605-mcp-api.md) | Next: [Video to Vector Video](607-video-processing.md)*
