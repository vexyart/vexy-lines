# Performance and Troubleshooting

Vexy Lines turns photographs into thousands of mathematically precise vector strokes. That is computationally expensive work, and at some point --- a dense fill on a large canvas, a complex multi-layer composition, a batch export of fifty files --- you will bump into the limits of your hardware. This article explains why things get slow, how to keep them fast, and what to do when something goes wrong.

---

## Why Rendering Gets Slow

Every fill in your document generates strokes by sampling the source image pixel by pixel, calculating thickness variations, applying smoothing and randomization, and writing the result as vector paths. The cost scales with four factors:

### 1. Fill Density (Interval)

The single biggest performance factor. An interval of 2 mm on a 200 mm canvas produces roughly 100 strokes. An interval of 0.2 mm produces 1,000 strokes. Each stroke is an independent path that must be generated, smoothed, and rendered. Cutting the interval in half roughly quadruples the workload (more strokes, and each is longer because the canvas is unchanged).

| Interval | Strokes on 200 mm Canvas | Relative Cost |
|----------|--------------------------|---------------|
| 5.0 mm | ~40 | Baseline |
| 2.0 mm | ~100 | 2.5x |
| 1.0 mm | ~200 | 5x |
| 0.5 mm | ~400 | 10x |
| 0.2 mm | ~1,000 | 25x |

### 2. Source Image Resolution

Every stroke samples the source image along its length. A 6000 x 4000 pixel source image contains 24 million pixels. A 1500 x 1000 image contains 1.5 million. The sampling is faster on the smaller image, and the visual difference is often negligible --- the source image determines tone, not export resolution.

### 3. Number of Fills and Layers

Each fill renders independently. Five fills means five times the rendering work. This is straightforward multiplication: if one fill takes 2 seconds, five fills take roughly 10 seconds (there is a small overhead for compositing, but the fill rendering dominates).

### 4. Mesh Warp and Hidden Stroke Removal

Mesh warping deforms every stroke through a mathematical transformation. Hidden Stroke Removal (HSR) simulates 3D occlusion, testing each stroke against every other stroke to determine visibility. Both features add significant computation on top of the base fill rendering. Mesh + HSR together is the most expensive combination in the application.

---

## Keeping Things Fast

### Turn Off Auto Refresh

This is the single most effective habit for working comfortably with complex documents. Auto Refresh recalculates every fill after every parameter change. When you are dragging a slider, that means dozens of recalculations per second --- each one potentially taking several seconds for dense fills.

Turn it off in the toolbar. Make your adjustments. Then press **Refresh Fill** (for the current fill) or **Refresh All** (for every fill) when you are ready to see the result. You trade instant feedback for control over when the computer does its heavy work.

### Use Fast Rendering Quality While Working

The rendering quality toggle (in the toolbar or View menu) has two settings:

- **Fast:** Approximates strokes with fewer calculations. Good enough to evaluate composition, spacing, and tone. Renders 3--10x faster than Best.
- **Best:** Full-precision rendering with all smoothing and anti-aliasing. Use for final review and export.

Work in Fast. Switch to Best only when you need to evaluate fine detail or are about to export.

### Increase the Interval While Experimenting

If you are designing a look that will eventually use a 0.5 mm interval, start at 2 mm. Get the angle, threshold, colour, and layer stack right. Then tighten the interval as a final step. You will iterate much faster on a document that renders in half a second than one that takes fifteen.

### Reduce Source Image Resolution

Your source image does not need to be 8000 pixels wide while you are working. Resize it to 1500--2000 pixels on the long edge for the working phase. The tonal information that fills read from is preserved at that resolution. When you are ready for final export, swap in the full-resolution source.

To swap source images without rebuilding your fill stack:
1. Keep a high-res and a low-res version of the same photo.
2. Work with the low-res version.
3. Before final export, use the Visual > set source image option (via [the API](605-mcp-api.md) or the GUI) to replace it.

### Simplify During Composition

Turn off fills you are not actively editing. Click the eye icon next to a fill in the Layers Panel to hide it. Hidden fills are not rendered, so the remaining fills update faster. Re-enable them when you need to see the full composition.

---

## Memory

Vexy Lines keeps the document, all source images, all rendered strokes, and the undo history in memory. Large documents can consume significant RAM.

### Symptoms of Memory Pressure

- The app becomes sluggish even for simple operations.
- Switching between tools has a noticeable delay.
- Other applications on your computer slow down.
- On macOS, the spinning beach ball appears. On Windows, the cursor becomes an hourglass.

### Reducing Memory Usage

- **Close documents you are not working on.** Each open document consumes memory independently.
- **Reduce undo history depth.** Every undo state is a snapshot of the document. Deep undo history means many snapshots. In Preferences, reduce the maximum undo levels if memory is tight.
- **Use smaller source images.** A 50-megapixel camera produces images that contain far more data than Vexy Lines needs for stroke generation.
- **Restart the app periodically.** During long sessions, memory can accumulate from cached renders and undo states. Closing and reopening the app clears this.

---

## Crash Recovery

### Auto Save

Vexy Lines automatically saves your document at regular intervals. If the app crashes or your computer loses power, the auto-saved version is available when you next launch the app. You will see a recovery prompt offering to restore the auto-saved document.

The auto-save interval is configurable in Preferences. The default is every few minutes. Reducing the interval provides more safety but adds brief pauses when the save occurs.

### Backup Files

When you manually save a document, Vexy Lines creates a backup of the previous version with a `.~lines` extension in the same folder. If your save somehow corrupts the file (extremely rare, but not impossible), the `.~lines` backup contains the last known-good version.

To restore from a backup:
1. Find the `.~lines` file next to your `.lines` file.
2. Rename it to have a `.lines` extension.
3. Open it in Vexy Lines.

### Job Folders

Batch operations (export, style transfer, video processing) create job folders that track progress. If a batch is interrupted, restarting the same operation resumes from where it stopped. See [Video to Vector Video](607-video-processing.md) for details.

---

## Common Errors and Solutions

### macOS: "Vexy Lines can't be opened because it is from an unidentified developer"

This is macOS Gatekeeper protecting you from unsigned software.

**Fix:**
1. Open **System Preferences > Security & Privacy > General**.
2. You should see a message about the blocked app. Click **Open Anyway**.
3. Alternatively, right-click (or Ctrl+click) the app icon and select **Open** from the context menu. Click **Open** in the dialog.

You only need to do this once. After the first launch, macOS remembers your choice.

### Windows: Windows Defender SmartScreen Warning

Windows may show a blue "Windows protected your PC" screen when you first run the installer.

**Fix:**
1. Click **More info** in the warning dialog.
2. Click **Run anyway**.

This is a one-time prompt. Windows Defender learns to trust the application after the first run.

### "Connection Refused" When Using CLI or API

The CLI and API commands talk to the running Vexy Lines app over a local network connection. This error means the app is not listening.

**Fix:**
1. Make sure Vexy Lines is launched and running.
2. Check that no firewall is blocking `localhost:47384`. On macOS, the built-in firewall rarely causes issues. On Windows, you may need to add an exception.
3. Try restarting the app.
4. Run `vexy-lines mcp-status` to check the connection.

### Display Scaling Issues

On high-DPI displays (Retina on macOS, scaled displays on Windows), the canvas may appear at the wrong size, or elements may look blurry or offset.

**Fix on macOS:** This is rare on macOS. If it occurs, ensure your display settings in **System Preferences > Displays** use the default (Retina) scaling.

**Fix on Windows:**
1. Right-click the Vexy Lines shortcut or executable.
2. Select **Properties > Compatibility > Change high DPI settings**.
3. Check **Override high DPI scaling behavior** and set **Scaling performed by:** to **Application**.
4. Restart the app.

### Export Produces an Empty File

The exported SVG or PDF is 0 bytes or contains no visible strokes.

**Possible causes:**
- No fills are visible. Check that at least one fill's visibility (eye icon) is on.
- The Image Threshold is set to exclude all tones. Open the histogram and ensure the shadow and highlight handles are not both pushed to the same position.
- The fill's colour matches the background. A white fill on a white background is invisible. Check the fill colour in the Properties Panel.

### Rendering Produces No Visible Strokes

The fill is added but nothing appears on the canvas.

**Possible causes:**
- No source image loaded. Fills need a source image to read brightness from. Add one via File > New or by dragging a photo onto the canvas.
- The interval is too large. An interval of 50 mm on a 100 mm canvas produces only two strokes. Reduce the interval.
- The layer or group is hidden. Check the eye icon in the Layers Panel.
- A mask is hiding everything. Select the layer and check whether a mask (shown as a black/white thumbnail) is covering the entire canvas. Clear the mask if so.

### The App Is Unresponsive

**If it is rendering:** Wait. Dense fills on large canvases take time. The app may appear frozen but is working. Give it a minute before force-quitting.

**If it is not rendering:** Force-quit (Cmd+Q on macOS, Alt+F4 on Windows, or via the task manager/force-quit dialog). Relaunch. The auto-saved version should be offered for recovery.

---

## Performance Checklist

Before starting a complex project, run through this list:

- [ ] Auto Refresh is **off**.
- [ ] Rendering quality is set to **Fast**.
- [ ] Source image is **2000 px or less** on the long edge (for working).
- [ ] No unnecessary documents are open.
- [ ] Fills being experimented with are the **only visible fills**.
- [ ] Interval is **wider than final** (tighten as a last step).

Before final export:

- [ ] Swap in **full-resolution source image** if needed.
- [ ] Set rendering quality to **Best**.
- [ ] **Refresh All** to recalculate everything.
- [ ] Check all fills are **visible** as intended.
- [ ] Export.

---

## Further Reading

- [Controlling When Vexy Recalculates](112-refresh-controls.md) --- Auto Refresh, Refresh Fill, and Refresh All in detail.
- [Video to Vector Video](607-video-processing.md) --- performance considerations specific to video processing.
- [The Command Line Tool](602-cli-basics.md) --- `mcp-status` for connection diagnostics.

---

*Previous: [AI-Assisted Workflows](608-ai-workflows.md) | Next: [Keyboard Shortcuts Reference](610-shortcuts.md)*
