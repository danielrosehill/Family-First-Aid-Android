// Israel Child Fractures Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-FRACTURES-001
// SOP: 041

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-FRACTURES-001"
#let sop-number = "041"
#let protocol-title = "Fractures & Sprains — Immobilisation"
#let protocol-subject = "FRACTURES"
#let scenario = "IMMOBILISATION"
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
#let icon-calm = text(size: 12pt)[#emoji.hands.open]
#let icon-person = text(size: 12pt)[#emoji.person]
#let icon-warning = text(size: 12pt)[#emoji.warning]
#let icon-cold = text(size: 12pt)[#emoji.snowflake]

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
// PAGE 1: Assessment and immobilisation
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Action: Calm the child
  node((0, 0), align(center)[
    #icon-calm #action[REASSURE] the child. \
    Speak calmly at eye level. \
    Use distraction techniques.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: Open fracture?
  node((0, 1), align(center)[
    #icon-monitor Bone visible \
    through the skin? \
    (open/compound fracture)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

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
    #icon-phone #action[CALL] 101 immediately. \
    Cover wound with sterile \
    dressing. Apply indirect \
    pressure around wound.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 50mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->",
    label: no-label,
    label-side: left),

  // Decision: Spinal/neck injury?
  node((0, 2), align(center)[
    #icon-monitor Suspected spinal \
    or neck injury? \
    (fall from height, MVA)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  node((1, 2), align(center)[
    #action[KEEP] child completely \
    still. Hold head steady. \
    #icon-phone Call 101. \
    Wait for MDA.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 50mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->",
    label: no-label,
    label-side: left),

  // Action: Do not realign
  node((0, 3), align(center)[
    #action[LEAVE] injury as found. \
    Minimum movement, \
    maximum stability.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Arm or leg?
  node((0, 4), align(center)[
    #icon-monitor Arm injury \
    or leg injury?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: rect(fill: clr-step-stroke, radius: 10pt, inset: (x: 4pt, y: 2pt))[#text(fill: white, weight: "bold", size: 9pt)[ARM]],
    label-side: center),

  node((1, 4), align(center)[
    #action[SUPPORT] with sling \
    (shirt, scarf, sweater). \
    Secure sling to chest \
    to prevent swinging.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 50mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 4), (-1, 4), "->",
    label: rect(fill: clr-step-stroke, radius: 10pt, inset: (x: 4pt, y: 2pt))[#text(fill: white, weight: "bold", size: 9pt)[LEG]],
    label-side: center),

  node((-1, 4), align(center)[
    #action[PAD] both sides with \
    pillows, blankets, towels. \
    Bandage injured leg to \
    healthy leg if needed.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 50mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Action: Apply cold
  node((0, 5), align(center)[
    #icon-cold #action[APPLY] cold compress \
    wrapped in cloth. \
    15 min on, 15 min off.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->"),

  // Action: Remove constrictive items
  node((0, 6), align(center)[
    #action[REMOVE] jewellery, watches, \
    shoes from injured area \
    before swelling increases.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Shock prevention, monitoring, and transport
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Shock Prevention & Transport]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 9mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Decision: Spinal injury or vomiting?
    node((0, 0), align(center)[
      #icon-monitor Suspected spinal \
      injury or vomiting?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 0), (1, 0), "->",
      label: yes-label,
      label-side: center),

    node((1, 0), align(center)[
      #action[KEEP] in position found \
      (spinal) or on side \
      (vomiting). Continue \
      monitoring.
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->",
      label: no-label,
      label-side: left),

    // Action: Prevent shock
    node((0, 1), align(center)[
      #icon-person #action[LAY] child down. \
      Keep warm. Elevate \
      legs slightly.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->"),

    // Action: No food/drink
    node((0, 2), align(center)[
      #action[WITHHOLD] food and drink. \
      Moisten lips if very thirsty. \
      (Surgery may be needed.)
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->"),

    // Decision: Severe/open fracture?
    node((0, 3), align(center)[
      #icon-monitor Open fracture, severe \
      deformity, or loss of \
      circulation below injury?
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
      #icon-phone #action[CALL] 101 for \
      ambulance transport.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (-1, 3), "->",
      label: no-label,
      label-side: center),

    node((-1, 3), align(center)[
      #action[TRANSPORT] to hospital \
      with limb immobilised. \
      All sprains need X-ray \
      (growth plate risk).
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 50mm, inset: 8pt, corner-radius: 6pt),
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
  [#underline(stroke: 1.5pt)[*Do NOT attempt to straighten, pull, or realign a broken bone*] — can damage arteries, nerves, and growth plates.],
  [#underline(stroke: 1.5pt)[*Do NOT move the child unnecessarily*], especially if spinal injury is suspected.],
  [#underline(stroke: 1.5pt)[*Do NOT apply heat*] to the injury (no hot compresses, no warm water).],
  [#underline(stroke: 1.5pt)[*Do NOT apply ice directly to skin*] — always wrap in cloth first.],
  [#underline(stroke: 1.5pt)[*Do NOT tie splints or bandages too tightly*] — monitor circulation below the injury.],
  [#underline(stroke: 1.5pt)[*Do NOT allow the child to bear weight*] on an injured leg.],
  [#underline(stroke: 1.5pt)[*Do NOT remove clothing by pulling over the injury*] — cut it away if necessary.],
  [#underline(stroke: 1.5pt)[*Do NOT give aspirin to children*] (Reye's syndrome risk); use paracetamol (Acamol) or ibuprofen (Nurofen for Children).],
  [#underline(stroke: 1.5pt)[*Do NOT push a protruding bone back*] into the wound in an open fracture.],
  [#underline(stroke: 1.5pt)[*Do NOT give the child food or drink*] — surgery under anaesthesia may be required.],
))

#v(12pt)

#equipment-box((
  "Improvised sling material (shirt, scarf, sweater, triangular bandage)",
  "Improvised splint material (cardboard, rolled newspapers, rulers)",
  "Padding material (clothing, towels, blankets)",
  "Ice pack or cold compress (or bag of frozen vegetables)",
  "Cloth or towel for wrapping ice pack",
  "Sterile dressings or clean cloth (for open fractures)",
  "Bandages or fabric strips for securing splints",
  "Blanket for warmth and shock prevention",
  "Tourniquet (for severe uncontrollable bleeding, if available)",
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
    [Fracture / break], [שבר], [SHE-ver],
    [Sprain], [נקע], [NE-ka],
    [Splint], [סד], [SAD],
    [Sling], [מתלה], [mit-LE],
    [Bone], [עצם], [E-tsem],
    [Swelling], [נפיחות], [ne-fi-KHUT],
    [Pain], [כאב], [ke-EV],
    [Growth plate], [לוחית צמיחה], [lu-KHIT tsmi-KHA],
    [Open fracture], [שבר פתוח], [SHE-ver pa-TU-akh],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [It hurts here], [כואב לי פה], [ko-EV li PO],
    [Can you move it?], [?אתה יכול לזוז], [a-TA ya-KHOL la-ZUZ?],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — Fractures and Sprains First Aid Protocol — Children \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
