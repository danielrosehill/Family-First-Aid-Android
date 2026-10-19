// Israel Child Stroke Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-STROKE-001
// SOP: 055

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-STROKE-001"
#let sop-number = "055"
#let protocol-title = "Stroke (Cerebrovascular Event) — Child"
#let protocol-subject = "STROKE"
#let scenario = "FAST ASSESSMENT"
#let age-group = "CHILD"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2024-11-18"
#let last-verified = "2026-03-15"
#let generation-date = "2026-03-16"
#let version = "3.0"

// === ICON PATHS ===
#let mda-logo = "../../../../icons/mda/mda.png"

// === ICONS (inline helpers) ===
#let icon-phone = text(size: 12pt)[#emoji.phone]
#let icon-breath = text(size: 12pt)[#emoji.wind]
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-calm = text(size: 12pt)[#emoji.hands.open]
#let icon-person = text(size: 12pt)[#emoji.person]
#let icon-heart = text(size: 12pt)[#emoji.heart]
#let icon-clock = text(size: 12pt)[#emoji.clock]
#let icon-brain = text(size: 12pt)[#emoji.brain]

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
// PAGE 1: FAST Assessment & Initial Response
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // FAST assessment
  node((0, 0), align(center)[
    #icon-brain #action[APPLY] FAST assessment: \
    *F* — Face: ask child to smile \
    (drooping? asymmetry?) \
    *A* — Arms: raise both arms \
    (one drifts down?) \
    *S* — Speech: repeat a phrase \
    (slurred? confused?) \
    *T* — Time: note exact onset time
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: Any FAST signs?
  node((0, 1), align(center)[
    Any FAST sign present, \
    or other neurological signs?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 0.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((1, 1), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    State: suspected child stroke. \
    Describe symptoms observed.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 1), (0.5, 2), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 1), (-1, 1), "->",
    label: no-label,
    label-side: center),

  node((-1, 1), align(center)[
    #icon-monitor Continue monitoring. \
    If symptoms develop or \
    concern remains, call 101.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  // Note time
  edge((0, 1), (0, 2), "->"),

  node((0, 2), align(center)[
    #icon-clock #action[NOTE] exact time \
    symptoms began. \
    If not witnessed: last time \
    child was seen normal.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Decision: Conscious?
  node((0, 3), align(center)[
    #icon-person Is the child \
    conscious?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #action[LAY] child down with \
    head and shoulders \
    slightly elevated. \
    #action[KEEP] calm and still. \
    Loosen tight clothing.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 3), (0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 3), (0, 4), "->",
    label: no-label,
    label-side: left),

  // Decision: Unconscious — breathing?
  node((0, 4), align(center)[
    #icon-breath Is the unconscious \
    child breathing?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #action[PLACE] in recovery \
    position (on side). \
    #icon-monitor Monitor continuously.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 4), (0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (-1, 4), "->",
    label: no-label,
    label-side: center),

  node((-1, 4), align(center)[
    #icon-heart #action[BEGIN] CPR \
    immediately. \
    Follow MDA dispatcher \
    instructions.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  // Seizure management
  edge((0, 4), (0, 5), "->"),

  node((0, 5), align(center)[
    Is the child having \
    a seizure?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #action[CLEAR] area around child. \
    After seizure: place on side. \
    Note duration and type.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->",
    label: no-label,
    label-side: left),

  edge((1, 5), (0.5, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  // Monitor
  node((0, 6), align(center)[
    #icon-monitor #action[MONITOR] continuously \
    until EMS arrives. \
    Watch for changes in \
    consciousness and breathing. \
    #action[PREPARE] for CPR.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Reference Notes
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Reference Notes]
]
#v(8pt)

#do-not-box((
  [#underline(stroke: 1.5pt)[*Do NOT delay calling 101*] to wait and see if symptoms resolve.],
  [#underline(stroke: 1.5pt)[*Do NOT give the child any food or drink*] — stroke may impair swallowing reflex, creating aspiration and choking risk.],
  [#underline(stroke: 1.5pt)[*Do NOT give any medications, especially not aspirin*] — if the stroke is haemorrhagic, aspirin will worsen it.],
  [#underline(stroke: 1.5pt)[*Do NOT drive the child to hospital yourself*] unless MDA explicitly advises it. MDA ambulances begin treatment en route.],
  [#underline(stroke: 1.5pt)[*Do NOT assume a child cannot have a stroke*] — children can have strokes at any age.],
  [#underline(stroke: 1.5pt)[*Do NOT restrain the child during a seizure.*]],
  [#underline(stroke: 1.5pt)[*Do NOT put anything in the child's mouth*] during a seizure.],
  [#underline(stroke: 1.5pt)[*Do NOT rely solely on FAST to rule out stroke in children*] — adult screening tools are not validated for the pediatric population.],
))

#v(12pt)

// === PEDIATRIC STROKE NOTES ===
#rect(fill: rgb("#fef9e7"), stroke: 1pt + rgb("#d97706"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: rgb("#92400e"), weight: "bold", size: 13pt)[Pediatric Stroke — Key Differences from Adults]
  #v(6pt)
  #set text(size: 10pt)
  - Seizures at onset are more common in children than adults \
  - Symptoms may appear gradually rather than suddenly \
  - Very young children may show only irritability, feeding difficulty, or lethargy \
  - FAST assessment is not validated for the pediatric population \
  - Treatment window: alteplase effective within ~4.5 hours (ages 28 days–18 years) \
  - Mechanical clot removal may be effective for ages 6+ within 6–24 hours
]

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
    [Stroke], [שבץ מוחי], [SHEV-ets mo-KHI],
    [Face], [פנים], [pa-NIM],
    [Arm], [זרוע], [zro-A],
    [Speech], [דיבור], [di-BUR],
    [Seizure], [פרכוס], [pir-KUS],
    [Headache], [כאב ראש], [ke-EV ROSH],
    [Consciousness], [הכרה], [ha-ka-RA],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [The child may be having a stroke], [ייתכן שהילד סובל משבץ], [yi-ta-KHEN she-ha-YE-led so-VEL mi-SHEV-ets],
    [Can you smile?], [?אתה יכול לחייך], [a-TA ya-KHOL le-kha-YEKH?],
    [Raise both arms], [תרים את שתי הידיים], [ta-RIM et shTEI ha-ya-DA-yim],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — MDA Stroke Recognition Protocol (FAST) and AHA 2024 First Aid Guidelines — Pediatric Stroke Considerations \
  #strong[URL:] https://www.mdais.org/101/stroke \
  #strong[Publication date:] 2024-11-18 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-15
]
