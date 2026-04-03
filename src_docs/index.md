
[Vexy Lines for Mac & Windows](https://vexy.art/lines/) | [Download](https://www.vexy.art/lines/#buy) | [Buy](https://www.vexy.art/lines/#buy) | [Batch GUI](https://vexy.dev/vexy-lines-run/) | [CLI/MCP](https://vexy.dev/vexy-lines-cli/) | [API](https://vexy.dev/vexy-lines-apy/) | [.lines format](https://vexy.dev/vexy-lines-py/)

[![Vexy Lines](https://i.vexy.art/vl/websiteart/vexy-lines-hero-poster.png)](https://www.vexy.art/lines/)

# The Book of Vexy

The complete guide to [Vexy Lines](https://vexy.art/lines/) — the desktop app that transforms raster images into expressive, scalable vector artwork.

## Who this is for

Graphic designers, illustrators, printmakers, tattoo artists, laser-cutter operators — anyone who turns photographs into vector line art. No programming knowledge needed through Part 5. Part 6 introduces automation tools gently.

## Quick paths

**New to Vexy Lines?** Start with [Getting Started in Five Minutes](101-part1-tldr.md), then follow Part 1 article by article.

**Looking for a specific fill?** Jump to [Part 2: The Fill Parade](201-part2-tldr.md) for all twelve algorithms.

**Need to export for print?** See [Preparing Files for Print](511-print-preparation.md).

**Want a recipe?** The [Gallery of Techniques](512-gallery-recipes.md) has twelve copy-and-follow recipes.

**Just want the overview?** Read [The One-Page Manual](002-tldr.md).

## What's inside

| Part | Articles | What you'll learn |
|------|----------|-------------------|
| [Front Matter](001-toc.md) | 3 | Table of contents, one-page summary, introduction |
| [Part 1: Getting Started](101-part1-tldr.md) | 12 | Install, workspace, first artwork, layers, export |
| [Part 2: The Fill Parade](201-part2-tldr.md) | 14 | Every fill algorithm explained with walkthroughs |
| [Part 3: Properties](301-part3-tldr.md) | 12 | Colour, thickness, threshold, interval, angle, emboss |
| [Part 4: Composition](401-part4-tldr.md) | 10 | Masks, meshes, groups, layer ordering |
| [Part 5: Workflows](501-part5-tldr.md) | 12 | Portraits, print, tattoo, laser, comics, guilloche |
| [Part 6: Power Tools](601-part6-tldr.md) | 12 | CLI, Python SDK, MCP API, video, AI workflows |

75 articles. ~120,000 words. Everything you need to make work people remember.

## Related documentation

- [.lines File Format](https://vexy.dev/vexy-lines-py/) — parse `.lines` files in Python
- [MCP API & Style Engine](https://vexy.dev/vexy-lines-apy/) — programmatic control and style transfer
- [CLI & MCP Bridge](https://vexy.dev/vexy-lines-cli/) — command-line tools and AI assistant integration
- [Batch GUI](https://vexy.dev/vexy-lines-run/) — desktop app for batch and video processing

## About Vexy Lines

In 2007, Dmitry Apanovich released Strokes Maker — a focused tool that helped designers build engraving-style drawings from everyday images. A few years later, Dmitry joined FontLab to work on font-editing tools, while he supported Strokes Maker and explored new ideas.

Vexy Lines is the result: a careful rewrite combining Strokes Maker's proven approach with FontLab's product craft — with a calmer UI and a dependable desktop foundation.

- [Download for Mac or Windows](https://www.vexy.art/lines/#buy)
- [Buy Vexy Lines](https://www.vexy.art/lines/#buy)

### Vexy Lines Run

A desktop batch GUI for style transfer. Export multiple `.lines` files, apply styles to images or video.

**macOS** — Open Terminal, paste, press Enter:

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh && "$HOME/.local/bin/uvx" --python 3.12 vexy-lines-run@latest
```

**Windows** — Open Command Prompt, paste, press Enter:

```bat
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex; $env:Path = \"$HOME\.local\bin;$HOME\AppData\Roaming\uv;$env:Path\"; uvx --python 3.12 vexy-lines-run@latest"
```
