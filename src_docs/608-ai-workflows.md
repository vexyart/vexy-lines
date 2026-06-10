# AI-Assisted Workflows (Claude + MCP)

You can talk to Vexy Lines. Not metaphorically --- literally. Type a sentence like "Add a Linear fill at 45 degrees with an interval of 1 mm" into Claude, and the fill appears in your document. Ask "Make the lines thicker" and the parameters update. Say "Export as SVG" and a file lands on your hard drive. The AI translates your natural-language instructions into MCP API calls, and the app executes them.

This is not a gimmick. It is a fundamentally different way to work with the application --- one where you describe what you want instead of hunting for the right slider. It is especially powerful for exploration, iteration, and for tasks where you know the destination but not the exact parameter values to get there.

---

## What You Need

Three things:

1. **Vexy Lines** --- installed and running.
2. **Claude Desktop** (or Cursor, or another AI tool that supports MCP) --- installed.
3. **The MCP bridge** --- a small program called `vexylines-mcp` that connects Claude to Vexy Lines.

The bridge is the glue. Claude speaks a protocol called MCP (Model Context Protocol). Vexy Lines speaks JSON-RPC over TCP. The bridge translates between them. It reads requests from Claude on one side and sends them to the app on the other.

---

## Setting Up the Bridge

### Step 1: Install the Bridge

The bridge comes with the `vexy-lines-cli` package:

```
pip install vexy-lines-cli
```

Verify it installed:

```
vexylines-mcp --version
```

### Step 2: Find the Config File

Claude Desktop uses a configuration file to know about available MCP servers. The file location depends on your platform:

- **macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows:** `%APPDATA%\Claude\claude_desktop_config.json`

If the file does not exist, create it. If it exists, you will add to it.

### Step 3: Add the Vexy Lines Server

Open `claude_desktop_config.json` in a text editor and add the Vexy Lines entry inside the `mcpServers` section:

```json
{
  "mcpServers": {
    "vexy-lines": {
      "command": "vexylines-mcp",
      "args": []
    }
  }
}
```

If the file already has other MCP servers configured, add `"vexy-lines"` alongside them. Make sure the JSON syntax is valid --- every entry except the last needs a comma after its closing brace.

**Full example with multiple servers:**

```json
{
  "mcpServers": {
    "some-other-server": {
      "command": "other-mcp",
      "args": []
    },
    "vexy-lines": {
      "command": "vexylines-mcp",
      "args": []
    }
  }
}
```

### Step 4: Restart Claude Desktop

Close and reopen Claude Desktop. It reads the config file at startup. When it connects successfully, the Vexy Lines tools appear in Claude's tool list (usually visible as a hammer icon or in the tools panel).

### Step 5: Launch Vexy Lines

The app must be running for Claude to communicate with it. Launch Vexy Lines normally. Open a document or create a new one.

### Step 6: Test

In Claude Desktop, type:

> What document is currently open in Vexy Lines?

If Claude responds with the document name and dimensions, the connection is working. If it reports an error, check that:
- Vexy Lines is running.
- The bridge is installed (`vexylines-mcp --version` works).
- The config file path is correct and the JSON is valid.

---

## What Claude Can Do

Once connected, Claude has access to the same 29 MCP tools described in [Controlling Vexy Lines via API](605-mcp-api.md). Through conversation, Claude can:

### Document Operations

- Open, create, save, and export documents.
- Read document metadata (dimensions, DPI, caption).

### Structure Operations

- List the layer tree.
- Add and remove groups, layers, and fills.
- Reorder elements.

### Parameter Adjustments

- Read the current parameters of any fill.
- Change any parameter: interval, angle, randomization, smoothing, threshold, colour, dynamic colour settings.

### Visual Operations

- Set source images.
- Toggle visibility of layers and groups.
- Apply transforms and warps.

### Control Operations

- Trigger renders.
- Undo and redo changes.
- Export to any supported format.

---

## Conversation Examples

### Adding a Fill

> **You:** Add a Linear fill at 45 degrees with an interval of 1 mm and smoothing at 30.
>
> **Claude:** I've added a Linear fill with these settings:
> - Angle: 45°
> - Interval: 1.0 mm
> - Smoothing: 30
>
> The fill has been rendered. You should see diagonal lines across your canvas now.

### Iterating on Parameters

> **You:** The lines are too thin. Make them thicker.
>
> **Claude:** I've increased the stroke thickness multiplier from 1.0 to 1.5. Let me render the update.
>
> The lines should now be noticeably heavier. Want me to go further?

> **You:** A bit more. And add some randomization --- maybe 15%.
>
> **Claude:** Done. Multiplier is now 1.8, randomization at 15%. The lines have a subtle organic irregularity now while still maintaining the diagonal structure.

### Building a Complex Composition

> **You:** I want to create a crosshatched portrait. Start with a base layer of horizontal lines at 0.8 mm interval, then add a second layer at 75 degrees with 1.2 mm interval for the shadows only.
>
> **Claude:** I'll set this up in two steps.
>
> First fill added: Linear at 0°, interval 0.8 mm, full tonal range.
>
> Second fill added: Linear at 75°, interval 1.2 mm. I've adjusted the image threshold to respond only to the darker 40% of the tonal range, so the crosshatch appears only in shadow areas.
>
> Rendering now. The portrait should show single-direction lines in the highlights and crosshatching in the shadows.

### Exploring Creatively

> **You:** What would this look like as a halftone instead?
>
> **Claude:** I'll hide the current Linear fills and add a Halftone fill so you can compare. Added a Halftone fill with circle shapes, interval 2.0 mm, responding to the full tonal range. Rendered.
>
> The portrait is now built from dots of varying sizes instead of lines. Want me to bring back the Linear fills, or keep exploring this direction?

### Exporting

> **You:** This looks great. Export it as SVG and PDF.
>
> **Claude:** Exported two files:
> - /Users/you/Documents/portrait.svg
> - /Users/you/Documents/portrait.pdf
>
> Both are on your desktop. The SVG is 2.4 MB and the PDF is 1.8 MB.

---

## The AI as Creative Partner

The conversational workflow shines in three scenarios:

### 1. Exploration

You do not know what you want. You have a photograph and a vague sense of direction. Instead of clicking through fill types and dragging sliders, you describe the mood: "I want something that looks like an old woodcut" or "Make it feel loose and sketchy, like a quick pen drawing." Claude translates these descriptions into concrete parameter choices, and you respond to the result: "More texture," "Tighter lines," "Make the shadows deeper." Each exchange is a creative iteration that takes seconds.

### 2. Precision Without Memorisation

You know exactly what you want --- a Linear fill at 0.6 mm interval, 22-degree angle, stroke thickness in Thick mode, smoothing at 45, dynamic colour with 8 mm segment length --- but hunting through the Properties Panel for each setting takes time. Saying it out loud (or typing it) is faster, especially for complex setups with multiple fills.

### 3. Batch Descriptions

"Open each file in the portfolio folder, add a Circular fill with 1.5 mm interval centered on the canvas, render, and export as PDF." This kind of multi-step batch instruction is natural in conversation but would require either the CLI, a Python script, or many minutes of manual clicking.

---

## Limitations

The AI workflow has real constraints. Understanding them prevents frustration.

### Claude Does Not See Your Artwork

Claude manipulates parameters, but it does not have eyes on the canvas. It cannot tell you "the face looks muddy" or "the left side needs more contrast." It operates on numbers: fill types, intervals, angles, thresholds. Your eyes are the feedback loop. Claude is the hands.

**Practical consequence:** When Claude says "I've set the interval to 1.2 mm," you need to look at the Vexy Lines canvas to judge whether 1.2 mm is right. Claude can describe what it did, but it cannot evaluate the visual result.

### Natural Language Is Approximate

"Make it thicker" is ambiguous. Claude will make a reasonable interpretation (increase the stroke thickness multiplier, or decrease the interval, or both), but its interpretation might not match yours. Be as specific as you can: "Increase the stroke multiplier to 2.0" is unambiguous. "Make the lines a bit thicker" requires Claude to guess what "a bit" means.

### Connection Must Be Active

Vexy Lines must be running and the bridge must be configured. If the app is closed or the connection drops, Claude's tool calls will fail. Relaunch the app and try again.

### No Undo Through Claude's History

Claude's undo is the app's undo. Saying "undo" calls the app's undo function once. It does not revert Claude's entire last conversation turn if that turn involved multiple operations. For complex rollbacks, use the app's Edit > Undo (Cmd+Z) repeatedly.

---

## Tips for Effective AI Collaboration

- **Start broad, then narrow.** Begin with a general description ("engraving style, tight lines, strong contrast") and refine iteratively ("tighter interval," "more randomization," "shift the angle to 30 degrees").
- **Name your fills.** Ask Claude to name layers descriptively ("Shadow crosshatch," "Highlight dots"). This makes later conversations clearer: "Adjust the Shadow crosshatch fill's interval."
- **Use comparison.** "Hide the Halftone fill and show me just the Linear fills" is a fast way to evaluate individual contributions.
- **Save intermediate states.** Ask Claude to save the document after each major milestone. If exploration goes sideways, you can return to a known-good state.
- **Describe the look, not just the numbers.** Claude can translate "like a banknote illustration" or "loose watercolour" into reasonable starting parameters. You may still need to refine, but the starting point will be in the right neighbourhood.

---

## Using with Cursor and Other MCP Hosts

The `vexylines-mcp` bridge works with any application that supports the MCP stdio protocol, not just Claude Desktop. If you use Cursor, Windsurf, or another MCP-compatible tool, the setup is similar:

1. Install the bridge: `pip install vexy-lines-cli`
2. Add `vexylines-mcp` as an MCP server in that tool's configuration.
3. Launch Vexy Lines.
4. Start conversing.

The configuration format may differ slightly between tools. Consult your tool's documentation for how to add MCP servers.

---

## Further Reading

- [Controlling Vexy Lines via API](605-mcp-api.md) --- the 29 MCP tools that Claude uses under the hood.
- [Beyond the GUI](601-part6-tldr.md) --- overview of all power tools.
- [Batch Export and Style Transfer](603-cli-advanced.md) --- for when the CLI is faster than conversation.

---

*Previous: [Video to Vector Video](607-video-processing.md) | Next: [Performance and Troubleshooting](609-performance.md)*
