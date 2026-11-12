#let cv-template(
  name: "",
  role: "",
  email: "",
  github: "",
  body,
) = {
  // Page setup (A4 and clean professional margins)
  set page(
    paper: "a4",
    margin: (x: 1.5cm, y: 1.5cm),
  )
  
  // Base typography configuration
  set text(
    font: "Liberation Sans",
    size: 10pt,
    fill: rgb("#222222"),
  )

  // Main header section
  align(center)[
    #text(size: 18pt, weight: "bold")[#name] \
    #v(2pt)
    #text(size: 11pt, weight: "medium", fill: rgb("#555555"))[#role] \
    #v(4pt)
    #text(size: 9pt, fill: rgb("#666666"))[
      📧 #email | 🌐 github.com/#github
    ]
  ]

  v(10pt)
  line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
  v(10pt)

  // Global styling for section headings
  show heading.where(level: 1): it => block(
    below: 10pt,
    above: 15pt,
    text(size: 12pt, weight: "bold", fill: rgb("#111111"))[#upper(it.body)]
  )

  // Document body content injection
  body
}