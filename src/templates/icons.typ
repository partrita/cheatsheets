#let icon(name, size: 11pt) = {
  text(
    font: "Font Awesome 6 Free Solid",
    size: size,
    box[#name]
  )
}

#let iconUnicode(unicode, size: 11pt, color: black) = {
  text(
    font: "Font Awesome 6 Free Solid",
    size: size,
    fill: color,
    box[
      #symbol(unicode)
    ]
  )
}

// Font Awesome Icons
#let github = symbol("\u{f09b}")
#let linkedin = symbol("\u{f08c}")
#let link = symbol("\u{f0c1}")
#let envelope = symbol("\u{f0e0}")
#let phone = symbol("\u{f095}")
