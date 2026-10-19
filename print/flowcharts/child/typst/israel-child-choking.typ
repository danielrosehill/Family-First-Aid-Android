// Israel Child Choking Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-CHOKING-001
// SOP: 034

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-CHOKING-001"
#let sop-number = "034"
#let protocol-title = "Choking — Airway Obstruction"
#let protocol-subject = "CHOKING"
#let scenario = "FOREIGN BODY"
#let age-group = "CHILD"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2026-01-01"
#let last-verified = "2026-03-16"
#let generation-date = "2026-03-16"
#let version = "3.0"

#let mda-logo = "../../../../icons/mda/mda.png"

#let icon-phone = text(size: 12pt)[#emoji.phone]
#let icon-breath = text(size: 12pt)[#emoji.wind]
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-heart = text(size: 12pt)[#emoji.heart]

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

#let clr-age-child = rgb("#0d9488")
#let clr-condition = rgb("#1e40af")
#let clr-scenario = rgb("#4b5563")

#let clr-page-bg = rgb("#1e293b")
#let clr-page-fg = white

#let clr-header-bg = rgb("#f8f9fb")
#let clr-header-border = rgb("#e2e5ea")

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
// PAGE 1: Assessment and Age Determination
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Assess
  node((0, 0), align(center)[
    #icon-monitor #action[ASSESS] the choking victim. \
    Can they speak, cry, or cough?
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: can cough?
  node((0, 1), align(center)[
    #icon-breath Can the child cough \
    forcefully, cry, or breathe?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 1), align(center)[
    #action[ENCOURAGE] coughing. \
    #action[MONITOR] closely.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->",
    label: no-label,
    label-side: center),

  // MDA logo above call box
  node((0, 1.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Call for help
  node((0, 2), align(center)[
    #icon-phone #action[CALL] for help. \
    Have bystander call 101. \
    If alone: intervene first.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Age decision
  node((0, 3), align(center)[
    Is the victim an infant \
    (under 1 year)?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (-1, 3), "->",
    label: yes-label,
    label-side: center),

  node((-1, 3), align(center)[
    *INFANT PROTOCOL* \
    Back blows + chest thrusts.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: no-label,
    label-side: center),

  node((1, 3), align(center)[
    *CHILD PROTOCOL (1-8 yr)* \
    Abdominal thrusts (Heimlich).
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // INFANT path
  edge((-1, 3), (-1, 4), "->"),

  node((-1, 4), align(center)[
    #action[DELIVER] 5 back blows. \
    Face-down on forearm, \
    head lower than body.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 4), (-1, 5), "->"),

  node((-1, 5), align(center)[
    #action[DELIVER] 5 chest thrusts. \
    Face-up, 2 fingers below \
    nipple line, ~4 cm depth.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 5), (-1, 6), "->"),

  node((-1, 6), align(center)[
    Object expelled?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 6), (-1, 7), "->",
    label: no-label,
    label-side: center),

  node((-1, 7), align(center)[
    #action[ALTERNATE] 5 back blows \
    and 5 chest thrusts. \
    If loses consciousness: \
    proceed to CPR (page 2).
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // CHILD path
  edge((1, 3), (1, 4), "->"),

  node((1, 4), align(center)[
    #action[PERFORM] abdominal thrusts. \
    Stand/kneel behind child. \
    Fist above navel, below ribs. \
    Thrust inward and upward.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 4), (1, 5), "->"),

  node((1, 5), align(center)[
    Object expelled and \
    child can breathe?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 5), (1, 6), "->",
    label: yes-label,
    label-side: center),

  node((1, 6), align(center)[
    #action[STOP]. #action[MONITOR] child. \
    Seek medical evaluation.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 5), (1, 7), "->",
    label: no-label,
    label-side: center),

  node((1, 7), align(center)[
    #action[CONTINUE] thrusts. \
    If loses consciousness: \
    proceed to CPR (page 2).
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: CPR Transition
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[CPR Transition (Unconscious Victim)]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Stop choking manoeuvres
    node((0, 0), align(center)[
      Victim loses consciousness. \
      #action[STOP] all choking manoeuvres.
      #v(3pt)
      #action[PLACE] on firm, flat surface.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    // MDA logo
    node((0, -0.5), align(center)[
      #image(mda-logo, width: 24pt)
    ],
      shape: rect, fill: none, stroke: none,
      width: 14mm, inset: 0pt),

    edge((0, 0), (0, 1), "->"),

    // Call 101
    node((0, 1), align(center)[
      #icon-phone #action[CALL] 101 if not already done. \
      If alone: 5 CPR cycles first, \
      then call.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->"),

    // Begin CPR
    node((0, 2), align(center)[
      #icon-heart #action[BEGIN] CPR. \
      Solo: 30:2 ratio. \
      Two rescuers: 15:2 ratio. \
      Before each breath set: \
      look in mouth, remove visible objects.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->"),

    // Infant or child CPR?
    node((0, 3), align(center)[
      Is the victim an infant?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (-1, 3), "->",
      label: yes-label,
      label-side: center),

    node((-1, 3), align(center)[
      Two-finger compressions. \
      Slight head tilt only. \
      Mouth-to-mouth-and-nose.
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 3), (1, 3), "->",
      label: no-label,
      label-side: center),

    node((1, 3), align(center)[
      One-hand compressions. \
      Standard head-tilt chin-lift. \
      Mouth-to-mouth.
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    // Rejoin
    edge((-1, 3), (-0.5, 4), "->",
      stroke: 1pt + clr-rejoin, dash: "dashed"),
    edge((1, 3), (0.5, 4), "->",
      stroke: 1pt + clr-rejoin, dash: "dashed"),

    edge((0, 3), (0, 4), "->"),

    // Continue CPR
    node((0, 4), align(center)[
      #icon-heart #action[CONTINUE] CPR until \
      EMS arrives, victim recovers, \
      or AED is available.
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
  [#underline(stroke: 1.5pt)[*Do NOT perform abdominal thrusts on infants under 1 year*] -- use only back blows and chest thrusts. Risk of organ damage.],
  [#underline(stroke: 1.5pt)[*Do NOT insert fingers blindly into the mouth*] (blind finger sweeps) -- only remove objects you can clearly see.],
  [#underline(stroke: 1.5pt)[*Do NOT force anything into the mouth*] -- risk of pushing the object deeper.],
  [#underline(stroke: 1.5pt)[*Do NOT give food or fluids*] to a choking victim.],
  [#underline(stroke: 1.5pt)[*Do NOT intervene if the child is coughing effectively*] -- allow the body to clear the obstruction.],
  [#underline(stroke: 1.5pt)[*Do NOT use this protocol for choking caused by asthma, infection, or head injury*] -- seek immediate medical care.],
  [#underline(stroke: 1.5pt)[*Do NOT use excessive force*] during abdominal thrusts that would lift the child off the ground.],
  [#underline(stroke: 1.5pt)[*Do NOT fully extend an infant's head*] when opening the airway -- use slight tilt position only.],
))

#v(12pt)

#equipment-box((
  "AED with paediatric pads (if available, for CPR transition)",
))

#v(12pt)

// === HEBREW TERMINOLOGY PHRASEBOOK ===
#rect(fill: rgb("#f0f4ff"), stroke: 1pt + rgb("#6366f1"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: rgb("#4338ca"), weight: "bold", size: 14pt)[Hebrew Terminology — #text(dir: rtl)[מונחים בעברית]]
  #v(6pt)
  #set text(size: 10pt)
  #table(
    columns: (1fr, 1fr, 1fr),
    align: (left, right, left),
    stroke: 0.5pt + rgb("#c7d2fe"),
    inset: 6pt,
    fill: (x, y) => if y == 0 { rgb("#e0e7ff") } else { none },
    [*English*], [*עברית*], [*Pronunciation*],
    [Choking], [חנק], [KHE-nek],
    [Foreign body], [גוף זר], [guf zar],
    [Coughing], [שיעול], [shi-UL],
    [Back blows], [מכות גב], [ma-KOT gav],
    [Chest thrusts], [לחיצות חזה], [le-khi-TSOT kha-ZE],
    [Abdominal thrusts], [לחיצות בטן], [le-khi-TSOT BE-ten],
    [Breathing], [נשימה], [ne-shi-MA],
    [CPR], [החייאה], [ha-kha-ya-A],
    [Child], [ילד / ילדה], [YE-led / yal-DA],
    [Infant], [תינוק / תינוקת], [ti-NOK / ti-NO-ket],
    [The child is choking!], [!הילד נחנק], [ha-YE-led nekh-NAK!],
    [Ambulance], [אמבולנס], [am-bu-LANS],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) -- MDA 101 Public First Aid Guidance Series \
  #strong[URL:] https://www.mdais.org/101/asphyxia \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16 \
  #strong[Notes:] Infant (0-1 year), child (1-8 years). Physical size should guide technique selection, not age alone.
]
