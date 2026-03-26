#import "./templates/conf.typ": *

#show: template.with(
  title: "Python 주요 유용한 기능 8가지",
  header: [#datetime.today().display()],
  footer: "https://dev.to/renegadecoder94/8-coolest-python-programming-language-features-58i9",
)

= 리스트 컴프리헨션(List Comprehensions)

리스트를 편리하게 생성하는 방법.

```python
# 0-9 포함 리스트 생성
[i for i in range(10)]

# 0-9 중 짝수 포함 리스트 생성
[i for i range(10) if i % 2 == 0]

# 1-10 포함 리스트 생성
[i + 1 for i in range(10)]

# 0 ~ -9 포함 리스트 생성
[-i for i in range(10)]

# 0-9 가능한 모든 쌍 생성
[(a, b) for a in range(10) for b in range(10)]

# 리스트 얕은 복사
my_list = [1, 3, 5, 7, 9]
[item for item in my_list]
```


= 제너레이터 표현식(Generator Expressions)

메모리 효율적. 항목을 하나씩 생성하며 실제 리스트는 생성하지 않음.

```python
# 0-9 생성
(i for i in range(10)])

# 0-9 중 짝수 생성
(i for i range(10) if i % 2 == 0)

# 1-10 생성
(i + 1 for i in range(10)])

# 0 ~ -9 생성
(-i for i in range(10))

# 0-9 가능한 모든 쌍 생성
((a, b) for a in range(10) for b in range(10))

# 리스트 얕은 복사본 생성
my_list = [1, 3, 5, 7, 9]
(item for item in my_list)
```

= 슬라이스 할당(Slice Assignment)

리스트 특정 영역을 한 줄로 교체 가능.

```python
my_list = [1, 2, 3]

# 슬라이스 할당으로 리스트 추가
my_list[len(my_list):] = [4]

# 리스트 앞 추가
my_list[:0] = [0]

# 중간 요소 대체
midpoint = len(my_list) // 2
my_list[midpoint: midpoint + 1] = [-2]

# 임의 하위 섹션 대체
my_list[:2] = [3, 4, 5]
```

= 이터러블 언패킹 (Iterable Unpacking)

리스트를 여러 조각으로 분리.

```python
my_list = [1, 2, 3]
*remainder, last_item = my_list
```

= 음수 인덱싱(Negative Indexing)

리스트 마지막 요소 등에 우아하게 접근.

```python
my_list = [1, 2, 3]
last_item = my_list[-1]
```
= 딕셔너리 컴프리헨션(Dictionary Comprehensions)

한 줄 코드로 딕셔너리 생성.

```python
# 숫자-문자 딕셔너리 생성
{num: chr(65 + num) for num in range(5)}

# zip 활용 생성
nums = [1, 2, 3, 4, 5]
letters = ["A", "B", "C", "D", "E"]
{num: letter for num, letter in zip(nums, letters)}
```
= 비교 연결(Chaining Comparisons)

여러 비교 연산 동시 수행.

```python
# 예시
5 < 10 < 15
```
= f-문자열(f-Strings)

직관적인 문자열 포맷팅 지원.

```python
age = 25
name = 'Jeremy'
print(f'My name is {name}, and I am {age}')
```

= 기타 유용한 기능

- For/Else 루프
- 허수(Imaginary numbers)
- `Any()` 및 `All()`
- 튜플 이용 여러 값 반환
- 임의 정밀도 정수
- 키워드 인수(Keyword arguments)
- 세트(Sets)
- 문자열 연결/복사
- 대입 표현식(Walrus operator)
- 슬라이싱(Slicing)
