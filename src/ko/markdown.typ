#import "../templates/conf.typ": *

#show: template.with(
  title: "마크다운 치트시트",
  header: [#datetime.today().display()],
  footer: "commonmark.org | github.github.com/gfm/",
)

= 개요

마크다운은 일반 텍스트 편집기로 서식 있는 문서를 작성하기 위한 경량 마크업 언어입니다. 2004년 John Gruber가 제작하였으며, 이후 다양한 플랫폼에 맞춘 여러 *방언(Flavor)*이 등장했습니다.

- *CommonMark*: 표준화된 마크다운 명세 (commonmark.org)
- *GFM*: GitHub Flavored Markdown — GitHub의 CommonMark 확장
- *Pandoc*: 학술·기술 문서를 위한 확장 마크다운
- *MultiMarkdown (MMD)*: 표, 각주, 인용 등 추가 기능
- *Obsidian*: 위키 링크, 임베드, 콜아웃 등 앱 전용 확장

= 기본 문법 (CommonMark)

== 제목 (Headings)
```markdown
# 제목 1
## 제목 2
### 제목 3
#### 제목 4
##### 제목 5
###### 제목 6

Setext 스타일 (H1, H2만 가능):
제목 1       제목 2
======       ------
```

== 텍스트 강조
```markdown
*기울임* 또는 _기울임_
**굵게** 또는 __굵게__
***굵고 기울임*** 또는 ___굵고 기울임___
~~취소선~~                    <!-- GFM -->
==강조 표시==                 <!-- Pandoc, Obsidian -->
^위 첨자^   ~아래 첨자~       <!-- Pandoc -->
`인라인 코드`
```

== 단락 및 줄 바꿈
```markdown
빈 줄로 단락을 구분합니다.

줄 바꿈: 줄 끝에 공백 두 칸  
또는 백슬래시\
를 붙입니다.
```

== 인용 블록
```markdown
> 단일 인용

> 1단계
>> 2단계 (중첩)
>>> 3단계

> 여러 단락:
>
> 인용 안의 두 번째 단락.
```

== 목록
```markdown
<!-- 순서 없는 목록 (-, *, + 모두 사용 가능) -->
- 항목 A
- 항목 B
  - 하위 항목 (2칸 들여쓰기)
    - 더 깊은 하위

<!-- 순서 있는 목록 -->
1. 첫 번째
2. 두 번째
   1. 중첩 순서
3. 세 번째

<!-- 간편 번호 (모두 1. 이어도 올바르게 렌더링됨) -->
1. 하나
1. 둘
1. 셋

<!-- 체크리스트 (GFM) -->
- [x] 완료된 항목
- [ ] 미완료 항목
```

== 코드
````markdown
인라인: `코드`
백틱 내에 백틱: ``back`tick``

펜스 코드 블록:
```python
def hello():
    print("안녕하세요!")
```

```javascript
const greet = name => `Hello, ${name}!`;
```

들여쓰기 코드 블록 (4칸 공백):
    print("들여쓰기 코드")
````

== 링크 및 이미지
```markdown
<!-- 링크 -->
[텍스트](https://example.com)
[텍스트](https://example.com "제목")
[참조 링크][ref-id]
[ref-id]: https://example.com "선택적 제목"
<https://autolink.com>

<!-- GFM: 일반 URL 자동 링크 -->
https://github.com

<!-- 이미지 -->
![대체 텍스트](image.png)
![대체 텍스트](image.png "제목")
[![링크된 이미지](img.png)](https://example.com)
```

== 수평선 및 이스케이프
```markdown
---   또는   ***   또는   ___

이스케이프: \*  \_  \`  \#  \[  \]  \(  \)  \\  \|
```

= GitHub Flavored Markdown (GFM)

== 표 (Tables)
```markdown
| 헤더 1 | 헤더 2 | 헤더 3 |
|--------|:------:|-------:|
| 왼쪽   | 가운데 |  오른쪽 |
| 데이터 |  값    |    100 |
```

== 알림 블록 (Alerts / Admonitions)
```markdown
> [!NOTE]
> 사용자가 알아야 할 정보를 강조합니다.

> [!TIP]
> 더 잘하기 위한 유용한 조언입니다.

> [!IMPORTANT]
> 사용자가 반드시 알아야 할 핵심 정보입니다.

> [!WARNING]
> 즉각적인 주의가 필요한 긴급 정보입니다.

> [!CAUTION]
> 위험이나 부정적인 결과를 경고합니다.
```

== GitHub 전용 참조
```markdown
@사용자명                  <!-- 사용자 멘션 -->
@조직/팀                   <!-- 팀 멘션 -->
#123                      <!-- 이슈/PR 번호 링크 -->
org/repo#123              <!-- 크로스 레포 참조 -->
abc1234 (7자 이상 SHA)     <!-- 커밋 링크 -->
```

== 이모지
```markdown
:smile: :rocket: :warning: :white_check_mark:
:thumbsup: :tada: :fire: :bug: :book: :sparkles:
```

== 접을 수 있는 섹션
```markdown
<details>
<summary>클릭하여 펼치기</summary>

숨겨진 **마크다운** 내용이 여기에 들어갑니다.

</details>
```

== 각주 (GFM 확장)
```markdown
각주가 있는 문장입니다.[^1]

[^1]: 각주 내용입니다.

여러 단락 각주:[^긴각주]
[^긴각주]: 첫 번째 단락.

    두 번째 단락 (4칸 들여쓰기).
```

== 유용한 언어별 코드 블록
````markdown
```diff
- 삭제된 줄
+ 추가된 줄
  변경 없는 줄
```

```bash
echo "셸 스크립트"
```

```json
{ "키": "값", "숫자": 42 }
```

```yaml
키: 값
목록:
  - 항목1
  - 항목2
```

```sql
SELECT * FROM users WHERE active = true;
```
````

= Pandoc 확장 마크다운

== 수식 (LaTeX)
```markdown
인라인: $E = mc^2$

디스플레이:
$$ \int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2} $$

정렬된 수식:
$$
\begin{aligned}
  a &= b + c \\
  d &= e \times f
\end{aligned}
$$
```

== 정의 목록
```markdown
사과
:   과일의 일종입니다.

마크다운
:   경량 마크업 언어입니다.
:   훌륭한 서식 도구이기도 합니다.
```

== 각주 (Pandoc)
```markdown
각주가 있는 텍스트.[^fn]
[^fn]: 각주 내용.

인라인 각주^[바로 텍스트 안에 작성합니다.].
```

== 인용 (Citations)
```markdown
---
bibliography: refs.bib
csl: apa.csl
---

[@smith2020]               <!-- 괄호 인용 -->
@smith2020                 <!-- 서술 인용 -->
[@smith2020, p. 10]        <!-- 페이지 포함 -->
[@a2020; @b2021]           <!-- 다중 인용 -->
[-@smith2020]              <!-- 저자 생략 -->
```

== 디브 및 스팬 (Divs & Spans)
```markdown
::: {.classname}
클래스가 있는 블록 디브
:::

::: {#id .class key="val"}
id, 클래스, 속성이 있는 디브
:::

[스팬 텍스트]{.classname}
[스팬 텍스트]{style="color:red"}
```

== 위 첨자·아래 첨자
```markdown
2^10^ = 1024      H~2~O는 물입니다.
```

== 줄 블록 (Line Blocks)
```markdown
| 공백이 보존되는 첫 번째 줄
|   들여쓰기된 두 번째 줄
| 세 번째 줄
```

= Obsidian 마크다운

== 위키 링크 (Wiki Links)
```markdown
[[페이지 이름]]
[[페이지 이름|표시 텍스트]]
[[페이지 이름#제목]]
![[임베드할 노트]]
![[이미지.png|300]]
```

== 콜아웃 (Callouts)
```markdown
> [!note]
> 기본 노트입니다.

> [!warning] 커스텀 제목
> 커스텀 제목의 경고입니다.

> [!tip]+ 기본으로 펼침
> 내용이 있습니다.

> [!info]- 기본으로 접힘
> 숨겨진 내용입니다.
```

== 태그
```markdown
#태그   #중첩/태그   #여러_단어
```

= Mermaid 다이어그램

GitHub, GitLab, Obsidian, Notion 등 다양한 플랫폼에서 지원합니다.

````markdown
```mermaid
flowchart TD
    A[시작] --> B{조건}
    B -->|예| C[실행]
    B -->|아니오| D[건너뜀]
```

```mermaid
sequenceDiagram
    앨리스->>밥: 안녕하세요!
    밥-->>앨리스: 안녕하세요!
```

```mermaid
gantt
    title 프로젝트 계획
    dateFormat YYYY-MM-DD
    작업 A :a1, 2024-01-01, 30d
    작업 B :after a1, 20d
```

```mermaid
pie title 언어 비율
    "Python" : 45
    "R" : 30
    "기타" : 25
```

```mermaid
classDiagram
    Animal <|-- Dog
    Animal : +name String
    Animal: +speak()
    Dog: +breed String
```
````

= 마크다운 안의 HTML

```markdown
<br>                       <!-- 줄 바꿈 -->
<mark>강조 표시</mark>     <!-- 형광펜 -->
<kbd>Ctrl</kbd>+<kbd>C</kbd>   <!-- 키보드 키 -->
<sup>위 첨자</sup>   <sub>아래 첨자</sub>
<small>작은 텍스트</small>

<!-- 가운데 정렬 (GitHub README) -->
<div align="center">
  <img src="logo.png" width="200"/>
  <h2>가운데 정렬 제목</h2>
</div>

<!-- 접을 수 있는 섹션 -->
<details>
<summary><b>더 보기</b></summary>
숨겨진 **마크다운** 내용.
</details>
```

= 방언별 기능 비교

#table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: (left, center, center, center, center, center),
  table.header(
    [기능], [CM], [GFM], [Pandoc], [MMD], [Obsidian],
  ),
  [표],         [-], [✓], [✓], [✓], [✓],
  [체크리스트], [-], [✓], [✓], [-], [✓],
  [취소선],     [-], [✓], [✓], [✓], [✓],
  [각주],       [-], [✓], [✓], [✓], [✓],
  [수식],       [-], [-], [✓], [✓], [✓],
  [알림 블록],  [-], [✓], [-], [-], [✓],
  [Mermaid],    [-], [✓], [-], [-], [✓],
  [정의 목록],  [-], [-], [✓], [✓], [-],
  [인용],       [-], [-], [✓], [✓], [-],
  [위키 링크],  [-], [-], [-], [-], [✓],
  [위 첨자],    [-], [-], [✓], [✓], [✓],
)

= Pro Tips

```markdown
<!-- GitHub README 배지 -->
[![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Build](https://github.com/user/repo/actions/workflows/ci.yml/badge.svg)](...)

<!-- 수동 목차 앵커 링크 -->
## 목차
- [섹션 1](#섹션-1)
- [하위 섹션](#하위-섹션)

<!-- 모범 사례 -->
<!-- - 파일 전체에서 일관된 글머리 기호 사용 (-, *, +) -->
<!-- - 제목, 목록, 코드 블록 앞뒤에 반드시 빈 줄 추가 -->
<!-- - 4칸 들여쓰기보다 펜스 코드 블록 사용 권장 -->
<!-- - 긴 URL은 참조 스타일 링크 사용 -->
<!-- - 대상 플랫폼에서 렌더링 확인 필요 -->
```
