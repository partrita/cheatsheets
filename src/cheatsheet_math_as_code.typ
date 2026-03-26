#import "./templates/conf.typ": *

#show: template.with(
  title: "Math as Code (Python version)",
  header: [#datetime.today().display()],
  footer: "https://github.com/Jam3/math-as-code",
)

Python 코드 비교를 통한 수학 표기법 이해 참고 자료.

= 서문

수학 기호는 문맥 및 연구 분야에 따라 의미 다를 수 있음. 모든 용도를 다루지 않으며 실제 사용 사례 인용함.

상세 목록은 #link("https://en.wikipedia.org/wiki/List_of_mathematical_symbols")[위키피디아] 참조.

부동 소수점 예제는 수치적으로 불안정할 수 있음. 상세 내용은 #link("https://github.com/mikolalysenko/robust-arithmetic-notes")[Robust Arithmetic Notes] 참조.


= 목차

- 변수 명명 규칙
- 등호 기호 (`=`, `≈`, `≠`, `:=`)
- 제곱근과 복소수 (`√`, _`i`_)
- 내적 & 외적 (`·`, `×`, `∘`)
- 시그마 `Σ` - _합산_
- 대문자 파이 `Π` - _수열 곱_
- 파이프 `||`
- 햇 `â` - _단위 벡터_
- "원소" `∈`, `∉`
- 일반적인 수 집합 `ℝ`, `ℤ`, `ℚ`, `ℕ`
- 함수 `ƒ`
- 소수 `′`
- 바닥 & 천장 `⌊`, `⌉`
- 화살표
- 논리 부정 `¬`, `~`, `!`
- 구간


= 변수 명명 규칙

문맥 및 연구 분야별 명명 규칙 상이. 일반적 패턴:

- _s_ - 스칼라용 이탤릭체 소문자
- *x* - 벡터용 굵은 소문자
- *A* - 행렬용 굵은 대문자
- _θ_ - 상수 및 특수 변수용 이탤릭체 소문자 그리스 문자

== Numpy
강력한 배열 프로그래밍 라이브러리. 파이썬 내 DSL로 해석 가능. 벡터 및 행렬 연산 시 문법에 따른 성능 차이 주의. 관례적 `import numpy as np` 사용.

= 등호 기호

등호 및 유사 기호 예시:

- `=` : 동등 (값이 같음)
- `≠` : 부등 (값이 다름)
- `≈` : 거의 같음 (`π ≈ 3.14159`)
- `:=` : 정의 (A는 B로 정의됨)

파이썬 예시:

```python
## 동등
2 == 3

## 부등
2 != 3

## 거의 같음
import math
math.isclose(math.pi, 3.14159) # 허용 오차 미지정 시 False

from numpy.testing import assert_almost_equal
assert_almost_equal(math.pi, 3.14159, 1e-5) # 허용 오차 5자리 지정

def almost_equal(x, y, epsilon=7):
  """사용자 정의 함수 예시"""
  return abs(x - y) < 10 ** -epsilon
```

정의 기호로 `:=`, `=:`, `=` 사용. `x`를 `2kj`로 정의하는 예:

$x := 2 k j$

파이썬은 `=`로 변수 정의 및 별칭 부여.

```python
x = 2 * k * j
```

동등성 표현:

$x = 2 k j$

`=`와 `==` 차이 주의. 파이썬 `=`는 명령, `==`는 비교 연산. 수학은 문맥에 따라 구분 필요.


= 제곱근과 복소수

제곱근 연산 형태:

$sqrt(x)^2 = x$

프로그래밍 내 `sqrt` 함수 사용:

```python
import math
print(math.sqrt(2))
# 결과: 1.4142135623730951
```

복소수 $a + i b$ 형태. $a$ 실수부, $b$ 허수부. 허수 $i$ 정의:

$i = sqrt(-1)$

파이썬 `complex` 및 `cmath` 모듈 제공.

```python
complex(1, 1)  # (1+1j)

import cmath
cmath.sqrt(complex(-1, 0)) # (0+1j)
```

= 내적 & 외적

점 `·` 및 십자 `×` 기호 용도:

== 스칼라 곱셈

스칼라 단순 곱셈 표시. 다음은 동일:

$5 dot 4 = 5 times 4$

프로그래밍 곱셈 기호 `*` 사용.

== 벡터 곱셈

벡터 곱셈 시 점/십자 미사용. 요소별 곱셈(아다마르 곱)은 `∘` 사용.

$3 bold(k) \u{26AC} bold(j)$

== 내적 (Dot Product)

점 `·`은 내적 표시. 스칼라 값 반환.

$bold(k) dot bold(j)$

```python
k = [0, 1, 0]
j = [1, 0, 0]
d = np.dot(k, j) # 결과: 0
```

== 외적 (Cross Product)

십자 `×`는 외적 표시.

$bold(k) times bold(j)$

```python
k = [0, 1, 0]
j = [1, 0, 0]
result = np.cross(k, j) # 결과: [ 0, 0, -1 ]
```

= 시그마 `Σ`

그리스 문자 `Σ`(시그마)는 합산 의미.

$sum_(i=1)^100 i$

`i=1` 시작, `100` 종료 의미. 코드 예시:

```python
sum([k for k in range(1, 101)]) # 5050
```

= 대문자 파이 `Π`

대문자 파이(`Π`)는 수열 곱 의미.

$product_(i=1)^6 i$

```python
from functools import reduce
def times(x, y): return x * y
reduce(times, range(1, 7)) # 720
```

= 파이프 `||`

파이프 기호 용도: 절댓값, 유클리드 노름, 행렬식.

- *절댓값*: $abs(x)$
- *유클리드 노름*: $|| bold(v) ||$
- *행렬식*: $det(bold(A))$

= 햇 `â`

문자 위 "햇" 기호는 단위 벡터 표시.

$hat(bold(a))$

길이 1인 벡터. 3D 벡터 정규화 예시:

```python
def normalize(vec):
  # ... 구현
  return vec
```

= "원소" `∈`, `∉`

원소 기호 `∈`는 집합 소속 여부 표시.

$A = {3, 9, 14}, 3 in A$

파이썬 `in` 키워드 사용.

```python
A = {3, 9, 14}
3 in A # True
```

= 일반적인 수 집합

- $RR$: 실수 (Python `float`)
- $QQ$: 유리수
- $ZZ$: 정수 (Python `int`)
- $NN$: 자연수 (0 포함 양의 정수)
- $CC$: 복소수 (Python `complex`)

= 함수 `ƒ`

입력을 출력으로 변환. $f(x) = x^2$ 작성 예시:

```python
def square(x):
  return x**2
```

== 조각별 함수

입력 값별 상이한 관계 사용 함수.

$f(x) = cases( (x^2-x)/x "if" x >= 1, 0 "otherwise" )$

```python
def f(x):
  if (x >= 1):
    return (x**2 - x) / x
  else:
    return 0
```

= 소수 `′`

소수 기호(`′`)는 변수 구분 또는 변환 후 값 표시. 함수 도함수 의미.

$f(x) = x^2$ 의 도함수는 $f'(x) = 2x$ 입니다.

= 바닥 & 천장 `⌊`, `⌉`

- $floor(x)$: 내림
- $ceil(x)$: 올림
- $round(x)$: 반올림

```python
import math
math.floor(4.8) # 4
math.ceil(3.1)  # 4
round(4.5)      # Python 3 round는 짝수 근사값 반환
```

= 화살표

- 논리적 함의: $A => B$ (A 참일 시 B도 참)
- 부등식: `<`, `>`, `<=`, `>=`
- 논리곱과 논리합: `∧` (AND), `∨` (OR)

= 논리 부정 `¬`, `~`, `!`

논리적 `NOT` 표시. $x != y <=> not(x = y)$

= 구간

특정 값 범위 표시.
- $(0, 1)$: 0, 1 미포함
- $[0, 1)$: 0 포함, 1 미포함
- $(0, 1]$: 0 미포함, 1 포함
- $[0, 1]$: 0, 1 모두 포함
