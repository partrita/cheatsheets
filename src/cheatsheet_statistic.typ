#import "./templates/conf.typ": *

#show: template.with(
  title: "통계학 치트시트",
  header: [#datetime.today().display()],
  footer: "",
)

= 기술 통계 (Descriptive Statistics)
데이터 특성 요약 및 설명 방법.
- 중심 경향 (Central Tendency):
  - `평균 (Mean)`: 산술 평균. 이상치 민감.
  - `중앙값 (Median)`: 데이터 정렬 시 가운데 위치값. 이상치 영향 적음.
  - `최빈값 (Mode)`: 최다 빈도값.
- 산포도 (Dispersion):
  - `범위 (Range)`: 최대값 - 최소값.
  - `분산 (Variance)`: 평균과의 편차 제곱의 평균.
  - `표준편차 (Standard Deviation)`: 분산의 제곱근. 데이터 변동성 직관적 지표.
  - `사분위수 (Quartiles)`: 데이터 4등분값 (Q1, Q2, Q3). `IQR = Q3 - Q1`.

= 추론 통계 (Inferential Statistics)
표본 데이터로 모집단 결론 도출 방법.
- 가설 검정 (Hypothesis Testing):
  - `귀무가설 (H0)`: 기존 사실 주장. (예: 차이/효과 없음)
  - `대립가설 (H1)`: 입증 목표 주장. (예: 차이/효과 있음)
  - `p-value`: H0 가정 하에 관측 데이터 이상이 나타날 확률.
  - `유의수준 (α)`: p-value 판단 기준 (보통 0.05). `p < α` 시 H0 기각.
- 신뢰 구간 (Confidence Interval): 모집단 모수 포함 예상 구간. (예: 95% 신뢰구간)

= 주요 확률 분포
- 정규 분포 (Normal Distribution): 평균 중심 대칭 종 모양 분포. 자연/사회 현상 일반적 분포.
- 이항 분포 (Binomial Distribution): 베르누이 시행 반복 시 성공 횟수 분포.
- 포아송 분포 (Poisson Distribution): 단위 시간/공간 내 사건 발생 횟수 분포.
- t-분포 (Student's t-Distribution): 표본 크기 작을 때 사용. 정규 분포 유사.
- 카이제곱 분포 (Chi-squared Distribution): 범주형 데이터 분석용.

= 주요 통계 검정
- t-검정 (t-test): 두 집단 평균 비교.
  - `독립 표본 t-검정`: 서로 다른 두 집단 비교.
  - `대응 표본 t-검정`: 동일 집단 사전-사후 비교.
- 분산 분석 (ANOVA): 셋 이상 집단 평균 비교.
- 카이제곱 검정 (Chi-squared Test): 범주형 변수 간 연관성 검정.
- 상관 분석 (Correlation Analysis): 두 연속형 변수 간 선형 관계 강도/방향 측정.
  - `피어슨 상관 계수 (r)`: -1 ~ 1 사이 값.

= 회귀 분석 (Regression Analysis)
독립 변수(X) 기반 종속 변(Y) 예측 모델링.
- 단순 선형 회귀: `Y = β0 + β1*X + ε`. 독립 변수 1개.
- 다중 선형 회귀: `Y = β0 + β1*X1 + β2*X2 + ... + ε`. 독립 변수 여러 개.
- 로지스틱 회귀: 종속 변수 범주형(예: 합격/불합격) 시 사용.

= 통계적 오류
- 1종 오류 (α): H0 참인데 기각하는 오류. (False Positive)
- 2종 오류 (β): H0 거짓인데 기각 실패하는 오류. (False Negative)
