# Groups: Source Images and Inheritance

A fifty-layer document without groups is a filing cabinet with no folders — technically functional, practically nightmarish. Groups turn chaos into structure. But they do more than organise: they carry their own source images, create inheritance chains, import entire documents as sub-compositions, and control how masks interact across layer boundaries.

---

## Creating Groups

Select one or more layers in the Layers Panel and press **Cmd+G** (macOS) or **Ctrl+G** (Windows). The selected layers collapse into a group — a folder icon with a disclosure triangle. Click the triangle to expand or collapse the group.

You can also:

- **Right-click** in the Layers Panel → New Group (creates an empty group).
- **Drag layers** into an existing group to move them inside.
- **Drag layers** out of a group to remove them.
- **Nest groups** inside other groups by dragging a group into another group. Nesting depth is unlimited.

To ungroup: select the group, then Cmd+Shift+G (macOS) or Ctrl+Shift+G (Windows). The layers move back to the parent level and the group disappears.

---

## Per-Group Source Images

This is the feature that transforms groups from organisational folders into compositing powerhouses.

Every group can have its own **source image** — the photograph or illustration that its fills read brightness (and Dynamic Color) from. To assign one:

1. Select a group in the Layers Panel (click its header, not a layer inside it).
2. Drag a photo onto the group header. Or use the Properties Panel to browse for an image file.
3. The group's source image thumbnail appears on the group header.

From now on, **every fill inside that group reads from the group's source image**, not the document's root source image.

### Why this matters

Without per-group source images, every fill in your document reads from the same photograph. That's fine for single-image artwork. But many projects composite multiple images:

- **Collage.** Three photographs, each with its own set of fills, combined in a single canvas.
- **Background + subject.** A landscape photo for the background fills and a portrait photo for the foreground fills.
- **Texture injection.** A group whose source image is a seamless texture (wood grain, marble, fabric), generating fills that add texture to areas of the composition that have nothing to do with the main photo.

Each of these scenarios requires different fills to read from different images. Per-group source images make it possible without any workarounds.

### Workflow: Multi-Image Composite

1. **Create the document** with your primary photo (File > New, drag photo).
2. **Add fills for the background** at the root level. They read from the primary photo.
3. **Create a new group** (Cmd+G on an empty selection, or right-click > New Group).
4. **Assign a second photo** to the group by dragging it onto the group header.
5. **Add fills inside the group.** They read from the group's photo, not the root photo.
6. **Mask the group's fills** to the region where the second photo should appear.
7. Repeat for additional source images.

The document now contains fills driven by different photographs, all composited on a single canvas.

---

## The Inheritance Chain

Not every group needs its own source image. Groups without an assigned source image **inherit** from their parent — and if the parent doesn't have one either, inheritance continues upward until it reaches a group that does, or the document root.

The inheritance chain:

```
Fill Layer
  └── reads from: Parent Group's source image
        └── if none: Grandparent Group's source image
              └── if none: ... continue upward ...
                    └── if none: Document root source image
```

This means:

- A fill in a group with a source image reads from that group's image.
- A fill in a group *without* a source image reads from the nearest ancestor group that has one.
- A fill at the root level (not inside any group) reads from the document's root source image.

### Practical example

```
Document (source: landscape.jpg)
├── Sky Group (no source → inherits landscape.jpg)
│   ├── Wave fill (reads landscape.jpg)
│   └── Circular fill (reads landscape.jpg)
├── Foreground Group (source: portrait.jpg)
│   ├── Linear fill (reads portrait.jpg)
│   └── Trace fill (reads portrait.jpg)
│   └── Detail Sub-Group (no source → inherits portrait.jpg)
│       └── Halftone fill (reads portrait.jpg)
└── Texture Group (source: woodgrain.png)
    └── Linear fill (reads woodgrain.png)
```

The Sky Group doesn't need its own source — it uses the document's landscape. The Foreground Group overrides with a portrait. The Detail Sub-Group inside it inherits the portrait without needing a second assignment. The Texture Group uses a completely different image for its wood-grain fills.

Inheritance keeps things DRY. You only assign a source image where you need a change. Everything else flows automatically.

---

## Importing .lines Files as Groups

An entire Vexy Lines document can become a sub-component of another document:

1. **File > Import** (or drag a .lines file onto the Layers Panel).
2. The imported document appears as a new group, complete with all its layers, fills, masks, meshes, and sub-groups.
3. The imported group retains its own source image if it had one.

### Why import?

- **Reusable components.** Build a decorative border in one document, then import it into every certificate or poster that needs it.
- **Collaborative assembly.** Team members work on different parts of a composition in separate .lines files, then someone imports all of them into a master document.
- **Template stacking.** Import multiple style templates and toggle their visibility to compare approaches without rebuilding.

Imported groups behave like any other group. You can move layers in and out, change the source image, add fills, and nest them further.

---

## Overlay Mode

By default, a group's masks only affect layers *inside* that group. Fills outside the group don't know or care about masks inside it.

**Overlay mode** changes this. When enabled on a group, the group's combined mask region *cuts through* layers outside the group. Fills outside the group disappear wherever the group's masks are active.

### When to use overlay

- **Subject isolation.** You have a background group with wide-interval fills and a foreground group with tight-interval fills masked to a portrait. Enable overlay on the foreground group, and the background fills vanish behind the portrait — no need to manually mask the background.
- **Sticker effect.** An imported group with its own source image, overlaid so it punches through the layers beneath it, creating a sticker-on-canvas effect.
- **Cutout compositions.** Multiple overlaid groups create a collage where each group's region is exclusive — fills never overlap between groups.

### How to enable

1. Select the group in the Layers Panel.
2. In the Properties Panel, toggle **Overlay** on.

---

## Lock and Visibility

Two simple toggles on every group header:

| Toggle | Icon | What It Does |
|--------|------|-------------|
| **Visibility** | Eye icon | Hides all layers inside the group (and sub-groups). The fills don't render, don't export, and don't affect performance. |
| **Lock** | Lock icon | Prevents editing of all layers inside the group. You can't paint masks, move nodes, or change parameters. Useful for protecting finished work while editing other areas. |

Both cascade: toggling visibility or lock on a parent group affects all children, grandchildren, and so on.

**Tip:** Temporarily hide complex groups while working on other parts of the document. This speeds up rendering and reduces visual clutter. Show them again when you need to see the full composition.

---

## Group Strategies for Complex Documents

### Strategy 1: Region Groups

Divide the canvas into spatial regions, each in its own group. A portrait might have:

- Head Group (fills for hair, face, features)
- Body Group (fills for clothing, hands)
- Background Group (fills for background elements)

Each group can have the same source image (inherited) or different ones.

### Strategy 2: Technique Groups

Group by visual technique rather than spatial region:

- Outlines Group (Trace fills on top)
- Shading Group (Linear/Wave fills in the middle)
- Texture Group (Halftone/Scribble fills at the bottom)

This makes it easy to adjust all shading at once (change the shading group's source image to a higher-contrast version) without touching outlines or textures.

### Strategy 3: Version Groups

Keep alternative approaches in separate groups:

- Style A Group (classic engraving: Linear crosshatch)
- Style B Group (modern: Halftone + Trace)
- Style C Group (organic: Wave + Scribble)

Toggle visibility to compare. When you've decided, delete the rejected groups or keep them hidden as a record of your exploration.

### Strategy 4: Export Groups

For screen printing or colour separation, each colour gets its own group:

- Black Group (Trace outlines)
- Red Group (Linear fills, masked to red regions)
- Blue Group (Circular fills, masked to blue regions)

Export each group separately for individual colour plates. See [Preparing for Screen Printing](504-screen-printing.md).

---

## Tips

**Name your groups.** Double-click a group header to rename it. "Group 1" through "Group 12" is a recipe for confusion. "Face — Linear Crosshatch" tells you exactly what's inside.

**Keep nesting shallow.** One or two levels of nesting is manageable. Four or five levels becomes difficult to navigate. If your group hierarchy is deeper than three levels, consider flattening it.

**Check inheritance when debugging.** If a fill isn't responding to the right image, trace the inheritance chain upward from the fill's group. The fill reads from the first group in the chain that has a source image assigned. If you forgot to assign one, it's reading from the document root.

**Import conservatively.** Importing a large .lines file into a complex document can make things unwieldy. If you only need one or two fills from the imported document, consider copying just those layers instead of importing the entire file.

---

## Summary

| Action | How |
|--------|-----|
| Create group | Select layers → Cmd+G |
| Ungroup | Select group → Cmd+Shift+G |
| Assign source image | Drag photo onto group header |
| Remove source image | Select group → Properties Panel → Remove Source |
| Import .lines as group | File > Import or drag .lines file onto Layers Panel |
| Enable overlay | Select group → Properties Panel → Overlay On |
| Lock group | Click lock icon on group header |
| Toggle visibility | Click eye icon on group header |
| Rename group | Double-click group header |

*Next: [Layer Order and Stacking Strategy](408-layer-ordering.md)*
