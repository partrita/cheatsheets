#let template(title: "", header: "", footer: "", body) = {
  // set the document basic properties.
  set document(title: title)
  set text(
    font: "Noto Sans KR",
    weight: "light",
    size: 8pt,
    // stretch: 75%
  )
  set page("a4",
    flipped: true,  // 페이지를 가로로 설정
    margin: (
      left: 15mm, right: 15mm, top: 20mm, bottom:15mm),
    header: [
      #text(1em)[
        #header
        #h(1fr)
        // #place(right, dy: -10pt,
        // square(width: 20pt, stroke: 2pt + blue),)
        // #square(size: 9pt, stroke: 1pt + black, fill: white )
      ]
    ],
    // numbering: "1/1",
    // number-align: center,
    footer: [#text(1em)[
      #footer
      #h(1fr)
      #context(counter(page).display(
        "1/1",
        both: true,)
      )
      // #counter(page).display(
      //   "1/1",
      //   both: true,)
    ]]
  )

  // 단락 설정
  set par(spacing: 0.9em, hanging-indent: 0em, justify: false)

  // 제목 설정
  set heading(numbering: "1.1.")

  // 제목 스타일 설정
  show heading: it => [
    #set align(left)
    #set text(1.0em, weight: "bold")
    #block(it)
  ]

  // 코드 블록 스타일 설정
  show raw: set text(
    size: 1.0em, font: "JBD2",
    weight: "regular")
  show raw.where(block: false): set text(fill: navy)

  pad(
    // Title row.
    top: -3.0em, bottom: 0em,
    align(center)[
      // #line(length: 100%, stroke: 0.5pt)
      #block(
        text(
          font: "Noto Sans KR",
          // stretch: 100%,
          weight: "bold", size: 1.8em, title)
      )
      #line(length: 100%, stroke: 0.5pt)
      #v(1em, weak: true)
    ])

  // 4컬럼 레이아웃 적용
  show: rest => columns(4, rest, gutter: 0.5em)

  // main body
  body
}
