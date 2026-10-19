// Israel Child Heatstroke Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-HEATSTROKE-001
// SOP: 044

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-HEATSTROKE-001"
#let sop-number = "044"
#let protocol-title = "Heatstroke and Heat Exhaustion"
#let protocol-subject = "HEATSTROKE"
#let scenario = "HEAT EMERGENCY"
#let age-group = "CHILD"
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
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-calm = text(size: 12pt)[#emoji.hands.open]
#let icon-water = text(size: 12pt)[#emoji.drops]
#let icon-cool = text(size: 12pt)[#emoji.snowflake]
#let icon-heart = text(size: 12pt)[#emoji.heart]

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
// PAGE 1: Flowchart — Assessment and initial response
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Assess severity
  node((0, 0), align(center)[
    #icon-monitor #action[ASSESS] the child's \
    condition and severity.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: Heatstroke or heat exhaustion?
  node((0, 1), align(center)[
    Hot, dry, red skin? \
    Temp above 40 C? \
    Confusion / seizures / \
    loss of consciousness?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  // MDA logo above call box
  node((1, 0.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((1, 1), align(center)[
    *HEAT STROKE.* \
    #icon-phone #action[CALL] 101 \
    immediately.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 1), (0.5, 2), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 1), (-1, 1), "->",
    label: no-label,
    label-side: center),

  node((-1, 1), align(center)[
    Likely heat exhaustion. \
    #action[CALL] 101 if no \
    improvement in 30 min.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 1), (-0.5, 2), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 1), (0, 2), "->"),

  // Move to cool environment
  node((0, 2), align(center)[
    #icon-cool #action[MOVE] child to a cool \
    environment immediately. \
    Shade or air-conditioned room.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Remove clothing
  node((0, 3), align(center)[
    #action[REMOVE] excess and \
    tight clothing.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Begin cooling
  node((0, 4), align(center)[
    #icon-water #action[COOL] the child actively. \
    Pour/spray cool water. \
    Fan the child. \
    Ice packs to armpits and groin.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: Conscious and able to swallow?
  node((0, 5), align(center)[
    #icon-breath Is the child conscious, \
    alert, and able to \
    swallow safely?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #icon-water #action[GIVE] small, frequent \
    sips of cool water \
    or ORS.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  node((-1, 5), align(center)[
    No fluids. \
    #action[PLACE] in recovery \
    position if breathing. \
    Maintain airway.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Continued monitoring and airway
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Airway and Continued Monitoring]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Decision: Breathing?
    node((0, 0), align(center)[
      #icon-breath Is the child breathing?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (1, 0), "->",
      label: yes-label,
      label-side: center),

    node((1, 0), align(center)[
      #action[MAINTAIN] recovery \
      position. Continue cooling. \
      Wait for MDA.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 0), (-1, 0), "->",
      label: no-label,
      label-side: center),

    // MDA logo
    node((-1, -0.5), align(center)[
      #image(mda-logo, width: 24pt)
    ],
      shape: rect, fill: none, stroke: none,
      width: 14mm, inset: 0pt),

    node((-1, 0), align(center)[
      #icon-heart #action[BEGIN] CPR. \
      Ensure 101 called.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // Continue cooling
    node((0, 1), align(center)[
      #icon-cool #action[CONTINUE] cooling and \
      monitoring until MDA arrives.
      #v(3pt)
      Note time cooling began.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),
  )
]

#v(16pt)

// Vehicle note
#rect(fill: rgb("#fff7ed"), stroke: 1.5pt + rgb("#ea580c"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: rgb("#c2410c"), weight: "bold", size: 12pt)[Child found in vehicle]
  #v(4pt)
  #set text(size: 10pt)
  Temperatures inside a locked car in Israeli summer can reach 70 C. \
  #action[REMOVE] the child from the vehicle immediately -- break the window if necessary. \
  Report to MDA that the child was found in a vehicle, including estimated time of exposure.
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
  [#underline(stroke: 1.5pt)[*Do NOT give fever-reducing medications*] (Acamol, Nurofen, naproxen) — these do not reduce heatstroke temperature and may cause harm.],
  [#underline(stroke: 1.5pt)[*Do NOT use ice-cold water immersion*] for young children without medical supervision.],
  [#underline(stroke: 1.5pt)[*Do NOT force fluids*] if the child is vomiting or has altered consciousness.],
  [#underline(stroke: 1.5pt)[*Do NOT leave the child unattended*] at any point.],
  [#underline(stroke: 1.5pt)[*Do NOT give fluids to an unconscious child.*]],
  [#underline(stroke: 1.5pt)[*Do NOT delay calling 101*] if heat stroke is suspected.],
  [#underline(stroke: 1.5pt)[*Do NOT leave a child unattended in a vehicle*] — even for a moment, even with windows open or A/C running.],
))

#v(12pt)

#equipment-box((
  "Cool water (for pouring or spraying over the body)",
  "Fan or means of fanning",
  "Ice packs or cold wet cloths",
  "Oral rehydration solution (ORS) or cool drinking water",
  "Thermometer (if available)",
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
    [Heatstroke], [מכת חום], [ma-KAT KHOM],
    [Heat exhaustion], [תשישות חום], [tshi-SHUT KHOM],
    [Water], [מים], [MA-yim],
    [Shade], [צל], [TSEL],
    [Hot], [חם], [KHAM],
    [Cold water], [מים קרים], [MA-yim ka-RIM],
    [Unconscious], [מחוסר הכרה], [me-khu-SAR ha-ka-RA],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Child], [ילד / ילדה], [YE-led / yal-DA],
    [Are you thirsty?], [?אתה צמא], [a-TA tsa-ME?],
    [Drink water], [תשתה מים], [tish-TE MA-yim],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — Heat Stroke Guidelines \
  #strong[URL:] https://www.mdais.org/news/300820 \
  #strong[Publication date:] 2024-04-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
