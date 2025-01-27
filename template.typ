#import "symbols.typ": *
#import "@preview/ctheorems:1.1.3": *

#let todo = highlight(text(size: 20pt, weight: "bold", "TODO"))

#let __display = state("__display", ())
#let __prob_number = state("__problem_number", 0)
#let __prob_active = state("__problem_active", false)
#let __points = state("__points", (:))
#let __setbrk = state("__setbrk", false)


#let problem(points: none, coalesce: false, title, question: none, body) = {
  __prob_number.update(u => u + 1)
  context {
    let num = __prob_number.get()

    if num > 1 {
      pagebreak(weak: true)
    }

    if points == none {
      // initialize points
      __points.update(x => {
        x.insert(str(num), ())
        x
      })
    }
    let hdr = if points == none {
      context {
        let s = __points.final().at(str(num))
        if s.len() == 0 {
          [#title]
        } else {
          let pr = if coalesce {
            s.sum()
          } else {
            s.map(x => str(x)).join("+")
          }
          [#title (#pr points)]
        }
      }
    } else {
      [#title (#points points)]
    }
    __prob_active.update(points == none)
    enum.item(num)[
      #set enum(numbering: "(a)")
      #if question == none {
        [#strong(hdr) #body]
      } else {
        [
          #strong(hdr) #question
          #v(1.5em)
          #strong[Solution.] #body
        ]
      }
    ]
    __prob_active.update(false)
  }
}

#let brk() = [
  #__setbrk.update(true)
  #colbreak(weak: true)
]

#let part(points, question, body, pb: false) = {
  context {
    assert(
      __prob_active.get(),
      message: "No problem is active! Cannot declare part.",
    )
    let prob_num = __prob_number.get()
    let prob_count = __points.get().at(str(prob_num)).len() + 1
    __points.update(x => {
      let _ = x.at(str(prob_num)).push(points)
      x
    })

    if not __setbrk.get() {
      v(.75em)
    }
    __setbrk.update(false)
    enum.item(prob_count)[
      #strong[(#points points).] #question
      #v(1.5em)
      #strong[Solution.] #body
    ]
    v(1fr)
  }
}


// Initiate the document title, author...
#let assignment_class(
  title,
  author,
  course_id,
  semester,
  body,
  margin: 1.75em,
  draft: true,
) = {
  set text(size: 11pt)
  set document(title: title, author: author)

  show: thmrules
  show heading: set block(above: 1.4em, below: 1em)
  set par(
    leading: 1em,
    spacing: 0.7em,
    justify: true,
  )
  set text(font: "New Computer Modern")
  show heading: set block(above: 1.4em, below: 1em)
  let width = 8.5in
  let height = 11in
  let xmargin = margin
  let ymargin = margin
  set page(
    margin: (x: xmargin, y: ymargin),
    width: width,
    height: height,
    header: box(
      inset: (bottom: 4pt, x: 2pt),
      stroke: (bottom: 0.5pt + black),
    )[#course_id, #semester #h(1fr) Name: #author],
    footer: align(
      center,
      context counter(page).get().first(),
    ),
    background: if draft {
      box(
        width: width - 2 * xmargin,
        height: height - 2 * ymargin,
        stroke: 0.8pt + gray.lighten(50%),
        outset: 4pt,
        box(
          width: width - 2 * xmargin,
          height: height - 2 * ymargin,
          stroke: 0.3pt + gray.lighten(50%),
          outset: 0pt,
          text(size: 5em, fill: gray.lighten(60%))[*DRAFT*],
        ),
      )
    } else { none },
  )


  // use parentheses as delimiters for
  // matrices/vectors
  set math.mat(delim: "(")
  set math.vec(delim: "(")
  show heading.where(level: 1): set text(20pt)
  show heading.where(level: 2): set text(16pt)
  show math.equation: set block(breakable: true)

  v(.5em)
  align(center, text(16pt, title))
  v(3em)
  body
}
