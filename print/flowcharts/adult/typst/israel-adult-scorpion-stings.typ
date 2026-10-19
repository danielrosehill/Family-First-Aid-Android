// Israel Adult Scorpion Stings Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-SCORPION-STINGS-001
// SOP: 020

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-SCORPION-STINGS-001"
#let sop-number = "020"
#let protocol-title = "Scorpion Stings"
#let protocol-subject = "SCORPION STINGS"
#let scenario = "ENVENOMATION"
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
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-calm = text(size: 12pt)[#emoji.hands.open]
#let icon-sit = text(size: 12pt)[#emoji.person]
#let icon-camera = text(size: 12pt)[#emoji.camera]

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
// PAGE 1: Immediate response and assessment
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // MDA logo
  node((0, -0.55), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Call 101
  node((0, 0), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    All scorpion stings require \
    hospital evaluation.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Keep calm and still
  node((0, 1), align(center)[
    #icon-calm #action[KEEP] victim calm \
    and still. Have them lie down. \
    Minimise all movement.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Immobilise limb
  node((0, 2), align(center)[
    #action[IMMOBILISE] the stung \
    limb. Position at or below \
    heart level.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Remove constrictive items
  node((0, 3), align(center)[
    #action[REMOVE] rings, watches, \
    tight clothing near sting site.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: systemic symptoms?
  node((0, 4), align(center)[
    Systemic symptoms? \
    (altered consciousness, \
    difficulty breathing, seizures, \
    cardiovascular changes)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (-1, 4), "->",
    label: yes-label,
    label-side: center),

  node((-1, 4), align(center)[
    #action[REPORT] to MDA dispatch. \
    Severe envenomation. \
    Maintain airway (ABC). \
    #action[BEGIN] CPR if breathing \
    stops.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: no-label,
    label-side: center),

  node((1, 4), align(center)[
    #icon-monitor #action[CONTINUE] monitoring. \
    Keep victim calm and still. \
    Hospital transport still \
    required.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // Rejoin
  edge((-1, 4), (0, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),
  edge((1, 4), (0, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (0, 5), "->"),

  // Identify scorpion
  node((0, 5), align(center)[
    Can scorpion be safely \
    identified or photographed?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #icon-camera #action[PHOTOGRAPH] or note \
    colour and size. Share \
    with paramedics.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  node((-1, 5), align(center)[
    Report any details \
    observed to paramedics.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // Rejoin
  edge((1, 5), (0, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),
  edge((-1, 5), (0, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 5), (0, 6), "->"),

  // ABC monitoring
  node((0, 6), align(center)[
    #icon-monitor #action[MAINTAIN] ABC support. \
    Monitor airway, breathing, \
    circulation continuously.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (0, 7), "->"),

  // Decision: conscious and breathing?
  node((0, 7), align(center)[
    Victim conscious and \
    breathing adequately?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 7), (1, 7), "->",
    label: yes-label,
    label-side: center),

  node((1, 7), align(center)[
    #icon-monitor #action[CONTINUE] monitoring. \
    Keep lying down, limb \
    immobilised.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 7), (-1, 7), "->",
    label: no-label,
    label-side: center),

  node((-1, 7), align(center)[
    If unconscious but breathing: \
    #action[PLACE] in recovery position. \
    If not breathing: \
    #action[BEGIN] CPR.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
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
  [#underline(stroke: 1.5pt)[*Do NOT apply a tourniquet*] — it traps venom locally and causes tissue damage.],
  [#underline(stroke: 1.5pt)[*Do NOT suck the venom out*] — this is ineffective and potentially harmful.],
  [#underline(stroke: 1.5pt)[*Do NOT cut the sting area*] — increases infection risk and does not remove venom.],
  [#underline(stroke: 1.5pt)[*Do NOT apply ice or cool the sting area*] — Israeli Ministry of Health (2026) explicitly advises against cooling.],
  [#underline(stroke: 1.5pt)[*Do NOT give the victim food or drink*] — risks venom dispersal and may complicate hospital treatment.],
  [#underline(stroke: 1.5pt)[*Do NOT allow the victim to walk or move the stung limb*] — movement accelerates venom circulation.],
))

#v(12pt)

#equipment-box((
  "Phone to call 101 (MDA) and optionally 04-7771900 (Poison Center)",
  "Phone or camera to photograph the scorpion if safe to do so",
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
    [Scorpion], [עקרב], [ak-RAV],
    [Scorpion sting], [עקיצת עקרב], [a-ki-TSAT ak-RAV],
    [Deathstalker (yellow scorpion)], [עקרב צהוב], [ak-RAV tsa-HOV],
    [Venom], [ארס], [E-res],
    [Antivenom], [נוגדן], [nog-DAN],
    [Swelling], [נפיחות], [ne-fi-KHUT],
    [Pain], [כאב], [KE-ev],
    [Poison Center], [מרכז הרעלות], [mer-KAZ har-a-LOT],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Where were you stung?], [?איפה נעקצת], [EI-fo ne-ek-TSATS-ta?],
    [Stay still], [תישאר במקום], [ti-sha-ER ba-ma-KOM],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — First Aid for Scorpion Stings; Israeli Ministry of Health \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Poison Center:] 04-7771900 (Rambam Health Care Campus, Haifa — 24/7) \
  #strong[Note:] All scorpion sting victims must be observed in ED for minimum 6 hours. \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-15
]
