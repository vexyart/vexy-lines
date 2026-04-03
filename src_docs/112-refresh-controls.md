# Controlling When Vexy Recalculates

Every time you change a parameter — Interval, Angle, Threshold, anything — Vexy Lines has to regenerate the vector strokes for the affected fill. For a single fill on a small document, this takes milliseconds. For twelve fills on a high-resolution document with fine Intervals, it can take seconds or even minutes. The refresh controls exist so your computer doesn't spend all its time recalculating while you're still dragging sliders.

## The Three Refresh Modes

Vexy Lines gives you three ways to trigger recalculation. They live in the toolbar area, and understanding the difference between them is the single most important performance skill in the application.

### Auto Refresh (Toggle)

**What it does:** When Auto Refresh is **on**, Vexy Lines recalculates the affected fill every time you change any parameter. Move a slider, and the canvas updates immediately (or as quickly as the computer can manage). It's live feedback — you see what you're doing as you do it.

When Auto Refresh is **off**, changing parameters does *not* update the canvas. The Properties Panel reflects your new values, but the canvas still shows the old rendering. Nothing recalculates until you explicitly tell it to.

**When to use it on:** Simple documents. One to three fills, moderate Interval values, modest canvas size. Auto Refresh makes parameter exploration intuitive — you drag, you see, you adjust. It's the most natural way to work and the default setting for new documents.

**When to turn it off:** Complex documents. Many fills, small Interval values, large canvas dimensions. When every slider drag triggers a multi-second recalculation, Auto Refresh becomes a burden — the interface freezes while the CPU churns, and you can't tell whether the current render is "done" or "still computing." Turning Auto Refresh off gives you control: adjust parameters at your own pace, then recalculate when you're ready.

### Refresh Fill (Manual, Selection Only)

**What it does:** Recalculates only the currently selected fill layer. All other fills remain as they were.

**When to use it:** When Auto Refresh is off and you've finished adjusting parameters on one fill. Click Refresh Fill to see the result of your changes on just that fill, without waiting for the entire document to recalculate.

This is the most commonly used manual refresh. The typical workflow:

1. Turn off Auto Refresh.
2. Select a fill layer.
3. Adjust Interval, Angle, Threshold, and other parameters.
4. Click **Refresh Fill** to see the result.
5. If it needs more tweaking, adjust and click Refresh Fill again.
6. Move to the next fill layer.

### Refresh All (Manual, Entire Document)

**What it does:** Recalculates every fill in the document, regardless of which one is selected.

**When to use it:** When you've changed parameters on multiple fills and want to see the complete, up-to-date rendering. Also essential before exporting — you want to make sure the export reflects your current settings, not a stale render.

Refresh All is the heaviest operation. On a complex document, it may take noticeable time. Use it deliberately — at natural break points in your workflow, not after every small change.

## The Refresh Workflow

Here's the workflow that experienced Vexy Lines users converge on:

**For exploration (new document, few fills):**
- Auto Refresh: **On**
- Drag sliders freely, see instant feedback.
- Turn Auto Refresh off only if you notice lag.

**For production (complex document, many fills):**
- Auto Refresh: **Off**
- Work on one fill at a time.
- Use **Refresh Fill** after adjusting each fill.
- Use **Refresh All** before exporting or at major milestones.
- Turn Auto Refresh back on temporarily if you need live feedback for fine-tuning a specific fill, then turn it off again.

**The transition point:** Most users start with Auto Refresh on and only turn it off when they notice the interface becoming sluggish. A better habit is to turn it off proactively when you know the document is going to be complex. You'll save cumulative minutes of waiting for recalculations you didn't need yet.

## Rendering Quality

Vexy Lines may offer rendering quality settings that affect how fills are computed and displayed on the canvas:

### Fast (Draft) Mode

Renders fills at reduced fidelity for faster feedback. Strokes may be simplified, fine details may be omitted, and the rendering may not exactly match the final export. This is useful for coarse parameter exploration — getting the overall composition right before committing to a full-quality render.

### Best (Final) Mode

Renders fills at full fidelity. Every stroke is computed exactly as it will appear in the export. This is slower but ensures what you see on the canvas is what you'll get in your exported file.

**The workflow:** Use Fast mode while exploring and adjusting. Switch to Best mode for final verification before exporting. This saves significant time on complex documents where full-quality rendering takes noticeable time.

## Preventing Density Bombs

A "density bomb" is what happens when you accidentally create a fill configuration that generates an enormous number of strokes — so many that the computer slows to a crawl, the application becomes unresponsive, or the export file balloons to hundreds of megabytes.

The most common cause: a very small **Interval** value on a very large canvas. An Interval of 0.1 mm on an A2-sized document generates thousands of strokes per square centimetre. That's millions of strokes total, each a complex Bezier path. Your CPU will not be amused.

### How to Avoid Density Bombs

**Match Interval to document size.** A 0.5 mm Interval looks fine on a business-card-sized document (producing perhaps 200 strokes). The same 0.5 mm Interval on a poster-sized document produces ten thousand strokes. Scale your Interval proportionally to your canvas dimensions.

Rough guidelines:

| Document Size | Minimum Comfortable Interval |
|--------------|------------------------------|
| Business card / small icon | 0.3 mm |
| A5 / Half letter | 0.5 mm |
| A4 / Letter | 0.7 mm |
| A3 / Tabloid | 1.0 mm |
| A2 / Poster | 1.5 mm |
| Larger | 2.0 mm+ |

These are starting points, not hard rules. Your computer's speed, the number of fills, and your patience all factor in.

**Use Image Threshold to limit coverage.** A fill that generates strokes only in the darkest 30% of the tonal range (by pulling the highlights handle leftward) produces far fewer strokes than one covering the full range. Strategic Threshold settings reduce density without reducing visual impact.

**Turn off Auto Refresh before reducing Interval.** If Auto Refresh is on and you drag the Interval slider toward zero, Vexy Lines tries to recalculate at every intermediate value — including the very small ones that produce massive stroke counts. Turn Auto Refresh off first, set your Interval, then manually refresh. This way you only compute the final value, not every intermediate one.

**Check the fill's stroke count.** Some versions of Vexy Lines display the number of generated strokes for a fill in the Properties Panel or in the status bar. Keep an eye on this number. Hundreds to low thousands of strokes per fill is typical. Tens of thousands is heavy. Hundreds of thousands is a density bomb.

### Recovering from a Density Bomb

If you've already triggered one and the application is sluggish or unresponsive:

1. **Wait.** If the application is still computing, it may finish eventually. Give it a minute or two.
2. **Force quit and reopen.** If the application is completely frozen, force quit (**Cmd+Option+Esc** on macOS, **Ctrl+Alt+Delete > Task Manager** on Windows) and reopen. If Auto Save captured the dense state, you'll need to quickly change the Interval before the auto-refresh triggers again.
3. **Turn off Auto Refresh immediately** after reopening, before the dense fill recalculates.
4. **Increase the Interval** to a sane value.
5. **Manually refresh** when ready.

If the saved file itself is so dense that it freezes on open, and you can't turn off Auto Refresh fast enough, you have two options: open the `.~lines` backup file (which may contain a pre-density-bomb state), or — for the technically adventurous — open the `.lines` file in a text editor and manually change the Interval value in the XML before reopening in Vexy Lines.

## Performance Tips

| Tip | Why It Helps |
|-----|-------------|
| Turn off Auto Refresh for complex documents | Eliminates redundant recalculations during parameter exploration |
| Use Refresh Fill instead of Refresh All | Recalculates one fill instead of all of them |
| Hide layers you're not working on | Hidden layers may skip computation (depending on version) |
| Use Fast rendering quality for exploration | Reduces computation per refresh cycle |
| Start with larger Intervals, refine later | Avoids heavy computation during the exploratory phase |
| Match Interval to document size | Prevents accidentally generating too many strokes |
| Save before experimenting with small Intervals | Gives you a safe state to return to |

## Before You Export

One final note: **always Refresh All before exporting.** If Auto Refresh is off and you've been making changes, the canvas may not reflect your current parameters. The export captures the last-computed state, not the state shown in the Properties Panel. A Refresh All ensures everything is up to date.

This is the most common cause of "my export doesn't match what I see on screen" — a stale render from parameters that were changed but not recalculated.

With saving and refresh controls understood, you've completed Part 1 of this manual. You know how to install Vexy Lines, navigate the workspace, create documents, add and tune fills, mask areas, organise layers, export files, save your work, and manage recalculation performance.

For the next level — deep dives into each of the twelve fill types — continue to Part 2. Or return to the [Table of Contents](001-toc.md) and pick any topic that interests you.
