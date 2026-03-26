#import "./templates/conf.typ": *

#show: template.with(
  title: "Python 치트시트",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 기본 데이터 타입 및 구조

- 숫자형: `int`, `float`, `complex` (복소수)
- 시퀀스 타입:
  - `str`: 불변(immutable) 문자열. `f"name: {name}"` (f-string), `"a" + "b"` (연결), `"a" * 3` (반복)
  - `list`: 가변(mutable) 리스트. `[1, "apple", 3.5]`
  - `tuple`: 불변(immutable) 튜플. `(1, "apple", 3.5)`
- 매핑 타입:
  - `dict`: 키-값 쌍. `{"key": "value", "name": "John"}`
- 집합 타입:
  - `set`: 중복 없는 순서 없는 컬렉션. `{1, 2, 3}`. 합집합(`|`), 교집합(`&`), 차집합(`-`)
  - `frozenset`: 불변 집합

= 2. 제어 흐름

- if-elif-else: 조건문
- for 루프:
  - `for item in iterable: ...`
  - `for i, value in enumerate(my_list): ...`
- while 루프: `while condition: ...`
- 루프 제어: `break` (종료), `continue` (다음 반복), `else` (정상 완료 시 실행)
- try-except-else-finally: 예외 처리
  ```python
  try:
      # 실행할 코드
      result = 10 / x
  except ZeroDivisionError as e:
      print(f"Error: {e}")
  except TypeError:
      print("Type error!")
  else:
      print("No errors occurred.")
  finally:
      print("This always runs.")
  ```
- with 문: 컨텍스트 관리자. 자원(파일, 락 등)의 안전한 사용 및 자동 해제
  `with open("file.txt", "r") as f: ...`

= 3. 함수

- 정의: `def func_name(pos_arg, key_arg="default"): ...`
- 인수 종류:
  - 위치 인수 (Positional): 순서대로 전달
  - 키워드 인수 (Keyword): `name=value` 형태로 전달
  - 기본값 인수 (Default): 호출 시 생략 가능
  - 가변 위치 인수 (`*args`): 다수의 위치 인수를 튜플로 수신
  - 가변 키워드 인수 (`**kwargs`): 다수의 키워드 인수를 딕셔너리로 수신
- 람다 함수 (Lambda): 한 줄 익명 함수. `lambda args: expression`
- 타입 힌트 (Type Hints):
  ```python
  def greet(name: str) -> str:
      return f"Hello, {name}"
  ```
- 데코레이터 (Decorators): 코드 수정 없이 기능 추가. `@` 구문 사용
  ```python
  def my_decorator(func):
      def wrapper(*args, **kwargs):
          print("Before call")
          result = func(*args, **kwargs)
          print("After call")
          return result
      return wrapper

  @my_decorator
  def say_hello():
      print("Hello!")
  ```

= 4. 컴프리헨션 및 제너레이터

- 리스트 컴프리헨션: `[expr for item in iterable if cond]`
- 딕셔너리 컴프리헨션: `{k_expr: v_expr for item in iterable if cond}`
- 집합 컴프리헨션: `{expr for item in iterable if cond}`
- 제너레이터 표현식: `(expr for item in iterable if cond)`
  - 메모리 효율적. 항목을 하나씩 생성
- 제너레이터 함수: `yield` 키워드 사용
  ```python
  def count_up_to(max):
      count = 1
      while count <= max:
          yield count
          count += 1
  ```

= 5. 클래스와 객체 (OOP)

- 정의: `class MyClass: ...`
- 생성자: `def __init__(self, ...): ...`
- 인스턴스 메서드: 첫 인수로 `self` 수신
- 상속: `class SubClass(SuperClass): ...`
- `super()`: 부모 클래스 메서드 호출

= 6. 모듈과 패키지

- `import module_name`: 모듈 임포트
- `from module_name import function_name`: 특정 기능 임포트
- `from module_name import function_name as fn`: 별칭 사용
- `import package_name.module_name`: 패키지 내 모듈 임포트

= 7. 표준 라이브러리 및 Pip

- 주요 모듈: `os`, `sys`, `datetime`, `math`, `random`, `json`
- Pip (패키지 관리):
  - 설치: `pip install <package>`
  - 제거: `pip uninstall <package>`
  - 목록: `pip list`
  - 요구사항 파일 설치: `pip install -r requirements.txt`
  - 요구사항 파일 생성: `pip freeze > requirements.txt`

= 8. 정규 표현식 (Regex)

```python
import re
<str>   = re.sub(r'<regex>', new, text, count=0)  # 패턴 대체
<list>  = re.findall(r'<regex>', text)            # 모든 일치 항목 반환
<list>  = re.split(r'<regex>', text, maxsplit=0)  # 패턴 기준으로 분할
<Match> = re.search(r'<regex>', text)             # 첫 번째 일치 항목 탐색
<Match> = re.match(r'<regex>', text)              # 시작 부분 일치 확인
<iter>  = re.finditer(r'<regex>', text)           # 모든 일치 항목을 반복자로 반환
```
- `re.IGNORECASE`, `re.MULTILINE`, `re.DOTALL` 플래그 지원

== Match 객체
```python
<str>   = <Match>.group()      # 전체 일치 항목
<str>   = <Match>.group(1)     # 첫 번째 캡처 그룹
<tuple> = <Match>.groups()     # 모든 캡처 그룹을 튜플로 반환
<int>   = <Match>.start()      # 일치 시작 인덱스
<int>   = <Match>.end()        # 일치 종료 인덱스 (제외)
```

== 특수 시퀀스
- `\d`: 숫자 `[0-9]`
- `\w`: 단어 문자 `[a-zA-Z0-9_]`
- `\s`: 공백 문자 `[ \t\n\r\f\v]`
- 대문자(`\D`, `\W`, `\S`)는 부정(Not) 의미

= 9. 열거형 (Enum)

명명된 상수 집합을 정의하는 클래스
```python
from enum import Enum, auto

class <name>(Enum):
    <member> = auto()      # 자동 증가 값 할당
    <member> = <value>     # 명시적 값 할당
```
- 멤버 접근: `<enum>.<member>`, `<enum>['<member>']`, `<enum>(<value>)`
- 멤버 속성: `<member>.name`, `<member>.value`

= 10. 덕 타이핑 (Duck Types)

암시적 타입 시스템. 특정 메서드가 정의된 객체는 해당 타입의 멤버로 간주

== 비교 가능 (Comparable)
- `__eq__(self, other)`: `==` 연산자 정의. 기본값은 `self is other`

== 해시 가능 (Hashable)
- `__hash__` 및 `__eq__` 필수. 불변 해시 값 유지

== 정렬 가능 (Sortable)
- `functools.total_ordering` 사용 시 `__eq__`와 하나의 비교 메서드(`__lt__` 등)만으로 전체 비교 연산자 생성

== 이터레이터 (Iterator)
- `__next__` (다음 항목 반환/StopIteration 발생) 및 `__iter__` (자신 반환) 정의

== 컨텍스트 관리자 (Context Manager)
- `__enter__` (자원 획득) 및 `__exit__` (자원 해제) 정의. `with` 문에서 사용

= 11. 시스템 및 데이터 처리

== 경로 (Paths)
```python
import os
from pathlib import Path

# 작업 디렉토리
path_str = os.getcwd()
path_obj = Path.cwd()

# 경로 결합
full_path = os.path.join(path_str, 'dir', 'file.txt')
full_path_obj = path_obj / 'dir' / 'file.txt'

# 목록 확인
file_list = os.listdir(path_str)
path_iter = path_obj.iterdir()
```

== JSON
```python
import json
<str>  = json.dumps(<coll>)    # 컬렉션을 JSON 문자열로 변환
<coll> = json.loads(<str>)     # JSON 문자열을 컬렉션으로 변환
```

== Pickle
바이너리 객체 직렬화
```python
import pickle
<bytes>  = pickle.dumps(<obj>)   # 객체를 바이트로 변환
<obj>    = pickle.loads(<bytes>) # 바이트를 객체로 변환
```

== SQLite
내장 데이터베이스 엔진
```python
import sqlite3
conn = sqlite3.connect('example.db')
cursor = conn.execute('SELECT * FROM stocks')
rows = cursor.fetchall()
conn.close()
```

= 12. 고급 주제

== 로깅 (Logging)
```python
import logging
logging.basicConfig(level=logging.INFO, filename='app.log',
                    format='%(name)s - %(levelname)s - %(message)s')
logging.warning('Message')
```

== 코루틴 / Asyncio
```python
import asyncio

async def main():
    print('Hello')
    await asyncio.sleep(1)
    print('World')

asyncio.run(main())
```

== 메타클래스 (Metaclasses)
```python
class SingletonMeta(type):
    _instances = {}
    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super().__call__(*args, **kwargs)
        return cls._instances[cls]

class Database(metaclass=SingletonMeta): pass
```

== 데이터 클래스
```python
from dataclasses import dataclass, field
from typing import List, Optional

@dataclass
class Task:
    id: int
    name: str
    dependencies: List[int] = field(default_factory=list)
```

== 성능 최적화
```python
# 메모이제이션
from functools import lru_cache
@lru_cache(maxsize=128)
def fib(n): ...

# 메모리 최적화
class Point:
    __slots__ = ['x', 'y']
```

