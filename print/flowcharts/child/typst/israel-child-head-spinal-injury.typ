// Israel Child Head/Spinal Injury Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-HEAD-SPINAL-INJURY-001
// SOP: 042

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-HEAD-SPINAL-INJURY-001"
#let sop-number = "042"
#let protocol-title = "Head & Spinal Injury — Stabilisation"
#let protocol-subject = "HEAD / SPINAL INJURY"
#let scenario = "STABILISATION"
#let age-group = "CHILD"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2026-01-01"
#let last-verified = "2026-03-16"
#let generation-date = "2026-03-16"
#let version = "3.0"

// === ICON PATHS ===
#let mda-logo = "../../../../icons/mda/mda.png"

// === ICONS (inline helpers) ===
#let icon-phone = text(size: 12pt)[#emoji.phone]
#let icon-breath = text(size: 12pt)[#emoji.wind]
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-heart = text(size: 12pt)[#emoji.heart]
#let icon-person = text(size: 12pt)[#emoji.person]
#let icon-warning = text(size: 12pt)[#emoji.warning]
#let icon-calm = text(size: 12pt)[#emoji.hands.open]

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
    rect(fill: clr-age-child, width: 100%, height: 3pt, radius: (top: 2pt, bottom: 0pt))[]
    rect(fill: clr-header-bg, width: 100%, inset: (x: 10pt, y: 6pt), stroke: (bottom: 1pt + clr-header-border))[
      #grid(
        columns: (60pt, 1fr, 60pt),
        gutter: 0pt,
        [],
        align(center)[
          #text(size: 15pt, weight: "bold", fill: clr-age-child, tracking: 0.5pt)[#upper(age-group)]
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
// PAGE 1: Scene safety, assessment, and stabilisation
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Action: Scene safety
  node((0, 0), align(center)[
    #icon-warning #action[ENSURE] scene safety. \
    Wear gloves if available.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: Child responsive?
  node((0, 1), align(center)[
    #icon-monitor Child responsive? \
    (tap shoulder, call name; \
    tap sole of foot for infant)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 1), align(center)[
    #icon-calm #action[INSTRUCT] child \
    to stay completely still. \
    Reassure with calm voice.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 1), (0.5, 2.5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 1), (-1, 1), "->",
    label: no-label,
    label-side: center),

  node((-1, 1), align(center)[
    #icon-breath #action[OPEN] airway \
    with jaw thrust only. \
    Check breathing.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 1), (-1, 2), "->"),

  // Decision: Breathing after jaw thrust?
  node((-1, 2), align(center)[
    #icon-breath Breathing \
    after jaw thrust?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 2), (-1, 3), "->",
    label: no-label,
    label-side: left),

  node((-1, 3), align(center)[
    #icon-heart #action[BEGIN] CPR. \
    Maintain spinal \
    alignment.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 2), (-0.5, 2.5), "->",
    label: yes-label,
    label-side: left,
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 1), (0, 2), "->"),

  // MDA logo above call box
  node((0, 1.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Action: Call 101
  node((0, 2), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    Provide: location, age, \
    mechanism, AVPU level.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Decision: Immediate danger?
  node((0, 3), align(center)[
    #icon-warning Child in \
    immediate danger? \
    (fire, traffic, collapse)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #action[MOVE] minimum distance \
    to safety. Keep head, \
    neck, spine aligned.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->",
    label: no-label,
    label-side: left),

  // Action: Stabilise head and neck
  node((0, 4), align(center)[
    #action[STABILISE] head and neck \
    manually. Hands on both \
    sides; hold steady. \
    Maintain until MDA arrives.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: Scalp bleeding?
  node((0, 5), align(center)[
    #icon-monitor Visible scalp \
    bleeding?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  // Decision: Skull fracture?
  node((1, 5), align(center)[
    Depressed area, visible \
    bone, or clear fluid \
    from ears/nose?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 5), (1, 6), "->",
    label: yes-label,
    label-side: left),

  node((1, 6), align(center)[
    #action[COVER] loosely with \
    non-adherent dressing. \
    No pressure on wound.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 5), (1, 7), "->",
    label: no-label,
    label-side: left),

  node((1, 7), align(center)[
    #action[APPLY] gentle direct \
    pressure with clean \
    cloth or bandage.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->",
    label: no-label,
    label-side: left),

  // Action: Cover child
  node((0, 6), align(center)[
    #action[COVER] child to maintain \
    warmth (blanket/coat). \
    Provide shade in hot weather.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Continued monitoring
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Continued Monitoring]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 9mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Action: Monitor red flags
    node((0, 0), align(center)[
      #icon-monitor #action[CHECK] for red flags: \
      loss of consciousness, seizures, \
      repeated vomiting, unequal pupils, \
      fluid from ears/nose, limb weakness, \
      bulging fontanelle (infants).
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 62mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // Decision: Red flags present?
    node((0, 1), align(center)[
      #icon-monitor Any red flag \
      signs present?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 62mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (1, 1), "->",
      label: yes-label,
      label-side: center),

    node((1, 1), align(center)[
      #action[REPORT] urgently to 101 \
      dispatcher or arriving \
      MDA crew. Serious \
      intracranial/spinal injury.
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->",
      label: no-label,
      label-side: left),

    // Action: Continue monitoring
    node((0, 2), align(center)[
      #icon-monitor #action[MONITOR] continuously. \
      Check breathing, AVPU, \
      any changes. Keep child \
      calm and reassured.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 62mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->"),

    // Decision: Child vomits?
    node((0, 3), align(center)[
      #icon-monitor Child vomiting?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 62mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (1, 3), "->",
      label: yes-label,
      label-side: center),

    node((1, 3), align(center)[
      #action[LOG-ROLL] onto side \
      (second person supports \
      head/neck alignment). \
      Prevent aspiration.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (-1, 3), "->",
      label: no-label,
      label-side: center),

    node((-1, 3), align(center)[
      #action[MAINTAIN] in current \
      position. Continue \
      monitoring until \
      MDA arrives.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 50mm, inset: 8pt, corner-radius: 6pt),
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
  [#underline(stroke: 1.5pt)[*Do NOT move the child*] unless in immediate life-threatening danger (fire, traffic, structural collapse).],
  [#underline(stroke: 1.5pt)[*Do NOT remove a helmet*] — leave for MDA paramedics (requires two trained rescuers).],
  [#underline(stroke: 1.5pt)[*Do NOT allow the child to stand or walk*] — standing/walking does NOT exclude spinal injury.],
  [#underline(stroke: 1.5pt)[*Do NOT give food or drink*] — imaging or surgery under anaesthesia may be needed.],
  [#underline(stroke: 1.5pt)[*Do NOT apply pressure to a depressed skull fracture*] or push back any protruding matter.],
  [#underline(stroke: 1.5pt)[*Do NOT insert anything into a wound.*]],
  [#underline(stroke: 1.5pt)[*Do NOT attempt to straighten the neck*] if in an abnormal position — hold as found.],
  [#underline(stroke: 1.5pt)[*Do NOT use head-tilt chin-lift*] to open the airway — use jaw thrust only.],
  [#underline(stroke: 1.5pt)[*Do NOT shake the child*] to assess responsiveness.],
  [#underline(stroke: 1.5pt)[*Do NOT leave the child alone*] — continuous monitoring is essential.],
  [#underline(stroke: 1.5pt)[*Do NOT stop the flow of clear fluid*] from ears or nose (may be cerebrospinal fluid).],
))

#v(12pt)

#equipment-box((
  "Disposable gloves",
  "Clean cloth or sterile bandages for wound control",
  "Blanket or coat for warmth",
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
    [Head injury], [פגיעת ראש], [pgi-AT ROSH],
    [Spinal injury], [פגיעת עמוד שדרה], [pgi-AT a-MUD shid-RA],
    [Spine], [עמוד שדרה], [a-MUD shid-RA],
    [Neck], [צוואר], [tsa-VAR],
    [Helmet], [קסדה], [kas-DA],
    [Consciousness], [הכרה], [ha-ka-RA],
    [Unconscious], [חסר הכרה], [kha-SAR ha-ka-RA],
    [Vomiting], [הקאות], [ha-ka-OT],
    [Seizure], [פרכוס], [pir-KUS],
    [Fontanelle], [מרפס], [mar-PES],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Do not move the child], [אל תזיזו את הילד], [al ta-ZI-zu et ha-YE-led],
    [The child fell], [הילד נפל], [ha-YE-led na-FAL],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — MDA BLS Guide (2016), MDA ALS Professional Manual (2024) \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
