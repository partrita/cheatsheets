// 문서 설정: A4 용지, 가로 방향
#set page(
  paper: "a4",
  orientation: "landscape",
  margin: 1cm, // 페이지 여백 설정
)

// 글꼴 설정 (선택 사항, 시스템에 설치된 글꼴 사용)
#set text(font: "KoPubWorldDotum", size: 10pt)

// 열 설정: 4개의 열, 열 간 간격 0.8cm
#set columns(4, gutter: 0.8cm)

// 치트 시트 내용 시작

// 제목
#align(center)[
  #text(20pt, weight: "bold")[나만의 치트 시트]
  #v(0.5em) // 세로 간격
]

// 각 열의 내용
= 섹션 1: 기본 문법

#text(12pt, weight: "bold")[제목]
- `= 제목 1`
- `== 제목 2`
- `=== 제목 3`

#text(12pt, weight: "bold")[텍스트 서식]
- `*굵게*` -> *굵게*
- `_기울임_` -> _기울임_
- `` `코드` `` -> `코드`
- `~취소선~` -> ~취소선~

#text(12pt, weight: "bold")[목록]
- 항목 1
  - 하위 항목
- 항목 2

#text(12pt, weight: "bold")[정렬]
- `#align(left)[왼쪽]`
- `#align(center)[가운데]`
- `#align(right)[오른쪽]`

#pagebreak() // 다음 열로 이동 (선택 사항, 내용이 많을 경우 자동으로 넘어감)

= 섹션 2: 블록 요소

#text(12pt, weight: "bold")[코드 블록]
```typst
#let x = 10
#x + 5 // 15

#text(12pt, weight: "bold")[인용 블록]
#quote[
    "Typst는 강력하고 사용하기 쉬운 조판 시스템입니다."
]

#text(12pt, weight: "bold")[수식]
$ x^2 + y^2 = z^2 $

#text(12pt, weight: "bold")[테이블]
#table(
columns: 2,
align: (center, right),
[헤더 1], [헤더 2],
[데이터 1], [100],
[데이터 2], [200],
)

#pagebreak()

= 섹션 3: 이미지 및 도형

#text(12pt, weight: "bold")[이미지 삽입]
// 로컬 이미지 경로 (예: ./images/my_image.png)
// #image("path/to/your/image.png", width: 50%)

#text(12pt, weight: "bold")[사각형]
#rect(width: 3cm, height: 1cm, fill: blue, radius: 4pt)

#text(12pt, weight: "bold")[원]
#circle(radius: 0.5cm, fill: red)

#text(12pt, weight: "bold")[선]
#line(length: 4cm, stroke: 2pt + green)

#pagebreak()

= 섹션 4: 고급 기능 (예시)

#text(12pt, weight: "bold")[변수 정의]
#let my-variable = "Hello, Typst!"
#my-variable

#text(12pt, weight: "bold")[함수 정의]

#let greet(name) = {
  "안녕하세요, " + name + "님!"
}
#greet("사용자")

#text(12pt, weight: "bold")[조건문]

#let show-text = true
#if show-text {
  "이 텍스트는 보입니다."
} else {
  "이 텍스트는 보이지 않습니다."
}

#text(12pt, weight: "bold")[반복문]

#for i in range(3) {
  "반복 " + str(i) + "\n"
}
