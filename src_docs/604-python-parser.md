# Reading .lines Files with Python

`vexy-lines-py` parses `.lines` files without launching the app. Use it when you need metadata, layer trees, fill parameters, embedded source images, previews, or small offline edits.

## Install

```bash
pip install vexy-lines-py
```

Requires Python 3.11 or newer.

## Parse A File

```python
from vexy_lines import GroupInfo, LayerInfo, parse

doc = parse("portrait.lines")
print(doc.caption, doc.version, doc.dpi)
print(doc.props.width_mm, doc.props.height_mm)

for node in doc.groups:
    if isinstance(node, GroupInfo):
        print("Group:", node.caption)
        for child in node.children:
            if isinstance(child, LayerInfo):
                print("  Layer:", child.caption)
                for fill in child.fills:
                    print("    Fill:", fill.params.fill_type, fill.params.interval, fill.params.angle)
```

## Embedded Images

```python
from vexy_lines import extract_preview_image, extract_source_image, extract_source_images

extract_source_image("portrait.lines", "portrait-source.jpg")
extract_source_images("portrait.lines", "portrait-sources")
extract_preview_image("portrait.lines", "portrait-preview.png")
```

`extract_source_images()` writes the document source first, then group-owned source images. Href references are ignored.

## Offline Edits

```python
from vexy_lines import rename_objects, replace_source_image, set_visibility

replace_source_image("style.lines", "new-photo.jpg", "new-photo-style.lines")
rename_objects("artwork.lines", "renamed.lines", {42: "sky-lines"})
set_visibility("artwork.lines", "fill-only.lines", {42: True, 43: False})
```

These helpers preserve unrelated XML content. They are useful for workflows such as AI rename and per-fill rendering.

## Key Types

| Type | Useful attributes |
|---|---|
| `LinesDocument` | `caption`, `version`, `dpi`, `props`, `groups`, `source_image_data`, `source_images`, `preview_image_data` |
| `GroupInfo` | `caption`, `object_id`, `expanded`, `children` |
| `LayerInfo` | `caption`, `object_id`, `visible`, `mask`, `fills`, `grid_edges` |
| `FillNode` | `xml_tag`, `caption`, `object_id`, `params`, `image_filters` |
| `FillParams` | `fill_type`, `color`, `interval`, `angle`, `thickness`, `smoothness`, `raw` |
| `SourceImageInfo` | `index`, `scope`, `caption`, `owner_path`, `width`, `height`, `data` |

*Previous: [Batch Export and Style Transfer](603-cli-advanced.md) | Next: [Controlling Vexy Lines via API](605-mcp-api.md)*
