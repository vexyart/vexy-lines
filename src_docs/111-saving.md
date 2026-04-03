# Save, Backup, Recover

You've spent an hour building a multi-layer composition with carefully tuned parameters and hand-painted masks. A crash, a power cut, or an overzealous Cmd+Z could wipe it out. This article is about making sure that never happens — and recovering gracefully when it does.

## The .lines File Format

Vexy Lines saves documents in its own format with the `.lines` extension. A `.lines` file is a single XML file that contains everything about your document:

- **Document dimensions and resolution (DPI)**
- **Every layer and group** with their names, stacking order, and visibility states
- **Every fill's parameters** — Interval, Angle, Threshold settings, Stroke Thickness mode, Smoothing, Randomization, Shift, Dynamic Color, and all fill-type-specific parameters
- **Every mask** as embedded pixel data
- **Every source image** as base64-encoded data embedded in the XML
- **Mesh warp settings** if you've applied any

The single-file design is deliberate: you can copy a `.lines` file to another machine, hand it to a colleague, or archive it on a backup drive, and everything travels together. There are no linked assets to lose, no external dependencies to break.

### File Size

Because source images are embedded as base64 data (which is roughly 33% larger than the original binary image), the `.lines` file will be larger than your source image alone. A document using a 5 MB JPEG source image will have a `.lines` file of at least 7–8 MB, plus the size of masks, generated path data, and any additional source images in groups.

Typical file sizes:

| Document Complexity | Approximate .lines Size |
|--------------------|------------------------|
| Simple (one source image, few fills) | 5–20 MB |
| Medium (one source image, 10–15 fills with masks) | 20–50 MB |
| Complex (multiple source images, many fills, detailed masks) | 50–200 MB |
| Very complex (high-resolution sources, dozens of fills) | 200 MB+ |

If file size becomes a concern:
- **Reduce source image resolution** before importing. Vexy Lines doesn't need a 50-megapixel photo — a 3000-pixel-wide image provides plenty of detail for most projects.
- **Remove unused source images** from groups that no longer need them.
- **Avoid unnecessarily high-resolution mask painting.** A mask that's 90% solid white with a small painted region doesn't need to be painted at maximum zoom.

## Saving

### Manual Save

**Cmd+S** (macOS) / **Ctrl+S** (Windows) saves the document. If it's a new document that hasn't been saved before, you'll be prompted for a file name and location.

**Cmd+Shift+S** / **Ctrl+Shift+S** opens **Save As**, letting you save a copy under a new name or in a new location. The original file remains unchanged.

### Auto Save

Vexy Lines includes an Auto Save feature that periodically saves your document without manual intervention. When enabled, the application saves at a configurable interval — typically every few minutes.

Auto Save writes to the same `.lines` file you're working on. It's a safety net against crashes, not a versioning system. If you make changes you don't like, Auto Save won't help you get back to a previous state — that's what manual saves and backups are for.

**To configure Auto Save:** Check the application preferences (Vexy Lines > Preferences on macOS, or Edit > Preferences / Tools > Options on Windows). You can enable or disable Auto Save and adjust the interval.

**When to disable Auto Save:** If you're working on a very large document and saves take noticeable time, you might prefer to save manually at natural break points rather than having Auto Save interrupt your workflow. Otherwise, leave it on.

## Backup Files

Vexy Lines creates backup copies of your document with the extension `.~lines` (note the tilde prefix). These backups are written to the same directory as your main `.lines` file.

The `.~lines` backup contains the previous saved state of your document — the version before the most recent save. If you save, realise you've lost something, and can't undo far enough, the `.~lines` file may still contain the version you want.

**To recover from a backup:**

1. Close the current document (or quit Vexy Lines).
2. In Finder (macOS) or File Explorer (Windows), navigate to your document's directory.
3. The `.~lines` file may be hidden (files starting with `.` or `~` are sometimes hidden by default). Show hidden files if necessary.
4. Rename the `.~lines` file to give it a `.lines` extension — for example, rename `portrait.~lines` to `portrait-recovered.lines`.
5. Open the renamed file in Vexy Lines.

**Important:** The `.~lines` backup is overwritten each time you save. It contains only the *previous* save state, not a full history. If you save twice in quick succession, the backup reflects the state before the first save, not the state before the second.

## Undo and Redo

**Cmd+Z** (macOS) / **Ctrl+Z** (Windows) undoes the most recent action. **Cmd+Shift+Z** / **Ctrl+Shift+Z** redoes it.

Vexy Lines maintains an undo history during your session. You can step backward through multiple actions — parameter changes, mask painting strokes, layer additions, layer deletions, and more.

**The undo history is session-only.** When you close the document or quit the application, the undo history is lost. You cannot reopen a document and undo changes from a previous session. This is why saving and backups matter.

**Undo and masks:** Each brush stroke on a mask is a separate undo step. If you paint a large mask area with many strokes, you can undo them one at a time. This is usually what you want, but it means extensive mask painting can fill the undo history quickly.

## Recent Files

**File > Recent Files** (or **Open Recent**) shows a list of recently opened `.lines` documents. This is the fastest way to get back to a project you were working on yesterday.

The recent files list persists across application sessions — quitting and relaunching Vexy Lines doesn't clear it.

## Versioning Strategies

The `.lines` format doesn't have built-in versioning, so managing versions is up to you. Here are practical approaches:

### Strategy 1: Sequential Save As

At meaningful milestones, use **Save As** to create a numbered copy:

```
portrait-v1.lines    ← Initial composition
portrait-v2.lines    ← After tuning fill parameters
portrait-v3.lines    ← After adding masks
portrait-v4.lines    ← After adding second fill layer
portrait-final.lines ← Export-ready version
```

This is simple, requires no tools, and gives you clear snapshots to return to. The downside: it consumes disk space (each file is a full copy with embedded images) and requires discipline.

### Strategy 2: Date-Based Naming

For ongoing projects:

```
portrait-2025-01-15.lines
portrait-2025-01-17.lines
portrait-2025-01-20.lines
```

This works well for projects that evolve over days or weeks.

### Strategy 3: Git or Version Control

If you're technically inclined, `.lines` files are XML and can be tracked in Git or another version control system. The embedded base64 image data makes diffs large and mostly unreadable, but the version history and rollback capabilities are genuine.

For a more practical approach, store your `.lines` files in a cloud-synced folder (iCloud, Dropbox, OneDrive, Google Drive). Most cloud services maintain file version history, letting you restore previous versions through their web interface.

### Strategy 4: Export Milestones

Export a PNG or SVG at each significant stage, alongside the `.lines` save. The exports serve as visual bookmarks — you can see what each version looked like without opening the `.lines` file. Name them to match:

```
portrait-v1.lines     +  portrait-v1-preview.png
portrait-v2.lines     +  portrait-v2-preview.png
```

## File Organisation Tips

**Keep source images alongside .lines files.** Even though the source image is embedded in the `.lines` file, keeping the original image file nearby means you can re-import it at different resolutions, use it in other documents, or reference it for colour matching.

**Create a project folder.** For anything beyond a quick experiment:

```
my-project/
├── portrait.lines
├── portrait.~lines          ← auto-created backup
├── source-images/
│   ├── face-photo.jpg
│   └── background-texture.png
├── exports/
│   ├── portrait-web.svg
│   ├── portrait-print.pdf
│   └── portrait-preview.png
└── old-versions/
    ├── portrait-v1.lines
    └── portrait-v2.lines
```

This structure keeps everything findable and separates works-in-progress from final outputs.

**Use descriptive file names.** `portrait-lincoln-engraving-style.lines` is more useful than `project1.lines`, especially six months from now when you've forgotten what "project1" was.

## Recovery Scenarios

| Situation | Solution |
|-----------|----------|
| Changed a parameter and hate it | **Cmd+Z** / **Ctrl+Z** to undo |
| Saved over a version you wanted to keep | Check the `.~lines` backup file |
| Application crashed before saving | Check Auto Save — the document may have been saved recently |
| Deleted a layer by accident | **Cmd+Z** to undo (if same session) |
| Need to return to a much earlier state | Restore from a versioned copy or cloud service history |
| .lines file won't open (corrupt) | Try the `.~lines` backup. If that fails, contact support. |

## The Golden Rule

**Save before experimenting.** When you're about to try something radical — a new fill type, a major mask change, a parameter you've never touched — save first. Then experiment freely. If it doesn't work, close without saving and reopen. The saved version is exactly where you left it.

This is unglamorous advice. It is also the advice that saves projects. See [Controlling When Vexy Recalculates](112-refresh-controls.md) for the next article, or return to the [Table of Contents](001-toc.md).
