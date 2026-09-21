#import "../templates/conf.typ": *

#show: template.with(
  title: "Tailwind CSS 핵심 치트시트",
  header: [최종 업데이트: #datetime.today().display()],
  footer: "Tailwind CSS Utility-First Framework Cheat Sheet",
)

= 레이아웃 및 디스플레이 (Layout & Display)

Tailwind CSS는 유틸리티 클래스를 조합하여 빠르게 UI를 구성하는 CSS 프레임워크입니다.

== 디스플레이 및 포지션
- `block`, `inline-block`, `inline`, `flex`, `grid`, `hidden`
- `static`, `fixed`, `absolute`, `relative`, `sticky`
- `top-0`, `right-4`, `bottom-auto`, `inset-0` (상하좌우 0)
- `z-0`, `z-10`, `z-50`, `z-auto`
- `overflow-auto`, `overflow-hidden`, `overflow-scroll`

= 플렉스박스 및 그리드 (Flexbox & Grid)

== Flexbox
- `flex`, `flex-row`, `flex-col`, `flex-wrap`
- `items-start`, `items-center`, `items-end`, `items-baseline`
- `justify-start`, `justify-center`, `justify-between`, `justify-around`
- `flex-1` (1 1 0%), `flex-auto` (1 1 auto), `flex-none`

== Grid
- `grid`, `grid-cols-1`, `grid-cols-3`, `grid-cols-12`
- `col-span-2`, `col-span-full`, `col-start-1`
- `gap-2` (0.5rem), `gap-4` (1rem), `gap-x-6`, `gap-y-4`

= 간격 및 크기 (Spacing & Sizing)

== Spacing (Padding & Margin)
- *Padding*: `p-4` (전체), `px-4` (좌우), `py-2` (상하), `pt-2`, `pr-4`, `pb-2`, `pl-4`
- *Margin*: `m-4`, `mx-auto` (수평 중앙 정렬), `my-6`, `-mt-2` (음수 마진)
- *Space Between*: `space-y-4` (자식 요소 간 세로 간격)

== Sizing (Width & Height)
- *Width*: `w-full` (100%), `w-screen` (100vw), `w-1/2` (50%), `w-64` (16rem), `w-auto`
- *Height*: `h-full`, `h-screen` (100vh), `h-12` (3rem), `min-h-screen`
- *Max/Min*: `max-w-md` (28rem), `max-w-xl`, `max-w-7xl`, `min-w-0`
- *임의의 값 (Arbitrary)*: `w-[320px]`, `h-[calc(100vh-4rem)]`

= 타이포그래피 (Typography)

- *글꼴 크기*: `text-xs`, `text-sm`, `text-base` (1rem), `text-lg`, `text-xl`, `text-2xl`, `text-4xl`
- *글꼴 두께*: `font-thin`, `font-normal`, `font-medium`, `font-semibold`, `font-bold`
- *텍스트 정렬*: `text-left`, `text-center`, `text-right`, `text-justify`
- *텍스트 색상*: `text-white`, `text-gray-700`, `text-blue-500`, `text-opacity-80`
- *행간 및 자간*: `leading-none`, `leading-tight`, `leading-relaxed`, `tracking-wide`
- *텍스트 변형*: `uppercase`, `lowercase`, `capitalize`, `truncate` (말줄임표)

= 배경, 테두리 및 효과 (Background & Borders)

- *배경색*: `bg-white`, `bg-slate-900`, `bg-indigo-600`, `bg-transparent`
- *그라디언트*: `bg-gradient-to-r from-cyan-500 to-blue-500`
- *테두리 두께 & 색상*: `border`, `border-2`, `border-t-4`, `border-gray-300`
- *모서리 곡률*: `rounded-none`, `rounded-sm`, `rounded-md`, `rounded-lg`, `rounded-full`
- *그림자 효과*: `shadow-sm`, `shadow`, `shadow-md`, `shadow-lg`, `shadow-xl`, `shadow-none`
- *투명도 및 블러*: `opacity-50`, `backdrop-blur-md`

= 반응형 및 상태 변형자 (Variants)

== 반응형 중단점 (Breakpoints)
- `sm:` (640px 이상)
- `md:` (768px 이상)
- `lg:` (1024px 이상)
- `xl:` (1280px 이상)
- `2xl:` (1536px 이상)
- *예시*: `<div class="w-full md:w-1/2 lg:w-1/3">`

== 상태 변형자 (State Variants)
- *마우스 & 포커스*: `hover:bg-blue-600`, `focus:outline-none`, `focus:ring-2`, `active:scale-95`
- *폼 상태*: `disabled:opacity-50`, `checked:bg-blue-500`
- *다크 모드*: `dark:bg-gray-900 dark:text-white`
- *부모 그룹 상태*: `group`, `group-hover:text-blue-500`
- *형제 피어 상태*: `peer`, `peer-checked:block`

= CSS 지시어 (Directives)

```css
/* 기본 스타일 주입 */
@tailwind base;
@tailwind components;
@tailwind utilities;

/* 커스텀 유틸리티 추출 */
.btn-primary {
  @apply px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition duration-200;
}
```
