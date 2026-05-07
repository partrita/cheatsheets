#import "../templates/conf.typ": *

#show: template.with(
  title: "Typst Cheatsheet",
  header: [#datetime.today().display()],
  footer: "https://typst.app/docs/",
)

= Overview

Typst is a modern, fast, compiled markup language for document preparation — designed as a practical alternative to LaTeX. It features a clean syntax, built-in scripting, fast incremental compilation, and a growing package ecosystem.

== CLI
- `typst compile doc.typ`: Compile to PDF.
- `typst compile doc.typ out.pdf`: Compile to a specific output file.
- `typst watch doc.typ`: Live-recompile on save.
- `typst query doc.typ "<selector>"`: Query document metadata.
- `typst fonts`: List available fonts.
- `typst compile --font-path ./fonts doc.typ`: Use custom font directory.

= Markup Mode (Basic Syntax)

== Headings & Text
```typst
= Heading 1
== Heading 2
=== Heading 3

*bold text*         // bold
_italic text_       // italic
*_bold italic_*
`inline code`
https://typst.app   // auto-link
#link("https://typst.app")[link text]
```

== Lists
```typst
- Unordered item
- Another item
  - Nested item (indent 2 spaces)

+ Ordered item 1
+ Ordered item 2

/ Term: Definition list entry
/ Another: Second definition
```

== Quotes & Horizontal Rule
```typst
#quote[This is a block quote.]

"Smart" 'quotes' auto-converted.

---                 // horizontal rule
```

= Math Mode

Enclose math in `$` for inline, or `$ ... $` with surrounding spaces for display (block).

```typst
// Inline math
The formula is $E = m c^2$.

// Display math
$ sum_(i=1)^n i = (n(n+1)) / 2 $

// Greek and symbols
$ alpha + beta = pi $
$ integral_0^infinity e^(-x) dif x = 1 $

// Fractions
$ (a + b) / (c - d) $

// Matrices
$ mat(1, 0; 0, 1) $

// Cases
$ f(x) = cases(1 "if" x > 0, 0 "otherwise") $

// Align
$ a &= b + c \ d &= e times f $
```

= Code Mode (Scripting)

Code mode is entered with `#`. Everything inside `#{ }` is code.

== Variables & Functions
```typst
#let x = 10
#let greeting(name) = "Hello, " + name + "!"
#greeting("World")

// Content values
#let my-content = [This is *Typst* content.]
#my-content
```

== Conditionals & Loops
```typst
#if x > 5 [Greater] else [Not greater]

#for i in range(1, 4) [
  Item #i.
]

#let items = ("a", "b", "c")
#for item in items [- #item]
```

== Expressions in Markup
```typst
The result is #(2 + 3).
Today is #datetime.today().display().
```

= Set & Show Rules

== Set Rules (Global Defaults)
```typst
#set text(font: "Linux Libertine", size: 11pt, lang: "en")
#set page(paper: "a4", margin: (x: 2.5cm, y: 2cm))
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")
#set list(marker: [--])
#set math.equation(numbering: "(1)")
```

== Show Rules (Element Transforms)
```typst
// Style all headings
#show heading: it => text(blue, it)

// Make all links blue and underlined
#show link: it => underline(text(blue, it))

// Custom heading style
#show heading.where(level: 1): it => block(
  fill: blue,
  inset: 8pt,
  text(white, it)
)

// Raw code block styling
#show raw.where(block: true): it => block(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt,
  it
)
```

= Page Layout

```typst
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2.5cm),
  header: [
    #set align(right)
    My Document — #datetime.today().display()
  ],
  footer: [
    #set align(center)
    Page #counter(page).display("1 of 1", both: true)
  ],
  columns: 2,        // two-column layout
)
```

= Figures & Images

```typst
// Basic image
#image("photo.png", width: 60%)

// Figure with caption and label
#figure(
  image("chart.png", width: 80%),
  caption: [Monthly sales figures.],
) <fig-sales>

// Reference the figure
As shown in @fig-sales, sales increased.

// Side-by-side figures
#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  figure(image("a.png"), caption: [Left]),
  figure(image("b.png"), caption: [Right]),
)
```

= Tables

```typst
#table(
  columns: (1fr, auto, auto),
  align: (left, center, right),
  inset: 8pt,
  stroke: 0.5pt,
  fill: (col, row) => if row == 0 { luma(200) } else { white },
  table.header([Name], [Score], [Grade]),
  [Alice], [95], [A],
  [Bob],   [82], [B],
  [Carol], [78], [C+],
)
```

= Text & Styling Functions

```typst
#text(size: 14pt, weight: "bold", fill: red)[Large bold red text]
#text(font: "Fira Code", style: "italic")[Code font italic]
#smallcaps[Small Capitals]
#upper("make this uppercase")
#lower("MAKE THIS LOWERCASE")
#highlight(fill: yellow)[highlighted text]
#underline[underlined]
#strike[strikethrough]
#overline[overline]
#sub[subscript]    #super[superscript]
```

= Layout Functions

```typst
// Alignment
#align(center)[Centered content]
#align(right)[Right-aligned]

// Box (inline block)
#box(width: 3cm, height: 1cm, fill: blue, radius: 4pt)[]

// Block (block-level)
#block(width: 100%, inset: 10pt, fill: luma(240))[Content]

// Columns
#columns(2, gutter: 10pt)[
  First column text...
  #colbreak()
  Second column text...
]

// Grid layout
#grid(
  columns: (1fr, 2fr),
  rows: (auto, auto),
  gutter: 5pt,
  [Cell 1], [Cell 2],
  [Cell 3], [Cell 4],
)

// Stack
#stack(dir: ltr, spacing: 10pt,
  rect(width: 2cm, height: 1cm, fill: red),
  rect(width: 2cm, height: 1cm, fill: blue),
)
```

= Cross-References & Labels

```typst
== Introduction <sec-intro>

See @sec-intro for background.

#figure(image("plot.png"), caption: [Data]) <fig-data>
@fig-data shows the results.

$ E = mc^2 $ <eq-energy>
Equation @eq-energy is famous.
```

= Bibliography & Citations

```typst
// In document
#bibliography("references.bib")

// Cite with @
@smith2020 found that...
See also @jones2021.
```

= Variables, Types & Data

```typst
#let name = "Typst"                 // string
#let count = 42                     // integer
#let ratio = 3.14                   // float
#let flag = true                    // boolean
#let color = rgb(255, 100, 0)       // color
#let sizes = (10pt, 20pt, 30pt)     // array
#let info = (name: "A", age: 5)     // dictionary
#let nothing = none                 // none

// Array operations
#let arr = (1, 2, 3, 4, 5)
#arr.len()           // 5
#arr.first()         // 1
#arr.last()          // 5
#arr.slice(1, 3)     // (2, 3)
#arr.map(x => x * 2)
#arr.filter(x => x > 2)

// String operations
#"hello".len()
#"hello world".split(" ")
#"HELLO".lower()
```

= Packages

Typst has a built-in package registry. Import community packages:

```typst
// From the Typst package registry
#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/tablex:0.0.8": tablex, colspanx

// From a local file
#import "utils.typ": my-function, my-variable

// Use imported items
#canvas({
  draw.line((0,0), (1,1))
})
```

Popular packages:
- `@preview/cetz`: Drawing and diagrams
- `@preview/tablex`: Advanced tables
- `@preview/showybox`: Colored callout boxes
- `@preview/codly`: Fancy code blocks

= Pro Tips

== Useful Patterns
```typst
// Page counter
#counter(page).display("1 / 1", both: true)

// Outline (TOC)
#outline(depth: 3, indent: 1em)

// Line / Divider
#line(length: 100%, stroke: 0.5pt + gray)

// Invisible space
#h(1fr)    // horizontal fill
#v(1cm)    // vertical space
```

== Custom Template Structure
```typst
// conf.typ (template file)
#let template(title: "", body) = {
  set document(title: title)
  set page(paper: "a4")
  set text(font: "New Computer Modern", size: 11pt)

  // Title block
  align(center)[
    #text(20pt, weight: "bold")[#title]
  ]
  v(2em)
  body
}

// main.typ (document file)
#import "conf.typ": template
#show: template.with(title: "My Document")

= Introduction
Content here...
```
