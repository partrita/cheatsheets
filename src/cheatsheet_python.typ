#import "./templates/conf.typ": *

#show: template.with(
  title: "Python 치트시트 (심화)",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 기본 데이터 타입 및 구조

- 숫자형: `int`, `float`, `complex` (복소수)
- 시퀀스 타입:
  - `str`: 불변(immutable) 문자열. `f"name: {name}"` (f-string), ` "a" + "b" ` (연결), ` "a" * 3 ` (반복).
  - `list`: 가변(mutable) 리스트. `[1, "apple", 3.5]`
  - `tuple`: 불변(immutable) 튜플. `(1, "apple", 3.5)`
- 매핑 타입:
  - `dict`: 키-값 쌍. `{"key": "value", "name": "John"}`
- 집합 타입:
  - `set`: 중복 없는 순서 없는 컬렉션. `{1, 2, 3}`. 합집합(`|`), 교집합(`&`), 차집합(`-`).
  - `frozenset`: 불변 집합.

= 2. 제어 흐름

- if-elif-else: 조건문.
- for 루프:
  - `for item in iterable: ...`
  - `for i, value in enumerate(my_list): ...`
- while 루프: `while condition: ...`
- 루프 제어: `break` (종료), `continue` (건너뛰기), `else` (루프가 정상적으로 완료됐을 때 실행).
- try-except-else-finally: 예외 처리.
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
- with 문: 컨텍스트 관리자. 파일, 락 등 자원을 안전하게 사용하고 자동 해제.
  `with open("file.txt", "r") as f: ...`

= 3. 함수

- 정의: `def func_name(pos_arg, key_arg="default"): ...`
- 인수 종류:
  - `위치 인수 (Positional)`: 순서대로 전달.
  - `키워드 인수 (Keyword)`: `name=value` 형태로 전달.
  - `기본값 인수 (Default)`: 호출 시 생략 가능.
  - `가변 위치 인수 (*args)`: 여러 위치 인수를 튜플로 묶어 받음.
  - `가변 키워드 인수 (**kwargs)`: 여러 키워드 인수를 딕셔너리로 묶어 받음.
- 람다 함수 (Lambda): 한 줄로 된 익명 함수. `lambda args: expression`
- 타입 힌트 (Type Hints):
  `def greet(name: str) -> str: return f"Hello, {name}"`
- 데코레이터 (Decorators): 함수를 수정하지 않고 기능을 추가하는 함수. `@` 구문 사용.
  ```python
  def my_decorator(func):
      def wrapper(*args, **kwargs):
          print("Something is happening before the function is called.")
          result = func(*args, **kwargs)
          print("Something is happening after the function is called.")
          return result
      return wrapper

  @my_decorator
  def say_hello():
      print("Hello!")
  ```



= 4. 컴프리헨션 및 제너레이터

- 리스트 컴프리헨션: `[expression for item in iterable if condition]`
- 딕셔너리 컴프리헨션: `{key_expr: val_expr for item in iterable if condition}`
- 집합 컴프리헨션: `{expression for item in iterable if condition}`
- 제너레이터 표현식: `(expression for item in iterable if condition)`
  - 메모리를 효율적으로 사용. 한 번에 하나의 항목만 생성.
- 제너레이터 함수: `yield` 키워드를 사용하여 함수를 제너레이터로 만듦.
  ```python
  def count_up_to(max):
      count = 1
      while count <= max:
          yield count
          count += 1
  ```

= 5. 객체 지향 프로그래밍 (OOP)

- 클래스 정의:
  ```python
  class MyClass:
      class_variable = "I am a class var"

      def __init__(self, arg1):
          self.instance_variable = arg1

      def instance_method(self):
          return f"Instance method called with {self.instance_variable}"

      @classmethod
      def class_method(cls):
          return f"Class method called with {cls.class_variable}"

      @staticmethod
      def static_method():
          return "Static method called"
  ```
- 상속: `class ChildClass(ParentClass): ...`
- 매직 메서드 (Magic Methods): `__init__`, `__str__`, `__len__`, `__eq__` 등. 특별한 상황에 호출되는 메서드.

= 6. 주요 표준 라이브러리 모듈

- `os`: 운영체제와 상호작용. `os.path.join`, `os.listdir`, `os.system`.
- `sys`: 파이썬 인터프리터 제어. `sys.argv`, `sys.path`, `sys.exit`.
- `json`: JSON 데이터 직렬화/역직렬화. `json.dumps`, `json.loads`.
- `datetime`: 날짜와 시간 처리. `datetime.now`, `timedelta`.
- `collections`: 유용한 자료구조. `Counter`, `defaultdict`, `namedtuple`.
- `re`: 정규 표현식. `re.search`, `re.findall`, `re.sub`.
- `math`: 기본적인 수학 함수. `math.sqrt`, `math.sin`.
- `random`: 난수 생성. `random.choice`, `random.randint`.
- `argparse`: 커맨드라인 인수 파싱.
- `logging`: 로깅 기능.
- `pathlib`: 객체 지향적인 파일 시스템 경로. (`os.path`의 현대적 대안)
- `typing`: 타입 힌트를 위한 지원.

= 7. 가상 환경 및 패키지 관리

- 가상 환경: 프로젝트별로 독립된 Python 환경을 제공.
  - 생성: `python -m venv myenv`
  - 활성화 (Linux/macOS): `source myenv/bin/activate`
  - 활성화 (Windows): `myenv\Scripts\activate`
- pip: Python 패키지 설치 및 관리 도구.
  - 설치: `pip install <package_name>`
  - 제거: `pip uninstall <package_name>`
  - 목록: `pip list`
  - 요구사항 파일로 설치: `pip install -r requirements.txt`
  - 요구사항 파일 생성: `pip freeze > requirements.txt`
