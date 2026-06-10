# Glossary

Every specialised term used in this manual, defined in one or two sentences, with a pointer to where you can learn more. If a slider label, a menu item, or a paragraph in this manual has ever made you pause, start here.

---

## A

**Angle**
The rotation of a fill pattern, measured in degrees. 0 is horizontal, 90 is vertical, 45 is the classic diagonal. Every fill type that generates a directional pattern has an Angle parameter. See [Tuning Your Artwork](107-adjusting-fills.md).

**Auto Refresh**
A toggle that controls whether Vexy Lines recalculates fills automatically after every parameter change. When on, you see live updates. When off, you must manually trigger a refresh. Turn it off for complex documents to avoid long waits. See [Controlling When Vexy Recalculates](112-refresh-controls.md).

**Auto Save**
A background process that periodically saves your document to protect against crashes and power loss. The auto-saved version is offered for recovery when you next launch the app. See [Save, Backup, Recover](111-saving.md).

## B

**Batch Convert**
A CLI command that processes every `.lines` file in a directory, extracting source images, previews, or metadata in bulk. See [The Command Line Tool](602-cli-basics.md).

**Blend Mode**
The method used to combine a fill's strokes with the content beneath it. Standard blend modes (Normal, Multiply, Screen, Overlay, etc.) control how colours interact when fills overlap.

**Brush**
The freehand painting tool (**B**) used to create and edit masks. Paint white to reveal strokes, black to hide them. Supports pressure sensitivity on tablets. See [Hiding and Revealing](108-basic-masks.md).

## C

**Canvas**
The rectangular working area of your document, measured in pixels at the document's DPI. Everything outside the canvas boundary is cropped on export. See [The Workspace](103-workspace.md).

**Circular**
A fill type that generates concentric rings radiating outward from a centre point. Ring spacing maps to image brightness. See [Circular](204-circular.md).

**CLI**
Command Line Interface. A text-based way to interact with software by typing commands in a terminal. The Vexy Lines CLI (`vexy-lines-cli`) provides offline file operations and app-connected export and style transfer. See [The Command Line Tool](602-cli-basics.md).

**Clone**
A layer that references another layer and inherits all its fill parameters. Changes to the source layer propagate to its clones. In the `.lines` file format, clones use an `href` attribute. See [The .lines File Format](611-file-format.md).

**Colour (Static)**
A single colour applied uniformly to every stroke in a fill. Chosen via the colour wheel, HSB/RGB sliders, hex input, swatches, or the eyedropper. See [Colour: Static and Dynamic](302-colour.md).

**Colour (Dynamic)**
A mode where each segment of each stroke samples its colour from the source image beneath it. Controlled by the Segment Length parameter. See [Colour: Static and Dynamic](302-colour.md).

**Crosshatch**
A technique created by stacking two or more Linear fills at different angles. The overlapping line directions simulate traditional crosshatch drawing. See [Linear: The Engraver's Line](202-linear.md).

## D

**Dash**
A stroke modification that breaks continuous strokes into dashed segments. Dash length and gap are configurable.

**Dispersion**
A parameter that applies random perpendicular offset to individual strokes within a fill. Unlike Randomization (which shifts entire stroke paths), Dispersion affects segments of strokes. See [Linear: The Engraver's Line](202-linear.md).

**Document**
The working file in Vexy Lines, saved with the `.lines` extension. Contains the canvas, layer tree, fill parameters, source image, and preview. See [Save, Backup, Recover](111-saving.md).

**DPI**
Dots Per Inch. Determines the physical size of the canvas when printed. A 3000-pixel-wide canvas at 300 DPI prints at 10 inches (254 mm) wide. Does not affect on-screen display. See [Creating a New Document](105-new-document.md).

**Dynamic Color**
See *Colour (Dynamic)*.

## E

**Editor**
The selection and transformation tool (**V**). Used to select, move, resize, and rotate fill regions and layers. See [The Workspace](103-workspace.md).

**Ellipse Mask**
A tool (**O**) that creates elliptical mask regions. Hold Shift to constrain to a perfect circle. See [Shape Masks](403-shape-masks.md).

**Emboss**
A visual effect that simulates three-dimensional relief on strokes, making them appear pressed into or raised from the surface. Controlled by rise, smoothness, and randomness parameters.

**EPS**
Encapsulated PostScript. A vector export format used in legacy print workflows. See [Getting Your Art Out](110-exporting.md).

**Export**
The process of saving your artwork as a standard file format (SVG, PDF, EPS, PNG, JPEG) separate from the `.lines` working file. The source image is never included in the export. See [Getting Your Art Out](110-exporting.md).

**extract_style()**
A Python function in `vexy-lines-apy` that reads a `.lines` document and returns a portable style object containing all fill types, parameters, and layer arrangement. See [Style Transfer and Interpolation](606-style-engine.md).

## F

**Fill**
An algorithm that reads pixel brightness from the source image and generates vector strokes. Each fill type produces a different visual pattern: parallel lines, concentric circles, dots, contours, and so on. A layer can contain one or more fills. See [Your First Fill](106-first-fill.md).

**Fill Type**
The specific algorithm used by a fill. Vexy Lines includes fourteen fill types: Linear, Wave, Circular, Spiral, Radial, Halftone, Trace, Wireframe, Scribble, Fractal, Text, Handmade, Trace Area, and Source Strokes. See [The One-Page Manual](002-tldr.md).

**FillNode**
A Python object in `vexy-lines-py` representing a single fill within a layer. Contains `fill_type` (the algorithm name) and `params` (a `FillParams` object). See [Reading .lines Files with Python](604-python-parser.md).

**FillParams**
A Python object in `vexy-lines-py` containing all parameter values for a fill. Attributes include `interval`, `angle`, `randomization`, `smoothing`, and others. See [Reading .lines Files with Python](604-python-parser.md).

**Fractal**
A fill type that generates space-filling Peano curves. The curves weave through the image following a fractal pattern, with density modulated by brightness. Also called Peano in some contexts. See [Fractal](211-fractal.md).

**Freeform Mask**
A tool (**S**) that draws irregular mask boundaries by placing points one at a time. See [Shape Masks](403-shape-masks.md).

## G

**Group**
A container in the layer tree that holds layers and other groups, functioning like a folder. Groups can have their own source image, which overrides the document-level source for all layers within. See [Organising Your Work](109-layers-groups.md).

**GroupInfo**
A Python object in `vexy-lines-py` representing a group. Contains `name`, `layers`, and `visible` properties. See [Reading .lines Files with Python](604-python-parser.md).

**Guilloche**
A decorative pattern of fine, interlacing curved lines, historically used on banknotes and security documents. Achievable in Vexy Lines by combining multiple Circular or Spiral fills with offset centres.

## H

**Halftone**
A fill type that generates dots (or other shapes) arranged in a grid, with dot size determined by image brightness. Evokes pop art, newsprint, and retro printing. See [Halftone](207-halftone.md).

**Handmade**
A fill type where you draw custom strokes, then Vexy Lines repeats and modulates them across the image according to brightness. See [Handmade](213-handmade.md).

**Hidden Stroke Removal (HSR)**
A rendering feature that simulates 3D occlusion on mesh-warped layers. Strokes on the "back" of a warped surface are hidden behind "front" strokes. Computationally expensive. See [Hidden Strokes Removal](406-hidden-strokes.md).

**Histogram**
The visual display in the Image Threshold control showing the distribution of brightness values in the source image. Three draggable handles (shadow, midtone, highlight) control which tones produce strokes. See [Image Threshold Deep Dive](304-image-threshold.md).

## I

**Image Threshold**
The control that determines which brightness values in the source image produce strokes. Implemented as a histogram with shadow, midtone, and highlight handles. The single most powerful tonal control after Interval. See [Image Threshold Deep Dive](304-image-threshold.md).

**Interval**
The distance between adjacent strokes in a fill, measured in millimetres. The most impactful single parameter in the application. Small intervals produce fine detail; large intervals produce bold, graphic marks. See [Tuning Your Artwork](107-adjusting-fills.md).

**interpolate_style()**
A Python function in `vexy-lines-apy` that blends two style objects at a given ratio (0.0 to 1.0), producing a new style with averaged parameters. See [Style Transfer and Interpolation](606-style-engine.md).

## J

**Job Folder**
A temporary directory created during batch operations (export, style transfer, video processing) to track progress. Enables resumption after interruption. See [Video to Vector Video](607-video-processing.md).

**JSON-RPC 2.0**
The protocol used by the Vexy Lines MCP server. A standard format for remote procedure calls encoded as JSON. You do not need to interact with it directly --- the Python packages and CLI handle it. See [Controlling Vexy Lines via API](605-mcp-api.md).

## K

**Knife**
A tool (**K**) that splits fills and cuts paths. See [The Workspace](103-workspace.md).

## L

**Layer**
A single drawing surface in the layer tree. Each layer contains one or more fills and optionally a mask. Layers stack vertically; higher layers draw on top of lower ones. See [Organising Your Work](109-layers-groups.md).

**LayerInfo**
A Python object in `vexy-lines-py` representing a layer. Contains `name`, `fills`, and `visible` properties. See [Reading .lines Files with Python](604-python-parser.md).

**Linear**
A fill type that generates parallel straight lines with thickness varying according to image brightness. The foundational fill in Vexy Lines, evoking copperplate engraving. See [Linear: The Engraver's Line](202-linear.md).

**LinesDocument**
The top-level Python object returned by the `parse()` function in `vexy-lines-py`. Contains metadata, the group/layer tree, and methods to extract embedded images. See [Reading .lines Files with Python](604-python-parser.md).

## M

**Mask**
A greyscale overlay on a layer that controls where strokes are visible. White regions reveal strokes; black regions hide them. Painted with the Brush tool or drawn with geometric mask tools. See [Hiding and Revealing](108-basic-masks.md).

**MCP**
Model Context Protocol. The communication channel through which external tools (scripts, AI assistants, other applications) control a running Vexy Lines instance. Uses JSON-RPC 2.0 over TCP on `localhost:47384`. See [Controlling Vexy Lines via API](605-mcp-api.md).

**MCPClient**
The Python class in `vexy-lines-apy` that manages the connection to the Vexy Lines MCP server. Provides methods for all 29 MCP tools. See [Controlling Vexy Lines via API](605-mcp-api.md).

**MCPError**
The exception raised by `MCPClient` when an API call fails. Contains a descriptive error message. See [Controlling Vexy Lines via API](605-mcp-api.md).

**Mesh**
A grid of control points overlaid on a layer. Displacing the points warps the fill strokes, creating three-dimensional deformation effects. See [Mesh Warping](405-mesh-warping.md).

**Morphing**
The visual effect of smoothly transitioning between two states, often achieved through style interpolation across a sequence of frames or images. See [Style Transfer and Interpolation](606-style-engine.md).

**Multiplier**
A parameter that scales overall stroke width. A multiplier of 2.0 doubles the thickness of every stroke in the fill. Default is 1.0. See [Linear: The Engraver's Line](202-linear.md).

## N

**Node**
A control point on a vector path. Nodes define the shape of masks, pencil paths, and freeform boundaries. Drag nodes to reshape; add or remove them with the Pencil tool.

## O

**Opacity**
A per-fill setting (0--100%) controlling how opaque the fill's strokes are. At 100%, strokes fully cover what is beneath. At lower values, underlying fills and the background show through. See [Colour: Static and Dynamic](302-colour.md).

**Overlap**
When strokes from adjacent passes of a fill cross or touch each other, they overlap. The visual density of overlapping strokes depends on the fill colour, opacity, and blend mode.

## P

**Pencil**
A tool (**P**) for drawing precise vector paths. Used to create custom mask boundaries and shapes. See [The Workspace](103-workspace.md).

**Phase Shift**
An offset applied to periodic fill patterns (Wave, Spiral) that shifts the starting phase of the waveform. Changes the visual character without changing frequency or amplitude.

**Preview**
The rendered thumbnail of the document, shown in the canvas and embedded in the `.lines` file. Toggle with **Cmd+Space / Ctrl+Space**. See [The Workspace](103-workspace.md).

**Properties Panel**
The panel on the right side of the workspace that displays and controls all parameters for the currently selected fill. Every slider and input field in this panel maps to a fill parameter. See [The Workspace](103-workspace.md).

## R

**Radial**
A fill type that generates rays emanating from a centre point, like a sunburst. Ray density is modulated by image brightness. See [Radial](206-radial.md).

**Randomization**
A parameter (0--100%) that adds perpendicular jitter to stroke placement, breaking mechanical precision. At 0%, strokes are perfectly regular. At high values, strokes scatter chaotically. See [Tuning Your Artwork](107-adjusting-fills.md).

**Rectangle Mask**
A tool (**I**) that creates rectangular mask regions. Hold Shift to constrain to a perfect square. See [Shape Masks](403-shape-masks.md).

**Refresh All**
A command (**Cmd+Shift+R / Ctrl+Shift+R**) that re-renders every fill in the document. Use after making changes with Auto Refresh off. See [Controlling When Vexy Recalculates](112-refresh-controls.md).

**Refresh Fill**
A command (**Cmd+R / Ctrl+R**) that re-renders only the currently selected fill. Faster than Refresh All for targeted updates. See [Controlling When Vexy Recalculates](112-refresh-controls.md).

**Rendering Quality**
A toggle between Fast (approximate, quick) and Best (full precision, slower). Work in Fast; export in Best. See [Performance and Troubleshooting](609-performance.md).

**Resolution**
The pixel dimensions of the canvas or the source image. Higher resolution captures more detail but increases rendering time and memory usage. See [Creating a New Document](105-new-document.md).

## S

**Scribble**
A fill type that generates chaotic, energetic strokes. Strokes cluster densely in dark regions and scatter in light ones. See [Scribble](210-scribble.md).

**Segment Length**
In Dynamic Colour mode, the length of each colour segment along a stroke. Short segments produce high colour fidelity; long segments produce broad colour zones. See [Colour: Static and Dynamic](302-colour.md).

**Shift**
A parameter that offsets the entire fill pattern perpendicular to the stroke direction, in millimetres. Use non-zero Shift values when stacking multiple fills to prevent overlap. See [Linear: The Engraver's Line](202-linear.md).

**Smoothing**
A parameter that reduces jagged thickness transitions along strokes. At 0, strokes respond sharply to brightness changes. At high values, weight changes are gradual and flowing. See [Tuning Your Artwork](107-adjusting-fills.md).

**Source Image**
The raster photograph or image that fills read brightness (and optionally colour) from. The source image is the blueprint for stroke generation. It is embedded in the `.lines` file but never appears in the export. See [Creating a New Document](105-new-document.md).

**Source Strokes**
A special fill type that uses strokes from the source data directly rather than generating new ones algorithmically.

**Spiral**
A fill type that generates a continuous winding path from a centre point outward. Stroke density is driven by image brightness. See [Spiral](205-spiral.md).

**Static Color**
See *Colour (Static)*.

**Stroke**
A single vector path generated by a fill algorithm. Strokes have position, shape, thickness, and colour. Thousands of strokes combine to form the visible artwork.

**Stroke Thickness**
The mapping from image brightness to stroke weight. Three modes: Linear (proportional), Thick (emphasises weight), Thin (emphasises delicacy). See [Tuning Your Artwork](107-adjusting-fills.md).

**Style**
The complete set of artistic parameters in a document: fill types, their settings, layer arrangement, and colour choices. A style can be extracted, applied to other documents, and interpolated between two reference documents. See [Style Transfer and Interpolation](606-style-engine.md).

**SVG**
Scalable Vector Graphics. An XML-based vector format. The primary export format for web use and compatibility with design applications (Illustrator, Affinity Designer, Inkscape). See [Getting Your Art Out](110-exporting.md).

## T

**Text**
A fill type that uses letters and words as stroke elements, with character density following image tone. See [Text](212-text.md).

**Trace**
A fill type that generates contour lines following the edges detected in the source image. Produces a topographic-map or edge-based abstraction effect. See [Trace](208-trace.md).

**Trace Area**
A variant of the Trace fill that fills enclosed regions between detected edges rather than drawing contour lines.

## U

**Undo**
Reverses the last operation. **Cmd+Z / Ctrl+Z**. Repeatable to step back through the editing history. See [Keyboard Shortcuts Reference](610-shortcuts.md).

**Units**
Vexy Lines works in pixels internally but displays measurements in millimetres based on the document's DPI setting. An interval of 1 mm at 300 DPI is approximately 12 pixels.

## V

**vexy-lines-apy**
The Python package that provides MCP API bindings and the style engine. Requires the Vexy Lines app to be running for API calls. Install with `pip install vexy-lines-apy`. See [Controlling Vexy Lines via API](605-mcp-api.md).

**vexy-lines-cli**
The command-line tool for file inspection, batch export, and style transfer. Install with `pip install vexy-lines-cli`. See [The Command Line Tool](602-cli-basics.md).

**vexy-lines-py**
The pure Python `.lines` file parser. Works offline with no running app. Install with `pip install vexy-lines-py`. See [Reading .lines Files with Python](604-python-parser.md).

**vexy-lines-run**
The standalone batch processing GUI application. Three tabs for images, folders, and video. Install with `pip install vexy-lines-run`. See [Beyond the GUI](601-part6-tldr.md).

**vexylines-mcp**
The bridge binary that translates between the MCP stdio protocol (used by Claude Desktop and similar tools) and the TCP protocol (used by the Vexy Lines app). Installed as part of `vexy-lines-cli`. See [AI-Assisted Workflows](608-ai-workflows.md).

## W

**Warp**
A deformation applied to fill strokes through a mesh grid. Warp templates include Rectangle, Donut, Rising, Falling, and Ribbon. See [Mesh Warping](405-mesh-warping.md).

**Wave**
A fill type that generates flowing sinusoidal curves. Strokes follow a wave pattern with thickness modulated by image brightness. Also known as Sigmoid in the file format. See [Wave](203-wave.md).

**Wireframe**
A fill type that creates a 3D lattice mesh draped over the image, producing an elevation-map effect. See [Wireframe](209-wireframe.md).

## X

**XML**
Extensible Markup Language. The text-based format used inside `.lines` files. Every group, layer, fill, and parameter is encoded as XML elements and attributes. See [The .lines File Format](611-file-format.md).

## Z

**zlib**
A compression algorithm used to compress the JPEG source image data inside `.lines` files. The compressed data is then base64-encoded for storage in XML. See [The .lines File Format](611-file-format.md).

**Zoom**
Magnifying or shrinking the canvas view. **Z** zooms in, **X** zooms out, **Alt + scroll wheel** zooms continuously at the cursor. See [Zoom, Pan, and Navigate](104-navigating.md).

---

*Previous: [The .lines File Format](611-file-format.md) | Back to [Table of Contents](001-toc.md)*
