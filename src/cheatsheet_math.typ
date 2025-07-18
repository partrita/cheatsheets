#import "./templates/conf.typ": *

#show: template.with(
  title: "수학 치트시트",
  header: [#datetime.today().display()],
  footer: "",
)

= 대수학 (Algebra)
- *지수 법칙*:
  - $x^a * x^b = x^(a+b)$
  - $(x^a)^b = x^(a*b)$
  - $x^0 = 1$
- *로그 법칙*:
  - $log_b(xy) = log_b(x) + log_b(y)$
  - $log_b(x/y) = log_b(x) - log_b(y)$
  - $log_b(x^a) = a * log_b(x)$
- *근의 공식*: 이차방정식 $ax^2 + bx + c = 0$의 해
  - $x = (-b +- sqrt(b^2 - 4ac)) / (2a)$

= 미적분학 (Calculus)
- *극한 (Limits)*:
  - $\lim_(x->c) f(x) = L$
- *미분 (Derivatives)*: 함수의 순간 변화율
  - *정의*: $f'(x) = \lim_(h->0) (f(x+h) - f(x)) / h$
  - *곱의 법칙*: $(f*g)' = f'*g + f*g'$
  - *몫의 법칙*: $(f/g)' = (f'*g - f*g') / g^2$
  - *연쇄 법칙*: $(f(g(x)))' = f'(g(x)) * g'(x)$
  - *기본 미분*: $(x^n)' = n*x^(n-1)$, $(sin x)' = cos x$, $(e^x)' = e^x$
- *적분 (Integrals)*: 곡선 아래의 면적
  - *부정적분*: $integral f(x) dx = F(x) + C$
  - *정적분 (미적분학의 기본정리)*: $integral_a^b f(x) dx = F(b) - F(a)$
  - *부분적분법*: $integral u dv = uv - integral v du$

= 선형대수학 (Linear Algebra)
- *벡터 (Vectors)*: 크기와 방향을 갖는 양
  - *내적 (Dot Product)*: $a · b = |a||b|cos(theta) = \sum a_i b_i$
  - *외적 (Cross Product)*: (3차원 벡터에만 해당) 결과는 두 벡터에 모두 수직인 벡터.
- *행렬 (Matrices)*: 숫자의 사각형 배열
  - *곱셈*: $(AB)_(ij) = \sum_k A_(ik) B_(kj)$
  - *전치 행렬 (Transpose)*: $A^T$. 행과 열을 바꾼 행렬.
  - *역행렬 (Inverse)*: $A * A^(-1) = I$ (단위 행렬)
  - *행렬식 (Determinant)*: `det(A)` 또는 `|A|`. 행렬이 역행렬을 갖는지 여부를 결정.
- *고유값과 고유벡터 (Eigenvalues and Eigenvectors)*:
  - $A v = \lambda v$
  - `A`: 행렬, `v`: 고유벡터, `\lambda`: 고유값

= 확률론 (Probability Theory)
- *확률의 기본*:
  - $0 <= P(A) <= 1$
  - $P(A U B) = P(A) + P(B) - P(A \cap B)$
- *조건부 확률 (Conditional Probability)*:
  - $P(A|B) = P(A \cap B) / P(B)$
- *베이즈 정리 (Bayes' Theorem)*:
  - $P(A|B) = (P(B|A) * P(A)) / P(B)$
- *기대값 (Expected Value)*:
  - $E[X] = \sum x_i * P(X=x_i)$

= 이산수학 (Discrete Mathematics)
- *집합론 (Set Theory)*:
  - *합집합*: $A U B$
  - *교집합*: $A \cap B$
  - *차집합*: $A - B$
  - *드모르간의 법칙*: $(A U B)^c = A^c \cap B^c$
- *조합론 (Combinatorics)*:
  - *순열 (Permutation)*: $_n P_r = n! / (n-r)!$ (순서 고려)
  - *조합 (Combination)*: $_n C_r = n! / (r! * (n-r)!)$ (순서 미고려)
- *그래프 이론 (Graph Theory)*:
  - *정점 (Vertex)*과 *간선 (Edge)*으로 구성된 구조.
  - *경로 (Path)*, *사이클 (Cycle)*, *트리 (Tree)*.
