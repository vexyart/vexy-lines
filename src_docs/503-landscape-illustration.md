# Landscape and Nature

Landscapes are the opposite of portraits. A portrait has one subject with a clear boundary. A landscape has no single subject — it's a composition of spatial zones stacked from foreground to horizon, each demanding a different density, a different texture, and a different fill strategy. The challenge isn't rendering a face. It's rendering *depth*.

The secret weapon: atmospheric perspective. Distant objects look lighter, softer, less detailed. Close objects look darker, sharper, more textured. In traditional painting, artists achieve this by thinning paint and softening brushwork in the background. In Vexy Lines, you achieve it by widening intervals and softening parameters for distant zones and tightening everything for the foreground.

---

## Photo Selection

A good landscape source photo has:

- **Clear depth layers.** A foreground (rocks, flowers, a fence), a midground (fields, buildings, trees), and a background (mountains, sky, distant horizon). The more distinct these zones, the easier to mask and assign fills.
- **Tonal separation between zones.** If the foreground and background are the same brightness, your fills will look identical. A darker foreground against a lighter sky provides natural contrast.
- **Interesting textures.** A flat, featureless sky above a flat, featureless field gives the fills nothing to work with. Clouds, tree canopies, rocky terrain, flowing water — these produce the brightness variations that fills interpret.

---

## Layer Strategy: The Depth Stack

| Layer | Zone | Fill | Interval | Angle | Special | Threshold |
|-------|------|------|----------|-------|---------|-----------|
| 1 (bottom) | Sky | Wave | 5.0 mm | 0° | Wave Height 4 mm, Wave Length 20 mm | Highlights (150–255) |
| 2 | Distant mountains | Linear | 3.0 mm | 5° | Randomization 8% | Full range, low contrast |
| 3 | Midground hills/trees | Fractal | 2.0 mm | — | — | Full range |
| 4 | Midground detail | Linear | 1.5 mm | 25° | Dynamic Color ON | Midtones (50–200) |
| 5 | Foreground | Linear | 0.8 mm | 45° | Thickness: Thick | Shadows (0–140) |
| 6 | Foreground texture | Scribble | 1.2 mm | — | Randomization 50% | Midtones (40–180) |
| 7 (top) | Outlines | Trace | — | — | Smoothing 80, Spot Size 4 px | Full range |

---

## Building It

### Step 1: Mask the Zones

Before adding any fills, plan your masks. Look at the source photo and identify:

- **Sky boundary.** Where does the sky meet the mountains or treeline? This is usually the sharpest horizontal boundary.
- **Background/midground boundary.** Where do the distant hills give way to closer terrain? Often subtle — use auto-detection and refine.
- **Midground/foreground boundary.** Where does the closest zone begin? A road, a fence, a change in texture.

Rough out the masks using auto-detection and the Freeform tool. You'll refine them after seeing how the fills interact.

### Step 2: Sky (Layer 1)

**Wave fill** at a wide interval. The flowing curves suggest clouds and atmospheric movement without being literal. Set the wave height to 4 mm and wave length to 20 mm — long, gentle undulations.

The 0° angle keeps the waves horizontal, echoing the horizon. Threshold set to highlights means the fill only renders in the brightest parts of the sky, leaving darker cloud areas for the outline layer above.

Mask to the sky zone.

### Step 3: Distant Mountains (Layer 2)

**Linear fill** at 3.0 mm interval, nearly horizontal (5° angle). The wide spacing and minimal angle suggest distance — these strokes are deliberately sparse and subtle. Set randomization to 8% to soften the mechanical precision slightly.

Keep the thickness max low (0.4 mm) and the thickness mode to Linear. The distant mountains should be the lightest, most understated element in the composition.

Mask to the mountain/background zone.

### Step 4: Midground Foliage (Layer 3)

**Fractal fill** at 2.0 mm interval. The space-filling Peano curves create organic complexity that mimics foliage, canopy texture, and the irregular patterns of natural landscapes. The fractal patterns read as "detailed but natural" — perfect for tree-covered hills.

Mask to the midground vegetation areas.

### Step 5: Midground Structure (Layer 4)

**Linear fill** at 1.5 mm interval, 25° angle. This adds directional shading to the midground — buildings, paths, fields, anything with linear structure. Enable **Dynamic Color** so the strokes sample greens from foliage, browns from earth, blues from water.

Threshold set to midtones (50–200) to avoid over-darkening shadows or adding noise to highlights.

Mask to the midground area, overlapping with Layer 3 where desired. The Linear shading and Fractal texture combine to create a rich midground.

### Step 6: Foreground (Layers 5 and 6)

Two fills for the foreground:

**Layer 5: Linear** at a tight 0.8 mm interval, 45° angle, Thick thickness mode. This is the densest fill in the composition — the foreground is close, detailed, and high-contrast. The 45° angle creates bold diagonal shading that immediately reads as "near."

**Layer 6: Scribble** at 1.2 mm interval, 50% randomization. The chaotic strokes add texture to the foreground — grass, gravel, bark, rock faces. The Scribble layer sits above the Linear layer, so its strokes overlay the structured shading.

Mask both to the foreground zone.

### Step 7: Outlines (Layer 7)

**Trace fill** on top, full canvas, no mask. Smoothing at 80 for clean curves. Min spot size at 4 px to skip tiny noise contours — landscapes have a lot of fine texture that Trace can over-detect.

The outlines tie every zone together and provide edge definition where fills from adjacent zones meet.

---

## Water

Water is a landscape's trickiest element. It's reflective, it moves, and it occupies a horizontal plane that intersects the depth stack.

### Still Water (Lakes, Ponds)

- **Wave fill** masked to the water area: Wave Height 1.5 mm, Wave Length 25 mm, angle 0° (horizontal).
- **Second Wave fill** (clone or duplicate): same parameters but Phase Shift offset by 50% of the wave length. Reduce opacity to 60%.
- The two overlapping wave patterns create a moiré-like shimmer that reads as a reflective surface.
- Enable **Dynamic Color** on both to sample the colours reflected in the water.

### Moving Water (Rivers, Streams)

- **Wave fill**: Wave Height 3 mm, Wave Length 10 mm, angle following the water flow direction (often diagonal — 20° to 40°).
- Tighter wave length and higher amplitude create a more energetic, turbulent feel.
- Add a **Scribble fill** at low interval (1.0 mm) masked to rapids or white-water areas.

### Waterfalls

- **Linear fill** at 90° (vertical): tight interval (0.6 mm), shadow-biased threshold. The vertical lines read as falling water.
- Add a **Scribble fill** at the base where the water impacts, masked to the spray area.

---

## Atmospheric Perspective: The Numbers

The core technique summarised as a gradient of parameters:

| Zone | Distance | Interval | Max Thickness | Randomization | Visual Density |
|------|----------|----------|--------------|---------------|----------------|
| Sky | Farthest | 5.0 mm | 0.3 mm | 5% | Very light |
| Background | Far | 3.0 mm | 0.4 mm | 8% | Light |
| Midground | Medium | 1.5–2.0 mm | 0.6–0.8 mm | 15% | Medium |
| Foreground | Near | 0.8–1.2 mm | 1.0–1.2 mm | 30–50% | Dense |

The pattern: **everything gets tighter, thicker, and more randomised as it moves toward the viewer.** This gradient across the layer stack creates the depth illusion. Your eyes have been trained by a lifetime of real atmospheric perspective to read sparse-and-subtle as "far" and dense-and-bold as "near."

---

## Threshold Stacking

When two fills share a spatial zone (e.g., Layers 3 and 4 in the midground), avoid giving them the same threshold range. Instead:

- Layer 3 (Fractal): Full range but with Thin thickness mode — it renders everywhere but lightly.
- Layer 4 (Linear): Midtones only (50–200) — it skips the extremes.

This way, the Fractal fill handles the highlights and shadows while the Linear fill handles the midtones. They divide the tonal responsibility rather than competing.

---

## Seasonal Variations

| Season | Key Changes |
|--------|------------|
| **Summer** | Dense midground (Fractal + Scribble for lush foliage). Dynamic Color ON for greens. Sky: Wave with wide gentle curves. |
| **Autumn** | Dynamic Color ON everywhere to capture warm tones. Increase randomization (+10% on all layers) for organic decay. |
| **Winter** | Reduce midground density (widen intervals by 30%). Foreground: Linear at 0° (horizontal) for snow-covered ground. Sky: increase threshold to highlight-only for overcast whiteness. |
| **Night** | Invert thresholds on all layers: highlights become dense, shadows become sparse. Dark background, bright stars rendered by tight Halftone dots. |

---

## Export

- **SVG** for editorial illustration — scalable to any print size.
- **PDF** for framed prints — set canvas to the frame dimensions before export.
- **PNG at 300 DPI** for web galleries.

Landscapes often look best printed large (A3 or bigger) where the density gradient between foreground and background is visible at natural viewing distance. See [Preparing Files for Print](511-print-preparation.md) for large-format guidance.

*Next: [Preparing for Screen Printing](504-screen-printing.md)*
