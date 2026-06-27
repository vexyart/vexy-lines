# Video to Vector Video

Video processing applies a `.lines` style to many frames and assembles the rendered frames back into a video. Use the CLI for scripted jobs and `vexy-lines-run` when you want a GUI.

## CLI

```bash
vexy-lines-cli style-video --style engraving.lines --input clip.mp4 --output clip-styled.mp4
vexy-lines-cli style-video --style start.lines --end-style finish.lines --input clip.mp4 --output blend.mp4
vexy-lines-cli style-video --style look.lines --input clip.mp4 --output test.mp4 --start-frame 60 --end-frame 180
```

Useful flags:

| Flag | Purpose |
|---|---|
| `--audio=False` | Omit source audio |
| `--size 2x` | Render at a larger output scale |
| `--relative-style` | Scale spatial style parameters to target frame size |
| `--force` | Delete the existing job folder and start fresh |
| `--cleanup` | Delete the job folder after success |

The job folder stores decoded source frames, `.lines` intermediates, SVG exports, and raster frames. Re-running the same command resumes missing frames instead of starting over.

## GUI

```bash
pip install vexy-lines-run
vexy-lines-run
```

Use the Video tab to pick an input video, a style `.lines` file, optional end style, frame range, output size, and audio setting.

## Plan Short Tests

Render a short frame range first. If the style works, run the full clip. Dense fills, large frames, and high output scale can turn a short video into a long render.

*Previous: [Style Transfer and Interpolation](606-style-engine.md) | Next: [AI-Assisted Workflows](608-ai-workflows.md)*
