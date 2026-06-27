# AI-Assisted Workflows

Vexy Lines exposes its MCP tools to AI assistants through the `vexy-lines-mcp` bridge installed by `vexy-lines-cli`.

## Install

```bash
pip install vexy-lines-cli
vexy-lines-mcp --help
```

Launch Vexy Lines before using the bridge. The bridge connects the assistant's stdio MCP protocol to the app's local TCP server on `localhost:47384`.

## Claude Desktop Configuration

Add this to `~/Library/Application Support/Claude/claude_desktop_config.json` on macOS, or the matching Claude config path on Windows:

```json
{
  "mcpServers": {
    "vexy-lines": {
      "command": "vexy-lines-mcp"
    }
  }
}
```

Restart Claude Desktop after editing the file.

## Cursor Configuration

Add the same server under `mcp.servers` in Cursor's MCP configuration:

```json
{
  "mcp": {
    "servers": {
      "vexy-lines": {
        "command": "vexy-lines-mcp"
      }
    }
  }
}
```

## What The Assistant Can Do

The bridge exposes the app's MCP tools: document open/save/export, layer tree inspection, group/layer/fill creation, fill parameter edits, image-filter edits, source image changes, masks, transforms, render control, undo/redo, and selection.

It can only operate on the running app and the files the app can access. Treat AI-driven edits like any other automation: save copies, review output, and keep backups for important artwork.

*Previous: [Video to Vector Video](607-video-processing.md) | Next: [Performance and Troubleshooting](609-performance.md)*
