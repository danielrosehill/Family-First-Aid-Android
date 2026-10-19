// Israel Child Severe Bleeding Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-SEVERE-BLEEDING-001
// SOP: 050

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-SEVERE-BLEEDING-001"
#let sop-number = "050"
#let protocol-title = "Severe Bleeding (Hemorrhage Control) — Child"
#let protocol-subject = "SEVERE BLEEDING"
#let scenario = "HEMORRHAGE CONTROL"
#let age-group = "CHILD"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2026-01-01"
#let last-verified = "2026-03-15"
#let generation-date = "2026-03-16"
#let version = "3.0"

// === ICON PATHS ===
#let mda-logo = "../../../../icons/mda/mda.png"

// === ICONS (inline helpers) ===
#let icon-phone = text(size: 12pt)[#emoji.phone]
#let icon-glove = text(size: 12pt)[#emoji.hand]
#let icon-press = text(size: 12pt)[#emoji.hand]
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-calm = text(size: 12pt)[#emoji.hands.open]
#let icon-bandage = text(size: 12pt)[#emoji.hospital]
#let icon-warn = text(size: 12pt)[#emoji.warning]
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
// PAGE 1: Initial Response — Scene Safety through Direct Pressure
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Scene safety + gloves
  node((0, 0), align(center)[
    #icon-glove #action[ENSURE] scene safety. \
    Wear gloves if available.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Call 101
  node((0, 0.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((0, 1), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    State child's age and weight.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Calm the child
  node((0, 2), align(center)[
    #icon-calm #action[CALM] the child. \
    Involve parent/caregiver. \
    Shield from sight of blood.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Decision: Embedded object?
  node((0, 3), align(center)[
    Embedded or impaled \
    object in wound?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #action[STABILISE] object in place. \
    Pad around it. \
    Press around, not on it. \
    Skip to shock monitoring.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->",
    label: no-label,
    label-side: left),

  // Direct pressure
  node((0, 4), align(center)[
    #icon-press #action[PRESS] firmly on wound \
    with gloved hand or gauze. \
    Maintain continuous pressure.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: Bleeding controlled?
  node((0, 5), align(center)[
    Direct pressure \
    controlling bleeding?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #action[MAINTAIN] pressure. \
    #action[ELEVATE] limb \
    above heart level. \
    Continue to shock monitoring.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 5), (0.5, 7), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 5), (0, 6), "->",
    label: no-label,
    label-side: left),

  // Add layers
  node((0, 6), align(center)[
    #action[ADD] layers on top. \
    Apply Israeli Emergency \
    Bandage (pressure dressing).
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (0, 7), "->"),

  // Decision: Israeli bandage controlled?
  node((0, 7), align(center)[
    Israeli bandage \
    controlling bleeding?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 7), (1, 7), "->",
    label: yes-label,
    label-side: center),

  node((1, 7), align(center)[
    #action[MAINTAIN] dressing. \
    Continue to shock monitoring.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 7), (-1, 7), "->",
    label: no-label,
    label-side: center),

  node((-1, 7), align(center)[
    Assess wound location. \
    Proceed to Page 2: \
    Escalation.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Escalation — Wound Packing / Tourniquet
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Escalation — Wound Packing / Tourniquet]
]
#v(6pt)

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Decision: Limb wound?
  node((0, 0), align(center)[
    Is the wound on \
    a limb (arm or leg)?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (1, 0), "->",
    label: yes-label,
    label-side: center),

  // Tourniquet branch
  node((1, 0), align(center)[
    Assess child's age \
    and limb size.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 0), (1, 1), "->"),

  // Decision: Age 2+ and 13cm+?
  node((1, 1), align(center)[
    Child aged 2+ with limb \
    circumference 13 cm+?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 1), (0, 2), "->",
    label: yes-label,
    label-side: center),

  node((0, 2), align(center)[
    #action[APPLY] CAT Gen 7 \
    tourniquet 5–10 cm \
    above wound. \
    #action[TIGHTEN] until \
    bleeding stops. \
    #action[RECORD] time (TQ HHMM).
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((1, 1), (1, 2), "->",
    label: no-label,
    label-side: left),

  node((1, 2), align(center)[
    #action[USE] sustained direct \
    pressure as primary method. \
    Consider improvised narrow \
    pressure device only under \
    medical direction.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 2), (0.5, 3), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  // Wound packing branch (junctional)
  edge((0, 0), (-1, 0), "->",
    label: no-label,
    label-side: center),

  node((-1, 0), align(center)[
    Junctional wound \
    (groin, neck, axilla, shoulder).
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 0), (-1, 1), "->"),

  node((-1, 1), align(center)[
    #action[PACK] wound with gauze \
    finger-by-finger (sunburst \
    pattern). \
    #action[APPLY] dressing with \
    direct pressure 1–2 min. \
    #action[TIGHTEN] bandage straps.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 1), (0, 3), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  // Shock monitoring
  node((0, 3), align(center)[
    #icon-monitor #action[MONITOR] for shock: \
    tachycardia, pale/cool/mottled \
    skin, confusion, rapid breathing.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Signs of shock?
  node((0, 4), align(center)[
    Child showing signs \
    of shock?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #action[LAY] child down. \
    If conscious: elevate legs. \
    If unconscious: recovery position. \
    #action[COVER] with blanket. \
    Moisten lips only. \
    #action[UPDATE] 101 dispatcher.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (-1, 4), "->",
    label: no-label,
    label-side: center),

  node((-1, 4), align(center)[
    #icon-monitor #action[CONTINUE] monitoring. \
    Keep child warm and calm. \
    Reassess frequently.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),
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
  [#underline(stroke: 1.5pt)[*Do NOT remove an embedded or impaled object*] from the wound.],
  [#underline(stroke: 1.5pt)[*Do NOT lift or remove a blood-soaked dressing*] — add layers on top.],
  [#underline(stroke: 1.5pt)[*Do NOT remove or loosen a tourniquet*] once applied unless instructed by a paramedic or physician.],
  [#underline(stroke: 1.5pt)[*Do NOT loosen a tourniquet because the child is screaming*] — pain is expected.],
  [#underline(stroke: 1.5pt)[*Do NOT give food or drink*] to a child with severe bleeding or suspected shock.],
  [#underline(stroke: 1.5pt)[*Do NOT use wound packing for penetrating stab wounds.*]],
  [#underline(stroke: 1.5pt)[*Do NOT enlarge wound openings*] to facilitate wound packing.],
  [#underline(stroke: 1.5pt)[*Do NOT assume tachycardia is only from anxiety or pain*] — suspect blood loss.],
  [#underline(stroke: 1.5pt)[*Do NOT wait for hypotension*] to suspect shock in a child — it is a late, pre-arrest sign.],
  [#underline(stroke: 1.5pt)[*Do NOT delay calling 101*] for severe or uncontrolled bleeding in a child.],
  [#underline(stroke: 1.5pt)[*Do NOT apply a tourniquet over a joint*] — place 5–10 cm above the wound.],
  [#underline(stroke: 1.5pt)[*Do NOT use a manufactured tourniquet on a child under 2*] — use sustained direct pressure.],
))

#v(12pt)

#equipment-box((
  "Disposable gloves",
  "Sterile gauze or clean cloth",
  "Israeli Emergency Bandage (pressure dressing)",
  "Tourniquet (CAT Gen 7 — for children aged 2+ with limb circumference 13 cm+)",
  "Wound packing material (hemostatic gauze preferred)",
  "Blanket or coat (for shock management and warmth)",
  "Comfort item for the child (toy, stuffed animal) if available",
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
    [Bleeding], [דימום], [di-MUM],
    [Tourniquet], [חוסם עורקים], [kho-SEM or-KIM],
    [Bandage], [תחבושת], [takh-BO-shet],
    [Pressure], [לחץ], [LA-khats],
    [Wound], [פצע], [PE-tsa],
    [Shock], [הלם], [HE-lem],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Where is the bleeding?], [?איפה הדימום], [EI-fo ha-di-MUM?],
    [The child is bleeding], [הילד מדמם], [ha-YE-led me-da-MEM],
    [Apply pressure], [תלחץ], [til-KHATZ],
    [Gloves], [כפפות], [kfa-FOT],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — MDA 101 First Aid Public Guidance (Bleeding Control) — Pediatric Adaptation \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Publication date:] 2026-01-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-15
]
