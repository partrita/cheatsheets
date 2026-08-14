#import "../templates/conf.typ": *


#show: template.with(
  title: "Seaborn 치트시트",
  header: [#datetime.today().display()],
  footer: "가이드: 통계적 데이터 시각화의 정석",
)

// 주요 내용 시작
= 데이터셋 로드 (Dataset Loading)

Seaborn은 시각화 실습용 유명 공개 데이터셋(tips, iris 등)을 내장하고 있습니다.

```python
import seaborn as sns

# 팁 관련 데이터셋 로드
tips = sns.load_dataset("tips")
print(tips.head())
```

= 범주형 데이터 시각화 (Categorical Plots)

데이터의 카테고리별 분포나 빈도를 확인하는 데 최적화된 플롯들입니다.

== 카운트 플롯 (Count Plot)
각 범주별 데이터의 개수를 막대 형태로 보여줍니다.
```python
import seaborn as sns
import matplotlib.pyplot as plt

tips = sns.load_dataset("tips")
sns.countplot(x="day", data=tips, palette="viridis")
plt.title("요일별 방문객 빈도")
plt.show()
```

== 바 플롯 (Bar Plot)
범주별 수치의 평균값과 신뢰구간을 시각화합니다.
```python
sns.barplot(x="sex", y="total_bill", data=tips)
plt.title("성별 총 계산서 평균 비교")
plt.show()
```

== 박스 플롯 (Box Plot)
사분위수 기반으로 데이터 분포와 이상치(Outlier)를 한눈에 파악합니다.
```python
sns.boxplot(x="day", y="total_bill", hue="smoker", data=tips)
plt.title("요일 및 흡연 여부별 계산서 분포")
plt.show()
```

== 바이올린 플롯 (Violin Plot)
박스 플롯과 커널 밀도 추정을 결합하여 데이터의 밀집도를 더 상세히 보여줍니다.
```python
sns.violinplot(x="day", y="total_bill", data=tips, inner="quartile")
plt.title("요일별 계산서 금액 밀도 분포")
plt.show()
```

= 관계형 시각화 (Relational Plots)

변수 간의 상관관계와 패턴을 분석하는 데 사용됩니다.

== 산점도 (Scatter Plot - relplot)
`hue`, `size`, `style` 등 다양한 속성을 사용하여 다차원적인 관계를 표현합니다.
```python
sns.relplot(x="total_bill", y="tip", hue="smoker", style="time", data=tips)
plt.title("식사 금액과 팁의 상관관계 (흡연/시간대별)")
plt.show()
```

== 라인 플롯 (Line Plot - relplot)
시간 경과나 연속적인 변수에 따른 추세를 파악할 때 유용합니다.
```python
df = sns.load_dataset("fmri")
sns.relplot(x="timepoint", y="signal", kind="line", ci="sd", data=df)
plt.title("시간 경과에 따른 뇌 활동 신호 변화")
plt.show()
```

= 분포 시각화 (Distribution Plots)

단일 또는 다중 변수의 데이터 분포 특성을 분석합니다.

== 히스토그램 (Histogram - histplot)
데이터의 구간별 빈도를 나타내며, `kde=True` 옵션으로 커널 밀도 추정 곡선을 함께 표시합니다.
```python
sns.histplot(data=tips, x="total_bill", kde=True, bins=20)
plt.title("총 계산서 금액 분포")
plt.show()
```

== 커널 밀도 추정 (KDE Plot)
부드러운 곡선으로 데이터의 확률 밀도를 시각화합니다.
```python
sns.kdeplot(data=tips, x="total_bill", y="tip", fill=True, cmap="mako")
plt.title("금액과 팁의 2차원 밀도 분석")
plt.show()
```

= 매트릭스 시각화 (Matrix Plots)

변수 간의 상관계수나 빈도 행렬을 색상으로 표현합니다.

== 히트맵 (Heatmap)
데이터의 상관관계나 피벗 테이블 형태의 수치를 직관적으로 보여줍니다.
```python
flights = sns.load_dataset("flights")
# 연도별/월별 승객 수 피벗 테이블 생성
flights_pivot = flights.pivot_table(index="month", columns="year", values="passengers")
sns.heatmap(flights_pivot, annot=True, fmt="d", cmap="YlGnBu")
plt.title("연도 및 월별 승객 수 변화 추이")
plt.show()
```

= 테마 및 팔레트 설정 (Styles)

그래프의 전반적인 분위기를 일관되게 설정합니다.

```python
# 전체적인 스타일 설정 (darkgrid, whitegrid, dark, white, ticks)
sns.set_style("whitegrid") 

# 색상 팔레트 설정 (deep, muted, pastel, bright, dark, colorblind 등)
sns.set_palette("muted") 

sns.barplot(x="sex", y="total_bill", data=tips)
plt.title("커스텀 테마가 적용된 그래프")
plt.show()
```
