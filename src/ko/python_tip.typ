#import "../templates/conf.typ": *

#show: template.with(
  title: "8가지 쿨한 파이썬 기능",
  header: [#datetime.today().display()],
  footer: "https://dev.to/renegadecoder94/8-coolest-python-programming-language-features-58i9",
)

// 여기에 문서 내용을 작성하세요

= 리스트 컴프리헨션(List Comprehensions)

리스트 컴프리헨션(List Comprehension)은 반복 가능한 객체로부터 간결하고 직관적인 한 줄 문법으로 새 리스트를 생성하는 파이썬의 대표적인 관용구입니다.

```python
# 0부터 9까지의 값을 포함하는 리스트를 생성합니다.
[i for i in range(10)]

# 0부터 9까지의 모든 짝수 값을 포함하는 리스트를 생성합니다.
[i for i range(10) if i % 2 == 0]

# 1부터 10까지의 값을 포함하는 리스트를 생성합니다.
[i + 1 for i in range(10)]

# 0부터 -9까지의 값을 포함하는 리스트를 생성합니다.
[-i for i in range(10)]

# 0부터 9까지 가능한 모든 쌍을 생성합니다.
[(a, b) for a in range(10) for b in range(10)]

# 다른 리스트를 얕게 복사합니다.
my_list = [1, 3, 5, 7, 9]
[item for item in my_list]
```


= 제너레이터 표현식(Generator Expressions)

리스트 컴프리헨션과 동일한 문법에 괄호 `()`를 사용하면 제너레이터 표현식(Generator Expression)이 됩니다. 전체 데이터를 메모리에 한꺼번에 올리지 않고 필요할 때마다 원소를 하나씩 지연 생성(Lazy Evaluation)하므로 메모리를 크게 절약할 수 있습니다.

```python
# 0부터 9까지의 값을 생성합니다.
(i for i in range(10)])

# 0부터 9까지의 값을 생성합니다.
(i for i range(10) if i % 2 == 0)

# 1부터 10까지의 값을 생성합니다.
(i + 1 for i in range(10)])

# 0부터 -9까지의 값을 생성합니다.
(-i for i in range(10))

# 0부터 9까지 가능한 모든 쌍을 생성합니다.
((a, b) for a in range(10) for b in range(10))

# 다른 리스트의 얕은 복사본을 생성합니다.
my_list = [1, 3, 5, 7, 9]
(item for item in my_list)
```

= 슬라이스 할당(Slice Assignment)

슬라이스 할당(Slice Assignment)을 사용하면 리스트의 특정 구간을 다른 이터러블로 한 번에 교체·삽입·삭제할 수 있습니다. 슬라이스 범위와 대체 리스트의 길이가 달라도 유연하게 동작합니다.

```python
my_list = [1, 2, 3]

# 슬라이스 할당으로 리스트에 추가합니다.
my_list[len(my_list):] = [4]

# 슬라이스 할당으로 리스트 앞에 추가합니다.
my_list[:0] = [0]

# 중간 요소를 대체합니다.
midpoint = len(my_list) // 2
my_list[midpoint: midpoint + 1] = [-2]

# 임의의 하위 섹션을 대체합니다.
my_list[:2] = [3, 4, 5]
```

= 이터러블 언패킹 (Iterable Unpacking, 일명 구조 분해)

확장 언패킹(Starred Unpacking, PEP 3132)을 활용하면 리스트의 첫 요소나 마지막 요소를 추출하고 나머지 요소들을 `*` 변수에 손쉽게 묶을 수 있습니다.

```python
my_list = [1, 2, 3]
*remainder, last_item = my_list
```

= 음수 인덱싱(Negative Indexing)

파이썬의 음수 인덱싱은 뒤에서부터 순서를 매겨(마지막 요소는 `-1`), 별도의 길이 계산(`len(arr)-1`) 없이 끝쪽 원소에 직관적으로 접근하게 해줍니다.

```python
my_list = [1, 2, 3]
last_item = my_list[-1]
```
= 딕셔너리 컴프리헨션(Dictionary Comprehensions)

딕셔너리 컴프리헨션(Dict Comprehension, PEP 274)을 사용하면 반복 가능한 데이터로부터 키-값 쌍을 간결하게 생성하거나 필터링할 수 있습니다.

```python
# 숫자-문자 딕셔너리를 생성합니다.
{num: chr(65 + num) for num in range(5)}

# 같은 것을 생성합니다.
nums = [1, 2, 3, 4, 5]
letters = ["A", "B", "C", "D", "E"]
{num: letter for num, letter in zip(nums, letters)}
```
= 비교 연결(Chaining Comparisons)

파이썬에서는 `1 < x < 10`과 같이 여러 비교 연산자를 직관적으로 연결(Chaining Comparisons)하여 가독성 높은 조건식을 작성할 수 있습니다.

```python
17 > 5
```
= f-문자열(f-Strings)

포맷 문자열(f-string, PEP 498)은 문자열 내에 표현식을 직접 삽입하는 가장 빠르고 직관적인 방법입니다. 파이썬 3.8부터는 `f"{var=}"` 형태의 편리한 디버깅 출력도 지원합니다.

```python
age = 25
name = 'Jeremy'
print(f'My name is {name}, and I am {age}')
```

= 특별한 언급(Honorable Mentions)

그 외 유용한 파이썬 핵심 기능들:

- For/Else 루프
- 허수(Imaginary numbers)
- `Any()` 및 `All()`
- 여러 값 반환 (튜플)
- 임의로 큰 정수
- 키워드 인수(Keyword arguments)
- 세트(Sets)
- 문자열 연결(Joining strings)
- 문자열 곱하기(Multiplying strings)
- Walrus operator (대입 표현식)
- 문자열 보간(String interpolation)
- 슬라이싱(Slicing)
