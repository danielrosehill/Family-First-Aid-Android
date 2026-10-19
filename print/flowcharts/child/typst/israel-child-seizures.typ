// Israel Child Seizures Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-SEIZURES-001
// SOP: 049

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-SEIZURES-001"
#let sop-number = "049"
#let protocol-title = "Seizures (Including Febrile)"
#let protocol-subject = "SEIZURES"
#let scenario = "CONVULSIONS"
#let age-group = "CHILD"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2022-01-01"
#let last-verified = "2026-03-16"
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
#let icon-med = text(size: 12pt)[#emoji.pill]
#let icon-clock = text(size: 12pt)[#emoji.clock]

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
// PAGE 1: Flowchart — During the seizure
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Clear area
  node((0, 0), align(center)[
    #icon-calm #action[CLEAR] dangerous objects \
    from the child's vicinity. \
    Pad area if possible.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Position on side
  node((0, 1), align(center)[
    #icon-person #action[LAY] child on their side. \
    Support head, tilt \
    to side or slightly down.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Loosen clothing
  node((0, 2), align(center)[
    #action[LOOSEN] tight clothing \
    around neck and chest.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Time the seizure
  node((0, 3), align(center)[
    #icon-clock #action[TIME] the seizure. \
    Note when it started.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: First seizure?
  node((0, 4), align(center)[
    Is this the child's \
    first seizure?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  // MDA logo
  node((1, 3.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((1, 4), align(center)[
    #icon-phone #action[CALL] 101 \
    immediately. \
    First seizure always \
    requires evaluation.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 4), (0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (0, 5), "->",
    label: no-label,
    label-side: center),

  // Decision: Over 5 minutes or breathing difficulty?
  node((0, 5), align(center)[
    Seizure over 5 minutes? \
    Breathing difficulty? \
    Blue/pale skin?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #icon-phone #action[CALL] 101. \
    Medical emergency.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->",
    label: no-label,
    label-side: center),

  // Prescribed medication?
  node((0, 6), align(center)[
    Has child been prescribed \
    seizure-stopping medication \
    (e.g. rectal diazepam)?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (1, 6), "->",
    label: yes-label,
    label-side: center),

  node((1, 6), align(center)[
    #icon-med #action[ADMINISTER] per \
    doctor's instructions. \
    If seizure persists: \
    #action[CALL] 101.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (-1, 6), "->",
    label: no-label,
    label-side: center),

  node((-1, 6), align(center)[
    #icon-monitor Continue monitoring \
    until seizure stops.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Post-seizure and febrile management
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Post-Seizure and Febrile Management]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Febrile seizure: lukewarm towel
    node((0, 0), align(center)[
      *If febrile seizure:* \
      #action[WRAP] child in a \
      lukewarm damp towel \
      to help reduce fever.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // After seizure stops
    node((0, 1), align(center)[
      #icon-person After seizure stops: \
      #action[PLACE] in recovery \
      position (on side). \
      #action[MONITOR] breathing.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->"),

    // Decision: Regaining consciousness?
    node((0, 2), align(center)[
      Does the child regain \
      consciousness and \
      begin to recover?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (1, 2), "->",
      label: yes-label,
      label-side: center),

    node((1, 2), align(center)[
      #icon-monitor Continue to monitor. \
      Child may be drowsy \
      (post-ictal state is normal).
      #v(3pt)
      Seek paediatrician evaluation.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 2), (-1, 2), "->",
      label: no-label,
      label-side: center),

    // MDA logo
    node((-1, 1.5), align(center)[
      #image(mda-logo, width: 24pt)
    ],
      shape: rect, fill: none, stroke: none,
      width: 14mm, inset: 0pt),

    node((-1, 2), align(center)[
      #icon-phone #action[CALL] 101 \
      immediately. \
      Not regaining consciousness \
      is a medical emergency.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 42mm, inset: 6pt, corner-radius: 6pt),
  )
]

#v(16pt)

// Post-seizure fever management
#rect(fill: rgb("#f0f4ff"), stroke: 1pt + rgb("#6366f1"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: rgb("#4338ca"), weight: "bold", size: 12pt)[Post-Seizure Fever Management (Febrile Seizures)]
  #v(6pt)
  #set text(size: 10pt)
  Once the child has recovered and is no longer actively seizing: \
  - #action[ADMINISTER] age-appropriate fever-reducing medication (paracetamol or ibuprofen) as directed by the family doctor. \
  - Dress child in light clothing. Ventilate the room. \
  - Give plenty of fluids. \
  - A lukewarm bath (~20 min) may be given only when NOT actively seizing. \
  #v(4pt)
  #text(fill: rgb("#6b7280"), size: 9pt)[Note: Antipyretics improve comfort but have NOT been proven to prevent febrile seizures (Israeli Ministry of Health).]
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
  [#underline(stroke: 1.5pt)[*Do NOT force the child's mouth open*] — the child will not swallow their tongue.],
  [#underline(stroke: 1.5pt)[*Do NOT insert anything into the mouth*] — this can injure teeth or jaw.],
  [#underline(stroke: 1.5pt)[*Do NOT attempt CPR during the seizure*] — this can only cause harm.],
  [#underline(stroke: 1.5pt)[*Do NOT put the child in a bath or shower during the seizure.*]],
  [#underline(stroke: 1.5pt)[*Do NOT splash water on the child*] during the seizure.],
  [#underline(stroke: 1.5pt)[*Do NOT try to wake the child*] or stop the seizure by restraining or holding them down.],
  [#underline(stroke: 1.5pt)[*Do NOT give medications by mouth*] during the seizure.],
  [#underline(stroke: 1.5pt)[*Do NOT attempt to cool the child rapidly*] with cold water or ice.],
  [#underline(stroke: 1.5pt)[*Do NOT insert an airway device*] during an active seizure.],
  [#underline(stroke: 1.5pt)[*Do NOT attempt forced airway opening*] during an active seizure.],
))

#v(12pt)

#equipment-box((
  "Lukewarm damp towel (for febrile seizures)",
  "Pillows or blankets (to pad surroundings)",
  "Prescribed seizure-stopping medication if available (e.g., rectal diazepam)",
  "Fever-reducing medication for post-seizure fever management (paracetamol or ibuprofen, as directed by doctor)",
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
    [Seizure / convulsion], [פרכוס], [pir-KUS],
    [Febrile seizure], [פרכוס חום], [pir-KUS KHOM],
    [Fever], [חום], [KHOM],
    [Unconscious], [מחוסר הכרה], [me-khu-SAR ha-ka-RA],
    [Breathing], [נשימה], [nshi-MA],
    [Medication], [תרופה], [tru-FA],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Child], [ילד / ילדה], [YE-led / yal-DA],
    [The child is having a seizure], [הילד מפרכס], [ha-YE-led me-far-KES],
    [How long has the seizure lasted?], [?כמה זמן הפרכוס], [KA-ma ZMAN ha-pir-KUS?],
    [Does the child have a fever?], [?יש לילד חום], [YESH la-YE-led KHOM?],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — How to Treat Febrile Seizures \
  #strong[URL:] https://www.mdais.org/101/seizures \
  #strong[Publication date:] 2022-01-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
