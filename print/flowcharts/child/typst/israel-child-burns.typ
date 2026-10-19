// Israel Child Burns Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-BURNS-001
// SOP: 033

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-BURNS-001"
#let sop-number = "033"
#let protocol-title = "Burns — Thermal, Chemical, Electrical"
#let protocol-subject = "BURNS"
#let scenario = "ALL TYPES"
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
#let icon-med = text(size: 12pt)[#emoji.pill]
#let icon-monitor = text(size: 12pt)[#emoji.eye]

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
// PAGE 1: Initial Response — Remove, Clothing, Cool
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Remove from heat source
  node((0, 0), align(center)[
    #action[REMOVE] child from \
    heat source immediately. \
    Ensure scene safety.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Clothing decision
  node((0, 1), align(center)[
    Is clothing stuck \
    to the burn?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 1), align(center)[
    #action[LEAVE] stuck clothing. \
    Cut around it with scissors.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (-1, 1), "->",
    label: no-label,
    label-side: center),

  node((-1, 1), align(center)[
    #action[REMOVE] clothing gently. \
    Remove constrictive items \
    (shoes, watches, rings).
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // Rejoin
  edge((1, 1), (0.5, 2), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),
  edge((-1, 1), (-0.5, 2), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),

  edge((0, 1), (0, 2), "->"),

  // Cool the burn
  node((0, 2), align(center)[
    #action[COOL] burn under lukewarm \
    running water for \
    *minimum 20 minutes*.
    #v(3pt)
    Cool the BURN, not the whole child.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Hypothermia check
  node((0, 3), align(center)[
    #icon-monitor Child showing signs \
    of hypothermia (shivering)?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #action[SWITCH] to cold-soaked \
    cloths on burn area. \
    Keep rest of body warm.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (-1, 3), "->",
    label: no-label,
    label-side: center),

  node((-1, 3), align(center)[
    #action[CONTINUE] cooling under \
    lukewarm water until \
    full 20 min elapsed.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // Rejoin
  edge((1, 3), (0.5, 4), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),
  edge((-1, 3), (-0.5, 4), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),

  edge((0, 3), (0, 4), "->"),

  // Assess severity
  node((0, 4), align(center)[
    #icon-monitor Burn severe? \
    (large blisters, 3rd-degree, \
    sensitive areas, under 1 yr)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  // MDA logo above call box
  node((1, 3.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    Continue first aid.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (-1, 4), "->",
    label: no-label,
    label-side: center),

  node((-1, 4), align(center)[
    #action[CONTINUE] first aid. \
    Monitor for worsening.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // Rejoin
  edge((1, 4), (0.5, 5), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),
  edge((-1, 4), (-0.5, 5), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),

  edge((0, 4), (0, 5), "->"),

  // Cover and pain relief
  node((0, 5), align(center)[
    #action[COVER] burn with sterile, \
    loosely-applied, non-adherent dressings.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->"),

  node((0, 6), align(center)[
    #icon-med #action[ADMINISTER] pain relief \
    (ibuprofen or paracetamol by weight). \
    #action[OFFER] water in small sips.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Chemical / Electrical Burns
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Chemical & Electrical Burns]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Chemical burn?
    node((0, 0), align(center)[
      Was the burn caused \
      by a chemical substance?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (1, 0), "->",
      label: yes-label,
      label-side: center),

    // MDA logo
    node((1, -0.5), align(center)[
      #image(mda-logo, width: 24pt)
    ],
      shape: rect, fill: none, stroke: none,
      width: 14mm, inset: 0pt),

    node((1, 0), align(center)[
      #action[REMOVE] contaminated clothing. \
      #action[RINSE] with massive cool \
      water for 20+ minutes.
      #v(3pt)
      Eyes: flush 15+ minutes. \
      #action[CALL] 101 immediately.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->",
      label: no-label,
      label-side: center),

    // Electrical burn?
    node((0, 1), align(center)[
      Was the burn caused \
      by electricity?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    // MDA logo
    node((1, 0.5), align(center)[
      #image(mda-logo, width: 24pt)
    ],
      shape: rect, fill: none, stroke: none,
      width: 14mm, inset: 0pt),

    edge((0, 1), (1, 1), "->",
      label: yes-label,
      label-side: center),

    node((1, 1), align(center)[
      #action[DISCONNECT] power first. \
      #action[CALL] 101 immediately. \
      Internal damage may not be visible. \
      Be prepared for CPR.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->",
      label: no-label,
      label-side: center),

    // Monitor
    node((0, 2), align(center)[
      #icon-monitor #action[MONITOR] for complications. \
      Watch for infection, respiratory \
      issues, shock, hypothermia.
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
  [#underline(stroke: 1.5pt)[*Do NOT apply ice or ice-cold water*] -- extreme cold causes additional tissue and blood vessel damage.],
  [#underline(stroke: 1.5pt)[*Do NOT apply toothpaste, coffee grounds, raw eggs, yogurt, or butter*] -- these create a heat-trapping layer and increase infection risk.],
  [#underline(stroke: 1.5pt)[*Do NOT puncture or pop blisters*] -- the fluid protects tissue during healing.],
  [#underline(stroke: 1.5pt)[*Do NOT apply ointments, oils, or powders*] to serious burns before medical evaluation.],
  [#underline(stroke: 1.5pt)[*Do NOT use gauze pads or cotton wool directly on burns*] -- fibres adhere to damaged skin.],
  [#underline(stroke: 1.5pt)[*Do NOT remove clothing stuck to the burn*] -- cut around it instead.],
  [#underline(stroke: 1.5pt)[*Do NOT immerse the whole child in cold water*] -- cool the burn, not the child. High hypothermia risk.],
  [#underline(stroke: 1.5pt)[*Do NOT attempt chemical neutralisation*] on chemical burns.],
  [#underline(stroke: 1.5pt)[*Do NOT leave the child unattended if unconscious*] -- call 101 immediately.],
))

#v(12pt)

#equipment-box((
  "Cool (lukewarm) running water source",
  "Sterile non-adherent dressings or clean dry sheet",
  "Scissors (to cut clothing around stuck areas)",
  "Blanket or towel (warmth during burn cooling)",
  "Age-appropriate pain relief (ibuprofen or paracetamol, dosed by weight)",
  "Drinking water (for hydration)",
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
    [Burn], [כוויה], [kvi-YA],
    [Scald], [כוויה מנוזל חם], [kvi-YA mi-no-ZEL kham],
    [Cool water], [מים פושרים], [MA-yim posh-RIM],
    [Blister], [שלפוחית], [shal-pu-KHIT],
    [Bandage / dressing], [תחבושת], [takh-BO-shet],
    [Pain], [כאב], [ke-EV],
    [Child], [ילד / ילדה], [YE-led / yal-DA],
    [Infant], [תינוק / תינוקת], [ti-NOK / ti-NO-ket],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [It hurts], [כואב], [ko-EV],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) -- Burns First Aid Guidelines \
  #strong[URL:] https://www.mdais.org/101/burns \
  #strong[Publication date:] 2026-01-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16 \
  #strong[Key child difference:] Minimum 20 minutes cooling (vs 10 for adults). Cool the burn, not the whole child. All burns in infants under 1 year require immediate medical attention.
]
