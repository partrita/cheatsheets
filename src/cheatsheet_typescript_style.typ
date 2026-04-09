#import "./templates/conf.typ": *

#show: template.with(
  title: "Google TypeScript 스타일 가이드",
  header: [#datetime.today().display()],
  footer: "Google TypeScript Style Guide 요약",
)

= 1. 명명 규칙 (Naming)

- #highlight[클래스/인터페이스/데코레이터]: `UpperCamelCase`
- #highlight[함수/변수/매개변수/속성]: `lowerCamelCase`
- #highlight[상수]: `UPPER_SNAKE_CASE` (단, `const`가 항상 상수는 아님에 유의)
- #highlight[타입 변수]: `T` (단일 대문자)
- #highlight[파일 이름]: `my-file.ts` (kebab-case)

= 2. 포매팅 (Formatting)

- #highlight[들여쓰기]: 공백 2개
- #highlight[줄 길이]: 최대 80자 (선택사항, 100~120자도 흔히 사용됨)
- #highlight[세미콜론]: 필수 사용
- #highlight[따옴표]: 작은따옴표(`'`) 사용 (필요한 경우 템플릿 리터럴 사용)
- #highlight[중괄호]: 시작 brace `{` 앞에 줄 바꿈 금지

= 3. 언어 기능 (Language Features)

- #highlight[변수 선언]: `const`를 기본으로 사용, 재할당이 필요한 경우만 `let` 사용 (`var` 금지).
- #highlight[모듈]: `namespace` 대신 ES6 모듈 (`import`/`export`) 사용.
- #highlight[타입 강제]: `as` 문법보다 타입 어노테이션 사용 선호. `Number()`, `Boolean()` 함수 사용.
- #highlight[배열 리터럴]: `new Array()` 대신 `[]` 사용.
- #highlight[객체 리터럴]: `new Object()` 대신 `{}` 사용. `quoted`와 `unquoted` 키 혼용 금지.

= 4. 프로그래밍 관례

- #highlight[Imports]: `import {Symbol} from '...'` 형식을 선호하며, 절대 경로보다 상대 경로(`./foo`) 권장.
- #highlight[Exports]: `default export` 금지, 반드시 명명된 내보내기(`named export`) 사용.
- #highlight[Classes]: 생성자에서 필드 초기화 시 `parameter properties`(`constructor(private readonly x: T)`) 사용 권장.
- #highlight[Null vs Undefined]: 명확한 이유가 없다면 `undefined` 사용 (null은 API 연동 등 특정 경우만).
- #highlight[Decorators]: 실험적 기능임을 인지하고 사용.
