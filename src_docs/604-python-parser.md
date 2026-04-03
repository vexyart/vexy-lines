# Reading .lines Files with Python

The CLI commands from the previous articles let you inspect and extract data from `.lines` files without writing code. But the CLI offers a fixed set of operations. If you want to ask a question the CLI did not anticipate --- "Which of my 300 files use a Spiral fill?" or "What is the average interval across all my Linear fills?" --- you need a few lines of Python.

The `vexy-lines-py` package is a pure Python parser for `.lines` files. It reads the XML inside the file, builds a structured tree of groups, layers, and fills, and hands it to you as Python objects. No running app required. No network connection. Just a file and a script.

This article assumes you have never written Python before. If you have, skim the setup and jump to the code examples.

---

## Installing

Open a terminal and type:

```
pip install vexy-lines-py
```

That is it. The package has no dependencies beyond Python itself (3.10 or newer).

To verify:

```
python -c "import vexy_lines; print('Ready')"
```

If it prints `Ready`, you are set.

---

## Your First Script

Open any text editor --- TextEdit on macOS (switch to plain text mode first), Notepad on Windows, or a code editor like VS Code if you have one. Type the following:

```python
from vexy_lines import parse

doc = parse("portrait.lines")
print(f"Caption: {doc.caption}")
print(f"Canvas:  {doc.width} x {doc.height} px")
print(f"DPI:     {doc.dpi}")
```

Save the file as `inspect.py` in the same folder as your `.lines` file. Then, in the terminal:

```
python inspect.py
```

**Output:**

```
Caption: Evening Portrait Study
Canvas:  2400 x 3200 px
DPI:     300
```

Three lines of code. You have just parsed a `.lines` file and extracted its metadata.

---

## What `parse()` Returns

The `parse()` function returns a `LinesDocument` object. Think of it as a structured summary of everything in the file.

| Property | Type | What It Contains |
|----------|------|-----------------|
| `doc.caption` | Text | The document's title |
| `doc.version` | Text | The file format version |
| `doc.dpi` | Number | Dots per inch |
| `doc.width` | Number | Canvas width in pixels |
| `doc.height` | Number | Canvas height in pixels |
| `doc.groups` | List | The top-level groups in the document |

Each group contains layers, and each layer contains fills. The structure mirrors what you see in the Layers Panel inside the app.

---

## Navigating the Tree

A `.lines` document is a tree: groups contain layers, and layers contain fills. Here is how to walk through it:

```python
from vexy_lines import parse

doc = parse("portrait.lines")

for group in doc.groups:
    print(f"Group: {group.name}")
    for layer in group.layers:
        print(f"  Layer: {layer.name}")
        for fill in layer.fills:
            print(f"    Fill: {fill.fill_type}")
```

**Output:**

```
Group: Background
  Layer: Sky
    Fill: linear
  Layer: Ground
    Fill: halftone
Group: Figure
  Layer: Face
    Fill: linear
    Fill: linear
  Layer: Hair
    Fill: circular
  Layer: Outline
    Fill: trace
```

This is the same hierarchy you see in the GUI's Layers Panel, but as text.

---

## The Object Types

### GroupInfo

Represents a group (folder) in the layer tree.

| Property | What It Contains |
|----------|-----------------|
| `group.name` | The group's name |
| `group.layers` | List of `LayerInfo` objects in this group |
| `group.visible` | Whether the group is visible (`True` or `False`) |

### LayerInfo

Represents a single layer.

| Property | What It Contains |
|----------|-----------------|
| `layer.name` | The layer's name |
| `layer.fills` | List of `FillNode` objects in this layer |
| `layer.visible` | Whether the layer is visible |

### FillNode

Represents a single fill within a layer.

| Property | What It Contains |
|----------|-----------------|
| `fill.fill_type` | The algorithm name: `"linear"`, `"circular"`, `"halftone"`, etc. |
| `fill.params` | A `FillParams` object with all the fill's parameter values |

### FillParams

Contains every parameter of a fill as named attributes. The exact attributes depend on the fill type, but common ones include:

| Attribute | What It Is |
|-----------|-----------|
| `params.interval` | Spacing between strokes (mm) |
| `params.angle` | Rotation angle (degrees) |
| `params.randomization` | Jitter amount (0--100) |
| `params.smoothing` | Smoothing level |
| `params.shift` | Pattern offset (mm) |
| `params.stroke_thickness_mode` | Thickness mapping mode |
| `params.dynamic_color` | Whether dynamic colour is enabled |
| `params.color` | Stroke colour as an `#AARRGGBB` hex string |

Not every fill type has every parameter. If you ask for a parameter that does not apply to a fill type, you will get `None`.

---

## Reading Fill Parameters

```python
from vexy_lines import parse

doc = parse("portrait.lines")

for group in doc.groups:
    for layer in group.layers:
        for fill in layer.fills:
            if fill.fill_type == "linear":
                p = fill.params
                print(f"Linear fill in '{layer.name}':")
                print(f"  Interval:      {p.interval} mm")
                print(f"  Angle:         {p.angle}°")
                print(f"  Randomization: {p.randomization}%")
                print(f"  Smoothing:     {p.smoothing}")
```

**Output:**

```
Linear fill in 'Face':
  Interval:      0.8 mm
  Angle:         15°
  Randomization: 0%
  Smoothing:     30
Linear fill in 'Face':
  Interval:      1.2 mm
  Angle:         75°
  Randomization: 0%
  Smoothing:     30
Linear fill in 'Sky':
  Interval:      2.0 mm
  Angle:         0°
  Randomization: 5%
  Smoothing:     20
```

---

## Extracting Embedded Images

Every `.lines` file embeds two images: the source photograph (compressed as JPEG inside zlib inside base64) and a preview thumbnail (PNG inside base64). The parser can extract both.

```python
from vexy_lines import parse

doc = parse("portrait.lines")

# Extract the source photograph
source_bytes = doc.extract_source_image()
if source_bytes:
    with open("recovered-source.jpg", "wb") as f:
        f.write(source_bytes)
    print("Source image saved.")

# Extract the preview thumbnail
preview_bytes = doc.extract_preview_image()
if preview_bytes:
    with open("recovered-preview.png", "wb") as f:
        f.write(preview_bytes)
    print("Preview image saved.")
```

The `extract_source_image()` method returns raw JPEG bytes, or `None` if no source is embedded. The `extract_preview_image()` method returns raw PNG bytes.

---

## Practical Use Cases

### Catalogue All Your Files

Build a summary of every `.lines` file in a folder:

```python
import os
from vexy_lines import parse

folder = "./my-projects"

for filename in os.listdir(folder):
    if filename.endswith(".lines"):
        path = os.path.join(folder, filename)
        doc = parse(path)
        fill_count = sum(
            len(layer.fills)
            for group in doc.groups
            for layer in group.layers
        )
        print(f"{filename}: {doc.width}x{doc.height}, {fill_count} fills")
```

### Find All Files Using a Specific Fill Type

```python
import os
from vexy_lines import parse

folder = "./my-projects"
target = "spiral"

for filename in os.listdir(folder):
    if filename.endswith(".lines"):
        path = os.path.join(folder, filename)
        doc = parse(path)
        for group in doc.groups:
            for layer in group.layers:
                for fill in layer.fills:
                    if fill.fill_type == target:
                        print(f"{filename}: Spiral fill in '{layer.name}'")
```

### Calculate Average Interval Across All Linear Fills

```python
import os
from vexy_lines import parse

folder = "./my-projects"
intervals = []

for filename in os.listdir(folder):
    if filename.endswith(".lines"):
        path = os.path.join(folder, filename)
        doc = parse(path)
        for group in doc.groups:
            for layer in group.layers:
                for fill in layer.fills:
                    if fill.fill_type == "linear" and fill.params.interval:
                        intervals.append(fill.params.interval)

if intervals:
    avg = sum(intervals) / len(intervals)
    print(f"Found {len(intervals)} Linear fills.")
    print(f"Average interval: {avg:.2f} mm")
    print(f"Range: {min(intervals):.2f} – {max(intervals):.2f} mm")
```

### Build a Gallery of Previews

```python
import os
from vexy_lines import parse

folder = "./my-projects"
output_dir = "./gallery"
os.makedirs(output_dir, exist_ok=True)

for filename in os.listdir(folder):
    if filename.endswith(".lines"):
        path = os.path.join(folder, filename)
        doc = parse(path)
        preview = doc.extract_preview_image()
        if preview:
            out_path = os.path.join(output_dir, filename.replace(".lines", ".png"))
            with open(out_path, "wb") as f:
                f.write(preview)
            print(f"Saved: {out_path}")
```

---

## A Note on Python Basics

If this is your first encounter with Python, a few quick pointers:

- **Indentation matters.** Python uses indentation (spaces at the start of lines) to define structure. Always use four spaces per level. Never mix tabs and spaces.
- **`for ... in ...:`** is a loop. It runs the indented block once for each item.
- **`if ...:` ** is a condition. The indented block runs only if the condition is true.
- **`f"text {variable}"` ** is a formatted string. The bit in curly braces is replaced with the variable's value.
- **`print()`** displays text in the terminal.

You can learn more as you go. The examples above are deliberately simple --- copy them, change the folder paths, and run them. Experimentation is the fastest teacher.

---

## Further Reading

- [Controlling Vexy Lines via API](605-mcp-api.md) --- go beyond reading files to controlling the running app from Python.
- [Style Transfer and Interpolation](606-style-engine.md) --- the style engine that extracts and applies visual recipes.
- [The .lines File Format](611-file-format.md) --- the raw XML structure that the parser reads.

---

*Previous: [Batch Export and Style Transfer](603-cli-advanced.md) | Next: [Controlling Vexy Lines via API](605-mcp-api.md)*
