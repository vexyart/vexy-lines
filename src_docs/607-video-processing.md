# Video to Vector Video

A photograph becomes vector art in seconds. A video is just a lot of photographs --- thirty of them per second, typically. Apply a Vexy Lines style to every frame and you get something remarkable: a moving image where every frame is built from mathematically precise vector strokes. The result looks like hand-engraved animation, and nothing else quite produces this effect.

The catch is time. Each frame is a full render cycle. A ten-second clip at 30 frames per second means 300 renders. If each render takes two seconds, that is ten minutes. A five-minute music video at the same rate would take over sixteen hours. Video processing in Vexy Lines is powerful, but it demands patience and planning.

This article covers both routes: the `style-video` CLI command for straightforward jobs, and the `vexy-lines-run` GUI app for projects where you want visual feedback and fine-grained control.

---

## How It Works

The process is the same regardless of which tool you use:

1. **Extract frames.** The video is split into individual images (JPEG or PNG), one per frame.
2. **Apply style.** Each frame image is loaded into Vexy Lines as a source image, the style is applied, and the result is rendered.
3. **Export frame.** The rendered vector art for each frame is exported as a raster image (PNG or JPG) at the document's resolution.
4. **Reassemble.** The exported frame images are stitched back into a video file, with the original audio track (if any) preserved.

The input video can be MP4, MOV, or AVI. The output is typically MP4 with H.264 encoding --- the most widely compatible format.

---

## The CLI Route: `style-video`

The `style-video` command handles the entire pipeline in one shot.

### Basic Usage

```
vexy-lines style-video --style engraving.lines --input clip.mp4 --output clip-styled.mp4
```

This:
1. Reads `clip.mp4` and extracts every frame.
2. Applies the style from `engraving.lines` to each frame.
3. Renders and exports each styled frame.
4. Reassembles the frames into `clip-styled.mp4`.
5. Copies the audio track from the original.

### Frame Rate Control

By default, the output matches the input frame rate. To reduce the number of frames (and therefore the processing time):

```
vexy-lines style-video --style look.lines --input clip.mp4 --output out.mp4 --fps 15
```

Halving the frame rate halves the render count. The motion will be less smooth, but for many artistic styles this actually enhances the hand-crafted feel --- like a flipbook or stop-motion animation.

### Frame Range Selection

Process only a portion of the video:

```
vexy-lines style-video --style look.lines --input clip.mp4 --output out.mp4 --start-frame 60 --end-frame 180
```

This processes frames 60 through 180 only (two seconds of a 30 fps clip starting at the two-second mark). Useful for testing your style on a short segment before committing to the full video.

### Style Interpolation Across Video

The most cinematic feature: blend between two styles over the duration of the video.

```
vexy-lines style-video --style start.lines --end-style finish.lines --input clip.mp4 --output out.mp4
```

At frame 1, the style is 100% `start.lines`. At the final frame, it is 100% `finish.lines`. Every frame in between is a proportional blend. The visual effect is a smooth, continuous transformation from one artistic treatment to another over the length of the clip.

This is how you create a video that begins as a fine engraving and gradually dissolves into bold halftone dots, or starts with tight parallel lines and relaxes into loose scribbles. The interpolation uses the same blending engine described in [Style Transfer and Interpolation](606-style-engine.md).

**Compatibility note:** The two styles must be compatible (same number of fills, same or similar fill types). Run `vexy-lines style-check start.lines finish.lines` to verify before starting a long render.

---

## The GUI Route: vexy-lines-run

The `vexy-lines-run` package is a standalone desktop application built for batch processing. It has three tabs: **Lines** (for `.lines` files), **Images** (for folders of photographs), and **Video** (for video files). The Video tab is what concerns us here.

### Installing

```
pip install vexy-lines-run
```

Launch it:

```
vexy-lines-run
```

A window opens with three tabs. Click **Video**.

### The Video Tab

The Video tab provides:

- **Input field:** Drag a video file here or click Browse.
- **Style picker:** Select a `.lines` file as the style reference.
- **Frame range slider:** A dual-handle slider that shows the video timeline. Drag the handles to select a start and end point. The slider shows frame numbers and timestamps.
- **FPS control:** Set the output frame rate.
- **Output format:** Choose MP4, MOV, or individual frames (PNG sequence).
- **Output folder:** Where the result goes.
- **Preview button:** Renders a single frame at the current slider position so you can check the style before committing.
- **Start button:** Begins processing. A progress bar shows completion percentage and estimated time remaining.

The frame range slider is especially valuable. Scrub through the video, find an interesting moment, render a single preview frame, and assess whether the style works before investing hours on the full clip.

### Audio Passthrough

The GUI preserves the original audio track by default. The audio is copied without re-encoding, so there is no quality loss. If you want a silent output, uncheck the **Include Audio** box.

---

## Performance: Setting Expectations

Video processing is the most time-intensive operation in the Vexy Lines ecosystem. Here are realistic benchmarks to help you plan.

### Render Time per Frame

| Document Complexity | Approximate Time per Frame |
|--------------------|---------------------------|
| Simple (1--2 fills, moderate interval) | 1--3 seconds |
| Medium (3--5 fills, tight interval) | 5--15 seconds |
| Complex (6+ fills, dense interval, mesh warp) | 30--120 seconds |

### Total Time Estimates

| Video Length | FPS | Frames | Simple Style | Medium Style | Complex Style |
|-------------|-----|--------|-------------|-------------|--------------|
| 10 seconds | 30 | 300 | 5--15 min | 25--75 min | 2.5--10 hours |
| 10 seconds | 15 | 150 | 3--8 min | 12--38 min | 1--5 hours |
| 1 minute | 30 | 1,800 | 30--90 min | 2.5--7.5 hours | 15--60 hours |
| 1 minute | 15 | 900 | 15--45 min | 1--4 hours | 7.5--30 hours |
| 5 minutes | 24 | 7,200 | 2--6 hours | 10--30 hours | 60--240 hours |

These numbers make one thing clear: start with short clips and simple styles. Work your way up.

### Strategies for Faster Processing

- **Reduce frame rate.** 15 fps looks surprisingly good for stylised content. 12 fps gives a stop-motion feel. Every frame you skip is a render you do not wait for.
- **Simplify the style.** Fewer fills, wider intervals, lower smoothing. A style that renders in 2 seconds per frame instead of 10 saves 80% of total time.
- **Reduce source resolution.** The video frames do not need to be 4K. Downscale to 1080p or even 720p before processing. The vector strokes will be the same; only the source image sampling resolution changes.
- **Process a test segment first.** Use `--start-frame` and `--end-frame` (CLI) or the frame range slider (GUI) to process 30--60 frames and check the result before committing to the full video.
- **Turn off Auto Refresh.** Ensure the Vexy Lines app has Auto Refresh disabled. The render commands will trigger explicit renders; background recalculation wastes cycles.
- **Close other documents.** Free up memory and processing power by closing any documents in the app that you are not actively processing.

---

## Job Folders: Crash-Safe Processing

Both the CLI and the GUI use **job folders** to track progress. When a video processing job starts, a folder is created containing:

- The extracted frame images.
- A manifest file listing which frames have been processed.
- The exported styled frames.

If the process is interrupted --- a crash, a power outage, your laptop falling asleep --- the job folder preserves your progress. When you restart the job with the same input and output parameters, processing resumes from where it left off rather than starting over.

The job folder is cleaned up automatically after the final video is assembled. If you want to keep the individual frames (for use in other applications or for manual assembly), specify `--keep-frames` (CLI) or check **Keep Frames** (GUI).

---

## Use Cases

### Music Videos

A three-to-four-minute music video is the sweet spot: long enough to be impressive, short enough to process in a reasonable timeframe (especially at 15--24 fps with a moderate style). Style interpolation across the video --- starting soft and building to aggressive --- can mirror the musical arc.

### Art Installations

Loop a short clip (15--30 seconds) with a striking style. Display on a screen or projector. The vector aesthetic is immediately distinctive and holds attention in gallery settings.

### Social Media

A 5--15 second clip at 15 fps is fast to process and performs well on platforms that auto-play short video. The visual impact of vector-styled video stops the scroll.

### Motion Graphics

Process footage with a style, then composite the result in After Effects or DaVinci Resolve. The styled video becomes a layer in a larger motion piece. Export as a PNG sequence (instead of MP4) for maximum quality and compositing flexibility.

---

## Limitations

- **No real-time preview.** You cannot scrub through the styled video before it is fully rendered. Use the single-frame preview to evaluate the style.
- **Audio is passthrough only.** The tools copy the original audio. They do not adjust audio duration if you change the frame rate.
- **Temporal coherence.** Each frame is rendered independently. There is no frame-to-frame smoothing, so fast camera movements or rapid brightness changes can cause the stroke pattern to "flicker" between frames. Styles with higher smoothing and wider intervals tend to produce more stable results.
- **File size.** Styled video files can be large because every frame contains dense detail. Use standard video compression (H.264 at a reasonable bitrate) to manage this.

---

## Further Reading

- [Batch Export and Style Transfer](603-cli-advanced.md) --- the CLI commands for still-image style transfer.
- [Style Transfer and Interpolation](606-style-engine.md) --- the engine that powers style blending across video.
- [Performance and Troubleshooting](609-performance.md) --- general performance advice that applies to video rendering.

---

*Previous: [Style Transfer and Interpolation](606-style-engine.md) | Next: [AI-Assisted Workflows](608-ai-workflows.md)*
