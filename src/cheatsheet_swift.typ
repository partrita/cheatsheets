#import "./templates/conf.typ": *

#show: template.with(
  title: "Swift 치트시트 ",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 기본: 상수, 변수, 타입

- 상수/변수: `let` (상수), `var` (변수). 타입 추론 지원.
- 타입 명시: `var welcomeMessage: String`
- 데이터 타입: `Int`, `Double`, `Float`, `Bool`, `String`, `Character`.
- 튜플: `let http404Error = (404, "Not Found")`
- 타입 별칭: `typealias AudioSample = UInt16`

= 2. 옵셔널 (Optionals)

값 부재 가능성 안전 처리 핵심 기능.
- 선언: `var optionalString: String? = "Hello"`
- 강제 언래핑: `optionalString!` (주의: nil 시 런타임 에러 발생)
- 옵셔널 바인딩:
  ```swift
  if let constantName = someOptional {
      // 값 존재 시 constantName 할당 사용
  }
  ```
- 가드 구문:
  ```swift
  guard let constantName = someOptional else {
      // nil 시 실행 블록 (return, throw 필수)
      return
  }
  // 이후 constantName 사용 가능
  ```
- Nil-Coalescing 연산자: `a ?? b` (a 비 nil 시 언래핑 값, nil 시 b 반환)
- 옵셔널 체이닝: `resident?.printNumberOfRooms()`
- 암시적 언래핑 옵셔널: `var assumedString: String!` (선언 후 즉시 할당 확실 시 사용)

= 3. 컬렉션 타입

- 배열 (Array): `var shoppingList: [String] = ["Eggs", "Milk"]`
- 집합 (Set): `var favoriteGenres: Set<String> = ["Rock", "Classical"]`
- 딕셔너리 (Dictionary): `var airports: [String: String] = ["YYZ": "Toronto Pearson"]`

= 4. 제어 흐름

- for-in: `for item in shoppingList { ... }`
- while: `while condition { ... }`
- repeat-while: `do-while` 유사.
- if-else: `if ... else if ... else { ... }`
- switch: `break` 불필요, 모든 케이스 처리 필수.
  ```swift
  switch someValue {
  case 1:
      // ...
  case 2...5: // 범위 매칭
      // ...
  case let (x, 0): // 튜플 및 값 바인딩
      // ...
  case let (x, y) where x == y: // where 절
      // ...
  default:
      // ...
  }
  ```

= 5. 함수와 클로저

- 함수: `func greet(person: String, from hometown: String) -> String { ... }`
  - `_` : 인수 레이블 생략.
- 가변 매개변수: `func arithmeticMean(_ numbers: Double...) -> Double`
- in-out 매개변수: `func swapTwoInts(_ a: inout Int, _ b: inout Int)`
- 함수 타입: `(Int, Int) -> Int`
- 클로저: 이름 없는 코드 블록.
  - `reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })`
  - 타입 추론: `names.sorted(by: { s1, s2 in s1 > s2 })`
  - 단축 인수 이름: `names.sorted(by: { $0 > $1 })`
  - 연산자 메서드: `names.sorted(by: >)`
- 후행 클로저: 마지막 인수가 클로저일 때 `()` 외부 작성 가능.
- `@escaping` 클로저: 함수 반환 후 호출 필요 시 사용.

= 6. 구조체와 클래스

- 공통점: 프로퍼티, 메서드, 서브스크립트, 초기화 정의 가능.
- 차이점:
  - 클래스: 상속, 타입 캐스팅, 소멸자(`deinit`), 참조 카운팅 지원.
  - 구조체: 상속 불가.
  - 핵심 차이: 클래스는 *참조 타입*, 구조체/열거형은 *값 타입*(전달 시 복사).

= 7. 프로퍼티와 메서드

- 저장 프로퍼티: 값 저장.
- 연산 프로퍼티: 값 계산. `get`/`set` 보유.
- 프로퍼티 옵저버: `willSet`, `didSet`.
- 타입 프로퍼티: `static` 키워드. 타입 자체에 속함.
- 타입 메서드: `static` 또는 `class` 키워드.

= 8. 프로토콜 (Protocols)

- 작업/기능 청사진. `protocol SomeProtocol { ... }`
- 채택: `struct SomeStructure: FirstProtocol, AnotherProtocol { ... }`
- 합성: `SomeProtocol & AnotherProtocol`
- 확장: 메서드/연산 프로퍼티 기본 구현 제공.

= 9. 에러 처리

- Error 프로토콜: 에러 타입 정의. `enum VendingMachineError: Error { ... }`
- Throwing Functions: `func canThrowErrors() throws -> String`
- 처리 방법:
  1. `do-catch`: `do { try expression } catch pattern { ... }`
  2. `try?`: 결과를 옵셔널 변환. 에러 시 `nil`.
  3. `try!`: 에러 미발생 확신 시 사용. 에러 시 런타임 에러.
- `defer`: 스코프 종료 직전 실행 코드 블록.

= 10. 비동기 (Concurrency)

- `async`/`await`: 비동기 코드 순차 작성 지원.
  ```swift
  func fetchWeatherHistory() async -> [Double] {
      // ...
  }
  let history = await fetchWeatherHistory()
  ```
- 비동기 시퀀스: `for await ... in`
- Task: 비동기 작업 생성/관리.
- Actor: 데이터 경쟁 방지 참조 타입. `actor TemperatureLogger { ... }`

= 11. 자동 참조 카운팅 (ARC)

- 메모리 사용 추적 및 관리.
- 강한 참조 사이클: 인스턴스 간 상호 참조로 해제 불가한 문제.
- 해결책:
  - `weak`: 참조 대상 생명주기 짧을 때 사용. 항상 옵셔널.
  - `unowned`: 참조 대상 생명주기 같거나 길 때 사용.
  - 클로저 강한 참조 사이클: 캡처 리스트(`[weak self]`, `[unowned self]`) 사용.
