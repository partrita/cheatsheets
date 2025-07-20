#import "./templates/conf.typ": *

#show: template.with(
  title: "JavaScript 치트시트 ",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 변수, 타입, 연산자

- 변수 선언:
  - `var`: 함수 스코프. 호이스팅(hoisting) 발생. 재선언 가능. (사용 지양)
  - `let`: 블록(`{}`) 스코프. 재할당 가능.
  - `const`: 블록 스코프. 재할당 불가능. (객체나 배열의 내용은 변경 가능)
- 데이터 타입:
  - 원시: `String`, `Number`, `Boolean`, `null`, `undefined`, `Symbol`, `BigInt`
  - 객체: `Object` ( `Array`, `Function`, `Date`, `RegExp` 등 포함)
- 연산자:
  - 비교: `==` (동등, 타입 변환 O), `===` (일치, 타입 변환 X) - `===` 사용 권장.
  - 논리: `&&`, `||`, `!`
  - Nullish Coalescing: `a ?? b` (a가 `null` 또는 `undefined`일 때 b 반환, 그 외에는 a)
  - Optional Chaining: `obj?.prop?.method()` (중간에 `null`이나 `undefined`가 있으면 에러 대신 `undefined` 반환)

= 2. 제어 흐름

- `if...else`, `switch`, `for`, `while`, `do...while`
- `for...in`: 객체의 열거 가능한 속성(key)을 순회. (상속된 속성 포함 가능)
- `for...of`: 이터러블 객체(`Array`, `String`, `Map`, `Set` 등)의 값(value)을 순회.

= 3. 함수

- 함수 선언식: `function myFunction() {}` (호이스팅 O)
- 함수 표현식: `const myFunction = function() {};` (호이스팅 X)
- 화살표 함수 (Arrow Function):
  - `const add = (a, b) => a + b;`
  - `this`를 바인딩하지 않음 (상위 스코프의 `this`를 그대로 사용).
  - `arguments` 객체가 없음.
- Default Parameters: `function greet(name = "Guest") {}`
- Rest Parameters: `function sum(...numbers) {}` (나머지 인수들을 배열로 받음)
- Spread Syntax: `...` (배열이나 객체를 펼침)
  - `const arr2 = [...arr1];` (배열 복사)
  - `const obj2 = {...obj1};` (객체 복사)

= 4. 객체와 프로토타입

- 객체 리터럴: `const person = { name: "John", age: 30 };`
- Computed Property Names: `const prop = "name"; const obj = { [prop]: "John" };`
- 프로토타입 (Prototype): 모든 객체는 프로토타입이라는 다른 객체를 참조하며, 프로토타입의 속성과 메서드를 상속받음.
- 생성자 함수 (Constructor Function):
  ```javascript
  function Person(name) { this.name = name; }
  Person.prototype.greet = function() { console.log("Hi, " + this.name); };
  const person1 = new Person("Jules");
  ```
- 클래스 (ES6+): 프로토타입 상속을 더 명확하게 표현하는 문법적 설탕(Syntactic Sugar).
  ```javascript
  class Person {
    constructor(name) { this.name = name; }
    greet() { console.log("Hi, " + this.name); }
  }
  class Developer extends Person { /* ... */ }
  ```



= 5. 배열 고급 메서드

- 변형 메서드 (Mutator methods): `push`, `pop`, `shift`, `unshift`, `splice`, `sort`, `reverse`
- 접근자 메서드 (Accessor methods): `slice`, `concat`, `join`, `indexOf`
- 반복 메서드 (Iteration methods):
  - `forEach(callback)`: 각 요소에 대해 콜백 실행.
  - `map(callback)`: 각 요소에 콜백을 적용한 *새 배열* 반환.
  - `filter(callback)`: 콜백이 `true`를 반환하는 요소로 *새 배열* 반환.
  - `reduce(callback, initialValue)`: 누적 계산 값 반환.
  - `find(callback)`: 콜백이 `true`를 반환하는 첫 번째 *요소* 반환.
  - `findIndex(callback)`: 콜백이 `true`를 반환하는 첫 번째 *인덱스* 반환.
  - `some(callback)`: 조건을 만족하는 요소가 하나라도 있으면 `true`.
  - `every(callback)`: 모든 요소가 조건을 만족하면 `true`.

= 6. 비동기 처리

- 콜백 (Callback): 비동기 작업이 끝난 후 실행될 함수. (콜백 헬 문제 발생 가능)
- Promise: 비동기 작업의 최종 완료 또는 실패를 나타내는 객체.
  - 상태: `pending`, `fulfilled`, `rejected`
  - 메서드: `.then()`, `.catch()`, `.finally()`
  - `Promise.all(promises)`: 모든 프로미스가 성공하면 성공.
  - `Promise.race(promises)`: 가장 먼저 완료되는 프로미스의 결과를 따름.
- async/await (ES2017): Promise를 동기 코드처럼 보이게 하는 문법.
  ```javascript
  async function fetchData() {
    try {
      const response = await fetch('api/data');
      if (!response.ok) throw new Error('Network response was not ok.');
      const data = await response.json();
      return data;
    } catch (error) {
      console.error('Fetch error:', error);
    }
  }
  ```

= 7. 모듈 시스템 (ES6 Modules)

- 내보내기 (Export):
  - `export const name = "Jules";` (이름 있는 내보내기)
  - `export default function() { ... }` (기본 내보내기, 파일당 하나만 가능)
- 가져오기 (Import):
  - `import { name } from './module.js';`
  - `import myFunc from './module.js';`
  - `import * as myModule from './module.js';`
- HTML에서 사용: `<script type="module" src="./main.js"></script>`

= 8. 구조 분해 할당 (Destructuring Assignment)

- 배열: `const [first, second] = [1, 2];`
- 객체: `const { name, age } = { name: "Jules", age: 30 };`
- 이름 변경: `const { name: personName } = person;`
- 기본값: `const { city = "Unknown" } = person;`

= 9. `this` 키워드

`this`가 가리키는 값은 함수가 호출되는 방식에 따라 결정됨.
- 전역 컨텍스트: `window` (브라우저) 또는 `global` (Node.js).
- 일반 함수 호출: `strict mode`에서는 `undefined`, 아니면 전역 객체.
- 메서드 호출: `obj.method()` -> `this`는 `obj`.
- 생성자 함수: `new Person()` -> `this`는 새로 생성된 인스턴스.
- 화살표 함수: `this`를 갖지 않음. 상위 스코프의 `this`를 참조.
- 명시적 바인딩: `.call()`, `.apply()`, `.bind()` 메서드로 `this`를 직접 설정.
