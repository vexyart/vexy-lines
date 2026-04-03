# Beyond the GUI

Everything you have done so far in this manual happened inside the Vexy Lines application window. You dragged sliders, painted masks, toggled fills on and off. That workflow is powerful, intuitive, and entirely sufficient for a huge range of creative work. But it is not the only way to use Vexy Lines.

Behind the GUI sits a set of tools that let you read, write, automate, and control Vexy Lines from outside the application. Parse your `.lines` files without opening the app. Export an entire folder of documents overnight while you sleep. Transfer the look of one piece to fifty others with a single command. Ask an AI assistant to adjust your fills through conversation. These are not programmer-only features bolted on as afterthoughts --- they are first-class tools designed with the same care as the application itself.

This part of the manual introduces those tools one at a time, starting gentle and building gradually. No prior programming experience is assumed. If you have never opened a terminal window in your life, that is fine. By the end of this section, you will know what each tool does, when it is useful, and how to get started.

---

## The Four Packages

Vexy Lines ships four Python packages, each with a focused job. Think of them as a family of specialists:

| Package | What It Does | Needs the App? | Install Command |
|---------|-------------|----------------|-----------------|
| **vexy-lines-py** | Reads and parses `.lines` files. Extracts metadata, layer trees, fill parameters, and embedded images. | No | `pip install vexy-lines-py` |
| **vexy-lines-apy** | Talks to the running Vexy Lines app via its MCP API. Reads and writes document state. Includes a style engine for extracting, applying, and blending visual styles. | Yes (must be running) | `pip install vexy-lines-apy` |
| **vexy-lines-cli** | A command-line tool that wraps the parser and the API into simple text commands you type into a terminal. No code writing required. | Some commands need the app | `pip install vexy-lines-cli` |
| **vexy-lines-run** | A standalone desktop application for batch processing --- drag in dozens of images, pick a style, and export them all. Three tabs for still images, image folders, and video. | Yes (must be running) | `pip install vexy-lines-run` |

Each package builds on the ones above it. `vexy-lines-cli` uses `vexy-lines-apy` under the hood, which in turn uses `vexy-lines-py` for file parsing. You do not need to understand the internals --- just pick the tool that matches your task.

---

## Which Tool Is for You?

| If You Want To... | Use This | Article |
|-------------------|----------|---------|
| Inspect a `.lines` file without opening the app | `vexy-lines-cli` (the `info` command) | [The Command Line Tool](602-cli-basics.md) |
| Extract the source photo embedded in a `.lines` file | `vexy-lines-cli` (the `extract-source` command) | [The Command Line Tool](602-cli-basics.md) |
| Export a whole folder of `.lines` files to SVG overnight | `vexy-lines-cli` (the `export` command) | [Batch Export and Style Transfer](603-cli-advanced.md) |
| Apply one document's visual style to another | `vexy-lines-cli` (the `style-transfer` command) | [Batch Export and Style Transfer](603-cli-advanced.md) |
| Write a Python script that reads fill parameters from a `.lines` file | `vexy-lines-py` | [Reading .lines Files with Python](604-python-parser.md) |
| Control the Vexy Lines app from a script --- add fills, change params, render, export | `vexy-lines-apy` | [Controlling Vexy Lines via API](605-mcp-api.md) |
| Blend two styles together at a ratio you choose | `vexy-lines-apy` (the style engine) | [Style Transfer and Interpolation](606-style-engine.md) |
| Convert a video into vector-style animation | `vexy-lines-cli` or `vexy-lines-run` | [Video to Vector Video](607-video-processing.md) |
| Let Claude or another AI assistant edit your artwork through conversation | The MCP bridge (`vexylines-mcp`) | [AI-Assisted Workflows](608-ai-workflows.md) |
| Diagnose performance problems or recover from crashes | The app itself, plus some know-how | [Performance and Troubleshooting](609-performance.md) |
| Look up a keyboard shortcut quickly | This manual | [Keyboard Shortcuts Reference](610-shortcuts.md) |
| Understand what a `.lines` file actually contains, byte by byte | This manual | [The .lines File Format](611-file-format.md) |
| Look up any term used in this manual | This manual | [Glossary](612-glossary.md) |

---

## What Is a Terminal?

Several articles in this section will ask you to type commands into a terminal. If that phrase means nothing to you, here is the short version: a terminal is a text window where you type instructions and the computer executes them. It is not a relic from the 1970s --- it is the fastest way to do repetitive tasks, and every operating system has one built in.

- **macOS:** Open the **Terminal** app (search for "Terminal" in Spotlight, or find it in Applications > Utilities).
- **Windows:** Open **PowerShell** (search for "PowerShell" in the Start menu).

You type a command, press Enter, and the computer responds with text. That is the entire interaction model. No windows, no buttons, no mouse. It sounds primitive until you realise you can process a hundred files in the time it takes to open one in a GUI.

If you have never used a terminal before, [The Command Line Tool](602-cli-basics.md) walks you through it gently.

---

## What Is Python?

Python is a programming language. You do not need to learn it to use `vexy-lines-cli` --- the command-line tool handles everything through typed commands. But if you want to write scripts that do things the CLI does not cover, a small amount of Python goes a long way.

Installing Python is a one-time setup:

1. Go to [python.org](https://www.python.org/downloads/) and download the latest version (3.10 or newer).
2. Run the installer. On macOS, the default options are fine. On Windows, check the box that says **Add Python to PATH** --- this is important.
3. Open a terminal and type `python --version`. If it prints a version number, you are set.

The four Vexy Lines packages install through `pip`, Python's package manager. The command `pip install vexy-lines-cli` downloads the CLI tool and everything it depends on. One command, one step.

---

## What Is MCP?

MCP stands for Model Context Protocol. It is the channel through which external tools --- scripts, AI assistants, or other applications --- talk to a running Vexy Lines instance. The app listens on your computer's local network at a specific address (`localhost:47384`) and accepts commands in a standard format called JSON-RPC 2.0.

You do not need to understand any of that to use it. The `vexy-lines-apy` package and the CLI tool handle the protocol for you. When an article says "via MCP," it means "by sending a command to the running Vexy Lines app." If the app is not running, MCP commands will not work --- the app needs to be open and listening.

For AI integration, a small bridge program called `vexylines-mcp` translates between the format AI assistants expect and the format the app speaks. More on that in [AI-Assisted Workflows](608-ai-workflows.md).

---

## Reading Order

These articles are numbered but independent. Read them in any order that matches your interest:

- **Just want to get things done from the command line?** Start with [The Command Line Tool](602-cli-basics.md), then [Batch Export and Style Transfer](603-cli-advanced.md).
- **Curious about scripting?** Read [Reading .lines Files with Python](604-python-parser.md), then [Controlling Vexy Lines via API](605-mcp-api.md).
- **Interested in AI workflows?** Jump straight to [AI-Assisted Workflows](608-ai-workflows.md).
- **Here for reference?** Go to [Keyboard Shortcuts](610-shortcuts.md), [The .lines File Format](611-file-format.md), or the [Glossary](612-glossary.md).

The GUI is not going anywhere. These tools sit alongside it, ready when you need them. Think of Part 6 as the workshop behind the studio --- same craft, sharper tools.

---

*Previous: [Part 5: Output and Workflow](511-print-preparation.md) | Next: [The Command Line Tool](602-cli-basics.md)*
