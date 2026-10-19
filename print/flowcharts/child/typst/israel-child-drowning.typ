// Israel Child Drowning Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-DROWNING-001
// SOP: 038

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-DROWNING-001"
#let sop-number = "038"
#let protocol-title = "Drowning — Water Rescue & CPR"
#let protocol-subject = "DROWNING"
#let scenario = "WATER RESCUE & CPR"
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
// PAGE 1: Flowchart — Rescue and initial assessment
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Action: Scene safety
  node((0, 0), align(center)[
    #icon-warning #action[ENSURE] scene safety. \
    Use reaching/throwing aids. \
    Bring flotation device.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: Spinal injury suspected?
  node((0, 1), align(center)[
    #icon-monitor Spinal injury suspected? \
    (diving, fall, unknown \
    mechanism)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 1), align(center)[
    #action[IMMOBILISE] head and \
    neck in neutral position \
    during extraction.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 1), (0.5, 2), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 1), (-1, 1), "->",
    label: no-label,
    label-side: center),

  node((-1, 1), align(center)[
    #action[REMOVE] child from \
    water quickly. Place \
    on firm flat surface.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 1), (-0.5, 2), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 1), (0, 2), "->"),

  // Decision: Child responsive?
  node((0, 2), align(center)[
    #icon-monitor Child responsive? \
    (moving, coughing, \
    breathing)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  node((1, 2), align(center)[
    #icon-person #action[PLACE] in \
    recovery position. \
    #icon-phone Call 101. \
    Always go to hospital.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->",
    label: no-label,
    label-side: left),

  // Decision: Bystander available?
  node((0, 3), align(center)[
    #icon-phone Second person \
    available to call 101?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  // MDA logo
  node((1, 2.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((1, 3), align(center)[
    #action[DIRECT] them to \
    call 101 now.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (-1, 3), "->",
    label: no-label,
    label-side: center),

  node((-1, 3), align(center)[
    #action[PERFORM] 2 min CPR \
    (5 cycles) first, \
    then call 101.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Action: Open airway
  node((0, 4), align(center)[
    #icon-breath #action[OPEN] airway: \
    head-tilt chin-lift. \
    Look, listen, feel \
    for 5–10 seconds.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: Breathing?
  node((0, 5), align(center)[
    #icon-breath Child breathing \
    normally?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #icon-person #action[PLACE] in \
    recovery position. \
    Monitor until MDA arrives.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->",
    label: no-label,
    label-side: left),

  // Action: 2 rescue breaths
  node((0, 6), align(center)[
    #icon-breath #action[GIVE] 2 rescue breaths. \
    Pinch nose, seal mouth. \
    Watch for chest rise.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (0, 7), "->"),

  // Action: Begin compressions
  node((0, 7), align(center)[
    #icon-heart #action[BEGIN] compressions. \
    Centre of chest, \
    1/3 to 1/2 depth, \
    100–120 per minute.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: CPR continuation and recovery
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[CPR Continuation & Recovery]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Action: CPR cycles
    node((0, 0), align(center)[
      #icon-heart #action[CONTINUE] CPR cycles. \
      Solo: 30:2 ratio. \
      Two rescuers: 15:2 ratio. \
      Switch every 2 min if possible.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 62mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // Decision: Signs of life?
    node((0, 1), align(center)[
      #icon-monitor Signs of life? \
      (breathing, coughing, \
      movement)
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 62mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (1, 1), "->",
      label: yes-label,
      label-side: center),

    node((1, 1), align(center)[
      #icon-person #action[PLACE] in \
      recovery position (on side). \
      #action[MAINTAIN] warmth. \
      Always transport to hospital.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (-1, 1), "->",
      label: no-label,
      label-side: center),

    node((-1, 1), align(center)[
      #icon-heart #action[CONTINUE] CPR \
      until MDA arrives, \
      AED available, or \
      physically unable.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 50mm, inset: 8pt, corner-radius: 6pt),
  )
]

#v(12pt)

// Mandatory hospital transport box
#rect(fill: rgb("#eff6ff"), stroke: 2pt + clr-condition, radius: 6pt, width: 100%, inset: 12pt)[
  #align(center)[
    #text(fill: clr-condition, weight: "bold", size: 14pt)[All drowning victims MUST go to hospital]
  ]
  #v(6pt)
  #set text(size: 10pt)
  Secondary drowning (delayed pulmonary oedema) can develop hours after the event, \
  even if the child initially appears to recover fully. Electrolyte imbalances can also occur.
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
  [#underline(stroke: 1.5pt)[*Do NOT attempt to remove water from the lungs*] — this is impossible and can endanger the victim.],
  [#underline(stroke: 1.5pt)[*Do NOT perform abdominal thrusts (Heimlich)*] to expel water — not effective for drowning and risks aspiration.],
  [#underline(stroke: 1.5pt)[*Do NOT delay CPR*] to attempt water removal.],
  [#underline(stroke: 1.5pt)[*Do NOT use compression-only CPR for drowning*] — rescue breaths are essential (hypoxic emergency).],
  [#underline(stroke: 1.5pt)[*Do NOT assume the child is fine*] if they regain consciousness — always transport to hospital.],
  [#underline(stroke: 1.5pt)[*Do NOT enter the water*] unless you are a trained water rescuer with a flotation device.],
  [#underline(stroke: 1.5pt)[*Do NOT use excessive ventilation force*] — can cause gastric distention in children.],
))

#v(12pt)

#equipment-box((
  "Reaching aid (pole, rope, towel) or throwing aid (flotation device)",
  "Firm, flat surface for CPR",
  "Blanket or covering for warmth (hypothermia prevention)",
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
    [Drowning], [טביעה], [tvi-A],
    [Water], [מים], [MA-yim],
    [Swimming pool], [בריכת שחייה], [bre-KHAT skhi-YA],
    [CPR], [החייאה], [ha-kha-ya-A],
    [Rescue breaths], [הנשמות], [han-sha-MOT],
    [Chest compressions], [לחיצות חזה], [lkhi-TSOT kha-ZE],
    [Breathing], [נשימה], [nshi-MA],
    [Recovery position], [תנוחת התאוששות], [tnu-KHAT hit-o-she-SHUT],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [The child is not breathing], [הילד לא נושם], [ha-YE-led lo no-SHEM],
    [Call an ambulance], [תזמין אמבולנס], [taz-MIN am-bu-LANS],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — Drowning First Aid Protocol for Children \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
