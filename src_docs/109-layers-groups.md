# Organising Your Work

A one-layer document is an experiment. A twenty-layer document is a project. The difference between chaos and clarity in that twenty-layer document comes down to how you use layers and groups.

## Layers: The Transparent Sheets

Each layer in Vexy Lines contains exactly one fill — one algorithm generating one set of vector strokes. Layers stack vertically, like transparent sheets of acetate on an overhead projector (if you're old enough to remember those) or like layers in Photoshop, Illustrator, or any modern design application.

The layer at the top of the Layers Panel draws on top of everything below it. The layer at the bottom draws first and gets covered by everything above. This stacking order determines how fills overlap, which matters when fills have masks that leave some areas transparent.

### Creating Layers

Click the **+** button at the bottom of the Layers Panel. Choose a fill type from the menu. A new layer appears at the top of the stack, selected and ready for parameter adjustments.

### Selecting Layers

Click a layer in the Layers Panel to select it. The Properties Panel updates to show that fill's parameters. On the canvas, the selected fill's strokes may be highlighted (depending on your view settings).

You can also click directly on strokes in the canvas with the Editor tool (**V**) to select the layer they belong to.

### Reordering Layers

Drag a layer up or down in the Layers Panel to change its position in the stack. This changes which fills appear "in front of" or "behind" other fills.

Reordering is especially important when fills have masks with transparent areas. A Linear fill on top of a Halftone fill shows linear strokes where both fills are visible, with halftone dots visible through any gaps in the Linear fill's mask.

### Renaming Layers

Double-click a layer's name in the Layers Panel to rename it. Do this. Seriously.

A document with layers named "Linear 1", "Linear 2", "Linear 3", "Halftone 1" tells you nothing. A document with layers named "Face — fine engraving", "Hair — scribble texture", "Background — halftone dots", "Shadow — crosshatch" tells you everything.

Good names cost five seconds and save five minutes of clicking through layers to figure out which one does what.

### Toggling Visibility

Click the **eye icon** next to a layer to hide it without deleting it. The fill vanishes from the canvas but all its settings — parameters, mask, everything — remain intact. Click the eye again to bring it back.

Use visibility toggles to:
- Compare the document with and without a specific fill.
- Temporarily hide complex layers while working on simpler ones (this also speeds up rendering).
- Preview what the export will look like without certain fills.

### Locking Layers

Click the **lock icon** next to a layer to prevent accidental edits. A locked layer can't be moved, can't have its parameters changed, and can't have its mask painted on. It still renders normally — it's just protected from accidental changes.

Lock layers you're finished with. In a complex document, an accidental parameter drag on a finished layer is a frustrating setback, especially if you don't notice until later.

### Deleting Layers

Select a layer and press **Delete** (or right-click and choose **Delete Layer**). The layer and its fill are removed. If the layer had a mask, the mask is removed too.

This is undoable (**Cmd+Z** / **Ctrl+Z**), but it's still a good reason to save frequently. See [Save, Backup, Recover](111-saving.md).

## Groups: Folders for Layers

A group is a container that holds one or more layers. In the Layers Panel, groups appear as folders with a disclosure triangle that expands to show their contents.

### Creating Groups

Select one or more layers in the Layers Panel, then press **Cmd+G** (macOS) / **Ctrl+G** (Windows). The selected layers are wrapped in a new group.

Alternatively, create an empty group first and drag layers into it.

### Why Use Groups?

Groups serve three purposes:

**1. Organisation.** A portrait project might have groups named "Face", "Hair", "Background", and "Clothing", each containing several fill layers. Collapse a group you're not working on to declutter the Layers Panel.

**2. Shared masking.** A group can have its own mask, separate from the masks on individual layers inside it. The group mask applies on top of layer masks: a pixel is only visible if *both* the layer mask and the group mask allow it.

This is incredibly powerful. Put three fill layers inside a "Face" group, give the group a mask that shows only the face region, and all three fills are automatically restricted to the face — without each layer needing its own mask. Change the group mask once, and all three fills update.

**3. Per-group source images.** This is the feature that makes complex compositions possible.

### Per-Group Source Images

By default, all fills in a document read from the same source image — the one you loaded when you created the document. But each group can override this with its own source image.

Right-click a group in the Layers Panel and look for the source image option (the exact UI varies by version). Assign a different image, and every fill inside that group reads brightness values from the new image instead of the document-level one.

**Why this matters:**

- A portrait document can have a "Face" group (source: close-up photo) and a "Background" group (source: texture photo). Each set of fills reads its own source image.
- An illustration can combine multiple photographs into a single vector composition, each rendered through different fill algorithms.
- You can experiment with different source images for the same set of fills without duplicating layers.

### The Inheritance Chain

Source images follow an inheritance chain:

1. A fill first looks at its parent group for a source image.
2. If the parent group doesn't have one, it looks at the grandparent group.
3. This continues up the hierarchy until it either finds a group with a source image or reaches the document root.
4. The document root's source image is the one you loaded when you created the document.

This means: set a source image at the document level, and everything inherits it. Override at the group level, and only that group's contents change. Override at a nested group level, and only that nested group changes. It's a clean, predictable system.

**Practical example:**

```
Document (source: portrait.jpg)
├── Group: Face (no override → inherits portrait.jpg)
│   ├── Layer: Fine engraving (Linear, 0.5mm)
│   └── Layer: Crosshatch (Linear, 1mm, 90°)
├── Group: Background (source: texture.jpg)  ← override
│   └── Layer: Dot pattern (Halftone, 2mm)
└── Group: Border (source: ornament.png)  ← override
    └── Layer: Decorative frame (Trace)
```

Three source images, five fills, one document. Each fill reads the brightness values from its inherited source and generates strokes accordingly.

## Working with the Layers Panel

### Expanding and Collapsing Groups

Click the disclosure triangle next to a group name to expand (show contents) or collapse (hide contents). Collapsed groups still render normally — collapsing is purely a Layers Panel organisation feature.

Collapse groups you're not working on. A document with twenty layers in five groups is much easier to navigate when only the active group is expanded.

### Drag and Drop

The Layers Panel supports full drag-and-drop:

- Drag a layer up or down to reorder within a group.
- Drag a layer onto a group to move it inside.
- Drag a layer out of a group to move it to the top level.
- Drag a group up or down to reorder groups.
- Drag a group into another group to nest it.

Nesting groups is valid but use it sparingly. Deep nesting (groups inside groups inside groups) makes the inheritance chain harder to follow and the Layers Panel harder to navigate.

### Multiple Selection

Shift-click to select a range of layers. Cmd-click (macOS) / Ctrl-click (Windows) to select multiple individual layers. Multi-selected layers can be grouped, deleted, or moved together.

## Organisational Strategies

### Strategy 1: By Subject

Group layers by what they depict:
- "Face" group — all fills covering the face
- "Hair" group — fills covering the hair
- "Background" group — fills covering the background

This is intuitive for figurative work and makes per-group source images easy to manage.

### Strategy 2: By Fill Type

Group layers by technique:
- "Engraving" group — all Linear fills
- "Textures" group — Scribble and Fractal fills
- "Accents" group — Halftone and Radial fills

This is useful when you want to toggle an entire technique on and off to see its contribution.

### Strategy 3: By Stage

Group layers by refinement stage:
- "Base tones" group — the first rough fills
- "Detail" group — finer fills added later
- "Experimental" group — fills you're trying out (hide this group to see the "safe" version)

This is useful during iterative development of a complex piece.

### The Right Answer

There isn't one. Use whatever organisation helps you find things quickly and make changes confidently. The important thing is to *have* a strategy, not to have the *best* strategy. Unnamed layers in a flat list is the only truly wrong approach.

## A Naming Convention

If you want a convention:

```
[Region] — [fill type] [distinguishing detail]
```

Examples:
- "Face — Linear fine 0.5mm"
- "Face — Linear crosshatch 90°"
- "Background — Halftone dots"
- "Hair — Scribble dark"

The region prefix means layers sort by subject when alphabetically ordered, and the fill type and detail make each layer uniquely identifiable at a glance.

## Next Steps

You know how fills work ([Tuning Your Artwork](107-adjusting-fills.md)), how to control where they appear ([Hiding and Revealing](108-basic-masks.md)), and now how to organise them into manageable structures. The next step is getting your artwork out of Vexy Lines and into the world: [Getting Your Art Out](110-exporting.md).
