# Keyboard Shortcuts Reference

Memorising shortcuts is optional. Using them is addictive. Once your left hand learns to tap **V** for the Editor or **B** for the Brush without looking, the lag between thinking and doing shrinks to nearly zero. This page collects every keyboard shortcut in Vexy Lines, organised by what you are doing at the time.

Where macOS and Windows differ, both are shown as **macOS / Windows**.

---

## Tools

Each tool has a single-letter shortcut. Press the key and the tool activates. No modifier required.

| Key | Tool | What It Does |
|-----|------|-------------|
| **V** | Editor | Select, move, and transform fill regions |
| **P** | Pencil | Draw precise vector paths for masks and shapes |
| **K** | Knife | Split fills and cut paths |
| **B** | Brush | Paint masks freehand (white = reveal, black = hide) |
| **I** | Rectangle Mask | Draw rectangular mask areas |
| **O** | Ellipse Mask | Draw elliptical mask areas |
| **S** | Freeform Mask | Draw irregular mask boundaries point by point |

**Tip:** The tool shortcuts spell out **V-P-K-B-I-O-S** along the top-left of a QWERTY keyboard. No mnemonics needed --- just remember the positions.

---

## Navigation

Moving around the canvas: zooming, panning, and framing.

| Action | Shortcut | Notes |
|--------|----------|-------|
| Zoom in | **Z** | Tap to zoom in one step at the cursor position |
| Zoom out | **X** | Tap to zoom out one step at the cursor position |
| Zoom at cursor (continuous) | **Alt + scroll wheel** | Smooth zoom centred on the cursor. The fastest way to navigate. |
| Pan | **Spacebar + drag** | Hold Spacebar, then click and drag. Works with any tool active. |
| Frame selection | **Cmd+2 / Ctrl+2** | Zoom to fit the selected element(s) in the viewport |
| Show all | **Cmd+3 / Ctrl+3** | Zoom to fit the entire document in the viewport |
| Zoom to 100% | **Cmd+1 / Ctrl+1** | One document pixel = one screen pixel |
| Zoom to fit | **Cmd+0 / Ctrl+0** | Fit the entire canvas in the window |

**Trackpad users:** Two-finger pinch zooms in and out. Two-finger drag pans. These work alongside the keyboard shortcuts.

---

## Editing

Selection, clipboard, grouping, and deletion.

| Action | Shortcut | Notes |
|--------|----------|-------|
| Undo | **Cmd+Z / Ctrl+Z** | Reverses the last operation. Repeatable. |
| Redo | **Cmd+Shift+Z / Ctrl+Shift+Z** | Re-applies the last undone operation. Also **Cmd+Y / Ctrl+Y** on Windows. |
| Copy | **Cmd+C / Ctrl+C** | Copy selected element(s) to clipboard |
| Paste | **Cmd+V / Ctrl+V** | Paste from clipboard |
| Duplicate | **Cmd+D / Ctrl+D** | Create a copy of the selected element in place |
| Group selected | **Cmd+G / Ctrl+G** | Wrap selected layers into a new group |
| Ungroup | **Cmd+Shift+G / Ctrl+Shift+G** | Dissolve the selected group, releasing its contents |
| Delete | **Delete / Backspace** | Remove the selected element (fill, layer, or group) |
| Select all | **Cmd+A / Ctrl+A** | Select all elements in the current context |

---

## View

Controlling what you see on the canvas.

| Action | Shortcut | Notes |
|--------|----------|-------|
| Toggle preview | **Cmd+Space / Ctrl+Space** | Show rendered artwork without the source image overlay |
| Toggle source image | **Cmd+Shift+I / Ctrl+Shift+I** | Show or hide the source image beneath the fills |
| Toggle wireframe | **Cmd+Shift+W / Ctrl+Shift+W** | Show stroke paths as outlines without fill thickness |
| Refresh current fill | **Cmd+R / Ctrl+R** | Re-render the selected fill only |
| Refresh all fills | **Cmd+Shift+R / Ctrl+Shift+R** | Re-render every fill in the document |
| Toggle Auto Refresh | **Cmd+Shift+A / Ctrl+Shift+A** | Enable or disable automatic re-rendering after parameter changes |

---

## Brush and Mask Modifiers

These modifiers apply when a painting or mask tool is active (**B**, **I**, **O**, or **S**).

| Action | Shortcut | Notes |
|--------|----------|-------|
| Switch to reveal (white) | **Hold Shift** | While held, brush paints white (reveal). Release to return to current mode. |
| Switch to hide (black) | **Hold Alt / Option** | While held, brush paints black (hide). Release to return to current mode. |
| Resize brush | **Ctrl + drag left/right** | Hold Ctrl and drag horizontally to shrink or grow the brush diameter. macOS only. On Windows, use **[** and **]** keys. |
| Decrease brush size | **[** | Step the brush diameter down |
| Increase brush size | **]** | Step the brush diameter up |
| Constrain to straight line | **Hold Shift while dragging** | Brush strokes or mask shapes snap to horizontal, vertical, or 45-degree lines |
| Constrain rectangle to square | **Hold Shift while dragging** | Rectangle Mask tool creates a perfect square |
| Constrain ellipse to circle | **Hold Shift while dragging** | Ellipse Mask tool creates a perfect circle |
| Draw from centre | **Hold Alt / Option while dragging** | Rectangle and Ellipse mask tools draw from the centre outward instead of from corner to corner |

---

## Editor Tool Modifiers

These apply when the Editor tool (**V**) is active.

| Action | Shortcut | Notes |
|--------|----------|-------|
| Constrain movement | **Hold Shift while dragging** | Restrict movement to horizontal or vertical |
| Proportional resize | **Hold Shift while resizing** | Maintain aspect ratio during resize |
| Resize from centre | **Hold Alt / Option while resizing** | Resize anchored at the centre instead of the opposite corner |
| Duplicate by dragging | **Hold Alt / Option and drag** | Create a copy and move it in one gesture |
| Fine-tune position | **Arrow keys** | Move selected element 1 pixel per tap |
| Large position step | **Shift + Arrow keys** | Move selected element 10 pixels per tap |

---

## Layer Panel

Quick actions in the Layers Panel (bottom-right).

| Action | Shortcut | Notes |
|--------|----------|-------|
| New layer | **Cmd+Shift+N / Ctrl+Shift+N** | Create a new empty layer |
| Move layer up | **Cmd+] / Ctrl+]** | Move the selected layer higher in the stack |
| Move layer down | **Cmd+[ / Ctrl+[** | Move the selected layer lower in the stack |
| Toggle layer visibility | **Click the eye icon** | No keyboard shortcut; mouse only |

---

## File

Standard file operations.

| Action | Shortcut | Notes |
|--------|----------|-------|
| New document | **Cmd+N / Ctrl+N** | Create a new document |
| Open | **Cmd+O / Ctrl+O** | Open an existing file |
| Save | **Cmd+S / Ctrl+S** | Save the current document |
| Save As | **Cmd+Shift+S / Ctrl+Shift+S** | Save under a new name or location |
| Export | **Cmd+E / Ctrl+E** | Open the Export dialog |
| Close document | **Cmd+W / Ctrl+W** | Close the current document |
| Quit | **Cmd+Q / Alt+F4** | Close the application |

---

## Quick Reference Card

The shortcuts you will use 90% of the time, on one table:

| Action | Shortcut |
|--------|----------|
| Editor tool | **V** |
| Brush tool | **B** |
| Zoom in/out | **Z / X** |
| Pan | **Spacebar + drag** |
| Undo | **Cmd+Z / Ctrl+Z** |
| Refresh fill | **Cmd+R / Ctrl+R** |
| Toggle preview | **Cmd+Space / Ctrl+Space** |
| Save | **Cmd+S / Ctrl+S** |
| Export | **Cmd+E / Ctrl+E** |

Print this table and tape it to your monitor for the first week. After that, your fingers will know.

---

## Customisation

Vexy Lines does not currently support custom keyboard shortcuts. The shortcuts listed here are fixed. If you are accustomed to different bindings from other applications, the adjustment period is short --- most tools are single-key shortcuts, and the modifier combinations follow standard macOS and Windows conventions.

---

## Further Reading

- [The Workspace](103-workspace.md) --- where tools, panels, and canvas fit together.
- [Zoom, Pan, and Navigate](104-navigating.md) --- navigation in depth.
- [Hiding and Revealing](108-basic-masks.md) --- brush and mask tool usage.

---

*Previous: [Performance and Troubleshooting](609-performance.md) | Next: [The .lines File Format](611-file-format.md)*
