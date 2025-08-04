//#let sans_font = "KoPubWorldDotum"
//#let serif_font = "KoPubWorldBatang"
#let sans_font = "Noto Sans KR"
#let serif_font = "Noto Serif KR"
#let mono_font = "JBD2"

#let template(title: "", header: "", footer: "", body) = {
  // set the document basic properties.
  set document(title: title)

  // 본문 글꼴 설정
  set text(
    font: (serif_font, "Noto Serif KR", "Noto Serif CJK KR", "Arita Buri KR"),
    weight: "regular",
    size: 0.7em,
    fill: rgb("#2e3440"),
    // stretch: 75%
  )
  // 단락 설정
  set par(spacing: 0.9em, hanging-indent: 0em, justify: true)

  set page("a4",
    flipped: true,  // 페이지를 가로로 설정
    margin: (
      left: 15mm, right: 15mm, top: 20mm, bottom:15mm),
    header: [
      #text(0.8em, font: (sans_font, "Noto Sans KR", "Noto Sans CJK KR", "Arita Dotum KR"), fill: rgb("#4c566a"))[
        Last updated: #header
        #h(1fr)
        // #place(right, dy: -10pt,
        // square(width: 20pt, stroke: 2pt + blue),)
        // #square(size: 9pt, stroke: 1pt + black, fill: white )
      ]
    ],
    // numbering: "1/1",
    // number-align: center,
    footer: [#text(0.8em, font: (sans_font, "Noto Sans KR", "Noto Sans CJK KR", "Arita Dotum KR"), fill: rgb("#4c566a"))[
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

  // 제목 설정
  set heading(numbering: none)

  // 제목 스타일 설정
  show heading: it => [
    #set align(left)
    #set text(
        font: (sans_font, "Noto Sans KR", "Noto Sans CJK KR", "Arita Dotum KR"),
        weight: "bold",
        // 제목 레벨에 따라 크기와 색상 변경
        size: if it.level == 1 {
          1.3em // 제목 1 크기
        } else if it.level == 2 {
          1.2em // 제목 2 크기
        } else if it.level == 3 {
          1.1em // 제목 3 크기 (기본 크기)
        } else {
          1.0em // 그 외 제목 크기 (기본 크기)
        },
        fill: if it.level == 1 {
        rgb("#8fbcbb") // 제목 1 색상
      } else if it.level == 2 {
        rgb("#88c0d0") // 제목 2 색상
      } else if it.level == 3 {
        rgb("#81a1c1") // 제목 3 색상
      } else {
        rgb("#5e81ac") // 그 외 제목 색상
      },
    )
    #block(it)
  ]

  // 코드 블록 스타일 설정
  show raw: set text(
    size: 1.2em, font: (mono_font),
    weight: "regular")
  show raw.where(block: false): set text(
    // size: 1.1em,
    // weight: "bold",
    fill: rgb("#bf616a")
    )

  pad(
    // Title row.
    top: -3.0em, bottom: 0em,
    align(center)[
      // #line(length: 100%, stroke: 0.5pt)
      #block(
        text(
          font: (sans_font, "Noto Sans CJK KR", "Noto Sans KR", "Arita Dotum KR"),
          // stretch: 100%,
          fill: rgb("#3b4252"),
          weight: "extrabold", size: 1.8em, title)
      )
      #line(length: 100%, stroke: 0.5pt + rgb("#3b4252"))
      #v(1em, weak: true)
    ])

  // 4컬럼 레이아웃 적용
  show: rest => columns(4, rest, gutter: 0.5cm)

  // main body
  body
}

#let bordered-table(columns: none, ..children) = {
  let data = children.pos()
  let row-count = calc.ceil(data.len() / columns)

  show table.cell.where(y: 0): strong
  set table(
    stroke: (x, y) => {
      let strokes = (:)
      // 헤더 하단과 상단 선
      if y == 0 {
        strokes.top = 0.7pt + black
        strokes.bottom = 0.7pt + black
      }
      // 테이블 하단 선
      if y == row-count - 1 {
        strokes.bottom = 0.7pt + black
      }
      strokes
    },
    align: (x, y) => (
      if x > 0 { center }
      else { left }
    ),
  )

  table(columns: columns, ..data)
}
