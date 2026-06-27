# Beyond the GUI

The Vexy Lines app is the visual workspace. The Python tools are the workshop around it: they inspect `.lines` files, batch-export documents, transfer styles, render video, and let scripts or AI assistants control the running app.

## The Packages

| Package | Use it for | Needs the app? | Install |
|---|---|---:|---|
| `vexy-lines-py` | Parse `.lines` files, inspect layers/fills, extract embedded images, make small offline edits | No | `pip install vexy-lines-py` |
| `vexy-lines-apy` | Control the app through MCP, apply/interpolate styles, export, render, AI rename internals | Yes | `pip install vexy-lines-apy` |
| `vexy-lines-cli` | Terminal commands for parser, export, style, video, interpolation, AI rename, and MCP bridge | Some commands | `pip install vexy-lines-cli` |
| `vexy-lines-run` | Desktop batch GUI for lines/images/video workflows | Yes | `pip install vexy-lines-run` |

All current packages require Python 3.11 or newer.

## Quick Paths

| Goal | Start here |
|---|---|
| Inspect a file or extract its embedded image | [The Command Line Tool](602-cli-basics.md) |
| Export, bundle, style-transfer, or AI-rename files | [Batch Export and Style Transfer](603-cli-advanced.md) |
| Read `.lines` files from Python | [Reading .lines Files with Python](604-python-parser.md) |
| Control the app from Python | [Controlling Vexy Lines via API](605-mcp-api.md) |
| Apply or interpolate styles from code | [Style Transfer and Interpolation](606-style-engine.md) |
| Process video | [Video to Vector Video](607-video-processing.md) |
| Connect Claude Desktop or Cursor | [AI-Assisted Workflows](608-ai-workflows.md) |

## MCP In One Sentence

MCP is the local command channel exposed by the Vexy Lines app on `localhost:47384`. `vexy-lines-apy` talks to it from Python, and `vexy-lines-mcp` bridges it to AI assistants.

*Previous: [Part 5: Output and Workflow](511-print-preparation.md) | Next: [The Command Line Tool](602-cli-basics.md)*
