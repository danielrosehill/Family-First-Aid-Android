// Israel Adult Fractures Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-FRACTURES-001
// SOP: 013

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-FRACTURES-001"
#let sop-number = "013"
#let protocol-title = "Fractures and Sprains"
#let protocol-subject = "FRACTURES"
#let scenario = "FRACTURES / SPRAINS"
#let age-group = "ADULT"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2026-03-15"
#let last-verified = "2026-03-16"
#let generation-date = "2026-03-16"
#let version = "3.0"

// === ICON PATHS ===
#let mda-logo = "../../../../icons/mda/mda.png"

// === ICONS (inline helpers) ===
#let icon-phone = text(size: 12pt)[#emoji.phone]
#let icon-breath = text(size: 12pt)[#emoji.wind]
#let icon-med = text(size: 12pt)[#emoji.pill]
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-calm = text(size: 12pt)[#emoji.hands.open]
#let icon-sit = text(size: 12pt)[#emoji.person]
#let icon-heart = text(size: 12pt)[#emoji.heart]
#let icon-warning = text(size: 12pt)[#emoji.warning]

// === COLOURS ===
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
#let clr-terminal = rgb("#1e3a5f")
#let clr-rejoin = rgb("#b0b8c4")

// Header segment colours
#let clr-age-adult = rgb("#ea580c")
#let clr-age-child = rgb("#0d9488")
#let clr-condition = rgb("#1e40af")
#let clr-scenario = rgb("#4b5563")

// Page number badge
#let clr-page-bg = rgb("#1e293b")
#let clr-page-fg = white

// Header/footer chrome
#let clr-header-bg = rgb("#f8f9fb")
#let clr-header-border = rgb("#e2e5ea")

// === PAGE SETUP (A4) ===
#set page(
  paper: "a4",
  margin: (top: 2.8cm, bottom: 2cm, left: 1.5cm, right: 1.5cm),
  header: context {
    let page-num = counter(page).get().first()
    let page-total = counter(page).final().first()
    rect(fill: clr-age-adult, width: 100%, height: 3pt, radius: (top: 2pt, bottom: 0pt))[]
    rect(fill: clr-header-bg, width: 100%, inset: (x: 10pt, y: 6pt), stroke: (bottom: 1pt + clr-header-border))[
      #grid(
        columns: (60pt, 1fr, 60pt),
        gutter: 0pt,
        [],
        align(center)[
          #text(size: 15pt, weight: "bold", fill: clr-age-adult, tracking: 0.5pt)[#upper(age-group)]
          #h(5pt)
          #text(size: 11pt, fill: rgb("#94a3b8"))[#sym.triangle.stroked.r]
          #h(5pt)
          #text(size: 15pt, weight: "bold", fill: clr-condition, tracking: 0.5pt)[#upper(protocol-subject)]
          #h(5pt)
          #text(size: 11pt, fill: rgb("#94a3b8"))[#sym.triangle.stroked.r]
          #h(5pt)
          #text(size: 15pt, weight: "bold", fill: clr-scenario, tracking: 0.5pt)[#upper(scenario)]
          #v(3pt)
          #text(size: 8pt, fill: rgb("#94a3b8"), tracking: 1pt)[SOP #sop-number]
        ],
        align(right + horizon)[
          #rect(fill: clr-page-bg, radius: 4pt, inset: (x: 10pt, y: 5pt))[
            #text(fill: clr-page-fg, weight: "bold", size: 14pt)[#page-num]#text(fill: rgb("#94a3b8"), weight: "bold", size: 14pt)[ \/ ]#text(fill: clr-page-fg, weight: "bold", size: 14pt)[#page-total]
          ]
        ],
      )
    ]
  },
  footer: context {
    let page-num = counter(page).get().first()
    let page-total = counter(page).final().first()
    rect(fill: clr-header-bg, width: 100%, inset: (x: 10pt, y: 6pt), stroke: (top: 1pt + clr-header-border, bottom: 0pt), radius: (top: 0pt, bottom: 2pt))[
      #grid(
        columns: (1fr, auto, 1fr),
        gutter: 0pt,
        align(left + horizon)[
          #text(size: 7pt, fill: rgb("#94a3b8"))[
            #text(weight: "bold", fill: rgb("#64748b"))[#protocol-id] · v#version \
            #generation-date · #source-authority
          ]
        ],
        align(center + horizon)[
          #rect(fill: rgb("#fef3c7"), radius: 3pt, inset: (x: 8pt, y: 3pt), stroke: 0.5pt + rgb("#f59e0b"))[
            #text(size: 7pt, fill: rgb("#92400e"), weight: "bold")[
              Personal reference only — not medical advice
            ]
          ]
          #v(2pt)
          #text(size: 5.5pt, fill: rgb("#94a3b8"))[
            Daniel Rosehill · share with attribution
          ]
        ],
        align(right + horizon)[
          #rect(fill: clr-page-bg, radius: 3pt, inset: (x: 8pt, y: 3pt))[
            #text(fill: clr-page-fg, weight: "bold", size: 11pt)[#page-num]#text(fill: rgb("#94a3b8"), weight: "bold", size: 11pt)[ \/ ]#text(fill: clr-page-fg, weight: "bold", size: 11pt)[#page-total]
          ]
        ],
      )
    ]
  },
)

#set text(font: ("IBM Plex Sans", "IBM Plex Sans Hebrew"), size: 10pt, dir: ltr)

// === HELPERS ===
#let action(word) = { text(weight: "bold", fill: clr-condition, size: 11pt)[#upper(word)] }

#let yes-label = rect(fill: clr-yes, radius: 10pt, inset: (x: 6pt, y: 2pt))[#text(fill: white, weight: "bold", size: 11pt)[Y]]
#let no-label = rect(fill: clr-no, radius: 10pt, inset: (x: 6pt, y: 2pt))[#text(fill: white, weight: "bold", size: 11pt)[N]]

#let keep-together(body) = { block(breakable: false)[#body] }

#let do-not-box(items) = {
  keep-together[
    #rect(fill: clr-warning-fill, stroke: 2pt + clr-warning, radius: 6pt, width: 100%, inset: 10pt)[
      #set text(size: 10pt)
      #text(fill: clr-warning, weight: "bold", size: 13pt)[DO NOT:]
      #v(4pt)
      #for item in items [
        #text(fill: clr-warning, weight: "bold")[#emoji.crossmark] #item \
      ]
    ]
  ]
}

#let equipment-box(items) = {
  keep-together[
    #rect(fill: clr-equip-fill, stroke: 1pt + rgb("#ca8a04"), radius: 6pt, width: 100%, inset: 10pt)[
      #set text(size: 10pt)
      #text(fill: clr-equip, weight: "bold", size: 11pt)[Equipment needed:]
      #v(4pt)
      #for item in items [ — #item \ ]
    ]
  ]
}

// ============================================================
// PAGE 1: Fracture vs Sprain Triage
// ============================================================

// MDA logo above call box
#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // MDA logo
  node((0, -0.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Action: Call 101
  node((0, 0), align(center)[
    #icon-phone #action[CALL] 101 (MDA). \
    Keep on speaker for guidance.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: Fracture or sprain?
  node((0, 1), align(center)[
    Signs of fracture? \
    (deformity, severe pain, \
    inability to move limb, \
    crepitus)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 1), align(center)[
    Fracture pathway. \
    Continue below.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (-1, 1), "->",
    label: no-label,
    label-side: center),

  node((-1, 1), align(center)[
    Likely sprain. \
    See Page 2: RICE.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Decision: Open or closed?
  node((0, 2), align(center)[
    Bone visible or protruding \
    through the skin? \
    (open fracture)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  node((1, 2), align(center)[
    *Open fracture.* \
    #action[CONTROL] bleeding: \
    press around (not on) bone. \
    #action[COVER] wound with \
    sterile dressing. \
    Monitor for shock.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 2), (0.5, 3), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 2), (0, 3), "->",
    label: no-label,
    label-side: center),

  // Closed fracture: immobilise
  node((0, 3), align(center)[
    #action[IMMOBILISE] the limb \
    in position found. \
    Minimum movement, \
    maximum stability.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Arm or leg?
  node((0, 4), align(center)[
    Arm or upper limb?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #action[SUPPORT] with \
    improvised sling \
    (shirt, scarf). Attach \
    to chest.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (-1, 4), "->",
    label: no-label,
    label-side: center),

  node((-1, 4), align(center)[
    #action[PAD] both sides of \
    leg with pillows or \
    rolled blankets to \
    prevent movement.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 4), (0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((-1, 4), (-0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (0, 5), "->"),

  // Action: Ice and remove jewellery
  node((0, 5), align(center)[
    #action[APPLY] ice wrapped \
    in cloth (15-min intervals). \
    #action[REMOVE] rings, watches, \
    jewellery from affected limb.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->"),

  // Terminal: Monitor
  node((0, 6), align(center)[
    #icon-monitor #action[MONITOR] for shock \
    (pale skin, rapid breathing). \
    Keep warm until MDA arrives.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Sprain — RICE Protocol
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Sprain — RICE Protocol]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // R — Rest
    node((0, 0), align(center)[
      *R* — #action[REST] \
      Stop all activity. Do not \
      bear weight on the joint.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // I — Ice
    node((0, 1), align(center)[
      *I* — #action[ICE] \
      Apply ice wrapped in cloth \
      for 15–20 min every 2–3 hrs. \
      Continue for 48–72 hours.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->"),

    // C — Compression
    node((0, 2), align(center)[
      *C* — #action[COMPRESS] \
      Bandage firmly but not tightly \
      around, above, and below injury.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->"),

    // Decision: Circulation check
    node((0, 3), align(center)[
      Fingers/toes below bandage \
      numb, pale, or blue?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (1, 3), "->",
      label: yes-label,
      label-side: center),

    node((1, 3), align(center)[
      #action[LOOSEN] bandage \
      immediately.
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 3), (0, 4), "->",
      label: no-label,
      label-side: center),

    // E — Elevation
    node((0, 4), align(center)[
      *E* — #action[ELEVATE] \
      Raise injured limb above \
      heart level using pillows.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 4), (0, 5), "->"),

    // Decision: Severe signs?
    node((0, 5), align(center)[
      Cannot bear weight at all? \
      Visible deformity? Severe \
      unrelenting pain? Numbness?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    // MDA logo
    node((1, 4.5), align(center)[
      #image(mda-logo, width: 24pt)
    ],
      shape: rect, fill: none, stroke: none,
      width: 14mm, inset: 0pt),

    edge((0, 5), (1, 5), "->",
      label: yes-label,
      label-side: center),

    node((1, 5), align(center)[
      #icon-phone #action[CALL] 101 or go \
      to ER. Treat as \
      possible fracture.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 5), (-1, 5), "->",
      label: no-label,
      label-side: center),

    node((-1, 5), align(center)[
      Continue RICE at home. \
      Seek medical evaluation \
      if not improving in \
      48–72 hours.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),
  )
]

// ============================================================
// PAGE 3: Reference Notes
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Reference Notes]
]
#v(8pt)

#do-not-box((
  [#underline(stroke: 1.5pt)[*Do NOT attempt to straighten or realign a broken limb*] — this may tear arteries and nerves.],
  [#underline(stroke: 1.5pt)[*Do NOT push a protruding bone back in*] during an open fracture.],
  [#underline(stroke: 1.5pt)[*Do NOT apply ice directly to skin*] — always wrap in cloth first.],
  [#underline(stroke: 1.5pt)[*Do NOT apply heat*] to a fresh fracture or sprain — heat increases swelling.],
  [#underline(stroke: 1.5pt)[*Do NOT allow the patient to walk*] on a suspected leg fracture.],
  [#underline(stroke: 1.5pt)[*Do NOT remove embedded objects*] from a wound associated with a fracture.],
))

#v(12pt)

#equipment-box((
  "Triangular bandage or improvised sling (shirt, scarf)",
  "Ice pack or cooling spray (wrapped in cloth)",
  "Elastic bandage (for compression of sprains)",
  "Pillows, blankets, or rolled towels (for immobilisation and elevation)",
  "Sterile dressings or clean cloth (for open fracture wounds)",
  "Tourniquet (for severe bleeding in open fractures)",
))

#v(12pt)

// === HEBREW TERMINOLOGY PHRASEBOOK ===
#rect(fill: rgb("#f0f4ff"), stroke: 1pt + rgb("#6366f1"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: rgb("#4338ca"), weight: "bold", size: 14pt)[Hebrew Terminology — מונחים בעברית]
  #v(6pt)
  #set text(size: 10pt)
  #table(
    columns: (1fr, 1fr, 1fr),
    align: (left, right, left),
    stroke: 0.5pt + rgb("#c7d2fe"),
    inset: 6pt,
    fill: (x, y) => if y == 0 { rgb("#e0e7ff") } else { none },
    [*English*], [*עברית*], [*Pronunciation*],
    [Fracture], [שבר], [SHE-ver],
    [Broken bone], [עצם שבורה], [E-tsem shvu-RA],
    [Sprain], [נקע], [NE-ka],
    [Arm], [יד / זרוע], [yad / zro-A],
    [Leg], [רגל], [RE-gel],
    [It hurts], [כואב לי], [ko-EV li],
    [I cannot move it], [אני לא יכול להזיז], [a-NI lo ya-KHOL le-ha-ZIZ],
    [Sling], [מתלה], [mit-LE],
    [Ice], [קרח], [KE-rakh],
    [Bandage], [תחבושת], [takh-BO-shet],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Where does it hurt?], [?איפה כואב לך], [EI-fo ko-EV le-KHA?],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — Fractures and Sprains First Aid Guidelines \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Publication date:] 2026-01-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
