// Israel Adult Head/Spinal Injury Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-HEAD-SPINAL-INJURY-001
// SOP: 014

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-HEAD-SPINAL-INJURY-001"
#let sop-number = "014"
#let protocol-title = "Head and Spinal Injury"
#let protocol-subject = "HEAD / SPINE"
#let scenario = "TRAUMA"
#let age-group = "ADULT"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2024-01-01"
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
// PAGE 1: Scene Safety, Call, Stabilisation
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Decision: Immediate life threat?
  node((0, 0), align(center)[
    #icon-warning Immediate life-threatening \
    danger? (fire, active \
    shooting, structural collapse)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (1, 0), "->",
    label: yes-label,
    label-side: center),

  node((1, 0), align(center)[
    #action[MOVE] only as last \
    resort — log-roll \
    keeping spine aligned.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->",
    label: no-label,
    label-side: center),

  edge((1, 0), (0.5, 1), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  // MDA logo
  node((0, 0.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Action: Call 101
  node((0, 1), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    Report location, mechanism, \
    consciousness, bleeding.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Decision: Isolated penetrating trauma?
  node((0, 2), align(center)[
    Isolated penetrating trauma \
    (stab/gunshot) without \
    blunt component?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  node((1, 2), align(center)[
    Spinal immobilisation \
    not required. \
    #action[MANAGE] wounds \
    and bleeding.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->",
    label: no-label,
    label-side: center),

  // Action: Manual in-line stabilisation
  node((0, 3), align(center)[
    #icon-calm #action[STABILISE] head manually. \
    Hands on both sides, \
    cup the ears. Hold head \
    neutral, aligned with body. \
    Maintain until EMS arrives.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Conscious and talking?
  node((0, 4), align(center)[
    #icon-breath Patient conscious \
    and talking?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    Airway is open. \
    Maintain stabilisation. \
    Proceed to bleeding \
    control (Page 2).
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->",
    label: no-label,
    label-side: center),

  // Action: Jaw thrust
  node((0, 5), align(center)[
    #action[OPEN] airway with \
    jaw thrust only. Push jaw \
    forward from behind angles. \
    Do NOT tilt head.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->"),

  // Decision: Breathing and pulse?
  node((0, 6), align(center)[
    #icon-breath Patient breathing \
    and has pulse?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (1, 6), "->",
    label: yes-label,
    label-side: center),

  node((1, 6), align(center)[
    #icon-monitor Maintain stabilisation \
    and jaw thrust. \
    Proceed to Page 2.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (-1, 6), "->",
    label: no-label,
    label-side: center),

  node((-1, 6), align(center)[
    #icon-heart #action[BEGIN] CPR with \
    spinal precautions. \
    Use jaw thrust for \
    ventilations (2 responders).
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 42mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Bleeding, Neuro Assessment, Monitoring
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Bleeding, Assessment, and Monitoring]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 9mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Decision: Skull fracture suspected?
    node((0, 0), align(center)[
      Suspected skull fracture? \
      (depressed bone, visible \
      deformity, brain matter)
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (1, 0), "->",
      label: yes-label,
      label-side: center),

    node((1, 0), align(center)[
      #action[COVER] loosely with \
      sterile dressing. \
      Do NOT apply pressure. \
      Allow ear/nose drainage.
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 0), (-1, 0), "->",
      label: no-label,
      label-side: center),

    node((-1, 0), align(center)[
      #action[APPLY] gentle direct \
      pressure to scalp \
      wounds with clean \
      dressing.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((1, 0), (0.5, 1), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    edge((-1, 0), (-0.5, 1), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    edge((0, 0), (0, 1), "->"),

    // Action: Neuro assessment
    node((0, 1), align(center)[
      #icon-monitor #action[ASSESS] neurology: \
      Sensation in all 4 limbs? \
      Move fingers and toes? \
      Pupil size equal? \
      Report findings to MDA.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->"),

    // Action: C-collar if available
    node((0, 2), align(center)[
      If cervical collar available \
      and correctly sized: \
      #action[APPLY] with 2nd person \
      maintaining stabilisation.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->"),

    // Action: Monitor continuously
    node((0, 3), align(center)[
      #icon-monitor #action[MONITOR] continuously. \
      Keep still and calm. \
      Keep warm (blanket). \
      Watch for: loss of \
      consciousness, vomiting, \
      seizures, unequal pupils.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (0, 4), "->"),

    // Decision: Helmet?
    node((0, 4), align(center)[
      Patient wearing helmet \
      and unable to breathe?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 4), (1, 4), "->",
      label: yes-label,
      label-side: center),

    node((1, 4), align(center)[
      #action[REMOVE] helmet with \
      2 trained responders: \
      one maintains C-spine, \
      other removes helmet.
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 4), (-1, 4), "->",
      label: no-label,
      label-side: center),

    node((-1, 4), align(center)[
      #action[LEAVE] helmet in place. \
      Open face shield for \
      airway monitoring.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((1, 4), (0.5, 5), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    edge((0, 4), (0, 5), "->"),

    // Terminal
    node((0, 5), align(center)[
      #icon-monitor Continue manual \
      stabilisation and monitoring \
      until MDA arrives.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),
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
  [#underline(stroke: 1.5pt)[*Do NOT move the patient*] unless there is immediate danger to life (fire, active threat, collapse).],
  [#underline(stroke: 1.5pt)[*Do NOT twist, flex, or extend the neck.*]],
  [#underline(stroke: 1.5pt)[*Do NOT attempt to sit the patient up.*]],
  [#underline(stroke: 1.5pt)[*Do NOT use head-tilt chin-lift*] — use jaw thrust only.],
  [#underline(stroke: 1.5pt)[*Do NOT remove a helmet*] without proper training and a second person.],
  [#underline(stroke: 1.5pt)[*Do NOT give food or drink.*]],
  [#underline(stroke: 1.5pt)[*Do NOT leave the patient alone.*]],
  [#underline(stroke: 1.5pt)[*Do NOT apply direct pressure to a suspected skull fracture.*]],
  [#underline(stroke: 1.5pt)[*Do NOT plug ears or nose*] if blood or clear fluid is draining.],
  [#underline(stroke: 1.5pt)[*Do NOT pull the patient by arms or legs.*]],
  [#underline(stroke: 1.5pt)[*Do NOT extract from a vehicle*] unless the vehicle is on fire or there is another immediate threat.],
  [#underline(stroke: 1.5pt)[*Do NOT give oral fluids*] even if dehydrated — risk of vomiting and aspiration.],
  [#underline(stroke: 1.5pt)[*Do NOT attempt to straighten the head*] if the patient resists or reports pain — stabilise in position found.],
))

#v(12pt)

#equipment-box((
  "Disposable gloves",
  "Clean dressings or bandages for wound care",
  "Sterile dressing for skull fracture coverage",
  "Cervical collar (if available and properly sized)",
  "Blanket or thermal protection",
  "Tourniquet (CAT) for associated limb haemorrhage",
  "High-visibility vest (if responding at a road accident)",
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
    [Head injury], [פגיעת ראש], [pgi-AT rosh],
    [Spinal injury], [פגיעת עמוד שדרה], [pgi-AT a-MUD shid-RA],
    [Concussion], [זעזוע מוח], [ziz-U-a MO-akh],
    [Neck], [צוואר], [tsa-VAR],
    [Spine], [עמוד שדרה], [a-MUD shid-RA],
    [Do not move], [לא לזוז], [lo la-ZUZ],
    [Can you feel your legs?], [?אתה מרגיש את הרגליים], [a-TA mar-GISH et ha-rag-LA-yim?],
    [Can you move your fingers?], [?אתה יכול להזיז אצבעות], [a-TA ya-KHOL le-ha-ZIZ ets-ba-OT?],
    [Helmet], [קסדה], [kas-DA],
    [Recovery position], [תנוחת התאוששות], [tnu-KHAT hit-o-she-SHUT],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — BLS Guide 2016 / ALS Professional Manual 2024 \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Publication date:] 2024-01-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
