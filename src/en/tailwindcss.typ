#import "../templates/conf.typ": *

#show: template.with(
  title: "Tailwind CSS Cheat Sheet",
  header: [Last updated: #datetime.today().display()],
  footer: "Tailwind CSS Utility-First Framework Cheat Sheet",
)

= Layout & Display

Tailwind CSS is a utility-first CSS framework for rapid UI development.

== Display & Position
- `block`, `inline-block`, `inline`, `flex`, `grid`, `hidden`
- `static`, `fixed`, `absolute`, `relative`, `sticky`
- `top-0`, `right-4`, `bottom-auto`, `inset-0` (top/right/bottom/left 0)
- `z-0`, `z-10`, `z-50`, `z-auto`
- `overflow-auto`, `overflow-hidden`, `overflow-scroll`

= Flexbox & Grid

== Flexbox
- `flex`, `flex-row`, `flex-col`, `flex-wrap`
- `items-start`, `items-center`, `items-end`, `items-baseline`
- `justify-start`, `justify-center`, `justify-between`, `justify-around`
- `flex-1` (1 1 0%), `flex-auto` (1 1 auto), `flex-none`

== Grid
- `grid`, `grid-cols-1`, `grid-cols-3`, `grid-cols-12`
- `col-span-2`, `col-span-full`, `col-start-1`
- `gap-2` (0.5rem), `gap-4` (1rem), `gap-x-6`, `gap-y-4`

= Spacing & Sizing

== Spacing (Padding & Margin)
- *Padding*: `p-4` (all), `px-4` (x-axis), `py-2` (y-axis), `pt-2`, `pr-4`, `pb-2`, `pl-4`
- *Margin*: `m-4`, `mx-auto` (center), `my-6`, `-mt-2` (negative)
- *Space Between*: `space-y-4` (vertical spacing among child elements)

== Sizing (Width & Height)
- *Width*: `w-full` (100%), `w-screen` (100vw), `w-1/2` (50%), `w-64` (16rem), `w-auto`
- *Height*: `h-full`, `h-screen` (100vh), `h-12` (3rem), `min-h-screen`
- *Max/Min*: `max-w-md` (28rem), `max-w-xl`, `max-w-7xl`, `min-w-0`
- *Arbitrary Values*: `w-[320px]`, `h-[calc(100vh-4rem)]`

= Typography

- *Font Size*: `text-xs`, `text-sm`, `text-base` (1rem), `text-lg`, `text-xl`, `text-2xl`, `text-4xl`
- *Font Weight*: `font-thin`, `font-normal`, `font-medium`, `font-semibold`, `font-bold`
- *Text Alignment*: `text-left`, `text-center`, `text-right`, `text-justify`
- *Colors*: `text-white`, `text-gray-700`, `text-blue-500`, `text-opacity-80`
- *Line Height*: `leading-none`, `leading-tight`, `leading-relaxed`, `tracking-wide`
- *Transforms*: `uppercase`, `lowercase`, `capitalize`, `truncate` (ellipsis)

= Backgrounds, Borders & Effects

- *Background*: `bg-white`, `bg-slate-900`, `bg-indigo-600`, `bg-transparent`
- *Gradients*: `bg-gradient-to-r from-cyan-500 to-blue-500`
- *Borders*: `border`, `border-2`, `border-t-4`, `border-gray-300`
- *Border Radius*: `rounded-none`, `rounded-sm`, `rounded-md`, `rounded-lg`, `rounded-full`
- *Box Shadow*: `shadow-sm`, `shadow`, `shadow-md`, `shadow-lg`, `shadow-xl`, `shadow-none`
- *Opacity & Blur*: `opacity-50`, `backdrop-blur-md`

= Responsive & State Variants

== Responsive Breakpoints
- `sm:` (min-width: 640px)
- `md:` (min-width: 768px)
- `lg:` (min-width: 1024px)
- `xl:` (min-width: 1280px)
- `2xl:` (min-width: 1536px)
- *Usage*: `<div class="w-full md:w-1/2 lg:w-1/3">`

== State Modifiers
- *Pseudo-classes*: `hover:bg-blue-600`, `focus:outline-none`, `focus:ring-2`, `active:scale-95`
- *Form States*: `disabled:opacity-50`, `checked:bg-blue-500`
- *Dark Mode*: `dark:bg-gray-900 dark:text-white`
- *Group State*: `group`, `group-hover:text-blue-500`
- *Peer State*: `peer`, `peer-checked:block`

= Directives

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

.btn-primary {
  @apply px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition duration-200;
}
```
