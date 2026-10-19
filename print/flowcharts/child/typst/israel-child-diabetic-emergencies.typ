// Israel Child Diabetic Emergencies Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-DIABETIC-EMERGENCIES-001
// SOP: 037

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-DIABETIC-EMERGENCIES-001"
#let sop-number = "037"
#let protocol-title = "Diabetic Emergencies — Hypo/Hyperglycemia"
#let protocol-subject = "DIABETIC EMERGENCIES"
#let scenario = "HYPO / HYPERGLYCEMIA"
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
#let icon-med = text(size: 12pt)[#emoji.pill]
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-calm = text(size: 12pt)[#emoji.hands.open]
#let icon-food = text(size: 12pt)[#emoji.bread]
#let icon-syringe = text(size: 12pt)[#emoji.syringe]

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
// PAGE 1: Mild/moderate hypoglycemia (conscious child)
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Decision: Conscious and can swallow?
  node((0, 0), align(center)[
    #icon-monitor Child conscious \
    and able to swallow safely?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (1, 0), "->",
    label: no-label,
    label-side: center),

  node((1, 0), align(center)[
    Severe hypoglycemia. \
    Go to Page 2.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->",
    label: yes-label,
    label-side: left),

  // Decision: Under 6?
  node((0, 1), align(center)[
    #icon-monitor Child under \
    6 years old?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 1), align(center)[
    #icon-med #action[GIVE] 10 g \
    fast-acting sugar.
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
    #icon-med #action[GIVE] 15 g \
    fast-acting sugar.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 1), (-0.5, 2), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 1), (0, 2), "->"),

  // Action: Wait 15 min
  node((0, 2), align(center)[
    #icon-monitor #action[WAIT] 15 minutes. \
    Recheck glucose \
    if meter available.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Decision: Glucose above target?
  node((0, 3), align(center)[
    #icon-monitor Glucose above target? \
    (70 mg/dL age 6+, \
    80 mg/dL under 6)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #icon-food #action[GIVE] complex \
    carbohydrates: bread, \
    crackers, fruit.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (-1, 3), "->",
    label: no-label,
    label-side: center),

  node((-1, 3), align(center)[
    #action[REPEAT] sugar dose. \
    Still below 54 mg/dL \
    after 30 min?
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 3), (-1, 4), "->"),

  // MDA logo above call box
  node((-1, 3.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((-1, 4), align(center)[
    #icon-phone #action[CALL] 101 \
    immediately.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Insulin pump connected?
  node((0, 4), align(center)[
    #icon-monitor Insulin pump \
    connected?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #action[DISCONNECT] pump \
    gently.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->",
    label: no-label,
    label-side: left),

  // Action: Continue monitoring
  node((0, 5), align(center)[
    #icon-monitor #action[MONITOR] \
    continuously.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Severe hypoglycemia (unconscious/seizing)
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Severe Hypoglycemia — Unconscious / Seizing]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (8mm, 5mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Action: No oral intake
    node((0, 0), align(center)[
      #action[PROTECT] airway. \
      Nothing by mouth.
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // Action: Disconnect pump
    node((0, 1), align(center)[
      #action[DISCONNECT] insulin pump \
      if present.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->"),

    // Decision: Glucagon available?
    node((0, 2), align(center)[
      #icon-syringe Glucagon kit available \
      AND trained person present?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 2), (1, 2), "->",
      label: yes-label,
      label-side: center),

    // Decision: Under 6 / under 25 kg?
    node((1, 2), align(center)[
      Child under 6 years \
      or under 25 kg?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 40mm, inset: 6pt, corner-radius: 6pt),

    edge((1, 2), (1, 3), "->",
      label: yes-label,
      label-side: left),

    node((1, 3), align(center)[
      #icon-syringe #action[INJECT] 0.5 mL \
      glucagon (half vial) \
      into large muscle.
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 40mm, inset: 6pt, corner-radius: 6pt),

    edge((1, 2), (0, 3), "->",
      label: no-label,
      label-side: center),

    node((0, 3), align(center)[
      #icon-syringe #action[INJECT] 1.0 mL \
      glucagon (full vial) \
      into large muscle.
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 44mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (-1, 2), "->",
      label: no-label,
      label-side: center),

    node((-1, 2), align(center)[
      #action[PLACE] in recovery \
      position (on side).
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 40mm, inset: 6pt, corner-radius: 6pt),

    edge((-1, 2), (-1, 3), "->"),

    // MDA logo above call box
    node((-1, 2.5), align(center)[
      #image(mda-logo, width: 24pt)
    ],
      shape: rect, fill: none, stroke: none,
      width: 14mm, inset: 0pt),

    node((-1, 3), align(center)[
      #icon-phone #action[CALL] 101. \
      Monitor breathing.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 40mm, inset: 6pt, corner-radius: 6pt),

    // After glucagon administration
    edge((1, 3), (0, 4), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    edge((0, 3), (0, 4), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    // Action: Recovery position + call
    node((0, 4), align(center)[
      #action[PLACE] in recovery position. \
      #icon-phone #action[CALL] 101.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 4), (0, 5), "->"),

    // Decision: Regains consciousness?
    node((0, 5), align(center)[
      #icon-monitor Child regains \
      consciousness and \
      can swallow safely?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 5), (1, 5), "->",
      label: yes-label,
      label-side: center),

    node((1, 5), align(center)[
      #icon-food #action[GIVE] complex \
      carbohydrates. \
      Monitor until MDA arrives.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 40mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 5), (-1, 5), "->",
      label: no-label,
      label-side: center),

    node((-1, 5), align(center)[
      #action[MAINTAIN] recovery position. \
      Monitor breathing. \
      Wait for MDA.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
      width: 40mm, inset: 6pt, corner-radius: 6pt),
  )
]

// ============================================================
// PAGE 3: DKA assessment + "when in doubt" rule
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[DKA Assessment & Uncertainty Rule]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (8mm, 5mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Decision: DKA signs?
    node((0, 0), align(center)[
      #icon-monitor Signs of DKA? \
      Vomiting, rapid deep breathing, \
      fruity breath, decreased \
      consciousness?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 0), (1, 0), "->",
      label: yes-label,
      label-side: center),

    // MDA logo above DKA call box
    node((1, -0.5), align(center)[
      #image(mda-logo, width: 24pt)
    ],
      shape: rect, fill: none, stroke: none,
      width: 14mm, inset: 0pt),

    node((1, 0), align(center)[
      #icon-phone #action[CALL] 101 \
      immediately. \
      Medical emergency.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 40mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->",
      label: no-label,
      label-side: left),

    node((0, 1), align(center)[
      #action[ARRANGE] transport to \
      hospital for evaluation.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),
  )
]

#v(16pt)

// "When in doubt" rule
#rect(fill: rgb("#eff6ff"), stroke: 2pt + clr-condition, radius: 6pt, width: 100%, inset: 12pt)[
  #align(center)[
    #text(fill: clr-condition, weight: "bold", size: 14pt)[When in Doubt — Give Sugar]
  ]
  #v(6pt)
  #set text(size: 10pt)
  If uncertain whether hypoglycemia or hyperglycemia: *give sugar*. \
  #v(4pt)
  Sugar for a hypoglycemic child is life-saving. \
  Sugar for a hyperglycemic child will not cause immediate harm. \
  Withholding sugar from a hypoglycemic child can be fatal. \
  #v(4pt)
  _This applies only when the child is conscious and can swallow safely._
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
  [#underline(stroke: 1.5pt)[*Do NOT administer insulin*] — this is strictly a medical intervention and can be fatal if given inappropriately.],
  [#underline(stroke: 1.5pt)[*Do NOT give food, drink, or oral medication to an unconscious or seizing child*] — choking hazard.],
  [#underline(stroke: 1.5pt)[*Do NOT use chocolate as the initial sugar source*] — fat and protein slow absorption and delay correction.],
  [#underline(stroke: 1.5pt)[*Do NOT administer glucagon unless trained and authorised*] to do so.],
  [#underline(stroke: 1.5pt)[*Do NOT delay calling 101*] for severe hypoglycemia, seizures, or loss of consciousness.],
  [#underline(stroke: 1.5pt)[*Do NOT attempt to manage hyperglycemia or DKA with first aid*] — requires medical intervention.],
  [#underline(stroke: 1.5pt)[*Do NOT use diet drinks or sugar-free products*] as a sugar source.],
))

#v(12pt)

#equipment-box((
  "Glucose gel syringe (15 g glucose)",
  "Fast-acting sugar source (juice, glucose tablets, sugar cubes, honey)",
  "Complex carbohydrate snack (bread, crackers, fruit)",
  "Glucagon emergency kit (Hypo-Kit) if available and authorised",
  "Blood glucose meter (glucometer) if available",
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
    [Diabetes], [סוכרת], [su-KE-ret],
    [Low blood sugar], [סוכר נמוך], [SU-kar na-MUKH],
    [High blood sugar], [סוכר גבוה], [SU-kar ga-VO-ah],
    [Sugar], [סוכר], [SU-kar],
    [Glucagon], [גלוקגון], [glu-ka-GON],
    [Insulin pump], [משאבת אינסולין], [mash-E-vet in-su-LIN],
    [Seizure], [פרכוס], [pir-KUS],
    [Unconscious], [חסר הכרה], [kha-SAR ha-ka-RA],
    [Sweet drink], [שתייה מתוקה], [shti-YA me-tu-KA],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Does the child have diabetes?], [?יש לילד סוכרת], [yesh la-YE-led su-KE-ret?],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — How to Treat a Diabetes Patient \
  #strong[URL:] https://www.mdais.org/101/diabetes \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
