#import "../templates/conf.typ": *

#show: template.with(
  title: "TypeScript 스타일 가이드",
  header: [#datetime.today().display()],
  footer: "Google TypeScript 스타일 가이드 기반",
)

= 핵심 원칙

- *안전성과 명확성*: 읽기 쉽고 런타임 에러를 최소화하는 코드를 우선시합니다.
- *엄격함*: `tsconfig.json`에서 `strict: true`를 항상 활성화합니다.
- *현대성*: 최신 안정 버전의 ECMAScript 기능과 ES 모듈을 사용합니다.

= 명명 규칙 (Naming Conventions)

- *클래스, 인터페이스, 열거형(Enum)*: `UpperCamelCase`.
- *변수, 함수, 메서드, 속성*: `lowerCamelCase`.
- *상수*: `UPPER_SNAKE_CASE` (불변의 값에만 사용).
- *파일 이름*: `kebab-case.ts` (예: `user-profile.ts`).
- *접두사 금지*: 인터페이스에 `I` 접두사를 사용하지 않습니다 (`IUser` 대신 `User` 사용).

= 언어 기능 및 구문

- *변수 선언*: 기본적으로 `const`를 사용합니다. 재할당이 필요한 경우에만 `let`을 사용하며, `var`는 절대 사용하지 않습니다.
- *세미콜론*: 일관성과 모호성 제거를 위해 필수적으로 사용합니다.
- *따옴표*: 문자열에는 작은따옴표(`'`)를 선호합니다. 템플릿 리터럴에는 백틱을 사용합니다.
- *중괄호*: 여는 중괄호 `{` 앞에 줄바꿈을 하지 않습니다.
- *모듈*: 항상 ES6 `import`/`export`를 사용합니다. `namespace`와 `module` 키워드는 피합니다.

= 필수 타입 (Essential Types)

- *`any`*: 사용하지 마십시오. 대신 `unknown`이나 구체적인 유니온 타입을 사용합니다.
- *`unknown`*: 타입을 알 수 없는 값에 사용하며, 사용 전 타입 좁히기(narrowing)가 필요합니다.
- *`never`*: 절대 반환되지 않는 함수나 철저한(exhaustive) 스위치 검사에 사용합니다.
- *배열*: `Array<T>`보다 `T[]` 형식을 선호합니다 (예: `string[]`).
- *Boolean/Number 함수*: `!!x`나 `+x` 대신 `Boolean(x)`와 `Number(x)`를 사용하여 명시적으로 변환합니다.

= 인터페이스 vs 타입 별칭 (Type Aliases)

- *인터페이스*: 객체의 구조를 정의할 때 사용하며, 특히 확장이나 구현이 필요한 경우에 적합합니다.
- *타입 별칭*: 유니온, 인터섹션, 또는 기본 타입의 별칭을 만들 때 사용합니다.
- *일관성*: 일관된 에러 보고를 위해 가능한 경우 `interface`를 선호합니다.

= 클래스와 생성자

- *가시성*: `public`, `protected`, `private`을 항상 명시적으로 선언합니다 (또는 `#`를 사용하여 런타임 비공개 필드 사용).
- *매개변수 속성*: 생성자에서 간단한 초기화를 위해 사용합니다.
  ```typescript
  constructor(private readonly logger: Logger) {}
  ```
- *생성자 내 로직 지양*: 생성자는 간단하게 유지하고, 복잡한 설정은 별도의 초기화 메서드에서 처리합니다.

= 임포트와 익스포트 (Imports and Exports)

- *이름 지정 익스포트 (Named Exports)*: `default export`를 피합니다. 검색과 리팩토링이 용이한 이름 지정 익스포트를 사용합니다.
  ```typescript
  // 권장
  export class MyClass {}
  // 비권장
  export default class MyClass {}
  ```
- *상대 경로*: 동일 프로젝트 내의 로컬 임포트에는 상대 경로(`./foo`)를 권장합니다.

= 현대적인 관례

- *널 병합 연산자 (`??`)*: `0`이나 `false`를 안전하게 처리하기 위해 `||` 대신 사용합니다.
- *옵셔널 체이닝 (`?.`)*: 깊은 속성에 안전하게 접근합니다.
- *Null vs Undefined*: "값이 없음"을 나타내는 기본 상태로 `undefined`를 사용합니다. `null`은 외부 API에서 요구하는 경우에만 사용합니다.

= 권장 모범 사례

- *Non-null 단언 금지*: `!` 사용을 최소화합니다. 대신 `if` 체크나 옵셔널 체이닝을 사용합니다.
- *철저한 검사 (Exhaustive Checks)*: `switch`문의 `default` 케이스에서 `never` 타입을 사용하여 모든 케이스가 처리되었는지 확인합니다.
- *불변성*: 속성에는 `readonly`를, 배열에는 `ReadonlyArray<T>`를 사용하여 의도치 않은 변경을 방지합니다.
- *데코레이터*: 실험적인 기능이므로 주의해서 사용합니다.
