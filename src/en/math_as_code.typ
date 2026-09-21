#import "../templates/conf.typ": *

#show: template.with(
  title: "Math as Code (Python Version)",
  header: [Last updated: #datetime.today().display()],
  footer: "https://github.com/Jam3/math-as-code",
)

A developer reference translating mathematical notation directly into Python and NumPy code.

= Variable Name Conventions

- _s_ : Italic lowercase for *scalars* (e.g. `s = 5`)
- *x* : Bold lowercase for *vectors* (e.g. `x = np.array([1, 2])`)
- *A* : Bold uppercase for *matrices* (e.g. `A = np.array([[1, 2], [3, 4]])`)
- _θ_ : Italic Greek for *constants/angles* (`theta = math.pi / 2`)

== NumPy Array Programming
In scientific Python, mathematical operations typically leverage NumPy (`import numpy as np`) for vectorized execution.

= Equals Symbols (`=`, `≠`, `≈`, `:=`)

- `=` : Equality ($x = 2 k j$) or assignment
- `≠` : Inequality ($x != y$)
- `≈` : Approximately equal ($pi approx 3.14159$)
- `:=` : Definition ($x := 2 k j$, defined as)

```python
# Equality & Inequality
assert (2 + 2) == 4
assert 2 != 3

# Approximate Equality
import math
from numpy.testing import assert_almost_equal

math.isclose(math.pi, 3.14159, abs_tol=1e-5)
assert_almost_equal(math.pi, 3.14159, decimal=5)
```

= Square Root and Complex Numbers (`√`, `i`)

== Square Root
$sqrt(x)^2 = x$
```python
import math
import numpy as np
math.sqrt(2) # 1.41421356...
np.sqrt(2)
```

== Complex Numbers ($a + b i$)
$i = sqrt(-1)$
```python
import cmath

z = complex(1, 1) # (1+1j) in Python
z_conj = z.conjugate() # (1-1j)
real_part, imag_part = z.real, z.imag

cmath.sqrt(complex(-1, 0)) # 1j
```

= Dot & Cross (`·`, `×`, `∘`)

== Scalar Multiplication
$5 dot 4 = 5 times 4 = 20$  (`5 * 4`)

== Hadamard Product (Element-wise Vector)
$3 bold(k) \u{26AC} bold(j)$
```python
k = np.array([1, 2])
j = np.array([2, 3])
result = 3 * (k * j) # [6, 18]
```

== Dot Product (Scalar Product)
$bold(k) dot bold(j) = sum k_i j_i$
```python
k = np.array([0, 1, 0])
j = np.array([1, 0, 0])
d = np.dot(k, j) # or k @ j -> 0
```

== Cross Product (Vector Product)
$bold(k) times bold(j)$
```python
result = np.cross(k, j) # [0, 0, -1]
```

= Sigma `Σ` (Summation)

$sum_(i=1)^100 i$

```python
# Iterative sum
sum([i for i in range(1, 101)]) # 5050

# Gauss formula O(1)
def sum_to_n(n): return 0.5 * n * (n + 1)

# Nested Sigma: sum_{i=1}^2 sum_{j=4}^6 (3*i*j)
sum(3 * i * j for i in range(1, 3) for j in range(4, 7))
```

= Capital Pi `Π` (Products of Sequences)

$product_(i=1)^6 i = 6!$

```python
import math
from functools import reduce

# Built-in or reduce
math.prod(range(1, 7)) # 720
reduce(lambda x, y: x * y, range(1, 7)) # 720
```

= Pipes `||` (Norms & Bars)

- *Absolute Value* ($|x|$): `abs(-5) -> 5`
- *Euclidean Norm* ($||bold(v)||$):
  ```python
  v = np.array([0, 4, -3])
  length = np.linalg.norm(v) # 5.0
  ```
- *Determinant* ($|bold(A)|$):
  ```python
  A = np.array([[1, 0], [0, 1]])
  det_A = np.linalg.det(A) # 1.0
  ```

= Hat `â` (Unit Vector)

$hat(bold(a)) = bold(a) / (||bold(a)||)$

```python
def normalize(vec):
  v = np.array(vec)
  norm = np.linalg.norm(v)
  return v / norm if norm > 0 else v

normalize([0, 4, -3]) # [0.0, 0.8, -0.6]
```

= Element of `∈`, `∉`

$3 in A, quad 6 in.not A$

```python
A = {3, 9, 14}
assert 3 in A
assert 6 not in A
```

= Common Number Sets

- $RR$ : Real numbers (`float`)
- $QQ$ : Rational numbers (`fractions.Fraction`)
- $ZZ$ : Integers (`int`)
- $NN$ : Natural numbers ($\ge 0$ integers)
- $CC$ : Complex numbers (`complex`)

== Set Builder Notation
$CC = { a + b i mid(|) a, b in RR }$
```python
# List/Set Comprehension
{complex(a, b) for a in [-1, 1] for b in [-1, 1]}
```

= Functions `ƒ`

== Function Definition & Lambdas
- Named: $f(x) = x^2$ (`def f(x): return x**2`)
- Anonymous: $x mapsto x^2$ (`lambda x: x**2`)
- Signum Function ($"sgn"(x)$):
  ```python
  def sgn(x):
    return -1 if x < 0 else (1 if x > 0 else 0)
  ```

== Piecewise Function
$f(x) = cases( (x^2-x)/x "if" x >= 1, 0 "otherwise" )$
```python
def f(x):
  return (x**2 - x) / x if x >= 1 else 0
```

== Function Notation & Typing (PEP 484)
$f: RR -> RR, quad x mapsto x^2$
```python
def square(x: float) -> float:
  return x ** 2
```

= Prime `′` (Derivatives & Transformed State)

- Next transformed state: $(x, y) -> (x', y')$
- Derivative: $f'(x) = 2x$ for $f(x) = x^2$
  ```python
  def f(x): return x**2
  def f_prime(x): return 2*x
  ```

= Floor & Ceiling (`⌊x⌋`, `⌈x⌉`)

- Floor ($floor(x)$): `math.floor(4.8) -> 4`
- Ceiling ($ceil(x)$): `math.ceil(3.1) -> 4`
- Round ($floor(x)ceil$): `round(4.5) -> 4` (Python round-to-even)

= Logic & Arrows

- *Material Implication* ($A => B$): `if A: assert B`
- *Equivalence* ($A <=> B$): `(A and B) or (not A and not B)`
- *Inequalities*: `<`, `>`, `<=`, `>=`, `<<`, `>>`
- *Conjunction & Disjunction*: $A and B$ (`and`), $A or B$ (`or`)
- *Negation*: $not A$ (`not A`)

= Intervals

- $(0, 1)$ : Open (neither 0 nor 1 included)
- $[0, 1)$ : Half-open (includes 0, excludes 1)
- $[0, 1]$ : Closed (includes both 0 and 1)

== Interval Operations
- *Intersection* ($[3, 5) sect [4, 6] = [4, 5)$):
  `[x for x in R if (3 <= x < 5) and (4 <= x <= 6)]`
- *Union* ($[3, 5) union [4, 6] = [3, 6]$):
  `[x for x in R if (3 <= x < 5) or (4 <= x <= 6)]`
- *Difference* ($[3, 5) - [4, 6] = [3, 4)$):
  `[x for x in R if (3 <= x < 5) and not (4 <= x <= 6)]`
