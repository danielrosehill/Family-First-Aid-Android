// Israel Adult Dehydration / Heat-Related Illness Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-DEHYDRATION-001
// SOP: 008

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-DEHYDRATION-001"
#let sop-number = "008"
#let protocol-title = "Dehydration & Heat-Related Illness"
#let protocol-subject = "DEHYDRATION"
#let scenario = "HEAT-RELATED ILLNESS"
#let age-group = "ADULT"
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
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-person = text(size: 12pt)[#emoji.person]
#let icon-water = text(size: 12pt)[#emoji.drops]
#let icon-thermometer = text(size: 12pt)[#emoji.thermometer]

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
// PAGE 1: Assessment — dehydration vs heat stroke
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Assess severity
  node((0, 0), align(center)[
    #icon-thermometer #action[ASSESS] severity.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: heat stroke?
  node((0, 1), align(center)[
    Signs of heat stroke? \
    (Temp above 40 C, hot/dry \
    skin, NO sweating, \
    confusion, unconscious)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 1), align(center)[
    HEAT STROKE EMERGENCY. \
    Go to page 2.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->",
    label: no-label,
    label-side: center),

  // Stop activity
  node((0, 2), align(center)[
    #action[STOP] all physical activity. \
    Ensure complete rest.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Move to shade
  node((0, 3), align(center)[
    #action[MOVE] to shaded, cool place. \
    Air-conditioned room \
    if available.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Remove clothing
  node((0, 4), align(center)[
    #action[REMOVE] excess clothing. \
    Loosen tight garments.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Rehydrate
  node((0, 5), align(center)[
    #icon-water #action[REHYDRATE] gradually \
    with small sips of water \
    or ORS.
    #v(3pt)
    ORS: 1L water + 6 tsp sugar \
    + 0.5 tsp salt.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->"),

  // Cool the body
  node((0, 6), align(center)[
    #action[COOL] with wet cloths, \
    fan, or cool water spray.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (0, 7), "->"),

  // Decision: improved after 30 min?
  node((0, 7), align(center)[
    Symptoms improved after \
    30 minutes of rest \
    and rehydration?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 7), (1, 7), "->",
    label: yes-label,
    label-side: center),

  node((1, 7), align(center)[
    #icon-monitor Continue gradual \
    rehydration and rest. \
    Monitor for relapse.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // MDA logo above no-improvement box
  node((-1, 6.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  edge((0, 7), (-1, 7), "->",
    label: no-label,
    label-side: center),

  node((-1, 7), align(center)[
    #icon-phone #action[CALL] 101. \
    May need IV fluids.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Heat stroke emergency protocol
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-warning)[Heat Stroke Emergency]
]
#v(6pt)

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // MDA logo above call box
  node((0, -0.55), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Call 101
  node((0, 0), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    Heat stroke is \
    life-threatening.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Move to shade
  node((0, 1), align(center)[
    #action[MOVE] to shaded, \
    ventilated, or A/C location. \
    Remove excess clothing.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Rapid cooling
  node((0, 2), align(center)[
    #action[COOL] rapidly: ice, \
    wet towels, fans, cold \
    water on torso.
    #v(3pt)
    Continue until MDA arrives.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Decision: conscious?
  node((0, 3), align(center)[
    Is the person conscious?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #icon-water #action[OFFER] small \
    sips of water only.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 3), (0.5, 4), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 3), (-1, 3), "->",
    label: no-label,
    label-side: center),

  node((-1, 3), align(center)[
    #icon-person Lay on back, \
    elevate legs. \
    If breathing: recovery \
    position. \
    No fluids.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 3), (-0.5, 4), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 3), (0, 4), "->"),

  // Continue cooling and monitoring
  node((0, 4), align(center)[
    #icon-monitor #action[CONTINUE] active cooling \
    and monitoring until \
    MDA arrives.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 3: Reference Notes
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Reference Notes]
]
#v(8pt)

#do-not-box((
  [#underline(stroke: 1.5pt)[*Do NOT give large quantities of water quickly*] -- rapid fluid replacement disrupts electrolyte balance.],
  [#underline(stroke: 1.5pt)[*Do NOT give sugary drinks, coffee, or alcohol*].],
  [#underline(stroke: 1.5pt)[*Do NOT wet the head of a heat stroke patient*] -- choking risk if consciousness is altered.],
  [#underline(stroke: 1.5pt)[*Do NOT ignore the key distinction*]: dehydration = continued sweating; heat stroke = ABSENT sweating with high body temperature.],
  [#underline(stroke: 1.5pt)[*Do NOT delay calling 101 for heat stroke*] -- it is a medical emergency requiring hospital treatment.],
  [#underline(stroke: 1.5pt)[*Do NOT give fluids to an unconscious person*].],
))

#v(12pt)

#equipment-box((
  "Water or ORS (Oral Rehydration Solution)",
  "Fan or method of creating air flow",
  "Wet cloths or towels for cooling",
  "Ice packs (for heat stroke)",
  "Straw (for controlled sipping)",
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
    [Dehydration], [התייבשות], [hit-yab-SHUT],
    [Heat stroke], [מכת חום], [ma-KAT khom],
    [Water], [מים], [MA-yim],
    [Shade], [צל], [tsel],
    [Dizzy], [סחרחורת], [skhar-kho-RET],
    [Sweating], [הזעה], [haz-a-A],
    [Unconscious], [מחוסר הכרה], [me-khu-SAR ha-ka-RA],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Drink water], [שתה מים], [shte MA-yim],
    [Are you thirsty?], [?אתה צמא], [a-TA tsa-ME?],
    [Come to the shade], [בוא לצל], [bo la-TSEL],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — Dehydration and Heat-Related Illness First Aid \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Imported:] 2026-03-16 · #strong[Last verified:] 2026-03-16
]
