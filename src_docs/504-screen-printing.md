# Preparing for Screen Printing

Screen printing doesn't care about your gradients. It doesn't understand "50% opacity" or "feathered edges." Each colour is a separate screen, each screen holds ink or doesn't, and the press lays one colour on top of another in sequence. The beauty of Vexy Lines for screen printing is that it already thinks this way — every stroke is a vector path with a single colour, and every layer is independent. You just need to organise the output so the printer can work with it.

---

## The Core Principle: One Fill Per Colour

In screen printing, each ink colour requires its own screen. A three-colour poster needs three screens, three passes through the press, and three separate files.

In Vexy Lines, this maps directly to layers:

- **One layer per colour.**
- **One colour per layer.**
- **Export each layer as a separate file.**

No gradients, no transparency, no blending between layers. Each layer is a binary decision: ink here, no ink there.

---

## Colour Separation Workflow

### Step 1: Plan Your Colours

Before touching Vexy Lines, decide:

- **How many colours?** Home screen printers often work with 2–4 colours. Professional shops can handle 6–8 or more, but each colour adds cost and registration complexity.
- **Which colours?** Choose spot colours that work together. A classic combination: black + one warm colour + one cool colour. Or: black + white (on coloured paper).
- **Print order?** Lighter colours print first, darker colours on top. The topmost layer in Vexy Lines should be the last colour printed.

### Step 2: Build the Layer Stack

Create one fill layer per colour. Each layer gets:

- A flat colour matching your ink colour (or a standard spot-colour reference — Pantone, etc.).
- A mask confining it to the areas where that colour should print.
- A fill type and parameters appropriate for the ink and mesh count.

**Example: Three-Colour Poster (Black, Red, Blue)**

| Layer | Colour | Fill | Interval | Mask | Print Order |
|-------|--------|------|----------|------|-------------|
| 3 (top) | Black | Trace | — | Full canvas (outlines) | Last (on top) |
| 2 | Red | Linear, 30° | 1.5 mm | Masked to warm areas (skin, clothing) | Second |
| 1 (bottom) | Blue | Circular | 3.0 mm | Masked to cool areas (background, sky) | First |

### Step 3: Mask Each Colour Region

This is where the craft lives. Each colour's mask defines exactly where that ink lands.

- Use **auto-detection** for regions with clear colour boundaries in the source photo.
- Use **Freeform masks** (S) for precise geometric regions.
- Use the **Brush** (B) for organic boundaries.

**Critical:** Avoid overlapping masks between colours unless you want overprinting (ink on top of ink, which changes the colour). If the red layer and blue layer overlap, you'll get a purple area where both inks mix. Sometimes this is intentional. Usually it isn't.

### Step 4: Set Fill Parameters for Screen Printing

Screen printing has physical constraints that affect parameter choices:

| Parameter | Screen Print Consideration |
|-----------|---------------------------|
| **Interval** | Must be wider than the screen mesh openings. A 110-mesh screen can hold detail down to about 0.5 mm. A 60-mesh screen needs at least 1.0 mm. Ask your printer for their minimum detail size. |
| **Stroke Thickness** | Minimum printable thickness depends on ink viscosity and mesh count. 0.3 mm is a safe minimum for most setups. Below that, strokes may break up during printing. |
| **Smoothing** | Set to 60–80. Screen printing reproduces smooth curves well, but jagged vector paths can cause ink pooling at corners. |
| **Randomization** | Keep low (0–15%). High randomization produces strokes that approach each other unpredictably, creating areas where ink may flood. |

### Step 5: Export Each Layer Separately

Export each colour layer as its own SVG or PDF file:

1. **Hide all layers except the one you're exporting** (click the eye icon on each layer in the Layers Panel).
2. **File > Export** → SVG or PDF.
3. **Name the file** with the colour: `poster-black.svg`, `poster-red.svg`, `poster-blue.svg`.
4. **Repeat** for each colour layer.

Each file becomes one screen in the printing process.

---

## Registration Marks

Registration marks are small targets (usually crosshairs in a circle) printed on every colour layer at identical positions. The printer uses these to align the screens so each colour lands in the right place.

Vexy Lines doesn't add registration marks automatically. You have two options:

1. **Add them manually.** Create a small group with crosshair shapes at the four corners of your canvas (outside the artwork area). Include this group in every layer's export by keeping it visible during each export.

2. **Let the print shop add them.** Many shops have their own registration mark system and prefer to add marks themselves in their prepress software. Ask before adding your own.

---

## Halftone Sizes and Mesh Count

If you're using Halftone fills for one of your colour layers (common in pop-art or vintage styles), the dot size must work with the screen mesh:

| Screen Mesh | Minimum Dot Interval | Typical Use |
|-------------|---------------------|-------------|
| 60 mesh | 2.5 mm+ | Bold graphics, heavy ink coverage |
| 110 mesh | 1.5 mm+ | General purpose, most poster work |
| 160 mesh | 0.8 mm+ | Fine detail, photographic halftone |
| 230 mesh | 0.5 mm+ | Very fine detail, speciality printing |

Set the Halftone fill's interval to at least the minimum for your mesh count. Dots smaller than the mesh can print will blob together or drop out entirely.

---

## Trapping

Trapping is the intentional slight overlap between two adjacent colour regions to prevent white gaps caused by registration errors. If the red layer and the blue layer meet at a boundary, a tiny registration shift during printing creates a visible white line between them.

To trap in Vexy Lines:

1. Expand each colour's mask slightly (1–2 pixels) beyond its intended boundary.
2. The overlapping area prints both colours — a narrow strip of overprint that's invisible at normal viewing distance.
3. The darker colour should expand *into* the lighter colour's region (not the other way around), so the overlap reads as a shadow rather than a highlight.

Alternatively, use a black outline layer (Trace fill) that covers the boundaries between colours. The outline hides any registration gaps beneath it — this is the simplest and most common trapping strategy for hand-printed screen work.

---

## Colour on Coloured Paper

If printing on non-white paper (kraft, coloured stock, black paper):

- **The paper colour shows through everywhere ink isn't.** Design with this in mind — your "white" is actually the paper colour.
- **White ink is opaque** and can be printed as an underbase beneath other colours on dark paper.
- **Layer order matters more.** On dark paper, print white first, then lighter colours, then darker colours.
- In Vexy Lines, set the canvas background colour to match your paper colour. This gives you an accurate preview of how the final print will look.

---

## Risograph Considerations

Risograph printing is a form of screen printing with specific constraints:

- **Two drums maximum** on most machines (some have one). Each drum holds one ink colour.
- **Registration is imprecise** — expect 1–3 mm of drift between colours. Use generous trapping and avoid designs that require tight alignment.
- **Ink is semi-transparent.** Overlapping areas create third colours (red + blue = purple). This can be a feature, not a bug — design for it.
- **Grain texture** is inherent in riso printing. It adds character, so don't over-smooth your fills. A little randomization (10–20%) complements the riso aesthetic.

### Riso-Friendly Parameters

| Parameter | Riso Value | Why |
|-----------|-----------|-----|
| Interval | 2.0 mm+ | Riso resolution is lower than offset |
| Min thickness | 0.5 mm | Thinner strokes break up in riso ink |
| Smoothing | 50–70 | Some angular character suits the medium |
| Randomization | 10–20% | Complements riso's natural grain |

---

## Export Settings Summary

| Setting | Value | Reason |
|---------|-------|--------|
| Format | SVG (preferred) or PDF | Vector preserves all stroke detail |
| Layers | Export separately, one file per colour | Each file = one screen |
| Colour mode | Spot colour (solid) per layer | No gradients, no transparency |
| Canvas size | Match final print dimensions | Avoids scaling at the press |
| Smoothing | 60–80 | Clean curves for screen reproduction |
| Bleed | Add 3–5 mm beyond trim | If artwork extends to the edge |

---

## Checklist Before Sending to the Printer

- [ ] One file per colour, clearly named
- [ ] All fills use solid flat colours (no Dynamic Color, no gradients)
- [ ] Intervals and stroke widths compatible with mesh count
- [ ] Trapping applied at colour boundaries (or black outlines cover them)
- [ ] Registration marks included (or printer will add their own)
- [ ] Canvas size matches final print size
- [ ] Files are SVG or PDF (not PNG or JPEG)
- [ ] Preview each file individually to verify no stray strokes

*Next: [Tattoo Design](505-tattoo-design.md)*
