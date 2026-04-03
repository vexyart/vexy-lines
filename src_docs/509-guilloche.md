# Guilloche and Ornamental Patterns

Before software, guilloche patterns were cut by rose engine lathes — mechanical devices that translated hand-cranked rotation into precise, spiralling cuts on metal plates. The operator controlled the amplitude, frequency, and offset of the cutting head, producing interlocking waves, rosettes, and ribbon patterns of extraordinary complexity. These patterns were then used to print banknotes, stock certificates, government bonds, and official seals — documents where beauty was also security, because no forger could replicate the patterns without the same machine.

Vexy Lines includes a Guilloche plugin that generates these ornamental patterns algorithmically. The lathes weighed hundreds of kilograms. The plugin weighs a few megabytes. The output is remarkably similar.

---

## What the Guilloche Plugin Produces

The plugin generates three types of ornamental elements:

### Ribbons

A ribbon is a band of parallel wavy lines that undulates across the design. The lines within the ribbon maintain constant spacing but bend together, creating a snake-like band of pattern. Ribbons are the fundamental building block — the "strands" that weave, overlap, and frame other elements.

Parameters control:

- **Amplitude:** How far the ribbon swings from its center line (higher = more dramatic waves).
- **Frequency:** How many waves per unit length (higher = tighter oscillation).
- **Width:** How many parallel lines the ribbon contains.
- **Line count:** The number of parallel strokes within the ribbon.
- **Phase:** Shifts the wave pattern left or right — critical for creating overlapping ribbons that weave in and out of phase.

### Stripes

A stripe is a filled band — not individual lines, but a solid or near-solid region bounded by wavy edges. Stripes function as backgrounds, borders, or contrasting elements between ribbons.

### Components

Components are the decorative elements placed at intersections, corners, or focal points: rosettes, medallions, corner ornaments, and geometric motifs. They can be built from the same wavy-line parameters as ribbons but arranged in circular or radial patterns.

---

## Certificate Border: A Complete Recipe

The classic use case: an ornamental border for a certificate, diploma, or award. Here's a step-by-step recipe.

### Step 1: Set Up the Document

Create a new document at your certificate size — A4 landscape (297 × 210 mm) is standard. No source image needed — guilloche patterns are generated mathematically, not from photographs.

### Step 2: Outer Border Ribbon

Open the Guilloche plugin. Create a ribbon with:

- **Amplitude:** 8 mm
- **Frequency:** 12 waves across the long edge
- **Width:** 15 mm
- **Line count:** 20
- **Colour:** Dark teal or navy

Route this ribbon around the perimeter of the certificate, following a rectangular path with rounded corners. The ribbon forms the primary border frame.

### Step 3: Inner Border Ribbon

Create a second ribbon, slightly narrower:

- **Amplitude:** 5 mm
- **Frequency:** 18 waves (higher frequency — tighter pattern)
- **Width:** 8 mm
- **Line count:** 12
- **Colour:** Medium blue (lighter than the outer ribbon)

Route this ribbon inside the first, offset inward by 20 mm. The two ribbons run parallel but at different frequencies, creating visual depth through their phase differences.

### Step 4: Corner Rosettes

At each corner where the border ribbons turn, place a **component** — a circular rosette built from radial lines:

- **Type:** Rosette
- **Diameter:** 25 mm
- **Line count:** 36 (10° spacing between radial lines)
- **Colour:** Match the outer ribbon

The rosettes cover the corner joints where the ribbons change direction, hiding any awkward transitions and adding focal decoration.

### Step 5: Central Medallion

If the certificate has a central seal or logo area, create a larger rosette or concentric-ring component:

- **Type:** Concentric rings
- **Outer diameter:** 60 mm
- **Ring count:** 25
- **Colour:** Match the inner ribbon

Place it at the center or lower-center of the certificate. This is where the official seal or logo will eventually sit (added in the final layout application).

### Step 6: Background Wash

For an anti-counterfeiting background texture, add a very subtle ribbon pattern across the entire certificate interior:

- **Amplitude:** 3 mm
- **Frequency:** 30+ waves
- **Line count:** 8
- **Colour:** Extremely light — 10% tint of the border colour

This background pattern is nearly invisible in normal viewing but becomes apparent when photocopied (the copier either drops it or moirés it, both of which indicate reproduction).

---

## Security Features

Guilloche patterns on banknotes and official documents serve as anti-counterfeiting measures because:

1. **Complexity.** The interlocking wave patterns are extremely difficult to reproduce by hand or with standard design software. Each parameter combination produces a unique pattern — changing the frequency by 0.1 creates a visibly different design.

2. **Line precision.** The lines within a ribbon must maintain perfectly even spacing along their entire length. Any variation reveals a forgery.

3. **Overlap weaving.** When two ribbons cross, one passes in front of the other. Getting this overlap correct requires exact phase alignment. The Guilloche plugin handles this automatically; a forger must reproduce it manually.

4. **Micro-text integration.** Ribbons can contain micro-text — words readable only under magnification — woven into the wave pattern. Vexy Lines' Text fill can approximate this when combined with guilloche ribbons.

---

## Parameter Combinations for Banknote Aesthetics

The difference between "decorative border" and "this looks like it belongs on money" is specific parameter ranges:

| Element | Amplitude | Frequency | Line Count | Colour |
|---------|-----------|-----------|------------|--------|
| Primary ribbon | 6–10 mm | 10–15 waves/100 mm | 15–25 | Dark (navy, dark green, deep brown) |
| Secondary ribbon | 3–6 mm | 15–25 waves/100 mm | 8–15 | Medium tone of the primary |
| Background wash | 1–3 mm | 25–40 waves/100 mm | 5–10 | 5–15% tint of the primary |
| Rosette | — | — | 30–50 radial lines | Match primary |
| Fine detail ribbon | 2–4 mm | 30–50 waves/100 mm | 20–30 | Darkest value in the palette |

The key insight: **more lines per ribbon and higher frequency create the "money" look.** Twenty-five parallel wavy lines at high frequency produce the characteristic dense, almost hypnotic quality of banknote engraving. Ten lines at low frequency look more like a decorative border — pleasant, but not security-grade.

---

## Overlap: Weaving Ribbons

When two ribbons cross, the visual question is: which one is in front? The Guilloche plugin handles this through overlap control — the same system described in [Cloning for Coordinated Systems](410-cloning-strategies.md) but applied to guilloche elements.

### Basic Weave

1. Create Ribbon A running horizontally.
2. Create Ribbon B running diagonally across Ribbon A.
3. At the intersection, set Ribbon A to pass in front (its lines render on top, Ribbon B's lines are hidden behind).

### Alternating Weave

For a more complex effect — Ribbon A in front at the first crossing, Ribbon B in front at the second:

1. Split each ribbon into segments at each crossing point.
2. Alternate which ribbon is on top at each crossing.
3. The result is a genuine over-under weave, like woven fabric.

The plugin can automate alternating weaves for ribbons that cross multiple times. The visual effect is strikingly three-dimensional — ribbons that appear to thread through each other.

---

## Combining Guilloche with Standard Fills

Guilloche elements exist as layers in the Vexy Lines document, alongside standard fills. This means you can:

- **Layer a guilloche border around a portrait** rendered with Linear crosshatch fills.
- **Place a guilloche rosette behind a Trace-outlined logo.**
- **Use a guilloche background wash beneath Halftone shading.**

The guilloche plugin generates vector paths just like any fill. They stack, mask, and export identically. A certificate might combine:

- Guilloche border ribbons (plugin)
- Portrait of the honoree rendered in Linear fills (standard)
- Trace outline of an institutional seal (standard)
- Text fill with the awardee's name (standard)
- Guilloche background wash (plugin)

---

## Historical Context

The rose engine lathe dates to the 16th century, originally used for ornamental turning of decorative objects — snuff boxes, watch cases, medallions. By the 18th century, its precise geometric output had been adopted for engraving printing plates, particularly for financial documents.

Jacob Perkins, an American inventor, brought the rose engine lathe to the Bank of England in 1819, revolutionising banknote security. His machine could produce patterns so complex and precise that they were considered impossible to forge by hand. The technology remained the gold standard for security printing for nearly two centuries.

Today, computerised guilloche has largely replaced mechanical lathes, but the aesthetic — interlocking waves, precise line spacing, radial rosettes — remains unchanged. Vexy Lines' Guilloche plugin generates patterns that are algorithmically identical to those produced by modern security-printing software, though obviously intended for decorative rather than counterfeit-resistant use.

That said: if you design a certificate border in Vexy Lines, don't be surprised when people assume it was produced by professional security-printing software. The patterns are that convincing.

---

## Export for Guilloche

| Destination | Format | Key Settings |
|-------------|--------|-------------|
| Print (certificates, awards) | PDF | High smoothing (90+), spot colours if required |
| Further editing | SVG | Preserves all paths for manipulation in Illustrator/Affinity |
| Embossing / foil stamp | SVG with single colour | Convert to outlines for die-cutting |
| Web display | PNG at 300 DPI | Transparent background if layering over other content |

**Smoothing: set to maximum (90–100).** Guilloche patterns demand perfectly smooth curves. Any angular artefact in a wave pattern is immediately visible because the pattern's regularity makes irregularities obvious.

**Spot colours:** For formal printing (certificates, bonds), specify Pantone or custom spot colours rather than process CMYK. This ensures the precise ink colour the designer intended.

*Next: [Building a Style Library](510-style-libraries.md)*
