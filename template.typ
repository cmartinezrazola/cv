#let cv-template(
  name: "",
  role: "",
  email: "",
  phone: "",
  address: "",
  birthdate: "",
  nationality: "",
  marital-status: "",
  github: "",
  linkedin: "",
  xing: "",
  photo: none,
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

  // Header text block (left-aligned if photo is present, centered otherwise)
  let header_info = {
    text(size: 18pt, weight: "bold", fill: rgb("#111111"))[#name]
    v(2pt)
    text(size: 11pt, weight: "medium", fill: rgb("#444444"))[#role]
    v(6pt)
    text(size: 9pt, fill: rgb("#555555"))[
      #address #h(6pt) | #h(6pt) #phone \
      #if birthdate != "" [Geburtsdatum: #birthdate ]
      #if nationality != "" [ #h(6pt) | #h(6pt) #nationality ]
      #if marital-status != "" [ #h(6pt) | #h(6pt) #marital-status ]
      \
      #v(3pt)
      #link("mailto:" + email)[#email]
      #if github != "" [
        #h(6pt) | #h(6pt) #link("https://github.com/" + github)[#underline[GitHub]]
      ]
      #if linkedin != "" [
        #h(6pt) | #h(6pt) #link("https://linkedin.com/in/" + linkedin)[#underline[LinkedIn]]
      ]
      #if xing != "" [
        #h(6pt) | #h(6pt) #link("https://xing.com/profile/" + xing)[#underline[Xing]]
      ]
    ]
  }

  // Conditional header rendering based on photo availability
  if photo != none {
    grid(
      columns: (1fr, auto),
      gutter: 16pt,
      align: (left + horizon, right + horizon),
      header_info,
      // Circular crop with subtle executive border
      box(
        width: 4.0cm,
        height: 4.0cm,
        radius: 50%,
        clip: true,
        stroke: 0.5pt + rgb("#cccccc"),
        image(photo, width: 100%, height: 100%, fit: "cover")
      )
    )
  } else {
    align(center)[#header_info]
  }

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