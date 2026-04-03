# The .lines File Format

Open a `.lines` file in a text editor and you will find XML. Not especially pretty XML --- the source image alone is a wall of base64 characters that can run for megabytes --- but XML nonetheless. Every group, every layer, every fill, every parameter, every embedded image is encoded in a structured hierarchy that you can read, search, and (carefully) edit by hand.

This article is a reference for the technically curious. You do not need any of this information to use Vexy Lines. But if you want to build tools that read or write `.lines` files, debug a corrupted document, or simply understand what the parser from [Reading .lines Files with Python](604-python-parser.md) is actually parsing, this is the map.

---

## File Structure Overview

A `.lines` file is a plain-text XML document. The top-level structure:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Project caption="My Artwork" version="4.2" dpi="300">
  <Document width="2400" height="3200">
    <Objects>
      <!-- Layer tree goes here -->
    </Objects>
  </Document>
  <SourceImage>
    <!-- Base64-encoded source photograph -->
  </SourceImage>
  <PreviewImage>
    <!-- Base64-encoded preview thumbnail -->
  </PreviewImage>
</Project>
```

### `<Project>` Root Element

The root element. Its attributes store document-level metadata.

| Attribute | Type | Description |
|-----------|------|-------------|
| `caption` | String | The document's title, shown in the title bar |
| `version` | String | File format version (e.g., "4.2") |
| `dpi` | Integer | Dots per inch. Determines the physical size of the canvas. |

### `<Document>` Element

Contains the canvas dimensions and the layer tree.

| Attribute | Type | Description |
|-----------|------|-------------|
| `width` | Integer | Canvas width in pixels |
| `height` | Integer | Canvas height in pixels |

### `<Objects>` Element

The root of the layer tree. Contains a flat or nested sequence of groups (`<LrSection>`) and layers (`<FreeMesh>`).

---

## The Layer Tree

The `<Objects>` element contains the document's layer hierarchy. Two element types build this tree:

### Groups: `<LrSection>`

A group is a folder that contains layers and other groups.

```xml
<LrSection name="Background" visible="1">
  <!-- Layers and subgroups go here -->
</LrSection>
```

| Attribute | Type | Description |
|-----------|------|-------------|
| `name` | String | Group name, shown in the Layers Panel |
| `visible` | `0` or `1` | Whether the group is visible |

Groups can nest inside other groups to any depth.

### Layers: `<FreeMesh>`

A layer contains one or more fills. Each fill is a child element whose tag name identifies the fill type.

```xml
<FreeMesh name="Engraving" visible="1">
  <LinearStrokesTmpl interval="0.8" angle="15" randomization="0" smoothing="30" />
  <LinearStrokesTmpl interval="1.2" angle="75" randomization="0" smoothing="30" />
</FreeMesh>
```

| Attribute | Type | Description |
|-----------|------|-------------|
| `name` | String | Layer name |
| `visible` | `0` or `1` | Whether the layer is visible |

---

## Fill Elements

Each fill type has its own XML tag. The tag name determines the algorithm. All fill parameters are stored as XML attributes on the fill element.

### Fill Type Tag Mapping

| XML Tag | Fill Type | GUI Name |
|---------|-----------|----------|
| `LinearStrokesTmpl` | Linear | Linear |
| `SigmoidStrokesTmpl` | Sigmoid / Wave | Wave |
| `CircleStrokesTmpl` | Circle | Circular |
| `RadialStrokesTmpl` | Radial | Radial |
| `SpiralStrokesTmpl` | Spiral | Spiral |
| `ScribbleStrokesTmpl` | Scribble | Scribble |
| `HalftoneStrokesTmpl` | Halftone | Halftone |
| `FreeCurveStrokesTmpl` | Free Curve | Handmade / Trace |
| `PeanoStrokesTmpl` | Peano | Fractal |
| `TracedAreaTmpl` | Traced Area | Trace (area) |
| `SourceStrokes` | Source | Source Strokes |

The `FreeCurveStrokesTmpl` tag serves double duty: it covers both the Handmade fill (user-drawn strokes) and the Trace fill (edge-detected contours), distinguished by internal attributes.

### Common Fill Attributes

Most fill elements share a common set of attributes:

| Attribute | Type | Description |
|-----------|------|-------------|
| `interval` | Float | Spacing between strokes, in mm |
| `angle` | Float | Rotation of the fill pattern, in degrees |
| `randomization` | Float | Random displacement of strokes (0--100) |
| `smoothing` | Float | Smoothing applied to stroke thickness transitions |
| `shift` | Float | Perpendicular offset of the pattern origin, in mm |
| `color` | String | Stroke colour in `#AARRGGBB` format |
| `strokeThicknessMode` | String | Thickness mapping: `"linear"`, `"thick"`, or `"thin"` |
| `multiplier` | Float | Scales overall stroke width (default 1.0) |
| `dispersion` | Float | Random perpendicular offset on individual strokes |
| `dynamicColor` | `0` or `1` | Whether strokes sample colour from the source image |
| `dynamicColorSegmentLength` | Float | Length of each colour segment in dynamic mode |

Additional attributes vary by fill type. The Halftone fill has `shape`, `dotSize`, and `dotGap`. The Spiral fill has `centerX` and `centerY`. Consult the fill's Properties Panel in the GUI for a complete list --- each property maps to an XML attribute with the same or a similar name.

---

## Colour Format: `#AARRGGBB`

Vexy Lines uses an eight-character hex colour format with alpha first, not last:

```
#FFFF6B35
 ││││││││
 ││││││└┘── Blue:  0x35 = 53
 ││││└┘──── Green: 0x6B = 107
 ││└┘────── Red:   0xFF = 255
 └┘──────── Alpha: 0xFF = 255 (fully opaque)
```

This differs from the more common `#RRGGBBAA` or `#RRGGBB` formats used in CSS and most design tools. When reading or writing colour values in `.lines` files, remember: **alpha comes first**.

| Vexy Lines | CSS Equivalent | Description |
|------------|---------------|-------------|
| `#FF000000` | `#000000` (fully opaque) | Solid black |
| `#FFFFFFFF` | `#FFFFFF` | Solid white |
| `#FFFF0000` | `#FF0000` | Solid red |
| `#80FF0000` | `rgba(255, 0, 0, 0.5)` | 50% transparent red |
| `#00FF0000` | `rgba(255, 0, 0, 0)` | Fully transparent red |

---

## Source Image Encoding

The source photograph is embedded in the `<SourceImage>` element as a base64 string. But it is not simply base64-of-JPEG. There is an extra layer of compression:

```
base64( 4-byte-size-prefix + zlib-compressed-JPEG )
```

### Decoding Steps

1. **Base64-decode** the text content of `<SourceImage>`.
2. **Read the first 4 bytes** as a big-endian unsigned integer. This is the uncompressed size of the JPEG data.
3. **zlib-decompress** the remaining bytes.
4. The result is a standard **JPEG file** that can be opened in any image viewer.

### Encoding Steps (if writing)

1. Start with a standard JPEG file as bytes.
2. **Record the byte length** of the JPEG data as a 4-byte big-endian unsigned integer.
3. **zlib-compress** the JPEG bytes.
4. **Concatenate** the 4-byte size prefix and the compressed data.
5. **Base64-encode** the result.
6. Write as the text content of `<SourceImage>`.

In Python (using `vexy-lines-py`), the parser handles all of this automatically. The `extract_source_image()` method returns raw JPEG bytes ready to write to a file.

---

## Preview Image Encoding

The preview thumbnail is simpler: the `<PreviewImage>` element contains a base64-encoded PNG image. No size prefix, no zlib layer.

```
base64( PNG-file-bytes )
```

To decode: base64-decode the text, and you have a standard PNG file.

The preview reflects the last rendered state of the document. If you change parameters without re-rendering, the preview will not match the current settings.

---

## Mesh Data

Layers that use mesh warping contain additional child elements describing the mesh grid. The mesh is a grid of control points, each with an X and Y position in canvas coordinates.

```xml
<FreeMesh name="Warped Layer" visible="1">
  <LinearStrokesTmpl interval="1.0" angle="0" />
  <Mesh rows="5" cols="5">
    <Point x="0" y="0" />
    <Point x="600" y="0" />
    <Point x="1200" y="0" />
    <!-- ... more points ... -->
  </Mesh>
</FreeMesh>
```

The mesh points define a deformation grid. Each point can be displaced from its default position to warp the fill strokes. The warp templates (Rectangle, Donut, Rising, Falling, Ribbon, etc.) are preset mesh configurations.

---

## Clone References

Layers can be clones of other layers. A clone layer does not store its own fill parameters --- it references another layer by ID and inherits everything from it. Changes to the source layer propagate to all clones.

```xml
<FreeMesh name="Clone of Engraving" visible="1" href="#layer-42" />
```

The `href` attribute contains the ID of the source layer, prefixed with `#`. When you see a `<FreeMesh>` with no fill children but an `href` attribute, it is a clone.

---

## A Complete Example

A minimal `.lines` file with one group, one layer, and one Linear fill:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Project caption="Minimal Example" version="4.2" dpi="300">
  <Document width="1200" height="800">
    <Objects>
      <LrSection name="Main Group" visible="1">
        <FreeMesh name="Lines" visible="1">
          <LinearStrokesTmpl
            interval="1.5"
            angle="45"
            randomization="10"
            smoothing="25"
            shift="0"
            color="#FF000000"
            strokeThicknessMode="linear"
            multiplier="1.0"
            dispersion="0"
            dynamicColor="0"
          />
        </FreeMesh>
      </LrSection>
    </Objects>
  </Document>
  <SourceImage>
    <!-- base64(4-byte-size + zlib(JPEG)) goes here -->
  </SourceImage>
  <PreviewImage>
    <!-- base64(PNG) goes here -->
  </PreviewImage>
</Project>
```

This is the skeleton that every `.lines` file follows. Real documents have more groups, more layers, more fills, and much longer base64 strings for the embedded images.

---

## Editing Files by Hand

You can edit `.lines` files in a text editor. This is occasionally useful for:

- Changing a colour across many fills simultaneously (find and replace).
- Fixing a corrupted file where one element is broken.
- Batch-modifying parameters with a script that reads and writes XML.

**Warnings:**

- **Always work on a copy.** Save your original before editing.
- **Do not touch the base64 blocks.** Even a single missing character will corrupt the embedded image.
- **Validate your XML.** A missing closing tag or unescaped character will make the file unreadable. The app will refuse to open an invalid XML file.
- **Attribute order does not matter.** XML attributes can appear in any order.
- **Use the parser instead.** For anything beyond trivial edits, the `vexy-lines-py` parser is safer and faster than hand-editing. See [Reading .lines Files with Python](604-python-parser.md).

---

## Further Reading

- [Reading .lines Files with Python](604-python-parser.md) --- the parser that reads this format.
- [Save, Backup, Recover](111-saving.md) --- file management and recovery.
- [Glossary](612-glossary.md) --- definitions of terms used in this article.

---

*Previous: [Keyboard Shortcuts Reference](610-shortcuts.md) | Next: [Glossary](612-glossary.md)*
