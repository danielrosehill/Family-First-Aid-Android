// Israel Child CPR Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-CPR-001
// SOP: 035

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-CPR-001"
#let sop-number = "035"
#let protocol-title = "CPR — Cardiopulmonary Resuscitation"
#let protocol-subject = "CPR"
#let scenario = "CARDIAC ARREST"
#let age-group = "CHILD"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2024-04-01"
#let last-verified = "2026-03-16"
#let generation-date = "2026-03-16"
#let version = "3.0"

#let mda-logo = "../../../../icons/mda/mda.png"

#let icon-phone = text(size: 12pt)[#emoji.phone]
#let icon-breath = text(size: 12pt)[#emoji.wind]
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-heart = text(size: 12pt)[#emoji.heart]
#let icon-sit = text(size: 12pt)[#emoji.person]

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
// PAGE 1: Assessment Phase
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Scene safety
  node((0, 0), align(center)[
    #action[ENSURE] scene is safe \
    before approaching.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Check responsiveness
  node((0, 1), align(center)[
    #icon-monitor #action[CHECK] responsiveness. \
    Infant: tap sole of foot. \
    Child: tap and shout.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Decision: responsive?
  node((0, 2), align(center)[
    Is the child/infant \
    responsive?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  node((1, 2), align(center)[
    #action[MONITOR] the child. \
    #action[CALL] 101 if concerned.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->",
    label: no-label,
    label-side: center),

  // Check breathing
  node((0, 3), align(center)[
    #icon-breath #action[CHECK] breathing. \
    Look, listen, feel (max 10 sec).
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: breathing?
  node((0, 4), align(center)[
    Breathing normally?
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
    Recovery position. \
    #icon-phone #action[CALL] 101. \
    #action[MONITOR] breathing.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->",
    label: no-label,
    label-side: center),

  // Call for help
  node((0, 5), align(center)[
    Are you alone with \
    the child/infant?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #icon-heart #action[BEGIN] CPR now. \
    After 2 min (5 cycles), \
    call 101 and get AED.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  // MDA logo
  node((-1, 4.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((-1, 5), align(center)[
    #icon-phone #action[SEND] them to call 101 \
    and fetch AED.
    #v(3pt)
    You: #action[BEGIN] CPR now.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: CPR Technique (C-A-B)
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[CPR Technique (C-A-B)]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Compressions
    node((0, 0), align(center)[
      #icon-heart *C* — #action[BEGIN] chest compressions. \
      Firm, flat surface. \
      Rate: 100-120/min. Full recoil.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // Decision: infant?
    node((0, 1), align(center)[
      Is the patient an infant \
      (under 1 year)?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (-1, 1), "->",
      label: yes-label,
      label-side: center),

    node((-1, 1), align(center)[
      Solo: two-finger technique. \
      Two rescuers: two-thumb \
      encircling hands. \
      Depth: ~4 cm (1/3 chest).
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 1), (1, 1), "->",
      label: no-label,
      label-side: center),

    node((1, 1), align(center)[
      Heel of one or two hands. \
      Depth: ~5 cm (1/3 chest).
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    // Rejoin
    edge((-1, 1), (-0.5, 2), "->",
      stroke: 1pt + clr-rejoin, dash: "dashed"),
    edge((1, 1), (0.5, 2), "->",
      stroke: 1pt + clr-rejoin, dash: "dashed"),

    edge((0, 1), (0, 2), "->"),

    // Airway
    node((0, 2), align(center)[
      #icon-breath *A* — #action[OPEN] airway. \
      Infant: neutral/sniffing position. \
      Child: head-tilt chin-lift.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->"),

    // Breathing
    node((0, 3), align(center)[
      *B* — #action[DELIVER] 2 rescue breaths. \
      1 second each. Watch for chest rise.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (0, 4), "->"),

    // Decision: infant breaths?
    node((0, 4), align(center)[
      Is the patient an infant?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 4), (-1, 4), "->",
      label: yes-label,
      label-side: center),

    node((-1, 4), align(center)[
      Seal mouth over infant's \
      mouth AND nose. \
      Gentle puffs from cheeks.
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 4), (1, 4), "->",
      label: no-label,
      label-side: center),

    node((1, 4), align(center)[
      Pinch nose, seal mouth. \
      Breathe until chest rise.
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    // Rejoin
    edge((-1, 4), (-0.5, 5), "->",
      stroke: 1pt + clr-rejoin, dash: "dashed"),
    edge((1, 4), (0.5, 5), "->",
      stroke: 1pt + clr-rejoin, dash: "dashed"),

    edge((0, 4), (0, 5), "->"),

    // Ratio
    node((0, 5), align(center)[
      Two or more rescuers?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 5), (1, 5), "->",
      label: yes-label,
      label-side: center),

    node((1, 5), align(center)[
      Use *15:2* ratio. \
      Infants: switch to \
      two-thumb technique.
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 5), (-1, 5), "->",
      label: no-label,
      label-side: center),

    node((-1, 5), align(center)[
      Use *30:2* ratio.
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 42mm, inset: 6pt, corner-radius: 6pt),
  )
]

// ============================================================
// PAGE 3: AED and Continuation
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[AED & Continuation]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // AED
    node((0, 0), align(center)[
      #action[APPLY] AED when available. \
      Use paediatric pads if available. \
      Small chest: anteroposterior placement.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // After shock
    node((0, 1), align(center)[
      #icon-heart After AED shock, \
      #action[RESUME] CPR immediately. \
      5 cycles before reassessing.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->"),

    // Decision: breathing?
    node((0, 2), align(center)[
      Child started breathing \
      and responding?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (1, 2), "->",
      label: yes-label,
      label-side: center),

    node((1, 2), align(center)[
      #action[STOP] CPR. \
      Recovery position. \
      #icon-monitor #action[MONITOR] until \
      MDA arrives.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 2), (-1, 2), "->",
      label: no-label,
      label-side: center),

    node((-1, 2), align(center)[
      #icon-heart #action[CONTINUE] CPR \
      without interruption \
      until MDA arrives or \
      physically unable.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 42mm, inset: 6pt, corner-radius: 6pt),
  )
]

#v(10pt)

// Key parameters
#keep-together[
  #rect(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), radius: 6pt, width: 100%, inset: 12pt)[
    #text(fill: rgb("#1e40af"), weight: "bold", size: 13pt)[Key Paediatric CPR Parameters]
    #v(6pt)
    #grid(
      columns: (1fr, 1fr),
      gutter: 8pt,
      [#strong[Compression rate:] 100-120/min],
      [#strong[Child depth:] ~5 cm (1/3 chest)],
      [#strong[Infant depth:] ~4 cm (1/3 chest)],
      [#strong[Solo ratio:] 30:2],
      [#strong[Two-rescuer ratio:] 15:2],
      [#strong[Breath duration:] 1 second each],
      [#strong[Lone rescuer:] 2 min CPR, then call 101],
      [#strong[Emergency number:] 101 (MDA)],
    )
  ]
]

// ============================================================
// PAGE 4: Reference Notes
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Reference Notes]
]
#v(8pt)

#do-not-box((
  [#underline(stroke: 1.5pt)[*Do NOT hyperextend an infant's neck*] when opening the airway -- use neutral/sniffing position only.],
  [#underline(stroke: 1.5pt)[*Do NOT insert fingers into the mouth*] (risk of pushing objects deeper).],
  [#underline(stroke: 1.5pt)[*Do NOT deliver deep lung breaths to infants*] -- use gentle puffs from your cheeks.],
  [#underline(stroke: 1.5pt)[*Do NOT use excessive volume or pressure*] when delivering rescue breaths (risk of gastric distension).],
  [#underline(stroke: 1.5pt)[*Do NOT skip rescue breaths*] in paediatric CPR -- compression-only CPR is NOT adequate for children and infants.],
  [#underline(stroke: 1.5pt)[*Do NOT delay CPR to call for help when alone*] -- perform 2 minutes of CPR first, then call 101.],
  [#underline(stroke: 1.5pt)[*Do NOT allow AED pads to touch or overlap*] on a small child or infant.],
  [#underline(stroke: 1.5pt)[*Do NOT stop CPR to check for pulse*] unless there are clear signs of recovery (breathing, movement).],
  [#underline(stroke: 1.5pt)[*Do NOT compress over the xiphoid process*] (the very bottom tip of the sternum).],
))

#v(12pt)

#equipment-box((
  "AED with paediatric pads or paediatric dose attenuator (if available)",
  "Barrier device or pocket mask (optional, for rescue breaths)",
  "Bag-valve-mask -- infant size (250-350 cc) or paediatric size (if available)",
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
    [CPR], [החייאה], [ha-kha-ya-A],
    [Cardiac arrest], [דום לב], [dom lev],
    [Chest compressions], [לחיצות חזה], [le-khi-TSOT kha-ZE],
    [Rescue breaths], [הנשמות], [han-sha-MOT],
    [Not breathing], [לא נושם], [lo no-SHEM],
    [Unconscious], [מחוסר הכרה], [me-khu-SAR ha-ka-RA],
    [Defibrillator], [דפיברילטור], [de-fib-ri-LA-tor],
    [Recovery position], [תנוחת התאוששות], [tnu-KHAT hit-o-she-SHUT],
    [Child], [ילד / ילדה], [YE-led / yal-DA],
    [Infant], [תינוק / תינוקת], [ti-NOK / ti-NO-ket],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [The child is not breathing!], [!הילד לא נושם], [ha-YE-led lo no-SHEM!],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — BLS Guide 2016 / ALS Professional Handbook 2024 \
  #strong[URL:] https://www.mdais.org/kursim/cpr-children \
  #strong[Publication date:] 2024-04-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16 \
  #strong[Notes:] Unified from MDA and United Hatzalah. In children, cardiac arrest is almost always secondary to respiratory failure -- rescue breaths are critically important.
]
