#import "./templates/icons.typ": iconUnicode
#import "./templates/conf.typ": *

#show: template.with(
  title: "Typst 문법 치트시트",
  header: [#datetime.today().display()],
  footer: "https://typst.app/docs/",
)

#iconUnicode("\u{f0c1}", size: 14pt, color: blue) // 링크
#iconUnicode("\u{f0e0}", size: 14pt, color: blue) // 이메일
#iconUnicode("\u{f095}", size: 14pt, color: blue) // 전화
#iconUnicode("\u{f0c0}", size: 14pt, color: blue) // 주소
#iconUnicode("\u{f0c2}", size: 14pt, color: blue) // 위치
#iconUnicode("\u{f0c3}", size: 14pt, color: blue) // 지도
#iconUnicode("\u{f0c4}", size: 14pt, color: blue) // 시간

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

#text(12pt, weight: "bold")[인용 블록]
#quote[
"Typst는 강력하고 사용하기 쉬운 조판 시스템입니다."
]

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

#text(12pt, weight: "bold")[고급 테이블]

#bordered-table(
  columns: 3,
  table.header(
    [Substance],
    [Subcritical °C],
    [Supercritical °C],
  ),
  [Hydrochloric Acid],
  [12.0], [92.1],
  [Sodium Myreth Sulfate],
  [16.6], [104],
  [Potassium Hydroxide],
  table.cell(colspan: 2)[24.7],
)

= 섹션 3: 이미지 및 도형

#text(12pt, weight: "bold")[이미지 삽입]
#figure(
  image("./images/Scikit_learn_logo.png", width: 50%),
  caption: [
    Scikit learn 로고
  ],
)<logo>

@logo 로고 확인

#text(12pt, weight: "bold")[사각형]
#rect(width: 3cm, height: 1cm, fill: blue, radius: 4pt)

#text(12pt, weight: "bold")[원]
#circle(radius: 0.5cm, fill: red)

#text(12pt, weight: "bold")[선]
#line(length: 100%, stroke: 0.5pt + rgb("#2e3440"))

= 섹션 4: 고급 기능

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

= 섹션 5: 글꼴 변경

#text(font: "KoPubWorldBatang")[
  = 배경
  빙하 유체 역학 원리로 얼음 움직임, 온도, 압력, 유체 요인 이해 가능.
]

= 섹션 6: Typst 문법 안내

Typst 마크업 언어. 간단한 문법으로 문서 스타일 자동 지정 가능.

== 모드

Typst 3가지 문법 모드: 마크업, 수학, 코드.

+ 마크업
  - 문서 기본 모드.
  - 마크업을 `[[..]]`로 감쌈. `{let name = [*Typst!*]}`
+ 수학
  - 수학 공식 작성 모드.
  - 수식을 `[$..$]`로 감쌈. `[$-x$는 $x$의 반대]`
+ 코드
  - 스크립팅 기능 사용 모드.
  - 코드 앞 `#` 추가. `[Number: #(1 + 2)]`
  - `#` 진입 후 모드 전환 전까지 추가 해시 불필요.

=== 마크업

주요 문서 요소 내장 마크업 제공. 대부분 함수 단축키.

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

코드 블록 및 표현식 내 선행 `#` 없이 시작 가능.

+ 없음(None): `{none}`
+ 자동(Auto): `{auto}`
+ 부울(Boolean): `{false}`, `{true}`
+ 정수(Integer): `{10}`, `{0xff}`
+ 부동 소수점(Floating-point): `{3.14}`, `{1e5}`
+ 길이(Length): `{2pt}`, `{3mm}`, `{1em}`
+ 각도(Angle): `{90deg}`, `{1rad}`
+ 분수(Fraction): `{2fr}`
+ 비율(Ratio): `{50%}`
+ 문자열(String): `{"hello"}`
+ 레이블(Label): `{<intro>}`

=== 이스케이프

입력하기 어렵거나 특수 의미 문장 삽입 시 사용. 백슬래시(`\`) 접두어 사용. 유니코드 삽입 시 16진수 시퀀스 `[\u{1f600}]` 작성 가능.
