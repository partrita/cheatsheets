#import "./templates/conf.typ": *

#show: template.with(
  title: "Python 타입 힌트 치트시트",
  header: [#datetime.today().display()],
  footer: "https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html",
)

= 변수

mypy는 값으로부터 타입을 추론하므로 대부분의 어노테이션은 선택사항임. 상세 내용은 공식 문서 참조.

```python
# 변수 타입 선언
age: int = 1

# 초기화 없이 어노테이션 가능
a: int  # Ok (할당 전까지 런타임 값 없음)

# 조건부 분기 시 유용
child: bool
if age < 18:
    child = True
else:
    child = False
```

= 유용한 내장 타입

```python
# 대부분 내장 타입 이름 그대로 사용 가능
x: int = 1
x: float = 1.0
x: bool = True
x: str = "test"
x: bytes = b"test"

# Python 3.9+: 컬렉션 아이템 타입 괄호 사용
x: list[int] = [1]
x: set[int] = {6, 7}

# 매핑: 키/값 타입 모두 필요
x: dict[str, float] = {"field": 2.0}

# 고정 크기 튜플: 모든 요소 타입 지정
x: tuple[int, str, float] = (3, "yes", 7.5)

# 가변 크기 튜플: 생략 부호(...) 사용
x: tuple[int, ...] = (1, 2, 3)

# Python 3.8 이전: typing 모듈 대문자 타입 사용
from typing import List, Set, Dict, Tuple
x: List[int] = [1]
x: Set[int] = {6, 7}
x: Dict[str, float] = {"field": 2.0}
x: Tuple[int, str, float] = (3, "yes", 7.5)
x: Tuple[int, ...] = (1, 2, 3)

from typing import Union, Optional

# Python 3.10+: | 연산자 사용 (Union 대체)
x: list[int | str] = [3, 5, "test", "fun"]

# Optional[X]: X | None과 동일
x: Optional[str] = "something" if some_condition() else None
if x is not None:
    # None 아님을 자동 추론
    print(x.upper())

# 로직상 None 불가 확신 시 assert 사용
assert x is not None
print(x.upper())
```

= 함수

```python
from typing import Callable, Iterator, Union, Optional

# 함수 정의 어노테이션
def stringify(num: int) -> str:
    return str(num)

# 여러 인수 지정
def plus(num1: int, num2: int) -> int:
    return num1 + num2

# 반환값 없을 시 None 사용. 기본값은 어노테이션 뒤 위치.
def show(value: str, excitement: int = 10) -> None:
    print(value + "!" * excitement)

# 어노테이션 미지정 함수는 Any 처리되어 검사 생략됨
def untyped(x):
    x.anything() + 1 + "string"  # 오류 미발생

# 호출 가능(Callable) 값 어노테이션
x: Callable[[int, float], float] = f
def register(callback: Callable[[str], int]) -> None: ...

# 제너레이터 함수: 이터레이터 반환으로 어노테이션
def gen(n: int) -> Iterator[int]:
    i = 0
    while i < n:
        yield i
        i += 1

# 위치 전용 및 키워드 전용 인수 이해
def quux(x: int, /, *, y: int) -> None:
    pass

quux(3, y=5)  # Ok
quux(3, 5)    # error: 위치 인수 과다
quux(x=3, y=5) # error: 예상치 못한 키워드 인수 'x'

# 가변 인수 타입 지정
def call(self, *args: str, **kwargs: str) -> str:
    reveal_type(args)   # tuple[str, ...]
    reveal_type(kwargs) # dict[str, str]
    return self.do_api_query(make_request(*args, **kwargs))
```

= 클래스

```python
class BankAccount:
    # __init__ 반환 타입은 항상 None
    def __init__(self, account_name: str, initial_balance: int = 0) -> None:
        # 매개변수 기반 타입 자동 추론
        self.account_name = account_name
        self.balance = initial_balance

    # self 타입은 생략
    def deposit(self, amount: int) -> None:
        self.balance += amount

# 사용자 정의 클래스 타입 유효
account: BankAccount = BankAccount("Alice", 400)

# 서브클래스도 타입 호환됨
class AuditedBankAccount(BankAccount):
    audit_log: list[str] # 인스턴스 변수 명시적 선언 가능

    def __init__(self, account_name: str, initial_balance: int = 0) -> None:
        super().__init__(account_name, initial_balance)
        self.audit_log: list[str] = []

    def deposit(self, amount: int) -> None:
        self.audit_log.append(f"Deposited {amount}")
        self.balance += amount

audited = AuditedBankAccount("Bob", 300)
transfer(audited, account, 100)  # 통과

# ClassVar: 클래스 변수 선언
class Car:
    seats: ClassVar[int] = 4

# 동적 속성: __setattr__, __getattr__ 오버라이드
class A:
    def __setattr__(self, name: str, value: int) -> None: ...
    def __getattr__(self, name: str) -> int: ...
```

= 복잡한 상황 대응

```python
from typing import Union, Any, Optional, TYPE_CHECKING, cast

# reveal_type(): 추론 타입 확인용 (디버깅용)
reveal_type(1)  # builtins.int

# 빈 컨테이너/None 초기화 시 타입 명시 권장
x: list[str] = []
x: Optional[str] = None

# 타입 불분명/동적일 때 Any 사용 (검사 생략)
x: Any = mystery_function()

# 특정 줄 검사 억제: # type: ignore
x = confusing_function()  # type: ignore

# cast: 타입 강제 지정 (런타임 영향 없음)
a = [4]
b = cast(list[int], a)

# TYPE_CHECKING: 타입 검사 시에만 실행되는 블록
if TYPE_CHECKING:
    import json
else:
    import orjson as json
```

= 표준 덕 타입 (Duck Typing)

```python
from typing import Mapping, MutableMapping, Sequence, Iterable

# Iterable: 반복 가능 객체 (for 루프용)
# Sequence: 인덱싱/길이 지원 객체 (list, tuple 등)
def f(ints: Iterable[int]) -> list[str]:
    return [str(x) for x in ints]

# Mapping: 읽기 전용 dict-like
# MutableMapping: 수정 가능 dict-like
def f(m: Mapping[int, str]): ...
def f(m: MutableMapping[int, str]): ...

from typing import IO
# 파일 스트림 객체: IO[str] 또는 IO[bytes] 사용
def get_sys_IO(mode: str = 'w') -> IO[str]: ...
```

= 전방 참조 (Forward References)

```python
# 클래스 정의 전 참조 시 따옴표 사용 또는 __future__ 임포트
from __future__ import annotations

def f(foo: A) -> int: # Ok
    ...

class A:
    @classmethod
    def create(cls) -> A: ...
```
