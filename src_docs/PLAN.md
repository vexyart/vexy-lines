---
this_file: src_docs/PLAN.md
---

# Vexy Lines manual review

**Primary audience:** Graphic designers, illustrators, fine artists, printmakers, tattoo artists, embroidery digitizers, laser-cutter operators -- anyone who needs to convert photographs or illustrations into scalable vector line art.

**Secondary audience:** Developers and technical artists who want to automate Vexy Lines workflows via CLI, Python SDK, or MCP API.

## 2. Design Principles

### Voice and tone

- **Plain language.** Write for a designer who has never opened a terminal. No jargon without immediate definition. No passive voice. No corporate fluff.
- **Friendly intelligence.** Respect the reader's visual skill. Assume they understand colour, composition, and print production -- just not this particular software.
- **Show the transformation.** Every section should make the reader see the result before explaining the controls. "Your portrait becomes a copper-plate engraving" before "drag the Interval slider to 0.5 mm."
- **First line sells the second.** Every article opens with a sentence that earns the reader's attention. No "In this section we will discuss..." throat-clearing.
- **Concise and concrete.** Every sentence must carry weight. Specific numbers over vague descriptions ("0.5 mm for fine detail, 10 mm for bold stripes" not "adjust to taste").
- **Enter late, leave early.** Start mid-action, end before over-explaining. Trust the reader to experiment.

### Structure conventions

- Each article is a standalone unit. A reader landing from search should understand the article without reading the previous one.
- Cross-references use `[article title](filename.md)` links, never "see above" or "as mentioned earlier."
- Every fill-algorithm article (Part 2) follows the same skeleton: what it looks like, when to use it, the parameter table, a step-by-step walkthrough, creative variations, and tips.
- Keyboard shortcuts appear inline in parentheses on first mention: "the Editor tool (V)."
- Parameter names match the Properties Panel labels exactly. If the app says "Wave Height," the manual says "Wave Height." No synonyms.

### Stephen King's rules applied

- Kill your darlings. If a paragraph survives only because it sounds clever, delete it.
- Write with the door closed, edit with the door open. Drafts can be messy; finals must be tight.
- Use the first word that comes to mind, if it's appropriate and colourful. Don't reach for the thesaurus.
- Omit needless words (Strunk via King). "The reason for this is that" becomes "because."
- Avoid adverbs. "The slider responds quickly" becomes "the slider responds in real time."

---

## 3. Numbering and File Naming

| Range | Part | Pattern |
|-------|------|---------|
| 001-003 | Front matter | `00X-slug.md` |
| 101-112 | Part 1: Getting Started | `1XX-slug.md` |
| 201-214 | Part 2: The Fill Parade | `2XX-slug.md` |
| 301-312 | Part 3: Properties and Controls | `3XX-slug.md` |
| 401-410 | Part 4: Masks, Meshes, and Composition | `4XX-slug.md` |
| 501-512 | Part 5: Creative Workflows | `5XX-slug.md` |
| 601-612 | Part 6: Power Tools | `6XX-slug.md` |

---

## 6. Cross-Cutting Themes

These motifs recur throughout the manual. Every article should reinforce them where relevant.

### Start simple, layer complexity

The manual teaches one thing at a time. Part 1 uses one fill. Part 2 explores each fill alone. Part 3 shows how controls interact. Part 4 combines fills. Part 5 builds complete projects. Part 6 automates. The reader is never overwhelmed. This same philosophy applies to using Vexy Lines itself: start with one fill, add complexity gradually.

### The brightness-to-stroke relationship

Every fill type reads pixel brightness and translates it into stroke weight, density, or shape size. This is the fundamental concept. Dark = thick/dense/large. Light = thin/sparse/small. Understanding this relationship unlocks all twelve fills. The manual should reinforce it in every fill article and every workflow.

### Source image quality matters

The quality of the source image directly determines the quality of the vector output. High contrast, good lighting, clean edges produce better results. The manual should include photo preparation tips wherever relevant: increase contrast, convert to grayscale for clarity, crop tightly, remove busy backgrounds.

### Masks transform chaos into composition

Without masks, fills cover the entire canvas. Masks are what turn "interesting texture" into "intentional artwork." The manual should treat masks as essential (not optional) from Part 1 onward.

### Export format matches purpose

SVG for web and cutting machines. PDF for print shops. EPS for legacy workflows. PNG for raster with transparency. JPEG for web sharing. The manual should recommend the right format for each workflow, not leave the reader guessing.

### Naming and organisation prevent future pain

Name your layers. Name your groups. Save versions at milestones. Build a style library. These habits save hours later. The manual should model good naming in every example.

---

### Image placeholders

Articles should include image placeholders using the format:

```
![Description of what the image should show](images/XXX-description.png)
```

Actual screenshots and diagrams will be produced separately.

## Desktop controls

- Create a fill in each algorithm. Compare the Properties panel labels, units, defaults and slider limits with the manual. Try typing values beyond each slider limit.
- Compare the add-fill menu with the algorithm names and XML tags in the parser. Check Wireframe and Text explicitly.
- Try the shortcut table on macOS and Windows, including Preview with Spotlight’s default Cmd+Space binding.
- List the mesh templates and Hidden Strokes Removal modes from their menus.
- Try auto-detection with Brush, Rectangle, Ellipse and Freeform masks. Check which tools offer a tolerance control.
- Draw and import an SVG stroke in Handmade. Check the mode names and how Manual, Blend and Balanced distribute strokes.
- Apply Emboss to individual fills and layers. Check its scope, controls and supported fill types.
- Use the History panel to return to an earlier edit. Check its thumbnails and whether each entry is an undo step or a snapshot.
- Export each listed format, including EPS. Paste a clipboard copy into a vector editor to check whether the paths remain editable.
- Open Guilloche on macOS and Windows. Check how it is installed and compare the available patterns and parameters with the chapter.

## File format, automation and installation

- Compare colour values in current and older `.lines` files with the parser output. Check alpha order, decimal ARGB and normalisation to RGB or RGBA hex.
- Run the documented MCP bridge, check its executable and port, then use `initialize` and `tools/list` to compare the protocol version, tool count, names and parameters with the manual.
- Change a preference on macOS and inspect the saved plist for the actual domain and key separator.
- Check the installation chapter against the current macOS and Windows downloads and product page for minimum OS versions, RAM, installer sizes, price and licence terms.

## Illustrations and final review

- Produce the planned screenshots and diagrams. Check that the five-minute walkthrough shows each step and that the gallery illustrates the finished recipes.
- Have a second reader check the technical chapters against the application and reference implementations, including the CLI and Python examples.
- Proof the manual for typos and follow its internal and external links.
