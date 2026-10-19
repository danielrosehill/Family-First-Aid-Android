// First Aid Protocol Flowchart Template — V2
// Typst + fletcher for proper flowchart arrows
// A4, IBM Plex Sans + Hebrew, page numbering, action word highlighting
//
// IMPORTANT: This template defines the page setup, styles, and helper functions.
// Each protocol file imports this and builds its specific flowchart content.

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === PAGE SETUP (A4 standardised) ===
#let protocol-id = "IL-ADULT-CPR-001"
#let protocol-title = "PROTOCOL TITLE"
#let protocol-subject = "CPR"
#let age-group = "ADULT"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2024-01-01"
#let last-verified = "2026-03-16"
#let generation-date = "2026-03-16"
#let version = "2.0"

#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2cm, left: 1.5cm, right: 1.5cm),
  header: context {
    let page-num = counter(page).get().first()
    let page-total = counter(page).final().first()
    grid(
      columns: (1fr, auto, 1fr),
      gutter: 0pt,
      // Left: age group + subject
      align(left)[
        #text(size: 14pt, weight: "bold", fill: rgb("#1e40af"))[
          #upper(age-group) — #upper(protocol-subject)
        ]
      ],
      // Center: emergency number
      align(center)[
        #rect(fill: rgb("#dc2626"), radius: 4pt, inset: (x: 8pt, y: 3pt))[
          #text(fill: white, weight: "bold", size: 10pt)[CALL #emergency-number]
        ]
      ],
      // Right: page number with yellow background
      align(right)[
        #rect(fill: rgb("#fbbf24"), radius: 4pt, inset: (x: 8pt, y: 3pt))[
          #text(weight: "bold", size: 11pt)[Pg #page-num / #page-total]
        ]
      ],
    )
    line(length: 100%, stroke: 1pt + rgb("#d1d5db"))
  },
  footer: context {
    let page-num = counter(page).get().first()
    let page-total = counter(page).final().first()
    line(length: 100%, stroke: 0.5pt + rgb("#d1d5db"))
    v(3pt)
    grid(
      columns: (1fr, auto, 1fr),
      gutter: 0pt,
      // Left: metadata
      align(left)[
        #text(size: 7pt, fill: rgb("#9ca3af"))[
          #protocol-id · v#version · Generated: #generation-date · Source: #source-authority (#source-date)
        ]
      ],
      // Center: disclaimer
      align(center)[
        #text(size: 7pt, fill: rgb("#9ca3af"), weight: "bold")[
          Personal reference only — not medical advice
        ]
      ],
      // Right: page number
      align(right)[
        #rect(fill: rgb("#fbbf24"), radius: 3pt, inset: (x: 6pt, y: 2pt))[
          #text(weight: "bold", size: 8pt)[#page-num / #page-total]
        ]
      ],
    )
  },
)

#set text(font: ("IBM Plex Sans", "IBM Plex Sans Hebrew"), size: 10pt, dir: ltr)

// === HEBREW HELPER ===
#let heb(content) = {
  text(font: "IBM Plex Sans Hebrew", dir: rtl)[#content]
}

// === ACTION WORD HIGHLIGHTING ===
// Use #action[CALL] to highlight action verbs
#let action(word) = {
  text(weight: "bold", fill: rgb("#1e40af"), size: 11pt)[#upper(word)]
}

// === COLOUR CONSTANTS ===
#let clr-step = rgb("#f0f9ff")
#let clr-step-stroke = rgb("#3b82f6")
#let clr-decision = rgb("#eff6ff")
#let clr-decision-stroke = rgb("#2563eb")
#let clr-yes = rgb("#16a34a")
#let clr-yes-fill = rgb("#f0fdf4")
#let clr-no = rgb("#dc2626")
#let clr-no-fill = rgb("#fef2f2")
#let clr-warning = rgb("#dc2626")
#let clr-warning-fill = rgb("#fef2f2")
#let clr-equip = rgb("#92400e")
#let clr-equip-fill = rgb("#fefce8")

// === EMERGENCY NUMBERS STRIP ===
#let emergency-numbers-strip() = {
  rect(
    fill: rgb("#fef2f2"),
    stroke: 1pt + rgb("#dc2626"),
    radius: 4pt,
    width: 100%,
    inset: 6pt,
  )[
    #set text(size: 9pt)
    #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), gutter: 4pt,
      [#strong[MDA:] 101],
      [#strong[Police:] 100],
      [#strong[Fire:] 102],
      [#strong[Hatzalah:] 1221],
      [#strong[Poison:] 04-7771900],
    )
  ]
}

// === TITLE BLOCK ===
#let title-block() = {
  align(center)[
    #text(size: 20pt, weight: "bold")[#protocol-title]
    #v(2pt)
    #text(size: 12pt, fill: rgb("#6b7280"))[#country — #age-group]
  ]
  v(6pt)
  rect(
    fill: rgb("#dc2626"),
    radius: 6pt,
    width: 100%,
    inset: 10pt,
  )[
    #set text(fill: white, weight: "bold", size: 16pt)
    #align(center)[
      CALL #emergency-number (#emergency-service) — CALL IMMEDIATELY IF IN DOUBT
    ]
  ]
  v(4pt)
  emergency-numbers-strip()
  v(6pt)
}

// === KEEP-TOGETHER BLOCK ===
// Wraps content to prevent page breaks mid-section
#let keep-together(body) = {
  block(breakable: false)[#body]
}

// === DO NOT BOX ===
#let do-not-box(items) = {
  keep-together[
    #rect(
      fill: clr-warning-fill,
      stroke: 2pt + clr-warning,
      radius: 6pt,
      width: 100%,
      inset: 10pt,
    )[
      #set text(size: 10pt)
      #text(fill: clr-warning, weight: "bold", size: 13pt)[DO NOT:]
      #v(4pt)
      #for item in items [
        #text(fill: clr-warning, weight: "bold")[X] #item \
      ]
    ]
  ]
}

// === EQUIPMENT BOX ===
#let equipment-box(items) = {
  keep-together[
    #rect(
      fill: clr-equip-fill,
      stroke: 1pt + rgb("#ca8a04"),
      radius: 6pt,
      width: 100%,
      inset: 10pt,
    )[
      #set text(size: 10pt)
      #text(fill: clr-equip, weight: "bold", size: 11pt)[Equipment needed:]
      #v(4pt)
      #for item in items [
        — #item \
      ]
    ]
  ]
}

// === WHEN TO APPLY BOX ===
#let when-to-apply(content) = {
  rect(
    fill: rgb("#faf5ff"),
    stroke: 1pt + rgb("#7c3aed"),
    radius: 6pt,
    width: 100%,
    inset: 10pt,
  )[
    #set text(size: 10pt)
    #text(fill: rgb("#5b21b6"), weight: "bold", size: 11pt)[When to apply:]
    #v(3pt)
    #content
  ]
}

// === WARNING BOX (standalone) ===
#let warning-box(content) = {
  keep-together[
    #rect(
      fill: clr-warning-fill,
      stroke: 2pt + clr-warning,
      radius: 4pt,
      width: 100%,
      inset: 8pt,
    )[
      #text(fill: clr-warning, weight: "bold", size: 10pt)[WARNING: #content]
    ]
  ]
}

// === STEP BOX (for non-diagram linear steps) ===
#let step-box(number, instruction, detail: none, warning: none) = {
  keep-together[
    #rect(
      fill: clr-step,
      stroke: 1pt + clr-step-stroke,
      radius: 6pt,
      width: 100%,
      inset: 10pt,
    )[
      #set text(size: 10pt)
      #strong[Step #number:] #instruction
      #if detail != none [
        #v(4pt)
        #text(size: 9pt, fill: rgb("#6b7280"))[#detail]
      ]
      #if warning != none [
        #v(4pt)
        #rect(fill: clr-warning-fill, stroke: 1pt + clr-warning, radius: 4pt, inset: 6pt)[
          #text(fill: clr-warning, weight: "bold", size: 9pt)[WARNING: #warning]
        ]
      ]
    ]
  ]
}

// === DECISION BOX (for non-diagram linear layout) ===
#let decision-box(condition) = {
  rect(
    fill: clr-decision,
    stroke: 2pt + clr-decision-stroke,
    radius: 6pt,
    width: 100%,
    inset: 10pt,
  )[
    #set text(size: 11pt, weight: "bold", fill: rgb("#1e40af"))
    #align(center)[#condition]
  ]
}

#let yes-branch(content) = {
  rect(
    fill: clr-yes-fill,
    stroke: 1pt + clr-yes,
    radius: 4pt,
    width: 100%,
    inset: 8pt,
  )[
    #text(fill: clr-yes, weight: "bold")[YES → ] #content
  ]
}

#let no-branch(content) = {
  rect(
    fill: clr-no-fill,
    stroke: 1pt + clr-no,
    radius: 4pt,
    width: 100%,
    inset: 8pt,
  )[
    #text(fill: clr-no, weight: "bold")[NO → ] #content
  ]
}

// === DOCUMENT START ===
// Usage: After importing this template, set the variables and call title-block(),
// then build the flowchart content using either:
// (a) fletcher diagram() for proper arrow-connected flowcharts, or
// (b) step-box() / decision-box() for simpler linear sections
//
// Example fletcher usage:
//
// #diagram(
//   spacing: (10mm, 12mm),
//   node-stroke: 1pt,
//   edge-stroke: 1.5pt,
//
//   node((0, 0), align(center)[*Step 1:* #action[CHECK] responsiveness],
//     shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
//     width: 70mm, inset: 10pt),
//
//   edge((0, 0), (0, 1), "->"),
//
//   node((0, 1), align(center)[*Is the person responsive?*],
//     shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
//     width: 60mm, inset: 10pt),
//
//   edge((0, 1), (1, 1), "->",
//     label: text(fill: clr-yes, weight: "bold", size: 11pt)[YES],
//     label-side: center),
//
//   edge((0, 1), (0, 2), "->",
//     label: text(fill: clr-no, weight: "bold", size: 11pt)[NO],
//     label-side: center),
// )
