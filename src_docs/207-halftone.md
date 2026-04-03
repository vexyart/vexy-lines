# Halftone: Dots and Shapes

Every newspaper photograph you have ever seen is a lie told in dots. Thousands of tiny circles --- large in the shadows, microscopic in the highlights --- arranged in a grid so precise that your brain merges them into continuous tone. Halftone fill recreates this mechanical printing process as vector art, then goes far beyond it. Swap circles for squares, diamonds, stars, or any SVG shape you import. Switch from grid to random scatter for pointillism. Enable morphing so shapes transform as brightness changes --- tiny circles in the highlights, fat stars in the shadows. What took a printing press and a screen, Vexy Lines does with parameters.

---

## What It Looks Like

A regular grid (or random scatter) of shapes covers your canvas. Each shape's size is determined by the brightness of the pixel beneath it. Dark areas produce large shapes that nearly touch or overlap. Light areas produce small shapes surrounded by white space. Mid-tones produce medium shapes at medium spacing.

In Grid mode, the shapes sit at exact intersections of an invisible lattice, producing the mechanical precision of halftone printing. In Random mode, the shapes scatter organically, producing a stippled or pointillist effect that feels hand-placed.

The default shape is a circle, which matches traditional newspaper halftone. But circles are just the beginning.

---

## When to Use Halftone

- **Newspaper and press aesthetics:** Grid mode, circles, monochrome. Instant 1960s news photograph.
- **Pop art and Lichtenstein-style illustration:** Large circles, bold primary colours, strong outlines via [Trace](208-trace.md).
- **Pointillism:** Random mode, small circles, Dynamic Color enabled. Seurat in vectors.
- **Stippling and etching:** Random mode, very small circles, high density. Builds up tone through pure dot accumulation.
- **Themed and novelty artwork:** Import custom SVG shapes --- hearts, stars, skulls, logos --- and paint your image with them.
- **Screen-print preparation:** Each colour gets its own Halftone fill at a different angle, preventing moiré in multi-colour printing.

---

## Parameter Reference

| Parameter | What It Does | Recommended Starting Values |
|-----------|-------------|-----------------------------|
| **Grid / Random** | Distribution mode. Grid arranges shapes on a regular lattice. Random scatters them freely. | Grid for halftone printing aesthetics. Random for stippling and pointillism. |
| **Interval** | Spacing between shape centers, in mm. Controls overall density. | 1 mm for fine detail. 3 mm for visible dots. 6--10 mm for bold graphic dots. |
| **Angle** | Rotation of the grid pattern. | 0° default. 15° for subtle dynamism. 45° for diamond grid orientation. Vary between colour separations to avoid moiré. |
| **Shape** | The geometric form used for each dot. Built-in options: circle, square, diamond, star. Custom SVG shapes can be imported. | Circle for traditional halftone. Square for digital/pixel aesthetics. Star for whimsy. Custom SVG for anything else. |
| **Morphing** | When enabled, shapes transform based on brightness. The shape at 100% brightness differs from the shape at 0% brightness, with smooth interpolation between. | Off for uniform shapes at varying sizes. On for shapes that evolve from one form to another across the tonal range. |
| **Image Threshold** | Histogram handles controlling which brightness range produces shapes. | Full range for complete tonal reproduction. Narrow to target shadows or highlights only. |
| **Stroke Thickness** | Controls the outline weight of each shape. | Thin outlines for delicate stippling. Thick for bold Ben-Day dots. |
| **Dynamic Color** | Each shape samples the colour of the source pixel beneath it. | Off for monochrome. On for full-colour pointillism or pop art. |
| **Randomization** | In Grid mode, adds positional jitter. In Random mode, controls scatter variance. | 0% for precise grid. 5--10% for slight organic irregularity. |
| **Smoothing** | Controls how smoothly size transitions between adjacent shapes. | Low for sharp size contrasts. High for gradual size gradients. |

---

## Step-by-Step: Three Styles from One Photograph

This walkthrough demonstrates three distinct Halftone treatments of the same source image, showcasing the fill's range.

### Style 1: Classic Newspaper (Grid + Circles)

#### 1. Open your image

File > New, drag in a black-and-white portrait. High-contrast images with clear facial features work best.

#### 2. Add a Halftone fill

Click **+** in the Layers Panel. Select **Halftone**.

#### 3. Configure for newspaper

- **Mode:** Grid.
- **Shape:** Circle.
- **Interval:** 2 mm. Visible dots that read as individual circles at arm's length.
- **Angle:** 15°. The traditional halftone screen angle for single-colour printing.
- **Morphing:** Off.
- **Dynamic Color:** Off. Set a static black colour.

#### 4. Evaluate

Zoom out. The portrait should be clearly recognisable as dots of varying size on a white field. Dark areas (hair, pupils, shadows) have large circles that nearly touch. Light areas (forehead, highlights) have tiny dots with generous white space.

### Style 2: Pointillism (Random + Circles + Dynamic Color)

#### 5. Duplicate or create a new fill

Hide the newspaper fill. Add a fresh Halftone fill.

#### 6. Configure for pointillism

- **Mode:** Random.
- **Shape:** Circle.
- **Interval:** 1.2 mm. Dense enough to build up continuous tone through accumulated dots.
- **Angle:** N/A (Random mode ignores angle).
- **Morphing:** Off.
- **Dynamic Color:** On, segment length N/A (each dot samples one pixel). Each dot takes the colour of the source pixel beneath its center.

#### 7. Evaluate

The image now resembles a Seurat painting: thousands of coloured dots that merge into a representational image at distance but dissolve into pointillist texture up close. Zoom in: individual dots of skin tone, hair colour, background hue, each placed randomly but sized by brightness.

### Style 3: Custom SVG Hearts

#### 8. Create or obtain a heart SVG

Draw a simple heart shape in any vector editor, or use one from a free icon library. Save as a single-path SVG file.

#### 9. Add a new Halftone fill

Hide the previous fills. Add a fresh Halftone fill.

#### 10. Configure for hearts

- **Mode:** Grid.
- **Shape:** Import your heart SVG via the shape selector.
- **Interval:** 4 mm. Large enough to see each heart clearly.
- **Angle:** 0°.
- **Morphing:** On. Tiny hearts in the light areas. Large hearts in the dark areas. The shape grows with the shadow.
- **Dynamic Color:** On. Each heart takes the source colour. Red-tinted flesh tones, dark hair tones.

#### 11. Evaluate

A portrait made entirely of hearts, each sized and coloured by the pixel beneath it. Kitsch or charming, depending on your audience.

---

## Creative Variations

### Lichtenstein Pop Art

Big, bold, graphic. Start with a high-contrast, saturated colour photograph (or increase contrast manually).

- **Mode:** Grid.
- **Shape:** Circle.
- **Interval:** 4--6 mm. Dots large enough to be individually obvious.
- **Angle:** 15°.
- **Morphing:** Off.
- **Dynamic Color:** On.
- **Stroke Thickness:** Bold outlines.

Layer with a [Trace](208-trace.md) fill to add thick black outlines around major shapes. The combination of dot-filled areas and clean vector outlines produces the classic pop-art comic book look. Use bold, saturated source images --- primary colours work best.

### Graded Morphing

Enable Morphing with contrasting shapes:

- Light areas: small circles.
- Dark areas: large stars (or squares, or custom shapes).

The image now transitions not just in dot size but in dot *shape* across its tonal range. Highlights are delicate circular dots. Shadows are aggressive angular stars. The transition happens smoothly across mid-tones. The effect is subtle from a distance but striking up close.

### Stipple Etching

Maximum density, minimum dot size, monochrome.

- **Mode:** Random.
- **Shape:** Circle.
- **Interval:** 0.5 mm.
- **Morphing:** Off.
- **Dynamic Color:** Off. Static black.

The result resembles hand-stippled illustration: thousands of tiny dots building up tone through sheer accumulation. Shadows become dense constellations. Highlights become sparse scatter. The organic randomness of Random mode prevents the mechanical grid artifact, making the result look hand-placed. Export at high resolution --- the detail rewards close inspection.

### Multi-Angle Colour Separation

For screen printing or risograph, each colour plate needs a different screen angle to prevent moiré patterns:

- Cyan: Halftone fill, Grid, circle, Angle 15°, colour cyan.
- Magenta: Halftone fill, Grid, circle, Angle 75°, colour magenta.
- Yellow: Halftone fill, Grid, circle, Angle 0°, colour yellow.
- Black: Halftone fill, Grid, circle, Angle 45°, colour black.

Each fill reads the source image and produces dots sized by that colour channel's contribution. The four angled grids overlay without moiré because the angle offsets prevent dot alignment. Export each fill as a separate layer or file for plate-making.

### Density Gradient Background

Use Halftone as a background texture behind a subject rendered with a different fill type:

- Halftone fill: Grid, circle, Interval 3 mm, threshold narrowed to highlights only, light grey colour.
- Subject fill: [Linear](202-linear.md) or [Trace](208-trace.md), masked to the subject area.

The halftone dots fade in only where the image is light (typically the background), providing subtle texture without competing with the subject.

---

## Tips

- **Grid angle matters for multi-colour work.** If you stack multiple Halftone fills for colour separation, use the traditional screen angles (0°, 15°, 45°, 75°) to minimise moiré. These angles are not arbitrary --- they are the result of decades of print industry experience.
- **Random mode is better for artistic work; Grid mode is better for technical reproduction.** Grid produces precise, predictable results suitable for print production. Random produces organic, artistic results suitable for illustration and fine art.
- **Morphing creates visual surprise.** The transition from one shape to another across the tonal range adds a layer of visual interest that simple size variation cannot match. Experiment with unexpected shape pairs: circles morphing into triangles, squares morphing into stars.
- **Custom SVG shapes must be simple.** Complex multi-path SVGs will not import cleanly as halftone shapes. Use a single closed path. Keep the design recognisable at small sizes --- the shapes in highlight areas are tiny.
- **Halftone + Trace = comic book.** This combination is so effective it deserves its own recipe. See [Combining Fills](214-combining-fills.md) for the full technique.
- **Interval determines viewing distance.** Tight interval (0.5--1 mm): dots merge at arm's length, creating photographic tone. Medium interval (2--4 mm): dots are visible, creating obvious halftone pattern. Wide interval (6+ mm): each dot is a deliberate graphic element. Choose based on how you want the viewer to experience the piece.

---

*Previous: [Radial: Exploding Rays](206-radial.md) | Next: [Trace: Finding Edges](208-trace.md)*
