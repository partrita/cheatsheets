#import "./templates/conf.typ": *

#show: template.with(
  title: "타이디버스(Tidyverse) 치트시트",
  header: [#datetime.today().display()],
  footer: "R 기반 데이터 과학 패키지 모음",
)

= 1. Tidyverse 개요

데이터 정제, 모델링, 시각화에 최적화된 패키지 모음. `install.packages("tidyverse")`로 설치.

= 2. 깔끔한 데이터 (Tidy Data) 원칙

- 각 변수(Variable)는 하나의 열(Column)에 위치
- 각 관측치(Observation)는 하나의 행(Row)에 위치
- 각 값(Value)은 하나의 셀(Cell)에 위치

= 3. 주요 패키지 및 기능

== `dplyr`: 데이터 조작 (Verbs)
- `filter()`: 행 선택 (조건 기반)
- `select()`: 열 선택
- `mutate()`: 새 열 생성/기존 열 변경
- `arrange()`: 행 정렬
- `summarize()`: 통계적 요약 (평균, 합계 등)
- `group_by()`: 그룹별 연산 수행
- `left_join()`: 식별자 기준 데이터 병합

== `tidyr`: 데이터 재구조화
- `pivot_longer()`: 와이드 데이터를 롱 형식으로 전환
- `pivot_wider()`: 롱 데이터를 와이드 형식으로 전환

== `forcats`: 범주형 데이터(Factor) 처리
- `fct_relevel()`: 레벨 순서 변경
- `fct_lump()`: 희소 레벨 통합

= 4. 파이프 연산자 (`%>%` 또는 `|>`)

코드의 가독성을 높이기 위해 연산을 연결함.
```r
df %>%
  filter(age > 20) %>%
  group_by(city) %>%
  summarize(mean_score = mean(score))
```

= 5. 데이터 입력 지침

- 날짜 형식: `YYYY-MM-DD`
- 공백/빈 셀 최소화
- 한 셀에 하나의 데이터만 입력
- 파일 저장: 일반 텍스트(CSV 등) 권장
