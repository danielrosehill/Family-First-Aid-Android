// Israel Child Poisoning Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-POISONING-001
// SOP: 046

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-POISONING-001"
#let sop-number = "046"
#let protocol-title = "Poisoning"
#let protocol-subject = "POISONING"
#let scenario = "TOXIC EXPOSURE"
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
#let icon-calm = text(size: 12pt)[#emoji.hands.open]
#let icon-person = text(size: 12pt)[#emoji.person]
#let icon-heart = text(size: 12pt)[#emoji.heart]
#let icon-warn = text(size: 12pt)[#emoji.warning]
#let icon-water = text(size: 12pt)[#emoji.drops]

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
// PAGE 1: Flowchart — Scene safety, assessment, ingestion path
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Scene safety
  node((0, 0), align(center)[
    #icon-warn #action[ENSURE] scene safety. \
    For fumes: call Fire 102.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Assess consciousness and breathing
  node((0, 1), align(center)[
    #icon-breath #action[ASSESS] consciousness, \
    breathing, and airway.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Decision: Unconscious or not breathing?
  node((0, 2), align(center)[
    Is the child unconscious \
    or not breathing?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  // MDA logo
  node((1, 1.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((1, 2), align(center)[
    #icon-heart #action[BEGIN] CPR. \
    #icon-phone #action[CALL] 101.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->",
    label: no-label,
    label-side: center),

  // Determine route
  node((0, 3), align(center)[
    #action[DETERMINE] route of \
    exposure: ingestion, \
    inhalation, skin, or eye?
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Ingestion?
  node((0, 4), align(center)[
    Was the substance \
    ingested (swallowed)?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->",
    label: yes-label,
    label-side: center),

  edge((0, 4), (-1, 4), "->",
    label: no-label,
    label-side: center),

  node((-1, 4), align(center)[
    See page 2: \
    inhalation, skin, \
    or eye protocol.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  // Identify substance
  node((0, 5), align(center)[
    #action[IDENTIFY] the substance. \
    #action[PRESERVE] container \
    and packaging.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->"),

  // Decision: Caustic substance?
  node((0, 6), align(center)[
    Is the substance caustic \
    (acid, bleach, drain \
    cleaner, oven cleaner)?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (1, 6), "->",
    label: yes-label,
    label-side: center),

  node((1, 6), align(center)[
    If conscious: #action[GIVE] \
    water or milk to dilute. \
    Toddler: ~60 ml \
    Older child: ~120 ml
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (-1, 6), "->",
    label: no-label,
    label-side: center),

  node((-1, 6), align(center)[
    No food or liquids \
    unless instructed by \
    Poison Center.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Non-ingestion routes + calling for help
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Non-Ingestion Routes and Calling for Help]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Inhalation
    node((-1, 0), align(center)[
      *Inhalation:* \
      #action[MOVE] child to \
      fresh air immediately. \
      If not breathing: CPR.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    // Skin contact
    node((0, 0), align(center)[
      *Skin contact:* \
      #action[REMOVE] contaminated \
      clothing. #action[FLUSH] skin \
      with water for 15--20 min.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    // Eye contact
    node((1, 0), align(center)[
      *Eye contact:* \
      #icon-water #action[FLUSH] eye(s) with \
      running water for \
      at least 15--20 min.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((-1, 0), (0, 1), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),
    edge((0, 0), (0, 1), "->"),
    edge((1, 0), (0, 1), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    // Decision: Symptoms present?
    node((0, 1), align(center)[
      Are symptoms present? \
      (altered consciousness, \
      breathing difficulty, \
      burns, vomiting, seizures)
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (1, 1), "->",
      label: yes-label,
      label-side: center),

    // MDA logo
    node((1, 0.5), align(center)[
      #image(mda-logo, width: 24pt)
    ],
      shape: rect, fill: none, stroke: none,
      width: 14mm, inset: 0pt),

    node((1, 1), align(center)[
      #icon-phone #action[CALL] 101 \
      immediately. \
      Describe substance, \
      quantity, time, condition.
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 1), (-1, 1), "->",
      label: no-label,
      label-side: center),

    node((-1, 1), align(center)[
      #icon-phone #action[CALL] Poison Center \
      04-7771900 (24/7). \
      Follow their guidance.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((1, 1), (0.5, 2), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),
    edge((-1, 1), (-0.5, 2), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    // Transport to hospital
    node((0, 2), align(center)[
      #action[TRANSPORT] to hospital. \
      #action[BRING] the substance \
      container and packaging.
      #v(3pt)
      All poisoning cases \
      require hospital assessment.
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
  [#underline(stroke: 1.5pt)[*Do NOT induce vomiting*] — regardless of the substance ingested. Causes additional oesophageal burns (caustic agents), aspiration risk, and ineffective removal.],
  [#underline(stroke: 1.5pt)[*Do NOT give activated charcoal at home*] unless specifically instructed by the Poison Center or a physician.],
  [#underline(stroke: 1.5pt)[*Do NOT give food to the poisoned child.*] Water or milk for caustic dilution only, when conscious.],
  [#underline(stroke: 1.5pt)[*Do NOT attempt home remedies*] (raw eggs, olive oil, etc.).],
  [#underline(stroke: 1.5pt)[*Do NOT wait for symptoms*] before calling for guidance — some toxic substances cause delayed organ damage (liver, kidneys).],
  [#underline(stroke: 1.5pt)[*Do NOT discard the container or packaging*] — always bring it to the hospital.],
  [#underline(stroke: 1.5pt)[*Do NOT mix cleaning products*] — especially bleach with acids (releases toxic chlorine gas).],
  [#underline(stroke: 1.5pt)[*Do NOT enter a toxic fume environment*] without proper protection.],
))

#v(12pt)

#equipment-box((
  "Cloth (to wipe substance from child's mouth if present)",
  "Water or milk (for dilution of caustic substances only, age-appropriate amounts)",
  "Running water source (for skin and eye decontamination, 15--20 minutes flushing)",
  "Container or bag (to preserve substance packaging and any vomit for medical teams)",
))

#v(12pt)

// === Key numbers ===
#rect(fill: rgb("#fff7ed"), stroke: 1pt + rgb("#ea580c"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: rgb("#c2410c"), weight: "bold", size: 12pt)[Key Phone Numbers]
  #v(4pt)
  #set text(size: 11pt)
  #table(
    columns: (1fr, auto),
    stroke: 0.5pt + rgb("#fed7aa"),
    inset: 6pt,
    fill: (x, y) => if y == 0 { rgb("#ffedd5") } else { none },
    [*Service*], [*Number*],
    [MDA (emergency)], [*101*],
    [Israel Poison Information Center (Rambam)], [*04-7771900* (24/7)],
    [United Hatzalah], [*1221*],
    [Fire Department], [*102*],
  )
]

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
    [Poison / poisoning], [הרעלה], [har-a-LA],
    [Poison center], [מרכז הרעלות], [mer-KAZ har-a-LOT],
    [Swallowed], [בלע], [ba-LA],
    [Cleaning product], [חומר ניקוי], [KHO-mer ni-KUY],
    [Bleach (economica)], [אקונומיקה], [e-ko-NO-mi-ka],
    [Vomiting], [הקאה], [ha-ka-A],
    [Unconscious], [מחוסר הכרה], [me-khu-SAR ha-ka-RA],
    [Child], [ילד / ילדה], [YE-led / yal-DA],
    [What did they swallow?], [?מה הוא בלע], [MA HU ba-LA?],
    [How much?], [?כמה], [KA-ma?],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — Poisoning First Aid Guidelines; Rambam National Poison Information Center \
  #strong[URL:] https://www.mdais.org/101/poisoningn \
  #strong[Publication date:] 2026-01-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
