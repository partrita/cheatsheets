#import "../templates/conf.typ": *

#show: template.with(
  title: "수학 핵심 치트시트",
  header: [#datetime.today().display()],
  footer: "가이드: 대수학부터 그래프 이론까지",
)

= 대수학 (Algebra)
- *지수 법칙*:
  - $x^a * x^b = x^(a+b)$
  - $(x^a)^b = x^(a*b)$
  - $x^0 = 1$ (단, $x != 0$)
- *로그 법칙*:
  - $log_b(x*y) = log_b(x) + log_b(y)$
  - $log_b(x/y) = log_b(x) - log_b(y)$
  - $log_b(x^a) = a * log_b(x)$
- *이차방정식의 해 (근의 공식)*: $a*x^2 + b*x + c = 0$의 해
  - $x = (-b +- sqrt(b^2 - 4a*c)) / (2a)$

= 미적분학 (Calculus)
- *극한 (Limits)*: 함수가 특정 값에 한없이 가까워질 때의 거동
  - $\lim_(x->c) f(x) = L$
- *미분 (Derivatives)*: 함수의 순간 변화율 및 기울기
  - 정의: $f'(x) = \lim_(h->0) (f(x+h) - f(x)) / h$
  - 곱의 미분: $(f*g)' = f'*g + f*g'$
  - 몫의 미분: $(f/g)' = (f'*g - f*g') / g^2$
  - 연쇄 법칙 (합성함수 미분): $(f(g(x)))' = f'(g(x)) * g'(x)$
  - 주요 미분 공식: $(x^n)' = n*x^(n-1)$, $(sin x)' = cos x$, $(e^x)' = e^x$
- *적분 (Integrals)*: 곡선 아래의 면적 및 변화량의 누적
  - 부정적분: $integral f(x) "d"x = F(x) + C$
  - 정적분 (미적분학의 기본정리): $integral_a^b f(x) "d"x = F(b) - F(a)$
  - 부분적분법: $integral u dif(v) = u v - integral v dif(u)$

= 선형대수학 (Linear Algebra)
- *벡터 (Vectors)*: 크기와 방향을 동시에 갖는 물리량
  - 내적 (Dot Product): $a · b = |a||b|cos(theta) = sum a_i b_i$
  - 외적 (Cross Product): 두 벡터에 모두 수직인 새로운 벡터를 생성 (3차원 한정)
- *행렬 (Matrices)*: 수나 기호를 직사각형 형태로 배열한 것
  - 행렬의 곱: $("AB")_("ij") = sum_k A_("ik") B_("kj")$
  - 전치 행렬 (Transpose): 행과 열을 서로 바꾼 행렬 ($A^T$)
  - 역행렬 (Inverse): 원래 행렬과 곱했을 때 단위 행렬($I$)이 되는 행렬 ($A^(-1)$)
  - 행렬식 (Determinant): 행렬의 특성을 나타내는 스칼라 값. 역행렬 존재 여부를 결정
- *고유값과 고유벡터 (Eigenvalues and Eigenvectors)*:
  - 선형 변환 시 방향은 변하지 않고 크기만 변하는 벡터와 그 배율
  - $A v = lambda v$ (`A`: 행렬, `v`: 고유벡터, $lambda$: 고유값)

= 확률론 (Probability Theory)
- *기본 확률 법칙*:
  - $0 <= P(A) <= 1$
  - 합사건 확률: $P(A union B) = P(A) + P(B) - P(A inter B)$
- *조건부 확률 (Conditional Probability)*: 사건 B가 발생했을 때 A가 발생할 확률
  - $P(A|B) = P(A inter B) / P(B)$
- *베이즈 정리 (Bayes' Theorem)*: 사전 지식을 바탕으로 사후 확률을 추론하는 도구
  - $P(A|B) = (P(B|A) * P(A)) / P(B)$
- *기대값 (Expected Value)*: 확률 변수가 평균적으로 취할 것으로 기대되는 값
  - $E[X] = sum x_i * P(X=x_i)$

= 이산수학 (Discrete Mathematics)
- *집합론 (Set Theory)*: 원소들의 모임인 집합 간의 관계
  - 합집합($A U B$), 교집합($A inter B$), 차집합($A - B$)
  - 드모르간의 법칙: $(A union B)^c = A^c inter B^c$
- *조합론 (Combinatorics)*: 경우의 수를 계산하는 방법
  - 순열 (Permutation): $P(n, r)$ - 순서를 고려하여 선택
  - 조합 (Combination): $C(n, r)$ - 순서를 고려하지 않고 선택
- *그래프 이론 (Graph Theory)*: 정점(Vertex)과 간선(Edge)의 구조적 관계
  - 경로(Path), 사이클(Cycle), 트리(Tree) 등의 구조 분석
