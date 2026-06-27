# Controlling Vexy Lines via API

`vexy-lines-apy` wraps the Vexy Lines MCP server in a Python API. It can open documents, inspect the layer tree, change fill parameters, edit image-filter chains, render, and export.

## Install

```bash
pip install vexy-lines-apy
```

Requires Python 3.11 or newer and a running Vexy Lines app.

## Quick Check

```python
from vexy_lines_api import MCPClient

with MCPClient() as vl:
    info = vl.get_document_info()
    print(info)
```

`MCPClient()` connects to `localhost:47384`. If the app is not running, the client attempts to launch it and waits for the server.

## Common Operations

```python
from vexy_lines_api import MCPClient

with MCPClient() as vl:
    vl.open_document("portrait.lines")
    tree = vl.get_layer_tree()

    # Find the first fill in the returned LayerNode tree.
    first_layer = tree.children[0].children[0]
    first_fill = first_layer.children[0]

    vl.set_fill_params(first_fill.id, interval=1.2, angle=45)
    vl.set_image_filters(first_fill.id, [
        {"type": "brightness", "params": {"value": 25.0}},
        {"type": "levels", "params": {"left": 10, "right": 240}},
    ])

    vl.render()
    vl.export_svg("portrait.svg")
```

## Method Groups

| Group | Methods |
|---|---|
| Document | `new_document`, `open_document`, `save_document`, `export_document`, `get_document_info` |
| Structure | `get_layer_tree`, `add_group`, `add_layer`, `add_fill`, `delete_object` |
| Fill params | `get_fill_params`, `set_fill_params`, `get_image_filters`, `set_image_filters`, `add_image_filter`, `remove_image_filter` |
| Visual | `set_source_image`, `set_caption`, `set_visible`, `set_layer_mask`, `get_layer_mask`, `transform_layer`, `set_layer_warp` |
| Control | `render`, `render_all`, `wait_for_render`, `get_render_status`, `undo`, `redo`, `get_selection`, `select_object` |

## Export Shortcuts

```python
with MCPClient() as vl:
    vl.open_document("portrait.lines")
    vl.render()
    vl.export_svg("portrait.svg")
    vl.export_pdf("portrait.pdf")
    vl.export_png("portrait.png", dpi=150)
    vl.export_jpeg("portrait.jpg")
    vl.export_eps("portrait.eps")
```

## Errors

API failures raise `MCPError`:

```python
from vexy_lines_api import MCPClient, MCPError

try:
    with MCPClient() as vl:
        vl.open_document("/missing/file.lines")
except MCPError as exc:
    print(f"API error: {exc}")
```

*Previous: [Reading .lines Files with Python](604-python-parser.md) | Next: [Style Transfer and Interpolation](606-style-engine.md)*
