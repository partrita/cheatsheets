#import "./templates/icons.typ": iconUnicode
#import "./templates/conf.typ": *

#show: template.with(
  title: "나만의 치트 시트",
  header: [#datetime.today().display()],
  footer: "https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html",
)

// 여기에 문서 내용을 작성하세요

#iconUnicode("\u{f0c1}", size: 14pt, color: blue) // 링크 아이콘
#iconUnicode("\u{f0e0}", size: 14pt, color: blue) // 이메일 아이콘
#iconUnicode("\u{f095}", size: 14pt, color: blue) // 전화 아이콘
#iconUnicode("\u{f0c0}", size: 14pt, color: blue) // 주소 아이콘
#iconUnicode("\u{f0c2}", size: 14pt, color: blue) // 위치 아이콘
#iconUnicode("\u{f0c3}", size: 14pt, color: blue) // 지도 아이콘
#iconUnicode("\u{f0c4}", size: 14pt, color: blue) // 시간 아이콘

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

= 섹션 2: 블록 요소

#text(12pt, weight: "bold")[코드 블록]
```typst
#let x = 10
#x + 5 // 15
```

// #text(12pt, weight: "bold")[인용 블록]
// #quote[
// "Typst는 강력하고 사용하기 쉬운 조판 시스템입니다."
// ]

#text(12pt, weight: "bold")[수식]
$ x^2 + y^2 = z^2 $

#text(12pt, weight: "bold")[테이블]
#table(
columns: 2,
align:(center, right),
[헤더 1], [헤더 2],
[데이터 1], [100],
[데이터 2], [200],
)

= 섹션 3: 이미지 및 도형

#text(12pt, weight: "bold")[이미지 삽입]
#figure(
  image("./images/Scikit_learn_logo.png", width: 50%),
  caption: [
    Scikit learn 로고
  ],
)<logo>

logo as the one shown in @logo will cease to exist if
we don't take action!

// #text(12pt, weight: "bold")[사각형]
// #rect(width: 3cm, height: 1cm, fill: blue, radius: 4pt)

// #text(12pt, weight: "bold")[원]
// #circle(radius: 0.5cm, fill: red)

#text(12pt, weight: "bold")[선]
#line(length: 100%, stroke: 0.5pt + rgb("#2e3440"))

= 섹션 4: 고급 기능(예시)

#text(12pt, weight: "bold")[변수 정의]
#let my-variable = "Hello, Typst!"
#let amazed(term, color: blue) = {
  text(color, box[✨ #term ✨])
}
#my-variable
You are #amazed[beautiful]!
I am #amazed(color: purple)[amazed]!

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

= 섹션 5: 글꼴 변경 예시

#text(font: "KoPubWorldBatang")[
  = 배경
  빙하의 경우, 유체 역학 원리로 얼음의 움직임과 온도, 압력, 그리고 물과 같은 다른 유체의 요인으로 이해할 수 있습니다.
]

= 섹션 6: Typst 문법 안내서

Typst는 마크업 언어입니다. 즉, 간단한 문법을 사용하여 문서 스타일을 쉽고 자동으로 지정할 수 있습니다.

== 모드

Typst에는 세 가지 문법 모드가 있습니다: 마크업, 수학, 코드.

+ 마크업
  - 마크업 모드는 Typst 문서의 기본 모드입니다.
  - 마크업을 `[[..]]`로 감쌉니다.	`{let name = [*Typst!*]}`
+ 수학
  - 수학 모드에서는 수학 공식을 작성할 수 있습니다.
  - 수식을 `[$..$]`로 감쌉니다.	`[$-x$는 $x$의 반대입니다.]`
+ 코드
  - 코드 모드에서는 Typst의 스크립팅 기능을 사용할 수 있습니다.
  -	코드 앞에 `#`를 붙입니다.	`[Number: #(1 + 2)]`
  - `#`를 사용하여 코드 모드에 진입한 후에는 중간에 마크업 또는 수학 모드로 다시 전환하지 않는 한 추가 해시를 사용할 필요가 없습니다.

=== 마크업

Typst는 가장 일반적인 문서 요소에 대한 내장 마크업을 제공합니다. 대부분의 문법 요소는 해당 함수에 대한 단순한 단축키입니다. 아래 표는 사용 가능한 모든 마크업을 나열하고 해당 문법 및 사용법에 대해 자세히 알아볼 수 있는 가장 좋은 위치에 연결됩니다.

+ 단락 구분: 빈 줄
+ 강한 강조: `[*강조*]`
+ 원시 텍스트: ```[`print(1)`]```
+ 링크: `[https://typst.app/]`
+ 강조: `[_강조_]`
+ 레이블: `[<intro>]`
+ 참조: `[@intro]`
+ 제목: `[= 제목]`
+ 글머리 기호 목록: `[- 항목]`
+ 번호 매기기 목록: `[+ 항목]`
+ 용어 목록: `[/ 용어: 설명]`
+ 수학: `[$x^2$]`
+ 줄 바꿈: `[\]`
+ 스마트 인용 부호: `['홑따옴표' 또는 "겹따옴표"]`
+ 기호 약어: `[~]`, `[---]`
+ 코드 표현식: `[#rect(width: 1cm)]`
+ 문자 이스케이프: `[Tweet at us \#ad]`
+ 주석: `[/* 블록 */]`, `[// 줄]`

=== 코드 모드

코드 블록과 표현식 내에서는 선행 `#` 문자 없이 시작할 수 있습니다. 많은 문법 요소는 표현식에 특화되어 있습니다.

+ 없음(None): `{none}`
+ 자동(Auto): `{auto}`
+ 부울(Boolean): `{false}`, `{true}`
+ 정수(Integer): `{10}`, `{0xff}`
+ 부동 소수점 숫자(Floating-point number): `{3.14}`, `{1e5}`
+ 길이(Length): `{2pt}`, `{3mm}`, `{1em}`, ..
+ 각도(Angle): `{90deg}`, `{1rad}`
+ 분수(Fraction): `{2fr}`
+ 비율(Ratio): `{50%}`
+ 문자열(String): `{"hello"}`
+ 레이블(Label): `{<intro>}`

=== 이스케이프

이스케이프는 입력하기 어렵거나 Typst에서 특별한 의미를 갖는 특수 문자를 삽입하는 데 사용됩니다. 문자를 이스케이프하려면 백슬래시 앞에 붙입니다. 모든 유니코드 코드포인트를 삽입하려면 16진수 이스케이프 시퀀스: `[\u{1f600}]`를 작성할 수 있습니다.
z
