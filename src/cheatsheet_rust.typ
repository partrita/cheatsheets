#import "./templates/conf.typ": *

#show: template.with(
  title: "Rust 치트시트 (심화)",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 변수, 스칼라 & 컴파운드 타입

- *변수*: `let x = 5;` (불변), `let mut y = 10;` (가변).
- *섀도잉*: `let x = x + 1;` 새로운 변수를 선언하여 이전 변수를 가림.
- *상수*: `const MAX_POINTS: u32 = 100_000;` 타입 명시 필수.
- *스칼라 타입*:
  - 정수: `i8`..`i128`, `u8`..`u128`, `isize`, `usize`.
  - 부동소수점: `f32`, `f64`.
  - 불리언: `bool` (`true`, `false`).
  - 문자: `char` (4바이트 유니코드).
- *컴파운드 타입*:
  - 튜플: `let tup: (i32, f64, u8) = (500, 6.4, 1);`, `tup.0`으로 접근.
  - 배열: `let a: [i32; 5] = [1, 2, 3, 4, 5];` 고정 크기, 스택 할당.

= 2. 제어 흐름

- *if-else*: `if ... else if ... else { ... }`. `if`는 표현식이므로 `let x = if c { 5 } else { 6 };` 가능.
- *루프*:
  - `loop { ... }`: 무한 루프. `break`로 값 반환 가능: `let result = loop { break 10; };`.
  - `while condition { ... }`
  - `for element in collection { ... }`: `for x in 0..10 { ... }`

= 3. 소유권, 참조, 슬라이스

- *소유권 규칙*:
  1. 모든 값은 소유자(owner) 변수를 가짐.
  2. 한 번에 단 한 명의 소유자만 있음.
  3. 소유자가 스코프를 벗어나면 값은 `drop`됨.
- *이동 (Move)*: 스택에만 있는 데이터(e.g., `i32`)는 복사, 힙 데이터(e.g., `String`)는 소유권 이동.
- *클론 (Clone)*: `let s2 = s1.clone();` 힙 데이터의 깊은 복사.
- *참조와 대여 (References & Borrowing)*:
  - `&T`: 불변 참조. 여러 개 존재 가능.
  - `&mut T`: 가변 참조. 오직 하나만 존재 가능.
  - 불변 참조와 가변 참조는 공존할 수 없음.
  - `let r1 = &s; let r2 = &s;` (O)
  - `let r1 = &mut s; let r2 = &mut s;` (X)
- *슬라이스 (Slices)*: 컬렉션의 일부를 소유권 없이 참조. `&str`, `&[i32]`.

= 4. 구조체 (Structs)

- *정의*: `struct User { username: String, email: String, active: bool }`
- *인스턴스화*: `let user1 = User { email: String::from("..."), ... };`
- *튜플 구조체*: `struct Color(i32, i32, i32);`
- *유닛 라이크 구조체*: `struct AlwaysEqual;`
- *메서드*: `impl User { fn new(...) -> User { ... } fn describe(&self) { ... } }`
  - `&self`: 불변으로 빌림, `&mut self`: 가변으로 빌림, `self`: 소유권 가져옴.
- *연관 함수 (Associated Functions)*: `impl` 블록 내에 있지만 `self`를 받지 않는 함수. `String::from`처럼 `::`으로 호출.

#pagebreak()

= 5. 열거형 (Enums) 및 패턴 매칭

- *정의*: `enum Message { Quit, Move { x: i32, y: i32 }, Write(String), ChangeColor(i32, i32, i32), }`
- *Option<T>*: `enum Option<T> { Some(T), None, }` 값이 있거나 없음을 표현.
- *match*: 모든 경우를 처리해야 하는 강력한 제어 흐름 연산자.
  ```rust
  match option_value {
      Some(i) if i > 5 => println!("Greater than 5"), // 매치 가드
      Some(i) => println!("Got an int: {}", i),
      None => println!("It's None"),
  }
  ```
- *if let*: 하나의 패턴만 매칭할 때 사용.
  `if let Some(value) = option_value { ... }`
- *while let*: 루프가 패턴에 맞는 동안 계속 실행.

= 6. 패키지, 크레이트, 모듈

- *크레이트 (Crate)*: 라이브러리(`lib.rs`) 또는 실행 파일(`main.rs`).
- *패키지 (Package)*: 하나 이상의 크레이트를 포함. `Cargo.toml`로 관리.
- *모듈 (Module)*: `mod` 키워드로 코드를 그룹화. `super`로 부모 모듈 참조.
- *경로 (Path)*:
  - `use std::collections::HashMap;`: 절대 경로.
  - `use self::kinds::PrimaryColor;`: 상대 경로.
  - `use std::io::{self, Write};`: 중첩 경로.
  - `use std::collections::*;`: Glob 연산자.

= 7. 주요 컬렉션

- *벡터 (Vector)*: `Vec<T>`. `let v: Vec<i32> = Vec::new();` `let v = vec![1, 2, 3];`
- *문자열 (String)*: `String`. UTF-8 인코딩, 힙 할당.
- *해시맵 (HashMap)*: `HashMap<K, V>`. `use std::collections::HashMap;`

= 8. 에러 처리

- *panic!*: 복구 불가능한 에러. 프로그램을 즉시 종료.
- *Result<T, E>*: 복구 가능한 에러. `enum Result<T, E> { Ok(T), Err(E), }`
- *`?` 연산자*: `Result`를 반환하는 함수 내에서 에러 전파를 단순화. `Err`일 경우 즉시 반환.
  ```rust
  fn read_username_from_file() -> Result<String, io::Error> {
      let mut f = File::open("hello.txt")?;
      let mut s = String::new();
      f.read_to_string(&mut s)?;
      Ok(s)
  }
  ```

= 9. 제네릭, 트레잇, 라이프타임

- *제네릭 (Generics)*: `fn largest<T: PartialOrd + Copy>(list: &[T]) -> T { ... }`
- *트레잇 (Traits)*: 특정 타입이 가질 수 있는 공유 동작을 정의. (인터페이스와 유사)
  ```rust
  pub trait Summary {
      fn summarize(&self) -> String;
  }
  impl Summary for NewsArticle { ... }
  ```
- *라이프타임 (Lifetimes)*: 참조가 유효한 스코프를 명시하여 댕글링 포인터를 방지.
  `fn longest<'a>(x: &'a str, y: &'a str) -> &'a str { ... }`

= 10. 스마트 포인터

- `Box<T>`: 힙에 값을 할당.
- `Rc<T>`: 다중 소유권을 가능하게 하는 참조 카운팅 스마트 포인터. (단일 스레드)
- `Arc<T>`: `Rc<T>`의 원자적(스레드 안전) 버전.
- `RefCell<T>`/`Mutex<T>`: 내부 가변성(interior mutability) 패턴을 제공. 런타임에 빌림 규칙을 검사.
