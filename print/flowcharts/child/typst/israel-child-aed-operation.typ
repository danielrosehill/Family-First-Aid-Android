// Israel Child AED Operation Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-AED-OPERATION-001
// SOP: 029

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-AED-OPERATION-001"
#let sop-number = "029"
#let protocol-title = "AED Operation — Paediatric"
#let protocol-subject = "AED OPERATION"
#let scenario = "CARDIAC ARREST"
#let age-group = "CHILD"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2025-01-01"
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
#let icon-zap = text(size: 12pt)[#emoji.lightning]

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
// PAGE 1: Recognition, CPR, AED Setup
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Recognise cardiac arrest
  node((0, 0), align(center)[
    #icon-monitor #action[CHECK] responsiveness \
    and breathing (max 10 sec).
    #v(3pt)
    Tap shoulders / flick sole of foot.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: Bystander available?
  node((0, 1), align(center)[
    #icon-breath Bystander \
    available to help?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  // MDA logo above YES branch
  node((1, 0.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((1, 1), align(center)[
    #icon-phone #action[SEND] bystander to \
    call 101 and fetch AED.
    #v(3pt)
    #action[BEGIN] CPR immediately.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 50mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 1), (-1, 1), "->",
    label: no-label,
    label-side: center),

  node((-1, 1), align(center)[
    #icon-heart #action[BEGIN] CPR for \
    2 minutes (5 cycles).
    #v(3pt)
    Then call 101 and fetch AED.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 50mm, inset: 8pt, corner-radius: 6pt),

  // Rejoin
  edge((1, 1), (0.5, 2), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),
  edge((-1, 1), (-0.5, 2), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),

  edge((0, 1), (0, 2), "->"),

  // CPR while waiting
  node((0, 2), align(center)[
    #icon-heart #action[PERFORM] CPR \
    appropriate to age.
    #v(3pt)
    Child (1-8): one-hand, 5 cm depth. \
    Infant (under 1): two-finger, 4 cm depth.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // AED arrives
  node((0, 3), align(center)[
    #icon-zap #action[OPEN] AED and \
    power on the device.
    #v(3pt)
    Follow voice instructions.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Paediatric mode?
  node((0, 4), align(center)[
    #icon-zap Paediatric mode \
    or paediatric pads available?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #action[ACTIVATE] paediatric \
    mode / use paediatric pads.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (-1, 4), "->",
    label: no-label,
    label-side: center),

  node((-1, 4), align(center)[
    #action[USE] adult pads. \
    Proceed without delay.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // Rejoin
  edge((1, 4), (0.5, 5), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),
  edge((-1, 4), (-0.5, 5), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),

  edge((0, 4), (0, 5), "->"),

  // Expose chest and apply pads
  node((0, 5), align(center)[
    #action[EXPOSE] bare chest. \
    Dry skin. Remove patches.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->"),

  // Decision: Chest large enough?
  node((0, 6), align(center)[
    Chest large enough for \
    both pads on front \
    (2.5 cm gap, no overlap)?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (1, 6), "->",
    label: yes-label,
    label-side: center),

  node((1, 6), align(center)[
    #action[PLACE] anterolateral: \
    Pad 1 below R collarbone. \
    Pad 2 L side below armpit.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (-1, 6), "->",
    label: no-label,
    label-side: center),

  node((-1, 6), align(center)[
    #action[PLACE] anteroposterior: \
    Front pad on sternum. \
    Back pad between shoulder blades.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: AED Analysis and Shock Cycle
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[AED Analysis & Shock Cycle]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Allow AED to analyse
    node((0, 0), align(center)[
      #icon-zap #action[ALLOW] AED to analyse. \
      Ensure nobody touches the child.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // Decision: Shock advised?
    node((0, 1), align(center)[
      #icon-zap Does the AED \
      advise a shock?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (1, 1), "->",
      label: yes-label,
      label-side: center),

    node((1, 1), align(center)[
      #action[CLEAR] everyone away. \
      Call out "Stand clear!" \
      #action[PRESS] shock button.
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 1), (-1, 1), "->",
      label: no-label,
      label-side: center),

    node((-1, 1), align(center)[
      No shock advised. \
      #action[RESUME] CPR immediately.
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    // Rejoin
    edge((1, 1), (0.5, 2), "->",
      stroke: 1pt + clr-rejoin, dash: "dashed"),
    edge((-1, 1), (-0.5, 2), "->",
      stroke: 1pt + clr-rejoin, dash: "dashed"),

    edge((0, 1), (0, 2), "->"),

    // Resume CPR
    node((0, 2), align(center)[
      #icon-heart #action[RESUME] CPR immediately \
      for 2 minutes (5 cycles).
      #v(3pt)
      AED will re-analyse automatically.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->"),

    // Decision: Signs of life or paramedics?
    node((0, 3), align(center)[
      Child shows signs of life \
      (moves, breathes, opens eyes) \
      or MDA paramedics arrived?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (1, 3), "->",
      label: yes-label,
      label-side: center),

    node((1, 3), align(center)[
      #action[STOP] compressions. \
      Leave AED pads attached. \
      #action[MONITOR] closely.
      #v(3pt)
      Recovery position if breathing.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 3), (-1, 3), "->",
      label: no-label,
      label-side: center),

    node((-1, 3), align(center)[
      #action[CONTINUE] CPR and \
      AED cycle. Do not stop.
      #v(3pt)
      Repeat: CPR #sym.arrow AED \
      #sym.arrow shock/no shock #sym.arrow CPR
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
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
  [#underline(stroke: 1.5pt)[*Do NOT use an AED on a conscious, normally-breathing child*] -- AEDs are only for cardiac arrest.],
  [#underline(stroke: 1.5pt)[*Do NOT use an AED in water*] -- move the child to dry ground first before applying pads.],
  [#underline(stroke: 1.5pt)[*Do NOT delay defibrillation*] because paediatric pads are unavailable -- use adult pads with anteroposterior placement.],
  [#underline(stroke: 1.5pt)[*Do NOT allow pads to touch or overlap*] -- use anteroposterior placement if the chest is too small.],
  [#underline(stroke: 1.5pt)[*Do NOT touch the child*] during AED rhythm analysis or shock delivery.],
  [#underline(stroke: 1.5pt)[*Do NOT turn off the AED or remove pads*] once applied, even if the child regains consciousness.],
  [#underline(stroke: 1.5pt)[*Do NOT perform adult-depth compressions*] on a child or infant -- compress to one-third of chest depth only.],
  [#underline(stroke: 1.5pt)[*Do NOT use an AED near flammable gases*] or oxygen-enriched atmospheres.],
))

#v(12pt)

#equipment-box((
  "AED (Automated External Defibrillator)",
  "Paediatric AED pads (preferred for children under 8 / under 25 kg)",
  "Adult AED pads (if paediatric pads unavailable)",
  "Scissors or shears (to cut away clothing)",
  "Towel or cloth (to dry the chest)",
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
    [Defibrillator], [דפיברילטור], [de-fib-ri-LA-tor],
    [AED], [מכשיר החייאה], [makh-SHIR ha-kha-ya-A],
    [Electrode pads], [אלקטרודות], [e-lek-TRO-dot],
    [Shock], [הלם / שוק], [HE-lem / shok],
    [Cardiac arrest], [דום לב], [dom lev],
    [CPR], [החייאה], [ha-kha-ya-A],
    [Stand clear!], [!התרחקו], [hit-ra-KHU!],
    [Child], [ילד / ילדה], [YE-led / yal-DA],
    [Infant], [תינוק / תינוקת], [ti-NOK / ti-NO-ket],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Not breathing], [לא נושם], [lo no-SHEM],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — AED Operation for Children and Infants (AHA 2025 Guidelines as adopted by MDA) \
  #strong[URL:] https://www.mdais.org/kursim/defibrillator \
  #strong[Imported:] 2026-03-16 · #strong[Last verified:] 2026-03-16
]
