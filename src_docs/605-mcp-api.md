# Controlling Vexy Lines via API

The parser from [Reading .lines Files with Python](604-python-parser.md) reads files. The API writes reality. It talks to a running Vexy Lines instance and tells it what to do: open a document, add a fill, change a parameter, render, export. Anything you can do with the mouse in the GUI, you can do with a line of Python through the API.

The package is called `vexy-lines-apy`. It wraps the 25 tools in the Vexy Lines MCP server into a clean Python interface. You do not need to understand JSON-RPC, TCP sockets, or any protocol detail. You write Python. The package handles the plumbing.

---

## Installing

```
pip install vexy-lines-apy
```

This installs `vexy-lines-apy` and its dependency `vexy-lines-py` (the parser). You need Python 3.10 or newer.

---

## Prerequisites

The API talks to the Vexy Lines application over a local network connection. Two things must be true:

1. **The Vexy Lines app must be running.** Launch it normally. The app starts its MCP server automatically --- no configuration needed.
2. **Nothing else is using port 47384.** This is the port the app listens on. In practice, conflicts are extremely rare.

To test the connection from a terminal:

```
python -c "from vexy_lines_apy import MCPClient; c = MCPClient(); c.connect(); print(c.get_status()); c.disconnect()"
```

If you see status information, the connection works.

---

## The MCPClient

All API interaction goes through the `MCPClient` class. The recommended pattern uses Python's `with` statement, which automatically connects and disconnects:

```python
from vexy_lines_apy import MCPClient

with MCPClient() as vl:
    info = vl.get_document_info()
    print(f"Document: {info['caption']}")
    print(f"Canvas:   {info['width']} x {info['height']} px")
```

When the `with` block ends, the connection closes cleanly. If something goes wrong inside the block, the connection still closes. This is the safest way to use the client.

You can also connect manually:

```python
from vexy_lines_apy import MCPClient

vl = MCPClient()
vl.connect()
# ... do things ...
vl.disconnect()
```

But the `with` pattern is preferred because it never leaves a connection open by accident.

---

## The 25 Tools, Grouped

The MCP API offers 25 tools organised into five groups. Each tool maps to a method on `MCPClient`.

### Document Tools

Manage files and exports.

| Method | What It Does |
|--------|-------------|
| `new_document(width, height, dpi)` | Create a blank document |
| `open_document(path)` | Open a `.lines` file |
| `save_document()` | Save the current document |
| `export_document(path, format)` | Export to SVG, PDF, PNG, or JPG |
| `get_document_info()` | Return metadata (caption, size, DPI, version) |

### Structure Tools

Navigate and modify the layer tree.

| Method | What It Does |
|--------|-------------|
| `get_tree()` | Return the full layer hierarchy |
| `add_group(name)` | Create a new group |
| `add_layer(name)` | Create a new layer in the current group |
| `add_fill(fill_type)` | Add a fill to the current layer |
| `delete_element(element_id)` | Remove a group, layer, or fill by ID |

### Fill Parameter Tools

Read and write fill settings.

| Method | What It Does |
|--------|-------------|
| `get_fill_params(fill_id)` | Return all parameters for a fill |
| `set_fill_params(fill_id, params)` | Update one or more parameters |

### Visual Tools

Control what the document looks like beyond fill parameters.

| Method | What It Does |
|--------|-------------|
| `set_source_image(path)` | Set the source image for the current group |
| `set_caption(text)` | Set the document's title |
| `set_visibility(element_id, visible)` | Show or hide a group, layer, or fill |
| `set_mask(layer_id, mask_data)` | Set a layer's mask |
| `set_transform(element_id, transform)` | Apply position, rotation, scale |
| `set_warp(element_id, warp_type, params)` | Apply mesh warping |

### Control Tools

Rendering and editing operations.

| Method | What It Does |
|--------|-------------|
| `render()` | Trigger a full render |
| `get_status()` | Check app status and connection health |
| `undo()` | Undo the last operation |
| `redo()` | Redo the last undone operation |
| `get_selection()` | Return the currently selected element |
| `set_selection(element_id)` | Select an element by ID |

---

## Coordinates

All coordinates are in **pixels at the document's DPI**, with the origin at the **top-left corner** of the canvas. If your document is 2400 x 3200 pixels at 300 DPI, then:

- `(0, 0)` is the top-left corner.
- `(2400, 3200)` is the bottom-right corner.
- `(1200, 1600)` is the center.

When setting transforms or warp parameters, positions use this coordinate system.

---

## Code Examples

### Open a Document and List Its Fills

```python
from vexy_lines_apy import MCPClient

with MCPClient() as vl:
    vl.open_document("/Users/you/Documents/portrait.lines")
    tree = vl.get_tree()
    
    for group in tree["groups"]:
        for layer in group["layers"]:
            for fill in layer["fills"]:
                print(f"{fill['fill_type']} (id: {fill['id']})")
```

### Add a Linear Fill and Configure It

```python
from vexy_lines_apy import MCPClient

with MCPClient() as vl:
    vl.open_document("/Users/you/Documents/portrait.lines")
    
    # Add a Linear fill to the current layer
    fill_id = vl.add_fill("linear")
    
    # Set its parameters
    vl.set_fill_params(fill_id, {
        "interval": 1.0,
        "angle": 45,
        "randomization": 0,
        "smoothing": 30,
        "stroke_thickness_mode": "linear",
    })
    
    # Render to see the result
    vl.render()
    print(f"Added Linear fill (id: {fill_id}) at 45°, 1.0mm interval.")
```

### Change Parameters on an Existing Fill

```python
from vexy_lines_apy import MCPClient

with MCPClient() as vl:
    vl.open_document("/Users/you/Documents/portrait.lines")
    tree = vl.get_tree()
    
    # Find the first Linear fill
    for group in tree["groups"]:
        for layer in group["layers"]:
            for fill in layer["fills"]:
                if fill["fill_type"] == "linear":
                    # Double the interval
                    params = vl.get_fill_params(fill["id"])
                    new_interval = params["interval"] * 2
                    vl.set_fill_params(fill["id"], {"interval": new_interval})
                    print(f"Changed interval from {params['interval']} to {new_interval}")
                    break
    
    vl.render()
```

### Create a New Document from Scratch

```python
from vexy_lines_apy import MCPClient

with MCPClient() as vl:
    # Create a 3000x2000 canvas at 300 DPI
    vl.new_document(3000, 2000, 300)
    vl.set_caption("Automated Composition")
    
    # Set a source image
    vl.set_source_image("/Users/you/Photos/landscape.jpg")
    
    # Add a group and layer
    vl.add_group("Main")
    vl.add_layer("Engraving")
    
    # Add a Linear fill
    fill_id = vl.add_fill("linear")
    vl.set_fill_params(fill_id, {
        "interval": 0.8,
        "angle": 15,
        "smoothing": 40,
    })
    
    # Render and export
    vl.render()
    vl.export_document("/Users/you/Documents/output.svg", "svg")
    print("Document created and exported.")
```

### Export the Current Document

```python
from vexy_lines_apy import MCPClient

with MCPClient() as vl:
    vl.export_document("/Users/you/Desktop/final.pdf", "pdf")
    print("Exported to PDF.")
```

### Undo and Redo

```python
from vexy_lines_apy import MCPClient

with MCPClient() as vl:
    vl.open_document("/Users/you/Documents/portrait.lines")
    
    # Make a change
    tree = vl.get_tree()
    first_fill = tree["groups"][0]["layers"][0]["fills"][0]
    vl.set_fill_params(first_fill["id"], {"angle": 90})
    vl.render()
    print("Changed angle to 90°")
    
    # Undo it
    vl.undo()
    vl.render()
    print("Undone.")
    
    # Redo it
    vl.redo()
    vl.render()
    print("Redone.")
```

---

## Error Handling

API calls can fail. The connection might drop, the app might be busy, or you might pass an invalid parameter. The package raises `MCPError` exceptions with descriptive messages.

```python
from vexy_lines_apy import MCPClient, MCPError

try:
    with MCPClient() as vl:
        vl.open_document("/nonexistent/path.lines")
except MCPError as e:
    print(f"API error: {e}")
```

Common errors:

| Error | Cause | Fix |
|-------|-------|-----|
| `Connection refused` | App not running | Launch Vexy Lines |
| `Document not found` | Invalid file path | Check the path |
| `Invalid fill type` | Unrecognised fill type name | Use one of: `linear`, `wave`, `circular`, `spiral`, `radial`, `halftone`, `trace`, `wireframe`, `scribble`, `fractal`, `text`, `handmade` |
| `Invalid parameter` | Parameter name or value not valid for the fill type | Check the fill's parameter list |
| `Render timeout` | Document too complex to render in time | Simplify or increase timeout |

---

## When to Use the API vs. the CLI

The CLI ([The Command Line Tool](602-cli-basics.md)) and the API both talk to the running app. The difference is in how you talk to *them*:

| Situation | Use |
|-----------|-----|
| One-off tasks: export a file, check status | CLI |
| Batch export of a folder | CLI (`export` command) |
| Custom logic: "for each file, if it has a Spiral fill, change the interval" | API (Python script) |
| Integration with other tools or pipelines | API |
| Style transfer with standard settings | CLI (`style-transfer` command) |
| Style transfer with custom logic per file | API (style engine) |

The API gives you the full power of a programming language --- loops, conditions, variables, error handling. The CLI gives you the convenience of a single typed command. Use whichever fits the job.

---

## Further Reading

- [Style Transfer and Interpolation](606-style-engine.md) --- the style engine built on top of the API.
- [AI-Assisted Workflows](608-ai-workflows.md) --- using the MCP API through an AI assistant.
- [The .lines File Format](611-file-format.md) --- understanding what the API reads and writes.

---

*Previous: [Reading .lines Files with Python](604-python-parser.md) | Next: [Style Transfer and Interpolation](606-style-engine.md)*
