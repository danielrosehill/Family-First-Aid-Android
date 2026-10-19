// Israel Child Electrocution Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-ELECTROCUTION-001
// SOP: 039

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-ELECTROCUTION-001"
#let sop-number = "039"
#let protocol-title = "Electrocution — Electric Shock"
#let protocol-subject = "ELECTROCUTION"
#let scenario = "ELECTRIC SHOCK"
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
#let icon-heart = text(size: 12pt)[#emoji.heart]
#let icon-person = text(size: 12pt)[#emoji.person]
#let icon-warning = text(size: 12pt)[#emoji.warning]
#let icon-zap = text(size: 12pt)[#emoji.lightning]

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
// PAGE 1: Scene safety and power disconnection
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Action: Scene safety
  node((0, 0), align(center)[
    #icon-warning #action[STOP] — do NOT \
    touch the child while in \
    contact with source.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: High voltage?
  node((0, 1), align(center)[
    #icon-zap High-voltage source? \
    (power lines, transformer)
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
    #icon-phone #action[CALL] 101, 102, \
    and 103. Keep distance. \
    Wait for emergency \
    services.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->",
    label: no-label,
    label-side: left),

  // Action: Disconnect power
  node((0, 2), align(center)[
    #action[DISCONNECT] power at \
    circuit breaker or unplug. \
    If unreachable, use dry \
    non-conductive object.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // MDA logo above call box
  node((0, 2.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Action: Call 101
  node((0, 3), align(center)[
    #icon-phone #action[CALL] 101 immediately.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Child responsive?
  node((0, 4), align(center)[
    #icon-monitor Child responsive?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #action[KEEP] still and calm. \
    Proceed to burn \
    assessment (Page 2).
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (-1, 4), "->",
    label: no-label,
    label-side: center),

  // Decision: Breathing/pulse?
  node((-1, 4), align(center)[
    #icon-monitor Breathing \
    and pulse present?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 4), (-1, 5), "->",
    label: no-label,
    label-side: left),

  node((-1, 5), align(center)[
    #icon-heart #action[BEGIN] CPR. \
    Use AED if available. \
    Continue until \
    MDA arrives.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 4), (-1, 3), "->",
    label: yes-label,
    label-side: left),

  node((-1, 3), align(center)[
    #action[PLACE] in recovery \
    position. Monitor \
    breathing.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Burns and shock management
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Burn Assessment & Shock Management]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 9mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Decision: Oral burn?
    node((0, 0), align(center)[
      #icon-monitor Oral electrical burn? \
      (from biting/sucking \
      a cord)
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 0), (1, 0), "->",
      label: yes-label,
      label-side: center),

    node((1, 0), align(center)[
      #action[COOL] area if possible. \
      Warn parents: delayed \
      labial artery bleeding \
      can occur hours/days later.
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->",
      label: no-label,
      label-side: left),

    // Action: Cool burns
    node((0, 1), align(center)[
      #action[COOL] visible burns \
      with cool running water. \
      Cover with sterile \
      non-adherent dressing.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->"),

    // Decision: Spinal injury suspected?
    node((0, 2), align(center)[
      #icon-monitor Child thrown or \
      fell during shock? \
      (spinal injury risk)
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 2), (1, 2), "->",
      label: yes-label,
      label-side: center),

    node((1, 2), align(center)[
      #action[KEEP] completely still. \
      Support head and neck. \
      Wait for MDA.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->",
      label: no-label,
      label-side: left),

    // Action: Treat for shock
    node((0, 3), align(center)[
      #icon-person #action[LAY] child down. \
      Keep warm with blanket. \
      Elevate legs slightly.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 3), (0, 4), "->"),

    // Action: Hospital mandatory
    node((0, 4), align(center)[
      #action[TRANSPORT] to hospital. \
      MANDATORY for all \
      pediatric electrocution.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 52mm, inset: 6pt, corner-radius: 6pt),
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
  [#underline(stroke: 1.5pt)[*Do NOT touch the child while in contact with the electrical source*] — chain electrocution risk.],
  [#underline(stroke: 1.5pt)[*Do NOT use metal objects or wet/damp materials*] to separate the child from the source.],
  [#underline(stroke: 1.5pt)[*Do NOT apply ice to electrical burns.*]],
  [#underline(stroke: 1.5pt)[*Do NOT apply creams, ointments, toothpaste, or home remedies*] to electrical burns.],
  [#underline(stroke: 1.5pt)[*Do NOT assume the child is fine*] because external injuries appear minor — internal damage may be hidden.],
  [#underline(stroke: 1.5pt)[*Do NOT delay calling 101*] — every pediatric electrocution requires hospital assessment.],
  [#underline(stroke: 1.5pt)[*Do NOT move the child unnecessarily*] — spinal/traumatic injuries may be present.],
  [#underline(stroke: 1.5pt)[*Do NOT approach high-voltage sources*] — call 101, 102, and 103; maintain safe distance.],
  [#underline(stroke: 1.5pt)[*Do NOT stop CPR*] based on apparent lack of vital signs — electrocution victims can be resuscitated after prolonged efforts.],
  [#underline(stroke: 1.5pt)[*Do NOT give food or drink*] to a child in shock after electrocution.],
))

#v(12pt)

#equipment-box((
  "Non-conductive object (wooden broom handle, dry stick, plastic chair)",
  "AED / defibrillator (with pediatric pads if available)",
  "Cool running water source (for burn cooling)",
  "Sterile non-adherent dressings",
  "Blanket (for warmth and shock treatment)",
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
    [Electrocution], [התחשמלות], [hit-khash-me-LUT],
    [Electric shock], [מכת חשמל], [ma-KAT khash-MAL],
    [Circuit breaker], [מפסק ראשי], [maf-SEK ra-shi],
    [Power line], [קו חשמל], [kav khash-MAL],
    [Burn], [כוויה], [kvi-YA],
    [Shock (medical)], [הלם], [HE-lem],
    [CPR], [החייאה], [ha-kha-ya-A],
    [Defibrillator], [דפיברילטור], [de-fib-ri-LA-tor],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Turn off the electricity], [תכבה את החשמל], [te-kha-BE et ha-khash-MAL],
    [The child was electrocuted], [הילד התחשמל], [ha-YE-led hit-khash-MEL],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — Electrocution First Aid Guidelines — Pediatric \
  #strong[URL:] https://www.mdais.org/101/electrocution \
  #strong[Publication date:] 2026-01-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-16
]
