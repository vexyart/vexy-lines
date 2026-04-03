# From Tool to Craft

Knowing what every slider does is not the same as knowing what to make. Parts 1–4 gave you the instrument. Part 5 is where you play actual songs.

Every article in this chapter follows a real project from concept to export — with specific parameter values, specific stacking orders, and specific reasons for every choice. These are not theoretical explorations. They are tested recipes that produce finished artwork, and each one exists because someone actually needed to make the thing described.

---

## What Part 5 Covers

| Article | Project Type | You'll Walk Away With |
|---------|-------------|----------------------|
| [Portrait Engraving](502-portrait-engraving.md) | Fine-art portrait | A complete copper-plate-style engraving with crosshatch shading and contour outlines |
| [Landscape and Nature](503-landscape-illustration.md) | Scenic illustration | A multi-layer landscape using atmospheric perspective through fill density |
| [Preparing for Screen Printing](504-screen-printing.md) | Production output | Colour-separated layers ready for silk-screen or risograph printing |
| [Tattoo Design](505-tattoo-design.md) | Body art | Clean, scalable vectors that survive skin and time |
| [Laser Cutting and CNC](506-laser-cutting.md) | Fabrication | Machine-ready SVGs with appropriate stroke settings for physical cutting and engraving |
| [Botanical Illustration](507-botanical-illustration.md) | Scientific art | Precise, convention-following plant illustrations with structural accuracy |
| [Comics and Graphic Novels](508-comics-graphics.md) | Sequential art | Bold inking, expressive shading, and panel-by-panel workflow |
| [Guilloche and Ornamental Patterns](509-guilloche.md) | Security printing / decorative | Complex interlocking ornamental patterns for certificates and banknotes |
| [Building a Style Library](510-style-libraries.md) | Workflow efficiency | Reusable style templates, style transfer, and style interpolation |
| [Preparing Files for Print](511-print-preparation.md) | Professional output | Resolution, bleed, colour, and format settings for offset, large-format, and screen printing |
| [Gallery of Techniques](512-gallery-recipes.md) | Quick reference | 12 concise recipe cards, each reproducible in under 10 minutes |

---

## How to Use These Articles

**If you have a specific project:** Jump directly to the matching article. Each stands alone.

**If you want to build range:** Read them in order. Each article introduces techniques and parameter combinations that appear in later articles. Portrait Engraving establishes crosshatching. Landscape builds on atmospheric layering. Screen Printing introduces colour separation. Each adds a tool to your repertoire.

**If you need something fast:** Skip to [Gallery of Techniques](512-gallery-recipes.md) at the end. It contains twelve recipe cards — name, layer stack, key parameters, export format — each designed to be reproducible in ten minutes or less.

---

## The Recurring Principles

Across all eleven project articles, the same principles reappear:

### Start with the photo, not the fill

Every project begins with photo selection and preparation. The source image is the blueprint. A well-chosen, well-lit photo with appropriate contrast produces better results than any amount of parameter tweaking on a poor source. Several articles include specific guidance on what makes a good source photo for that project type.

### Plan the layer stack before building it

Decide what goes on each layer, what fill type and interval it gets, and what mask shapes it to *before* adding the first fill. A sketch on paper takes thirty seconds and saves thirty minutes of restructuring.

### Use threshold bands to separate responsibilities

When two fills share the same spatial region, give them different Image Threshold ranges. One fill handles shadows (0–120), another handles midtones (80–200), a third handles highlights (160–255). Each fill does one job well instead of all three jobs poorly.

### Export format follows function

SVG for anything that will be further edited, scaled, or machine-processed. PDF for print production. PNG for screen display. EPS for legacy workflows. The article on [Preparing Files for Print](511-print-preparation.md) goes deep on format selection; each project article includes a recommended export format with rationale.

### Parameters are recipes, not laws

Every value in these articles — "interval 1.5 mm, angle 15°, smoothing 70" — is a starting point tested on representative source images. Your photo is different. Your taste is different. Use the given values for your first attempt, then adjust. The articles explain *why* each value was chosen so you can reason about changes rather than guessing.

---

## What You Need Before Starting

- **Vexy Lines installed and licensed** (or in demo mode — you can build everything except export).
- **Source photos** for the project type. Several articles suggest specific photo characteristics. A high-contrast portrait for engraving, a layered landscape for nature illustration, a product photo for screen printing.
- **An idea of the output.** Where is this going? A gallery wall? A screen-print studio? A laser cutter? A tattoo parlour? A certificate printer? The destination shapes every parameter choice.
- **Parts 1–4 in your head** (or bookmarked). These articles reference specific techniques and tools without re-explaining them. If you encounter a term you don't recognise, check [The One-Page Manual](002-tldr.md) for a quick refresher or the relevant Part 1–4 article for depth.

---

## The Workflow Pattern

Every article in Part 5 follows the same structure, regardless of the project type. Once you've worked through one article, you know the rhythm for all of them.

### 1. Choose and Prepare the Source Photo

Each project type demands different source characteristics. Portraits need directional lighting and tonal range. Landscapes need depth separation between zones. Tattoo designs need clean shapes at the target physical size. The articles specify what to look for and how to prepare the photo before importing.

### 2. Plan the Layer Stack

Before adding the first fill, decide how many layers you need, what fill type each gets, and what mask confines it. The articles provide complete layer-stack tables — fill type, interval, angle, threshold, and mask for every layer. Copy the table into your planning notes (or just keep the article open) and build from the bottom up.

### 3. Build Bottom-to-Top

Start with the widest, subtlest fill at the bottom of the Layers Panel. Add increasingly detailed fills above it. Put outlines on top. This order ensures that each layer is evaluated in the context of everything below it — you can see immediately whether a new fill adds value or creates visual noise.

### 4. Mask Each Layer

Shape each fill to its intended region using the mask tools: auto-detection for speed, Brush for organic edges, Freeform and Rectangle for geometric boundaries. The articles specify which tool works best for each region type. Mask precision is often the difference between "interesting experiment" and "finished artwork."

### 5. Evaluate and Tune

Zoom to 100% (actual print size if the piece is headed for print). Check stroke spacing, tonal balance, and mask edges. Each article includes specific adjustment guidance: which parameters to increase if the result is too light, which to decrease if it's too dark, and which to leave alone.

### 6. Export

Choose the format that matches the destination. The articles recommend specific export settings for each project type — format, resolution, colour mode, and any special considerations for the output medium.

---

## From Recipes to Repertoire

The first time you follow a recipe from this chapter, you're learning a technique. The second time, you're practising it. The third time, you're adapting it. By the fifth time, you've internalised the parameter relationships and can build similar compositions from scratch without consulting the article.

That's the trajectory these articles are designed to accelerate. Each one is a shortcut through the experimentation phase — the phase where you'd otherwise spend hours trying random parameter combinations, most of which don't work. The recipes narrow the search space to the combinations that *do* work, and explain why, so you can extrapolate confidently.

---

## A Note on Style

The articles in Part 5 are opinionated. They recommend specific angles, specific intervals, specific fill combinations. This is intentional. Opinions are faster than options when you're learning. Follow the recipe once, understand why it works, then develop your own opinions. The best Vexy Lines artists all started by copying someone else's settings and ended by inventing their own.

*Start with [Portrait Engraving](502-portrait-engraving.md) — the project that best showcases what Vexy Lines was built to do.*
