# The Workspace

Every tool, panel, and control in Vexy Lines is visible from the moment you open the application. There are no hidden drawers, no floating palettes to hunt for, no modes that rearrange the screen. Learn this layout once and you'll never be lost.

## The Big Picture

The workspace divides into five zones. From left to right, top to bottom:

```
┌────────────────────────────────────────────────────────┐
│                      Menu Bar                          │
├───────┬──────────────────────────────┬─────────────────┤
│       │                              │   Properties    │
│ Tool  │         Canvas               │     Panel       │
│  bar  │                              │                 │
│       │                              │                 │
│       │                              ├─────────────────┤
│       │                              │   Layers        │
│       │                              │     Panel       │
├───────┴──────────────────────────────┴─────────────────┤
│                    Status Bar                          │
└────────────────────────────────────────────────────────┘
```

**Canvas** — the large central area where your artwork lives. This is where you see the source image, the generated vector fills, and your masks. Everything you do ultimately affects what appears here.

**Toolbar** — the narrow vertical strip on the left edge. Seven tools, each with a single-key shortcut. You'll use the Editor (**V**) and Brush (**B**) most often.

**Properties Panel** — the panel on the right side. This is context-sensitive: it shows controls for whatever is currently selected. Select a fill, and you see Interval, Angle, Threshold, and the rest. Select a mask, and you see mask options. Select nothing, and it shows document properties.

**Layers Panel** — below the Properties Panel (or sometimes tabbed with it, depending on your layout). This is your document's structure: layers, groups, fills, masks, and their stacking order. The **+** button here is how you add new fills.

**Menu Bar** — the standard macOS/Windows menu bar at the top. File, Edit, View, and Help menus contain commands you'll occasionally need — document operations, undo/redo, zoom presets, and the Intro Tour.

## The Toolbar

Seven tools live in the toolbar. Each has a single-letter keyboard shortcut. Press the letter — no modifier keys needed — and you've switched tools.

| Icon | Tool | Shortcut | What It Does |
|------|------|----------|-------------|
| Arrow | **Editor** | **V** | Select, move, and transform fills and mask regions. Your default tool. |
| Pen tip | **Pencil** | **P** | Draw precise vector paths point by point. |
| Blade | **Knife** | **K** | Cut through paths to split them. |
| Brush | **Brush** | **B** | Paint masks freehand. White reveals, black hides. |
| Rectangle | **Rectangle Mask** | **I** | Draw rectangular mask areas. |
| Ellipse | **Ellipse Mask** | **O** | Draw elliptical mask areas. |
| Lasso | **Freeform Mask** | **S** | Click point by point to draw irregular mask boundaries. |

The Editor and Brush are the workhorses. You'll spend most of your time switching between **V** (to select and adjust fills) and **B** (to paint masks that control where fills appear). The mask tools (**I**, **O**, **S**) are for geometric precision when freehand painting isn't appropriate.

## The Properties Panel

This panel is the control centre for whatever you've selected. Its contents change based on context:

### When a Fill Is Selected

The Properties Panel shows every parameter that controls the selected fill's appearance. The exact set varies by fill type, but the common controls appear for nearly all fills:

- **Fill Type** — A dropdown or label showing the current algorithm (Linear, Wave, Halftone, etc.).
- **Interval** — The spacing between generated strokes. Smaller values produce finer detail; larger values produce bolder, more graphic results.
- **Angle** — Rotation of the fill pattern, in degrees.
- **Image Threshold** — A histogram with adjustable handles for shadows, midtones, and highlights. This controls which brightness values in the source image actually produce strokes.
- **Stroke Thickness** — How brightness maps to stroke weight. Three modes: **Linear** (proportional), **Thick** (emphasises heavy strokes in darks), and **Thin** (emphasises fine strokes in lights).
- **Smoothing** — Reduces jagged edges in generated strokes. Higher values produce smoother curves.
- **Randomization** — Adds controlled disorder to stroke placement, from 0% (perfectly regular) to 100% (maximum chaos).
- **Shift** — Offsets the entire pattern from its default position. Useful when aligning fills across layers.
- **Dynamic Color** — A toggle. When on, each stroke samples the colour of the source image pixel beneath it, rather than using a single flat colour.

Some fill types add their own unique parameters. [Tuning Your Artwork](107-adjusting-fills.md) covers the common parameters in depth. Part 2 of this manual covers each fill type's unique controls.

### When No Fill Is Selected

The Properties Panel shows **document-level properties**: canvas dimensions, resolution (DPI), and background colour. You'll visit this less often but it's where you adjust the overall document size.

### When a Mask Is Selected

The Properties Panel shows mask-specific options: feathering, inversion, and density controls. See [Hiding and Revealing](108-basic-masks.md) for details.

## The Layers Panel

The Layers Panel shows your document's structure as a vertical stack, similar to layer panels in Photoshop, Illustrator, or any design application. The key elements:

- **Layers** appear as rows in the stack. Each layer contains one fill. The topmost layer in the panel draws on top in the canvas.
- **Groups** appear as folders that contain layers. Click the disclosure triangle to expand or collapse a group.
- **Masks** appear attached to their parent layer or group — a small thumbnail showing white (visible) and black (hidden) regions.
- **Visibility toggles** — the eye icon next to each layer/group. Click to hide a layer without deleting it.
- **Lock toggles** — the lock icon. Locked layers can't be edited accidentally.
- **The + button** — at the bottom of the panel. Click to add a new fill layer. This opens the fill type selector.

Drag layers up and down to reorder them. Drag a layer onto a group to move it inside. Double-click a layer's name to rename it — good names save time on complex documents.

For a full treatment of layers and groups, see [Organising Your Work](109-layers-groups.md).

## The Menu Bar

Most of your work happens with tools, the Properties Panel, and the Layers Panel. The menu bar handles the rest:

**File** — New, Open, Save, Save As, Export, Recent Files. The commands you'd expect.

**Edit** — Undo (**Cmd+Z** / **Ctrl+Z**), Redo (**Cmd+Shift+Z** / **Ctrl+Shift+Z**), Copy (**Cmd+C** / **Ctrl+C** for clipboard export), Paste, and Select All.

**View** — Zoom controls (**Cmd+2** to frame selection, **Cmd+3** to show all), show/hide panels, and rendering quality toggles.

**Help** — the Intro Tour lives here, along with Check for Updates, Activate License, and links to online resources.

## Refresh Controls

Somewhere in the toolbar area (the exact location depends on your version), you'll find three refresh controls. These matter more than they might seem:

- **Auto Refresh** — A toggle. When on, Vexy Lines recalculates the vector output every time you change a parameter. For simple documents, this gives you live feedback. For complex documents with many fills, it can slow your machine to a crawl.
- **Refresh Fill** — Recalculates only the currently selected fill. Use this when Auto Refresh is off and you want to see the effect of your latest parameter change.
- **Refresh All** — Recalculates every fill in the document. Use this sparingly on complex projects.

See [Controlling When Vexy Recalculates](112-refresh-controls.md) for strategies on managing refresh performance.

## Customising the Workspace

Vexy Lines keeps its workspace layout fixed. You can't drag panels to new positions or create floating windows — this is a deliberate design choice that keeps the interface predictable. The Properties Panel is always on the right. The toolbar is always on the left. The canvas is always in the middle.

What you *can* control:

- **Panel width.** Drag the border between the canvas and the Properties/Layers Panel to give more or less room to either side.
- **View > Show/Hide.** Toggle the visibility of panels you don't currently need, giving the canvas more room.
- **Full screen mode.** Use macOS full screen or Windows maximise for maximum canvas space.

## The Canvas in Detail

The canvas isn't just a display — it's interactive:

- **Source image** appears as a dimmed background layer. It's there for visual reference while you work; it never exports.
- **Vector fills** render on top of the source image. Each fill draws according to its parameters and mask.
- **Masks** appear as semi-transparent red overlays when you're editing them (with the Brush or mask tools active).
- **Selection handles** appear around the currently selected element when the Editor tool (**V**) is active.

You navigate the canvas with keyboard shortcuts and gestures — see [Zoom, Pan, and Navigate](104-navigating.md) for the full set.

## Summary

| Zone | Location | Purpose |
|------|----------|---------|
| Canvas | Centre | View and interact with your artwork |
| Toolbar | Left edge | Seven tools, single-key shortcuts |
| Properties Panel | Right side | Context-sensitive parameter controls |
| Layers Panel | Right side, below Properties | Document structure, layer ordering, add fills |
| Menu Bar | Top | File operations, undo/redo, view options |
| Refresh Controls | Toolbar area | Control when vector recalculation happens |

This is the map. Now let's learn to [move around it](104-navigating.md).
