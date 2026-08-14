#import "../templates/conf.typ": *

#show: template.with(
  title: "Tidyverse 치트시트",
  header: [#datetime.today().display()],
  footer: "",
)

== Tidyverse 소개

데이터 과학은 데이터를 통해 질문의 답을 찾아가는 과정이지만, 실제로는 데이터 정제(wrangling)에 가장 많은 시간이 쓰입니다. R의 Tidyverse는 이러한 작업을 직관적이고 일관되게 처리하도록 돕는 핵심 패키지 모음입니다. 공통된 설계 철학과 데이터 구조를 공유하므로, 깔끔한 데이터(Tidy Data) 원칙을 바탕으로 데이터 가공·모델링·시각화를 매끄럽게 연결할 수 있습니다.

Tidyverse 설치:
```r
install.packages("tidyverse")
```

== 깔끔한 데이터 (Tidy Data)

깔끔한 데이터(Tidy Data)는 데이터 가공, 모델링, 시각화에 최적화된 표준 형태입니다. Hadley Wickham의 말처럼 "깔끔한 데이터셋은 모두 비슷하지만, 지저분한 데이터셋은 저마다의 방식으로 지저분합니다." 초기 단계에서 데이터를 깔끔한 형태로 정돈해 두면 후속 분석 작업이 한결 수월해집니다.

== 깔끔한 데이터의 장점

- *일관된 데이터 구조*: 일관된 형태를 유지하므로 프로젝트마다 데이터 구조를 새로 파악해야 하는 인지적 부담을 줄입니다.
- *도구 생태계의 호환성*: 동일한 규칙을 따르는 여러 도구와 패키지를 레고 블록처럼 유기적으로 결합할 수 있습니다.
- *학습 효율성*: 몇 가지 핵심 도구의 사용법만 익히면 다양한 분석 프로젝트에 그대로 재사용할 수 있습니다.
- *손쉬운 데이터 결합*: 서로 다른 출처나 테이블의 데이터를 손쉽게 병합하고 결합할 수 있습니다.

=== 스프레드시트 데이터 작성 원칙 (Broman & Woo)

Karl Broman과 Kara Woo의 "Data Organization in Spreadsheets" 논문에서 제시하는 핵심 지침:

- 일관성을 유지하기
- 명확하고 의미 있는 변수명 사용하기
- 날짜는 `YYYY-MM-DD` 표준 형식으로 표기하기
- 빈 셀(결측치)을 임의로 두지 않기
- 한 셀에는 단 하나의 값만 입력하기
- 글꼴 색상이나 셀 강조 표시를 데이터 의미로 사용하지 않기
- 일반 텍스트 파일(CSV, TSV 등) 형태로 저장하기

== Tidyverse 데이터 정제 (Data Wrangling)

지저분한 원천 데이터를 분석에 적합한 깔끔한 형태로 변환하는 과정을 데이터 랭글링(Data Wrangling) 또는 정제라고 합니다.

=== Tidy Data의 3대 기본 규칙

- 각 변수(Variable)는 하나의 열(Column)을 이룹니다.
- 각 관측치(Observation)는 하나의 행(Row)을 이룹니다.
- 각 값(Value)은 하나의 셀(Cell)에 들어갑니다.

=== 데이터 형태 변환 (Reshaping)

깔끔한 데이터는 분석 목적에 따라 와이드(Wide) 형태와 롱(Long) 형태로 표현됩니다.

==== 와이드 데이터 (Wide Data)
각 변수가 개별 열로 나열되고 각 관측 대상이 하나의 행을 이루는 형태입니다. 사람이 한눈에 파악하고 입력하기에 적합합니다.

==== 롱 데이터 (Long Data)
변수 이름과 측정값을 각각 '변수명 열'과 '값 열'로 풀어낸 형태입니다. 시각화(ggplot2)나 그룹별 모델링에 적합합니다.

=== 팩터(Factor) 다루기 (`forcats`)

R에서 범주형 데이터는 팩터(Factor)로 다룹니다. 범주형 데이터는 가질 수 있는 값(범주)의 범위가 정해져 있습니다(예: 월 이름 12개). 

Tidyverse의 `forcats` 패키지는 팩터 데이터를 다루는 전용 함수를 제공하며, 모든 함수명이 `fct_`로 시작하여 직관적입니다. RStudio 콘솔에서 `?fct_`를 입력하면 전체 함수 목록을 확인할 수 있습니다.

팩터는 *실제 데이터 값*과 허용되는 범주 순서인 *수준(Levels)*으로 구성됩니다:

```r
## 12개월 전체 수준 정의
all_months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

## 관측 데이터
some_months <- c("Mar", "Dec", "Jan",  "Apr", "Jul")
```

문자형 벡터를 그대로 정렬하면 알파벳순으로 정렬됩니다:

```r
# 알파벳순 정렬
sort(some_months)
## [1] "Apr" "Dec" "Jan" "Jul" "Mar"
```

달력 순서로 올바르게 정렬하려면 `levels`를 명시하여 팩터로 변환해야 합니다:

```r
# 팩터 생성 (수준 순서 지정)
mon <- factor(some_months, levels = all_months)
mon
## [1] Mar Dec Jan Apr Jul
## Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec

# 팩터 기준 정렬
sort(mon)
## [1] Jan Mar Apr Jul Dec
## Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
```

== Tidyverse를 활용한 데이터 분석

=== Tidyverse 기본 동작 방식

Tidyverse의 함수들은 다음과 같은 일관된 규칙을 따릅니다:
- 첫 번째 인자로 데이터프레임을 받습니다.
- 변환 결과로 항상 새로운 데이터프레임을 반환합니다.
- 파이프 연산자(`%>%` 또는 `|>`)를 통해 여러 작업을 체인처럼 연결합니다.

예제 데이터 로드:
```r
# install.packages("carData") # 필요 시 설치
library(carData)
library(tidyverse)
cow = Cowles
```

=== `dplyr`: 직관적인 데이터 조작

`dplyr`은 복잡한 데이터 가공 작업을 명확한 동사 형태의 함수로 처리합니다:

- `filter()`: 조건에 맞는 행 추출
- `arrange()`: 행 정렬
- `select()`: 특정 열 선택 또는 제외
- `mutate()`: 새로운 열 계산 및 추가
- `summarize()` / `summarise()`: 데이터 집계 및 요약
- `count()`: 항목별 빈도수 집계
- `group_by()`: 그룹별 연산 지정
- `left_join()`, `inner_join()`: 공통 식별자 기준 테이블 병합

=== 비표준 평가 (Non-Standard Evaluation)

`dplyr` 함수 내부에서는 `df$col`처럼 매번 데이터프레임명을 붙이지 않고 열 이름(`col`)만 바로 참조할 수 있습니다:

```r
cow %>%
    # 달러 기호($) 없이 열 이름 직접 사용
    count(sex, volunteer)
## # A tibble: 4 x 3
##   sex    volunteer     n
##   <fct>  <fct>     <int>
## 1 female no          431
## 2 female yes         349
## 3 male   no          393
## 4 male   yes         248
```

=== `dplyr` 주요 기능

==== `select`: 열 선택 및 제외

열 이름을 직접 지정하거나 `-` 기호로 제외할 열을 지정합니다:

```r
# 포함 및 제외 선택
cow %>%
    select(neuroticism, extraversion) %>%
    head(2)

cow %>%
    select(-sex, -volunteer) %>%
    head(2)
```

`starts_with()`, `ends_with()`, `contains()` 등의 헬퍼 함수를 조합하여 패턴에 맞는 열을 한 번에 선택할 수도 있습니다.

==== `mutate`: 새 열 생성 및 변환

새로운 변수를 계산하여 열로 추가합니다:

```r
cow %>%
    mutate(high_extraversion = extraversion >= 15,
           high_neuroticism = neuroticism >= 15) %>%
    head()
```

원본 데이터에 결과를 반영하려면 변수에 다시 할당합니다:

```r
# 변경 사항 저장
cow = cow %>%
    mutate(high_extraversion = extraversion >= 15,
           high_neuroticism = neuroticism >= 15)
```

==== `summarize`: 데이터 요약 통계

데이터를 요약하여 단일 행(또는 그룹별 단일 행)의 통계값을 계산합니다:

```r
cow %>%
    summarize(
        extraversion = mean(extraversion),
        volunteers = sum(volunteer == "yes")
    )
## # A tibble: 1 x 2
##   extraversion volunteers
##          <dbl>      <int>
## 1         12.4        597
```

==== `filter`: 행 조건 필터링

논리 조건에 부합하는 행만 추출합니다:

```r
cow %>%
  filter((sex == "male") & (volunteer == "yes")) %>%
  head()
```

==== `arrange`: 데이터 정렬

지정한 열을 기준으로 데이터를 오름차순 또는 내림차순(`desc()`) 정렬합니다:

```r
cow %>%
  arrange(sex, volunteer, desc(extraversion)) %>%
  head()
```

==== `group_by`: 그룹별 집계 및 연산

`group_by()`를 적용하면 이후의 `mutate()`나 `summarize()`가 그룹 단위로 수행됩니다:

- 성별 기준 점수 중심화:

```r
cow %>%
    group_by(sex) %>%
    mutate(
        extraversion_centered = extraversion - mean(extraversion)
    )
```

- 그룹별 평균 및 표준편차 산출:

```r
cow %>%
    group_by(sex, volunteer) %>%
    summarise(mean = mean(neuroticism),
              sd = sd(neuroticism))
## # A tibble: 4 x 4
## # Groups:   sex [2]
##   sex    volunteer  mean    sd
##   <fct>  <fct>     <dbl> <dbl>
## 1 female no         12.2  4.75
## 2 female yes        12.3  4.79
## 3 male   no         10.5  4.75
## 4 male   yes        10.4  5.11
```

==== `count`: 빈도표 및 비율 계산

```r
# 전체 빈도 및 백분율
cow %>%
    count(sex) %>%
    mutate(percent = n / sum(n) * 100)

# 그룹별 비율 계산 (성별 내 자원봉사 참여율)
cow %>%
    count(sex, volunteer) %>%
    group_by(sex) %>%
    mutate(percent = n / sum(n) * 100)
```

==== `left_join`: 테이블 병합

공통 식별자(키 열)를 기준으로 두 데이터프레임을 결합합니다:

```r
extraversion_info = cow %>%
    group_by(sex, volunteer) %>%
    summarize(mean_extraversion = mean(extraversion))

cow %>%
  left_join(extraversion_info, by = c("sex", "volunteer")) %>%
  head()
```
