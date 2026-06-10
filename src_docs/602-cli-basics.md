# The Command Line Tool

You do not need to be a programmer to use the Vexy Lines command-line tool. You need to be able to type, press Enter, and read text. If you can send a text message, you can use the CLI.

The CLI --- short for Command Line Interface --- lets you do things with `.lines` files that would take dozens of clicks in the GUI, or that the GUI cannot do at all. Inspect a file's metadata without opening it. Extract the embedded source photo. List every fill and its parameters. Convert a whole folder of files in one go. All from a text window, all without launching the Vexy Lines application.

This article covers the offline commands --- the ones that work with `.lines` files directly, no running app required. For commands that talk to the app (export, style transfer), see [Batch Export and Style Transfer](603-cli-advanced.md).

---

## What Is a Terminal?

A terminal is a text window where you type commands. Every computer has one.

**On macOS:**
1. Press **Cmd+Space** to open Spotlight.
2. Type `Terminal` and press Enter.
3. A window appears with a blinking cursor. That is your terminal.

**On Windows:**
1. Press the **Windows key**.
2. Type `PowerShell` and press Enter.
3. A blue window appears with a blinking cursor. That is your terminal.

You type a command, press Enter, and the computer prints a response. Then you type another command. That is the entire model. No menus, no buttons --- just text in, text out.

A few things to know before we start:

- **The prompt** is the text that appears before your cursor. It usually shows your username and current folder. You do not type the prompt --- it is just the computer telling you it is ready.
- **File paths** tell the computer where a file lives. On macOS, they look like `/Users/you/Documents/art.lines`. On Windows, they look like `C:\Users\you\Documents\art.lines`. You can usually drag a file from Finder or Explorer into the terminal window and the path will appear automatically.
- **Spaces in file names** need special handling. Wrap the path in quotes: `"My Artwork.lines"` instead of `My Artwork.lines`.

---

## Installing the CLI

Open your terminal and type:

```
pip install vexy-lines-cli
```

Press Enter. Text scrolls by as Python downloads and installs the package. When it finishes and your prompt returns, the tool is ready.

To verify the installation, type:

```
vexy-lines --version
```

You should see a version number. If you see an error like "command not found," try:

```
python -m vexy_lines_cli --version
```

If that works, use `python -m vexy_lines_cli` wherever this article says `vexy-lines`. The difference is just how your system finds the tool.

**Tip:** If `pip` itself is not found, you may need to install Python first. See the Python installation steps in [Beyond the GUI](601-part6-tldr.md).

---

## The Help Flag

Every command in the CLI supports `--help`. When in doubt, add it:

```
vexy-lines --help
```

This prints a list of all available commands with brief descriptions. To get help on a specific command:

```
vexy-lines info --help
```

This prints every option the `info` command accepts, with explanations. The `--help` flag is your safety net. You cannot break anything by reading help text.

---

## Command: `info` --- File Metadata

The `info` command reads a `.lines` file and prints a summary of what is inside: canvas dimensions, DPI, number of groups, number of layers, number of fills, and the number of image filters stored on those fills.

```
vexy-lines info portrait.lines
```

**Example output:**

```
File:       portrait.lines
Caption:    Evening Portrait Study
Version:    4.2
DPI:        300
Canvas:     2400 x 3200 px (203.2 x 271.0 mm)
Groups:     2
Layers:     5
Fills:      7
Image filters: 3
Fill types: Linear (3), Circular (2), Halftone (1), Trace (1)
```

This is useful for quick cataloguing. If you have a folder of `.lines` files and cannot remember what is in each one, `info` tells you in a fraction of a second without launching the app.

---

## Command: `file-tree` --- Layer Hierarchy

The `file-tree` command prints the document's layer structure as an indented tree, showing groups, layers, their fills, and any per-fill image-filter chains.

```
vexy-lines file-tree portrait.lines
```

**Example output:**

```
portrait.lines
├── Group: Background
│   ├── Layer: Sky
│   │   └── Fill: Linear (angle=0°, interval=2.0mm)
│   └── Layer: Ground
│       └── Fill: Halftone (shape=circle, interval=3.0mm)
└── Group: Figure
    ├── Layer: Face
    │   ├── Fill: Linear (angle=15°, interval=0.8mm)
    │   └── Fill: Linear (angle=75°, interval=1.2mm)
    ├── Layer: Hair
    │   └── Fill: Circular (interval=1.0mm)
    └── Layer: Outline
        └── Fill: Trace
```

The tree mirrors what you see in the Layers Panel inside the app. It is especially handy when you want to compare two documents' structures without opening both.

---

## Command: `extract-source` --- Get the Embedded Photo

Every `.lines` file embeds a copy of the source image used to generate the fills. The `extract-source` command pulls that image out and saves it as a standalone JPEG.

```
vexy-lines extract-source portrait.lines --output portrait-source.jpg
```

If you omit `--output`, the tool creates a file named after the input with `-source.jpg` appended.

**Why this matters:** `.lines` files can be large, and the source image is often the reason. Extracting the source lets you:

- Recover a source photo if you have lost the original.
- Check which photo was used in a file you received from someone else.
- Swap sources --- extract, edit in Photoshop, then re-import.

---

## Command: `extract-preview` --- Get the Thumbnail

The `extract-preview` command extracts the embedded preview image --- a PNG thumbnail of the rendered artwork.

```
vexy-lines extract-preview portrait.lines --output portrait-preview.png
```

This is useful for building galleries or contact sheets without rendering each file from scratch. The preview is whatever was last rendered in the app, so it may not reflect recent parameter changes.

---

## Command: `batch-convert` --- Process a Folder

The `batch-convert` command runs an extraction across every `.lines` file in a directory.

```
vexy-lines batch-convert ./my-projects/ --extract source --output-dir ./sources/
```

This extracts the source image from every `.lines` file in `./my-projects/` and saves the results to `./sources/`. You can also extract previews:

```
vexy-lines batch-convert ./my-projects/ --extract preview --output-dir ./previews/
```

Or extract metadata as JSON for further processing:

```
vexy-lines batch-convert ./my-projects/ --extract info --output-dir ./metadata/
```

**Practical scenario:** You have 200 `.lines` files from a year of work. You want to build a visual catalogue. Run `batch-convert` twice --- once for previews, once for metadata --- and you have a folder of thumbnails and a folder of JSON summaries. Feed those into a web gallery, a spreadsheet, or just browse the preview images in your file manager.

The `batch-convert` command processes files sequentially by default. For large batches, this can take a few minutes, but the tool prints progress as it goes so you can see it working.

---

## Working with Paths

Commands that accept file paths work with both relative and absolute paths:

- **Relative:** `vexy-lines info artwork.lines` looks for the file in your current directory.
- **Absolute:** `vexy-lines info /Users/you/Documents/artwork.lines` looks at the exact location regardless of where your terminal is.

To change your current directory in the terminal:

```
cd /Users/you/Documents/VexyProjects
```

After this, `vexy-lines info portrait.lines` will look for `portrait.lines` inside `VexyProjects`.

On macOS, you can type `cd` followed by a space, then drag a folder from Finder into the terminal window. The path fills in automatically. On Windows, the same trick works by dragging from Explorer into PowerShell.

---

## Putting It Together: A Real Session

Here is what a typical session looks like. You open a terminal, navigate to your project folder, and run a few commands:

```
cd ~/Documents/VexyProjects

vexy-lines info landscape.lines
# → Canvas: 4000 x 2667 px, 3 groups, 8 fills

vexy-lines file-tree landscape.lines
# → Shows the full layer hierarchy

vexy-lines extract-source landscape.lines
# → Saves landscape-source.jpg

vexy-lines extract-preview landscape.lines
# → Saves landscape-preview.png

vexy-lines batch-convert ./archive/ --extract preview --output-dir ./gallery/
# → Extracts previews from every .lines file in archive/
```

Five commands. No mouse. No waiting for the app to load. Each command finishes in under a second for a typical file.

---

## Tips

- **Tab completion.** In most terminals, pressing Tab after typing a few characters of a file name will auto-complete it. Type `vexy-lines info por` and press Tab --- if `portrait.lines` is the only file starting with "por," the terminal fills in the rest.
- **Up arrow.** Press the up arrow key to recall your last command. Press it again for the one before that. This saves retyping when you are running similar commands on different files.
- **Drag and drop paths.** If typing file paths feels awkward, drag files from Finder or Explorer directly into the terminal window. The full path appears at your cursor.
- **Redirect output to a file.** Add `> output.txt` to the end of any command to save the text output to a file instead of printing it on screen. For example: `vexy-lines info portrait.lines > portrait-info.txt`.
- **Errors are not scary.** If a command fails, the tool prints an error message explaining what went wrong. Read it. The most common cause is a mistyped file name or a missing file. Nothing in the CLI can damage your `.lines` files --- every command is read-only except `batch-convert`, which only creates new files.

---

## What the CLI Cannot Do (Offline)

The offline commands read `.lines` files but do not modify them or produce new vector output. They cannot:

- Render fills or generate strokes.
- Export to SVG, PDF, or PNG.
- Add, remove, or change fills.

Those tasks require the Vexy Lines application to be running, because the rendering engine lives inside the app. The CLI commands that talk to the app --- `export`, `style-transfer`, and others --- are covered in [Batch Export and Style Transfer](603-cli-advanced.md).

---

*Previous: [Beyond the GUI](601-part6-tldr.md) | Next: [Batch Export and Style Transfer](603-cli-advanced.md)*
