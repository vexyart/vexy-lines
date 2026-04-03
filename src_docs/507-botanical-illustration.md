# Botanical Illustration

Botanical illustration has rules. Not the "break them to be creative" kind — the kind that exist because a scientist in 1753 needed to tell two species apart from a drawing, and the conventions that emerged are still used in herbarium sheets, field guides, and taxonomic papers today. Vexy Lines can produce illustrations that follow these conventions, but only if you design with them in mind.

The payoff: a botanical illustration that took a trained artist forty hours of stippling and cross-hatching can be approximated in Vexy Lines in an afternoon, with the vector output scalable to any reproduction size.

---

## What Makes It Botanical

A botanical illustration is not a pretty picture of a flower. It's a scientific document that must:

- **Show the complete structure.** Roots, stem, leaves, flowers, fruit, seeds — whatever is taxonomically relevant. Not artistic cropping.
- **Maintain proportion.** Parts must be accurately scaled relative to each other. No exaggeration for drama.
- **Use consistent lighting.** Traditional convention: light from the upper left. This is arbitrary but universal — every botanical illustrator uses it, so every botanist expects it.
- **Distinguish surfaces through texture.** Smooth leaves get clean parallel lines. Hairy stems get short scattered strokes. Waxy petals get subtle shading. The line technique communicates surface quality.

Vexy Lines' fill algorithms map directly to these conventions. Linear for smooth surfaces, Scribble for rough textures, Circular for flower centres, Trace for clean outlines, Handmade for specialised symbols.

---

## Photo Preparation

The source photo is your reference, not your subject. In traditional botanical illustration, artists work from live specimens. In Vexy Lines, you work from photographs — but the photo needs to be set up properly.

### Ideal Source Photo

- **White or light grey background.** Botanical illustrations traditionally float on white. A clean background means fewer masking headaches.
- **Directional lighting from upper left.** This matches the convention. The fills will generate shading that follows the lighting, so if the light comes from the wrong direction, the illustration will look "wrong" to anyone trained in the field.
- **Sharp focus on all parts.** Depth-of-field blur translates to fuzzy fills. Use a small aperture (f/11–f/16) and adequate lighting to keep the entire specimen in focus.
- **Scale reference.** Include a ruler in the photo (outside the specimen area) so you can set your canvas to the correct physical scale.
- **Multiple views if needed.** A single photo may not show all diagnostic features. Consider photographing the flower from the front, the leaf from above, and a cross-section separately, then compositing them in Vexy Lines using per-group source images (see [Groups: Source Images and Inheritance](407-groups-advanced.md)).

---

## The Layer Stack

A botanical illustration typically needs 5–8 layers, each handling a different structure or texture.

| Layer | Structure | Fill | Interval | Angle | Special | Mask |
|-------|-----------|------|----------|-------|---------|------|
| 1 (bottom) | Leaf surfaces | Linear | 1.5 mm | Follow vein direction | Smoothing 80 | Each leaf masked separately |
| 2 | Stem and branches | Linear | 1.0 mm | Along stem axis | Thickness: Thick | Masked to stems |
| 3 | Flower petals | Wave | 2.0 mm | Radial from centre | Wave Height 1.5 mm, Length 10 mm | Masked per petal |
| 4 | Flower centre | Circular | 1.2 mm | — | Centre point on flower centre | Masked to disc/receptacle |
| 5 | Hairy/rough surfaces | Scribble | 1.5 mm | — | Randomization 40% | Masked to hairy areas |
| 6 | Symbols / annotations | Handmade | — | — | Manual mode | Placed individually |
| 7 (top) | Outlines | Trace | — | — | Smoothing 80+, Thickness 0.2 mm | Full canvas |

---

## Building It: Structure by Structure

### Leaves

Leaves are the most common element and the one that most clearly demonstrates Vexy Lines' utility.

1. **Mask each leaf separately** using the Freeform tool (S) or auto-detection. Separate masks let you set a different angle on each leaf's fill, following the vein direction.

2. **Linear fill at 1.5 mm interval.** The angle should follow the leaf's central vein — if the vein runs at 30°, set the fill angle to 30°. This is a botanical convention: line direction on a leaf indicates vein orientation.

3. **Smoothing: 80+.** Botanical lines should be clean and confident, not jagged.

4. **Thickness: Linear mode, max 0.6 mm.** The fills thicken in the shadow areas (lower-right, given upper-left lighting) and thin in the highlights. This communicates the leaf's three-dimensional form.

5. **For venation detail:** Add a second Linear layer masked to each leaf at 90° to the first (perpendicular to the main veins). Set threshold to shadows only (0–80) and interval to 2.5 mm. This creates a subtle crosshatch in the shadowed areas that suggests secondary venation.

**Multiple leaves:** If your specimen has leaves at different angles, you need separate fill layers (or clones with individual masks) for each leaf orientation. A rosette with twelve leaves might need twelve masked copies of the same fill, each at a different angle. This is tedious but taxonomically correct.

### Stems and Branches

- **Linear fill** with the angle aligned to the stem's longitudinal axis.
- **Interval: 1.0 mm** — tighter than leaves, because stems are typically more tonal and rounded.
- **Thickness: Thick mode** to emphasise the cylindrical shadow along one side.
- **Mask tightly** using the Freeform tool. Stems have clean boundaries.

For woody stems or bark texture, add a Scribble layer masked to the stem at 30% randomization, threshold biased toward shadows. The scribble strokes add rough bark texture on top of the linear shading.

### Flower Petals

- **Wave fill** with low amplitude (Wave Height 1.5 mm, Wave Length 10–15 mm). The gentle curves suggest the soft, organic surface of petals.
- **Angle: radial** from the flower's centre. Each petal should have its fill angle pointing away from the centre, like spokes. This requires separate masked fills per petal (or per group of identically-oriented petals).
- **Interval: 2.0 mm.** Petals are light-coloured and benefit from sparse shading.
- **Dynamic Color: ON** if you want a hand-coloured style. The fills sample petal colours from the source photo, producing strokes that carry pink, white, yellow, or red tones.

### Flower Centres (Disc Florets, Stamens)

- **Circular fill** centred on the flower's disc. The concentric rings map to the radial structure of disc florets, stamens, or pistils.
- **Interval: 1.2 mm.** Tight enough to suggest the dense packing of reproductive structures.
- **Mask to the central disc** area only.

### Hairy or Rough Surfaces

Many plants have hairy stems, fuzzy leaves, or rough bark. The Scribble fill communicates these textures:

- **Interval: 1.5 mm.**
- **Randomization: 40–60%.** High enough to feel chaotic and organic.
- **Threshold: Midtones (40–180).** Avoids the deepest shadows (where the base shading already provides weight) and the brightest highlights (where hairs catch light and should appear sparse).

### Roots

- **Linear fill** at the root angle, interval 1.2 mm.
- Roots are usually shown in a lighter line weight than above-ground structures (a convention indicating below-ground location).
- Set thickness max to 0.4 mm — noticeably lighter than the stem at 0.6 mm.

---

## Symbols and Annotations

Botanical illustrations often include standardised symbols: a cut line showing where a cross-section was taken, arrows indicating diagnostic features, scale bars. The Handmade fill in Manual mode lets you draw these symbols directly:

1. Add a Handmade fill layer.
2. Set mode to Manual.
3. Draw the symbol (a line with perpendicular ticks for a scale bar, an arrow shape, a cross-section outline).
4. Position and mask as needed.

For annotation text (species name, collector, date), add this in your vector editor after export. Vexy Lines' Text fill is for artistic typographic effects, not for readable labels.

---

## Dynamic Color for Hand-Coloured Style

Traditional botanical illustrations exist in two styles: black-and-white line drawings (for scientific papers) and hand-coloured watercolour-over-line (for collectors and field guides).

Vexy Lines can approximate the hand-coloured style:

1. Build the complete line illustration in black (all the layers described above).
2. Enable **Dynamic Color** on the primary shading layers (leaves, petals, stems).
3. The strokes sample colours from the source photo — green for leaves, coloured for petals, brown for stems.
4. Set the **Segment Length** to 8–15. This creates smooth colour transitions along each stroke, mimicking watercolour wash rather than confetti.

The result is a line illustration where the shading strokes carry botanical colours — not photorealistic, but reminiscent of the hand-coloured copper-plate engravings in 18th-century botanical atlases.

For the purest scientific style, keep everything in black ink. Dynamic Color is an aesthetic choice, not a taxonomic one.

---

## Compositing Multiple Views

A single photo rarely shows everything. A complete botanical plate might need:

- **Whole plant view** (habit)
- **Flower detail** (front view, enlarged)
- **Leaf detail** (showing venation)
- **Cross-section** (stem or fruit)
- **Seed or fruit detail**

Use per-group source images to composite these:

1. Create a group for each view.
2. Assign each group its own source photo.
3. Build the fills inside each group.
4. Position and scale each group on the canvas using the group transform controls.

The final illustration shows all diagnostic views on a single plate, each driven by its own reference photo. See [Groups: Source Images and Inheritance](407-groups-advanced.md) for the technical workflow.

---

## Export for Scientific Publication

| Destination | Format | Resolution | Notes |
|-------------|--------|-----------|-------|
| Journal submission | PDF or EPS | Vector (infinite) | Journals prefer vector formats. Check submission guidelines. |
| Herbarium sheet | PDF at actual specimen size | Vector | Scale bar must be accurate at 1:1 print |
| Field guide | SVG | Vector | Publisher's designer will place it in the layout |
| Web / database | PNG at 300 DPI | Raster | Transparent background recommended |

**Line weights for reproduction:** Journal printing is typically at 300–600 DPI on matte paper. Stroke thicknesses below 0.15 mm may not reproduce. Keep minimums at 0.2 mm.

---

## Tips

**One angle per structure, not per layer.** The angle of shading communicates the orientation of the plant surface. A leaf pointing northeast gets a northeast-angled fill. A leaf pointing southeast gets a southeast-angled fill. This requires more layers but produces a taxonomically accurate illustration.

**Smoothing is your friend.** Botanical lines should look confident and deliberate. Set smoothing to 80+ on every fill. Jagged strokes look amateur.

**Less is more.** Botanical illustration is restrained. The goal is clarity, not drama. Keep intervals relatively wide, thickness relatively thin, and avoid filling every surface with dense shading. White space on a botanical plate is not wasted space — it's breathing room.

*Next: [Comics and Graphic Novels](508-comics-graphics.md)*
