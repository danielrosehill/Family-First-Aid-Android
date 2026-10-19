// Israel Adult Heart Attack Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-HEART-ATTACK-001
// SOP: 015

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-HEART-ATTACK-001"
#let sop-number = "015"
#let protocol-title = "Heart Attack — Chest Pain"
#let protocol-subject = "HEART ATTACK"
#let scenario = "CHEST PAIN"
#let age-group = "ADULT"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2024-04-01"
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
// PAGE 1: Initial Response — Call, Position, Aspirin
// ============================================================

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
    #icon-phone #action[CALL] 101 immediately. \
    State suspected heart attack. \
    Stay on line for guidance.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Action: Stop activity, position
  node((0, 1), align(center)[
    #icon-sit #action[STOP] all physical activity. \
    #action[POSITION] half-sitting \
    with back supported, \
    knees slightly bent. \
    #action[LOOSEN] tight clothing.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Decision: Allergic to aspirin?
  node((0, 2), align(center)[
    #icon-med Patient allergic \
    to aspirin?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  node((1, 2), align(center)[
    Skip aspirin. \
    Inform MDA team \
    about allergy.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 2), (0.5, 3.5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 2), (0, 3), "->",
    label: no-label,
    label-side: center),

  // Action: Give aspirin
  node((0, 3), align(center)[
    #icon-med #action[GIVE] 100–300 mg aspirin. \
    Patient must *CHEW* \
    (not swallow whole). \
    Standard Israeli tablet = 100 mg.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Has prescribed nitroglycerin?
  node((0, 4), align(center)[
    Patient has their own \
    prescribed nitroglycerin?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #action[HELP] patient take \
    their nitroglycerin \
    as prescribed.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 4), (0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (0, 5), "->"),

  // Action: Monitor and send for AED
  node((0, 5), align(center)[
    #icon-monitor #action[MONITOR] continuously. \
    Stay with patient at all times. \
    Send bystander to fetch AED.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->"),

  // Decision: Patient loses consciousness?
  node((0, 6), align(center)[
    #icon-breath Patient loses \
    consciousness and stops \
    breathing normally?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (1, 6), "->",
    label: yes-label,
    label-side: center),

  node((1, 6), align(center)[
    Cardiac arrest. \
    See Page 2: CPR / AED.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (-1, 6), "->",
    label: no-label,
    label-side: center),

  node((-1, 6), align(center)[
    #icon-monitor Continue monitoring. \
    Keep half-sitting. \
    Keep calm.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: CPR and AED
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[CPR and AED — Cardiac Arrest]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Action: Begin CPR
    node((0, 0), align(center)[
      #icon-heart #action[BEGIN] CPR immediately. \
      Heel of hand on centre \
      of chest. Compress hard \
      and fast: 5+ cm depth, \
      100–120/min.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // Decision: Trained in rescue breaths?
    node((0, 1), align(center)[
      Trained and willing \
      to give rescue breaths?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (1, 1), "->",
      label: yes-label,
      label-side: center),

    node((1, 1), align(center)[
      30 compressions, \
      then 2 breaths. \
      Repeat.
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 1), (-1, 1), "->",
      label: no-label,
      label-side: center),

    node((-1, 1), align(center)[
      Hands-only CPR. \
      Continuous compressions \
      without stopping.
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((1, 1), (0.5, 2), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    edge((-1, 1), (-0.5, 2), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    edge((0, 1), (0, 2), "->"),

    // Decision: AED available?
    node((0, 2), align(center)[
      AED available?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (1, 2), "->",
      label: yes-label,
      label-side: center),

    node((1, 2), align(center)[
      #action[APPLY] AED pads. \
      Follow voice prompts. \
      Ensure no one touches \
      patient during analysis.
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((1, 2), (1, 3), "->"),

    // Decision: Shock advised?
    node((1, 3), align(center)[
      AED advises shock?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((1, 3), (1, 4), "->",
      label: yes-label,
      label-side: center),

    node((1, 4), align(center)[
      Clear patient. \
      #action[PRESS] shock. \
      Resume CPR \
      immediately.
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 38mm, inset: 8pt, corner-radius: 6pt),

    edge((1, 3), (0.2, 3), "->",
      label: no-label,
      label-side: center),

    node((0.2, 3), align(center)[
      Resume CPR. \
      AED re-analyses \
      in ~2 min.
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 38mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->"),

    // Terminal
    node((0, 3), align(center)[
      #icon-monitor #action[CONTINUE] CPR until \
      MDA arrives, AED applied, \
      or patient regains \
      consciousness and breathes.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),
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
  [#underline(stroke: 1.5pt)[*Do NOT allow the patient to walk, exert, or dismiss symptoms.*]],
  [#underline(stroke: 1.5pt)[*Do NOT give food or beverages.*]],
  [#underline(stroke: 1.5pt)[*Do NOT leave the patient alone*] (except briefly to call for help).],
  [#underline(stroke: 1.5pt)[*Do NOT give aspirin if the patient is allergic.*]],
  [#underline(stroke: 1.5pt)[*Do NOT give nitroglycerin*] not prescribed to this specific patient.],
  [#underline(stroke: 1.5pt)[*Do NOT wait to see if symptoms resolve*] — every minute of delay increases irreversible heart damage.],
  [#underline(stroke: 1.5pt)[*Do NOT drive the patient to hospital*] — call 101 and wait for ambulance. MDA has cardiac monitoring equipment.],
  [#underline(stroke: 1.5pt)[*Do NOT substitute paracetamol (Acamol) for aspirin*] — only aspirin provides the antiplatelet effect.],
  [#underline(stroke: 1.5pt)[*Do NOT give aspirin as a whole tablet*] — it must be chewed for rapid absorption.],
))

#v(12pt)

#equipment-box((
  "Aspirin tablets (100 mg, 1–3 tablets for 100–300 mg total)",
  "AED (Automated External Defibrillator) — if available",
  "Phone (to call 101 MDA and optionally 1221 United Hatzalah)",
  "Nitroglycerin (only if prescribed to the patient)",
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
    [Heart attack], [התקף לב], [het-KEF lev],
    [Chest pain], [כאב בחזה], [ke-EV ba-kha-ZE],
    [Heart], [לב], [lev],
    [Aspirin], [אספירין], [as-pi-RIN],
    [Chew], [ללעוס], [lil-OS],
    [Nitroglycerin], [ניטרוגליצרין], [nit-ro-gli-tse-RIN],
    [Defibrillator], [דפיברילטור], [de-fib-ri-LA-tor],
    [CPR], [החייאה], [ha-kha-ya-A],
    [He is not breathing], [הוא לא נושם], [hu lo no-SHEM],
    [Are you allergic to aspirin?], [?יש לך אלרגיה לאספירין], [yesh le-KHA a-ler-GI-ya le-as-pi-RIN?],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — Heart Attack Protocol / ALS Protocol 2024 / BLS Guide 2016 \
  #strong[URL:] https://www.mdais.org/101/mi-signs \
  #strong[Publication date:] 2024-04-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
