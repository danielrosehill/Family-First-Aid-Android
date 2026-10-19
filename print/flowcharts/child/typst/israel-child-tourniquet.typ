// Israel Child Tourniquet Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-TOURNIQUET-001
// SOP: 056

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-TOURNIQUET-001"
#let sop-number = "056"
#let protocol-title = "Tourniquet Application — Child"
#let protocol-subject = "TOURNIQUET"
#let scenario = "LIMB HEMORRHAGE"
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
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-press = text(size: 12pt)[#emoji.hand]
#let icon-clock = text(size: 12pt)[#emoji.clock]
#let icon-heart = text(size: 12pt)[#emoji.heart]
#let icon-warn = text(size: 12pt)[#emoji.warning]

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
// PAGE 1: Identify Need & Select Tourniquet
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Decision: Limb bleeding uncontrollable?
  node((0, 0), align(center)[
    #icon-press Bleeding from a limb \
    that cannot be controlled \
    with direct pressure?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (1, 0), "->",
    label: yes-label,
    label-side: center),

  node((1, 0), align(center)[
    #action[APPLY] tourniquet \
    immediately. Proceed below.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (-1, 0), "->",
    label: no-label,
    label-side: center),

  node((-1, 0), align(center)[
    #action[USE] direct pressure \
    with sterile gauze. \
    Pack junctional wounds \
    (torso, neck, groin).
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 0), (0, 1), "->"),

  // Decision: Limb size for CAT?
  node((0, 1), align(center)[
    Child's limb large enough \
    for CAT tourniquet? \
    (approx. 13 cm circumference, \
    typically age 2+)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 1), align(center)[
    #action[USE] CAT Gen 7 \
    tourniquet.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 1), (0.5, 2), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 1), (-1, 1), "->",
    label: no-label,
    label-side: center),

  node((-1, 1), align(center)[
    #action[USE] SWAT-T or RATS \
    tourniquet if available. \
    Otherwise: direct pressure \
    + improvised tourniquet.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 1), (-0.5, 2), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  // Place tourniquet
  node((0, 2), align(center)[
    #action[PLACE] tourniquet 5–7 cm \
    above wound (proximal, \
    toward heart). \
    Over single bone (upper arm \
    or upper thigh), not over joint.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Tighten
  node((0, 3), align(center)[
    #action[TIGHTEN] until bleeding \
    stops completely. \
    CAT: turn windlass, secure clip. \
    SWAT-T: stretch and overlap.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Record time
  node((0, 4), align(center)[
    #icon-clock #action[RECORD] time of application \
    on tourniquet or child's skin. \
    Use 24-hour format (e.g., TQ 1430).
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: Bleeding stopped?
  node((0, 5), align(center)[
    Has bleeding stopped \
    after tourniquet?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #action[MAINTAIN] tourniquet. \
    #icon-monitor Monitor for shock. \
    Continue to Page 2.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  node((-1, 5), align(center)[
    #action[APPLY] second tourniquet \
    proximal to first. \
    Tighten both. \
    Add direct pressure \
    if bleeding continues.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 5), (-0.5, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((1, 5), (0.5, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  // Call 101
  node((0, 5.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((0, 6), align(center)[
    #icon-phone #action[CALL] 101 if not already done. \
    #action[TRANSPORT] urgently \
    to hospital.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Monitoring & Transport
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Monitoring & Transport]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    node((0, 0), align(center)[
      #icon-monitor #action[CHECK] tourniquet \
      has not loosened. \
      #action[CHECK] bleeding has stopped. \
      #action[MONITOR] for shock: \
      rapid weak pulse, pallor, \
      cool mottled skin, \
      altered consciousness.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    node((0, 1), align(center)[
      #action[KEEP] child warm \
      to prevent hypothermia. \
      #action[REASSURE] child and parent. \
      Report time, device, and \
      condition to arriving EMS.
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
  [#underline(stroke: 1.5pt)[*Do NOT remove a tourniquet once applied*] — only hospital personnel should remove it.],
  [#underline(stroke: 1.5pt)[*Do NOT apply a tourniquet for venomous animal bites*] (snakes, scorpions, spiders) — tourniquets worsen envenomation outcomes.],
  [#underline(stroke: 1.5pt)[*Do NOT apply a tourniquet over a joint*] (elbow, knee) — place on upper arm or upper thigh.],
  [#underline(stroke: 1.5pt)[*Do NOT apply a tourniquet too loosely*] — an insufficiently tight tourniquet causes venous bleeding without arterial occlusion, worsening blood loss.],
  [#underline(stroke: 1.5pt)[*Do NOT use a standard CAT tourniquet on very small infant limbs*] (under ~13 cm circumference) — it will not be effective.],
  [#underline(stroke: 1.5pt)[*Do NOT delay tourniquet application*] to attempt prolonged direct pressure on massive haemorrhage.],
  [#underline(stroke: 1.5pt)[*Do NOT forget to record the time of application.*]],
))

#v(12pt)

#equipment-box((
  "CAT (Combat Application Tourniquet) Gen 7 — for children aged ~2+ with sufficient limb size",
  "SWAT-T tourniquet — for all pediatric sizes including very small limbs",
  "RATS tourniquet — alternative for all pediatric sizes",
  "Improvised tourniquet materials (triangular bandage + rigid windlass object)",
  "Marker or pen (to record time of application)",
  "Sterile gauze (for wound packing if needed)",
  "Phone (to call 101)",
))

#v(12pt)

// === TOURNIQUET SIZING GUIDE ===
#rect(fill: rgb("#fef9e7"), stroke: 1pt + rgb("#d97706"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: rgb("#92400e"), weight: "bold", size: 13pt)[Pediatric Tourniquet Sizing Guide]
  #v(6pt)
  #set text(size: 10pt)
  #table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    stroke: 0.5pt + rgb("#fbbf24"),
    inset: 6pt,
    fill: (x, y) => if y == 0 { rgb("#fef3c7") } else { none },
    [*Age / Size*], [*Device*], [*Notes*],
    [Age 2+, limb 13 cm+], [CAT Gen 7], [Upper + lower extremity],
    [Age 6+, limb 16 cm+], [CAT Gen 7], [Reliable both extremities],
    [All pediatric sizes], [SWAT-T / RATS], [Effective on very small limbs],
    [Infants < 2 years], [Direct pressure], [No evidence for manufactured TQ],
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
    [Tourniquet], [חוסם עורקים], [kho-SEM or-KIM],
    [Bleeding], [דימום], [di-MUM],
    [Tighten], [הדק], [ha-DEK],
    [Windlass], [מוט סיבוב], [MOT si-BUV],
    [Above the wound], [מעל הפצע], [me-AL ha-PE-tsa],
    [Time of application], [זמן הנחה], [ZMAN ha-na-KHA],
    [Shock], [הלם], [HE-lem],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [The child needs a tourniquet], [הילד צריך חוסם עורקים], [ha-YE-led tsa-RIKH kho-SEM or-KIM],
    [The bleeding won't stop], [הדימום לא נעצר], [ha-di-MUM LO ne-e-TSAR],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — MDA Tourniquet Application Guidelines — Pediatric \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Publication date:] 2026-01-01 \
  #strong[Imported:] 2026-03-16 · #strong[Last verified:] 2026-03-16
]
