#import "../templates/conf.typ": *

#show: template.with(
  title: "Markdown Cheatsheet",
  header: [#datetime.today().display()],
  footer: "commonmark.org | github.github.com/gfm/",
)

= Overview

Markdown is a lightweight markup language for creating formatted text. Created by John Gruber in 2004, it has spawned many *flavors* for different platforms.

- *CommonMark*: The standardized Markdown spec (commonmark.org)
- *GFM*: GitHub Flavored Markdown — superset of CommonMark
- *Pandoc*: Extended Markdown for academic/technical writing
- *MultiMarkdown (MMD)*: Adds tables, footnotes, citations
- *Obsidian*: App-specific extensions (callouts, wiki links, embeds)

= Basic Syntax (CommonMark)

== Headings
```markdown
# H1   ## H2   ### H3   #### H4   ##### H5   ###### H6

Setext style (H1 & H2 only):
Heading 1        Heading 2
=========        ---------
```

== Text Emphasis
```markdown
*italic*   _italic_
**bold**   __bold__
***bold italic***   ___bold italic___
~~strikethrough~~             <!-- GFM -->
==highlight==                 <!-- Pandoc, Obsidian -->
^superscript^   ~subscript~  <!-- Pandoc -->
`inline code`
```

== Paragraphs & Line Breaks
```markdown
Separate paragraphs with a blank line.

Line break: two trailing spaces  
or a backslash\
at the end of a line.
```

== Blockquotes
```markdown
> Single blockquote

> Level 1
>> Nested level 2
>>> Nested level 3

> Multi-paragraph:
>
> Second paragraph inside quote.
```

== Lists
```markdown
<!-- Unordered (-, *, + all work) -->
- Item A
- Item B
  - Nested (indent 2 spaces)
    - Deeper nesting

<!-- Ordered -->
1. First
2. Second
   1. Nested ordered
3. Third

<!-- Lazy numbering -->
1. One
1. Two
1. Three

<!-- Task lists (GFM) -->
- [x] Completed
- [ ] Incomplete
```

== Code
````markdown
Inline: `code here`
Inline with nested: ``back`tick``

Fenced block:
```python
def hello():
    print("Hello!")
```

```javascript
const greet = name => `Hello, ${name}!`;
```

Indented block (4 spaces):
    print("indented code")
````

== Links & Images
```markdown
<!-- Links -->
[text](https://example.com)
[text](https://example.com "title")
[ref link][ref-id]
[ref-id]: https://example.com "optional title"
<https://autolink.com>

<!-- GFM: bare URL auto-links -->
https://github.com

<!-- Images -->
![alt text](image.png)
![alt text](image.png "title")
[![linked image](img.png)](https://example.com)
```

== Horizontal Rules & Escaping
```markdown
---   or   ***   or   ___

Escape: \*  \_  \`  \#  \[  \]  \(  \)  \\  \|
```

= GitHub Flavored Markdown (GFM)

== Tables
```markdown
| Header 1 | Header 2 | Header 3 |
|----------|:--------:|---------:|
| Left     | Center   |    Right |
| Data     | Value    |      100 |
```

== Alerts / Admonitions
```markdown
> [!NOTE]
> Highlights information users should know.

> [!TIP]
> Helpful advice for doing things better.

> [!IMPORTANT]
> Key information users need to know.

> [!WARNING]
> Urgent info that needs attention.

> [!CAUTION]
> Advises about risks or negative outcomes.
```

== GitHub-Specific References
```markdown
@username                <!-- mention a user -->
@org/team                <!-- mention a team -->
#123                     <!-- link issue/PR -->
org/repo#123             <!-- cross-repo reference -->
abc1234 (7+ chars SHA)   <!-- link to a commit -->
```

== Emoji
```markdown
:smile: :rocket: :warning: :white_check_mark:
:thumbsup: :tada: :fire: :bug: :book: :sparkles:
```

== Collapsed Sections
```markdown
<details>
<summary>Click to expand</summary>

Hidden **Markdown** content here.

</details>
```

== Footnotes (GFM extension)
```markdown
A sentence with a footnote.[^1]

[^1]: Footnote content here.

Multi-paragraph footnote:[^long]
[^long]: First paragraph.

    Second paragraph (4-space indent).
```

== Fenced Code — Useful Languages
````markdown
```diff
- removed line
+ added line
  unchanged line
```

```bash
echo "shell script"
```

```json
{ "key": "value", "num": 42 }
```

```yaml
key: value
list:
  - item1
  - item2
```

```sql
SELECT * FROM users WHERE active = true;
```
````

= Pandoc-Extended Markdown

== Math (LaTeX)
```markdown
Inline: $E = mc^2$

Display:
$$ \int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2} $$

Aligned:
$$
\begin{aligned}
  a &= b + c \\
  d &= e \times f
\end{aligned}
$$
```

== Definition Lists
```markdown
Apple
:   A fruit.

Markdown
:   A lightweight markup language.
:   Also a great formatting tool.
```

== Footnotes (Pandoc)
```markdown
Text with footnote.[^fn]
[^fn]: Footnote text.

Inline footnote^[Right here in the text.].
```

== Citations
```markdown
---
bibliography: refs.bib
csl: apa.csl
---

[@smith2020]               <!-- parenthetical -->
@smith2020                 <!-- narrative -->
[@smith2020, p. 10]        <!-- with page -->
[@a2020; @b2021]           <!-- multiple -->
[-@smith2020]              <!-- suppress author -->
```

== Divs & Spans
```markdown
::: {.classname}
Block div with class
:::

::: {#id .class key="val"}
Div with id, class, attribute
:::

[Span text]{.classname}
[Span text]{style="color:red"}
```

== Superscript & Subscript
```markdown
2^10^ = 1024      H~2~O is water
```

== Line Blocks
```markdown
| Preserved whitespace line
|   Indented line
| Normal line
```

= Obsidian-Flavored Markdown

== Wiki Links
```markdown
[[Page Name]]
[[Page Name|Display Text]]
[[Page Name#Heading]]
![[Embedded Note]]
![[image.png|300]]
```

== Callouts
```markdown
> [!note]
> Standard note.

> [!warning] Custom Title
> Warning with custom title.

> [!tip]+ Expanded by default
> Content.

> [!info]- Collapsed by default
> Hidden content.
```

== Tags
```markdown
#tag   #nested/tag   #multi_word
```

= Mermaid Diagrams

Supported on GitHub, GitLab, Obsidian, Notion, and many platforms.

````markdown
```mermaid
flowchart TD
    A[Start] --> B{Decision}
    B -->|Yes| C[Do it]
    B -->|No| D[Skip]
```

```mermaid
sequenceDiagram
    Alice->>Bob: Hello!
    Bob-->>Alice: Hi!
```

```mermaid
gantt
    title Project Plan
    dateFormat YYYY-MM-DD
    Task A :a1, 2024-01-01, 30d
    Task B :after a1, 20d
```

```mermaid
pie title Languages
    "Python" : 45
    "R" : 30
    "Other" : 25
```

```mermaid
classDiagram
    Animal <|-- Dog
    Animal : +name String
    Animal: +speak()
    Dog: +breed String
```
````

= HTML in Markdown

```markdown
<br>                       <!-- line break -->
<mark>highlighted</mark>   <!-- highlight -->
<kbd>Ctrl</kbd>+<kbd>C</kbd>  <!-- keyboard keys -->
<sup>super</sup>   <sub>sub</sub>
<small>small text</small>

<!-- Center-aligned (GitHub READMEs) -->
<div align="center">
  <img src="logo.png" width="200"/>
  <h2>Centered Heading</h2>
</div>

<!-- Collapsible -->
<details>
<summary><b>Show more</b></summary>
Hidden **Markdown** content.
</details>
```

= Compatibility Overview

#table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: (left, center, center, center, center, center),
  table.header(
    [Feature], [CM], [GFM], [Pandoc], [MMD], [Obsidian],
  ),
  [Tables],        [-], [✓], [✓], [✓], [✓],
  [Task Lists],    [-], [✓], [✓], [-], [✓],
  [Strikethrough], [-], [✓], [✓], [✓], [✓],
  [Footnotes],     [-], [✓], [✓], [✓], [✓],
  [Math],          [-], [-], [✓], [✓], [✓],
  [Alerts],        [-], [✓], [-], [-], [✓],
  [Mermaid],       [-], [✓], [-], [-], [✓],
  [Def. Lists],    [-], [-], [✓], [✓], [-],
  [Citations],     [-], [-], [✓], [✓], [-],
  [Wiki Links],    [-], [-], [-], [-], [✓],
  [Superscript],   [-], [-], [✓], [✓], [✓],
)

= Pro Tips

```markdown
<!-- Badges for GitHub READMEs -->
[![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Build](https://github.com/user/repo/actions/workflows/ci.yml/badge.svg)](...)

<!-- Manual TOC anchor links -->
## Table of Contents
- [Section 1](#section-1)
- [Sub Section](#sub-section)

<!-- Best practices -->
<!-- - Use consistent bullet style (-, *, or +) throughout -->
<!-- - Always blank line before/after headings, lists, code blocks -->
<!-- - Prefer fenced code blocks over 4-space indented -->
<!-- - Use reference-style links for long URLs -->
<!-- - Test rendering in target platform (GitHub vs Pandoc vs Obsidian) -->
```
