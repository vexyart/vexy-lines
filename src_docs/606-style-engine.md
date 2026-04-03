# Style Transfer and Interpolation

A style, in Vexy Lines terms, is the complete recipe for transforming a photograph into vector art. It is everything *except* the photograph: which fill types are used, how many, at what angles, intervals, thresholds, colours, and layer arrangements. Change the photograph and the output changes. Keep the same style and every photograph gets the same treatment.

The style engine in the `vexy-lines-apy` package makes styles portable. You can extract a style from one document, apply it to another, blend two styles together, and check whether two styles are compatible before attempting a blend. This is the machinery behind the CLI's `style-transfer` command, exposed as Python functions for when you need more control than the CLI offers.

---

## The Four Functions

| Function | What It Does |
|----------|-------------|
| `extract_style(doc)` | Pull the complete style recipe from a `.lines` document |
| `apply_style(client, style)` | Apply a style to the currently open document via MCP |
| `interpolate_style(style_a, style_b, t)` | Blend two styles at a given ratio |
| `styles_compatible(style_a, style_b)` | Check whether two styles can be interpolated |

All four are imported from `vexy_lines_apy`:

```python
from vexy_lines_apy import (
    extract_style,
    apply_style,
    interpolate_style,
    styles_compatible,
)
```

---

## Extracting a Style

The `extract_style()` function takes a parsed `LinesDocument` (from `vexy-lines-py`) and returns a style object --- a data structure that captures every fill type, every parameter value, the layer arrangement, and the colour settings.

```python
from vexy_lines import parse
from vexy_lines_apy import extract_style

doc = parse("engraving-look.lines")
style = extract_style(doc)

print(f"Style has {len(style.fills)} fills")
for fill in style.fills:
    print(f"  {fill.fill_type}: interval={fill.params.get('interval')}, angle={fill.params.get('angle')}")
```

**Example output:**

```
Style has 3 fills
  linear: interval=0.8, angle=15
  linear: interval=1.2, angle=75
  halftone: interval=2.0, angle=0
```

The style object is a plain Python data structure. You can save it, print it, pass it to other functions, or inspect its contents. It does not contain the source image --- only the instructions for how to process one.

---

## Applying a Style

The `apply_style()` function takes an `MCPClient` connection and a style object, then reconfigures the currently open document to match the style. It adds or removes fills, sets parameters, and adjusts layer structure.

```python
from vexy_lines import parse
from vexy_lines_apy import MCPClient, extract_style, apply_style

# Extract the style from a reference document
ref = parse("engraving-look.lines")
style = extract_style(ref)

# Apply it to a different document
with MCPClient() as vl:
    vl.open_document("/Users/you/Documents/new-portrait.lines")
    apply_style(vl, style)
    vl.render()
    vl.export_document("/Users/you/Documents/new-portrait.svg", "svg")
    print("Style applied and exported.")
```

`apply_style()` replaces the target document's fills with the ones from the style. The source image and canvas dimensions of the target document are preserved --- only the artistic treatment changes.

### What Gets Transferred

| Transferred | Not Transferred |
|-------------|-----------------|
| Fill types and count | Source image |
| All fill parameters (interval, angle, threshold, etc.) | Canvas dimensions |
| Stroke colours | Document caption |
| Dynamic colour settings and segment length | Mask paint strokes |
| Layer and group structure | Warp settings |
| Fill ordering and visibility | |

Masks are not transferred because they are tied to the geometry of the source image. A mask that outlines a face in one portrait would not align with a face in a different portrait. Warp settings are similarly geometry-dependent.

---

## Interpolating Two Styles

This is where the style engine moves from useful to magical. `interpolate_style()` takes two styles and a blending factor `t` (from 0.0 to 1.0), and returns a new style whose parameters are a weighted average of the two inputs.

```python
from vexy_lines import parse
from vexy_lines_apy import extract_style, interpolate_style

style_a = extract_style(parse("fine-engraving.lines"))
style_b = extract_style(parse("bold-halftone.lines"))

# 50/50 blend
blended = interpolate_style(style_a, style_b, t=0.5)

print(f"Blended style has {len(blended.fills)} fills")
for fill in blended.fills:
    print(f"  {fill.fill_type}: interval={fill.params.get('interval'):.2f}")
```

### How Blending Works

For each numeric parameter that exists in both styles, the blended value is calculated as:

```
blended_value = value_a * (1 - t) + value_b * t
```

At `t=0.0`, the result is identical to style A. At `t=1.0`, it is identical to style B. At `t=0.5`, every numeric parameter is the average of the two styles. At `t=0.3`, it is 70% style A and 30% style B.

Non-numeric properties (like fill type names) come from style A when `t < 0.5` and from style B when `t >= 0.5`. This means the blend "snaps" from one fill type to another at the midpoint rather than trying to morph between them.

### The `t` Parameter

| Value | Effect |
|-------|--------|
| `0.0` | Pure style A |
| `0.1` | 90% A, 10% B --- subtle influence from B |
| `0.25` | 75% A, 25% B --- A dominates with B seasoning |
| `0.5` | Equal blend --- parameters averaged |
| `0.75` | 25% A, 75% B --- B dominates |
| `1.0` | Pure style B |

### Practical: Animated Style Progression

Create a series of images that smoothly transition from one style to another:

```python
from vexy_lines import parse
from vexy_lines_apy import MCPClient, extract_style, interpolate_style, apply_style

style_a = extract_style(parse("style-start.lines"))
style_b = extract_style(parse("style-end.lines"))

with MCPClient() as vl:
    vl.open_document("/Users/you/Documents/portrait.lines")
    
    steps = 10
    for i in range(steps + 1):
        t = i / steps
        blended = interpolate_style(style_a, style_b, t)
        apply_style(vl, blended)
        vl.render()
        vl.export_document(f"/Users/you/output/frame-{i:03d}.svg", "svg")
        print(f"Exported frame {i} (t={t:.2f})")
```

This produces 11 SVGs, each one step further along the style spectrum. String them together as frames and you have a style animation.

---

## Checking Compatibility

Not all style pairs can be interpolated. Two styles are compatible when they have the same number of fills and each corresponding fill pair shares a fill type (or the types can be meaningfully blended). The `styles_compatible()` function checks this:

```python
from vexy_lines import parse
from vexy_lines_apy import extract_style, styles_compatible

style_a = extract_style(parse("engraving.lines"))
style_b = extract_style(parse("different-engraving.lines"))
style_c = extract_style(parse("abstract-composition.lines"))

print(styles_compatible(style_a, style_b))  # True — same fill types and count
print(styles_compatible(style_a, style_c))  # False — different structure
```

**When styles are incompatible:**

- Different number of fills: a 3-fill style cannot interpolate with a 5-fill style.
- Fill types in different positions: if style A's first fill is Linear and style B's first fill is Halftone, interpolation between them is limited (the blend will snap rather than morph).

The function returns `True` or `False`. Check before interpolating to avoid runtime errors or unexpected results.

---

## The "House Style" Workflow

The most common production use of the style engine is maintaining a consistent visual identity. Here is the workflow:

1. **Design your look once.** Open a representative photograph in Vexy Lines. Build the fill stack, tune every parameter, get it exactly right. Save as `house-style.lines`.

2. **Extract the style.** Either through the CLI (`style-transfer`) or through the Python API (`extract_style`). The style is now a portable recipe.

3. **Apply to every new project.** When a new photograph arrives, apply the house style. The photograph changes; the treatment stays identical.

4. **Evolve the style over time.** As your aesthetic develops, update `house-style.lines`. All future applications use the new version. Previous exports remain as they were --- the style is applied at export time, not retroactively.

```python
from vexy_lines import parse
from vexy_lines_apy import MCPClient, extract_style, apply_style
import os

# Load the house style once
house_style = extract_style(parse("house-style.lines"))

# Apply to every new file in the inbox
inbox = "./new-projects"
outbox = "./styled-exports"
os.makedirs(outbox, exist_ok=True)

with MCPClient() as vl:
    for filename in os.listdir(inbox):
        if filename.endswith(".lines"):
            path = os.path.join(inbox, filename)
            vl.open_document(path)
            apply_style(vl, house_style)
            vl.render()
            out_path = os.path.join(outbox, filename.replace(".lines", ".svg"))
            vl.export_document(out_path, "svg")
            print(f"Styled: {filename}")
```

---

## Style as Data

A style object is just data. You can:

- **Save it** to JSON or any other format for archival.
- **Compare two styles** by inspecting their fill lists and parameters.
- **Generate styles programmatically** --- build a style from scratch in code, without ever opening the GUI.
- **Version-control styles** alongside your project files.

The style engine treats artistic decisions as structured data. That shift in perspective --- from "I dragged sliders until it looked right" to "here is a reproducible specification" --- is what makes batch processing, collaboration, and automation possible.

---

## Further Reading

- [Batch Export and Style Transfer](603-cli-advanced.md) --- the CLI commands that use the style engine under the hood.
- [Controlling Vexy Lines via API](605-mcp-api.md) --- the API that `apply_style()` calls internally.
- [Video to Vector Video](607-video-processing.md) --- style interpolation applied to video frames.

---

*Previous: [Controlling Vexy Lines via API](605-mcp-api.md) | Next: [Video to Vector Video](607-video-processing.md)*
