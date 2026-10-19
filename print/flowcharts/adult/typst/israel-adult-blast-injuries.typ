// Israel Adult Blast / Shrapnel Injuries Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-BLAST-INJURIES-001
// SOP: 004

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-BLAST-INJURIES-001"
#let sop-number = "004"
#let protocol-title = "Blast / Shrapnel Injuries"
#let protocol-subject = "BLAST INJURIES"
#let scenario = "EXPLOSION / SHRAPNEL"
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
#let icon-breath = text(size: 12pt)[#emoji.wind]
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-heart = text(size: 12pt)[#emoji.heart]
#let icon-person = text(size: 12pt)[#emoji.person]
#let icon-calm = text(size: 12pt)[#emoji.hands.open]

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
// PAGE 1: Scene safety, call 101, hemorrhage control
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Scene safety
  node((0, 0), align(center)[
    #action[CONFIRM] scene is safe. \
    Wait for security forces \
    to clear the area.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // MDA logo above call box
  node((0, 0.45), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Call 101
  node((0, 1), align(center)[
    #icon-phone #action[CALL] 101. \
    Report location, number of \
    casualties, type of incident.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Decision: life-threatening bleeding from limb?
  node((0, 2), align(center)[
    Life-threatening bleeding \
    from a limb?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->",
    label: yes-label,
    label-side: center),

  edge((0, 2), (1, 2), "->",
    label: no-label,
    label-side: center),

  node((1, 2), align(center)[
    Check for embedded objects, \
    burns, breathing difficulty. \
    Proceed to page 2.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // Direct pressure
  node((0, 3), align(center)[
    #action[APPLY] direct pressure \
    to bleeding site. \
    Use Israeli bandage \
    when available.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: bleeding controlled?
  node((0, 4), align(center)[
    Bleeding controlled \
    with direct pressure?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #action[MAINTAIN] pressure. \
    Secure with bandage. \
    Check distal pulse.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 4), (0.5, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (0, 5), "->",
    label: no-label,
    label-side: center),

  // Pack wound
  node((0, 5), align(center)[
    #action[PACK] wound with gauze \
    for large limb/groin wounds. \
    Secure with bandaging.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (-1, 5.5), "->"),

  // Decision: packing controlled?
  node((-1, 5.5), align(center)[
    Bleeding controlled?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 5.5), (-1, 6.3), "->",
    label: no-label,
    label-side: center),

  // Tourniquet
  node((-1, 6.3), align(center)[
    #action[APPLY] tourniquet above \
    injury. Tighten until \
    bleeding stops. \
    Record time applied.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 5.5), (0, 6), "->",
    label: yes-label,
    label-side: center),

  // Proceed to next checks
  node((0, 6), align(center)[
    Proceed to embedded \
    objects and burns \
    assessment (page 2).
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Embedded objects, burns, monitoring
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Secondary Assessment & Monitoring]
]
#v(6pt)

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Stabilise embedded objects
  node((0, 0), align(center)[
    #action[STABILISE] embedded objects. \
    Apply pressure on either side. \
    Immobilise in place.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Look for additional wounds
  node((0, 1), align(center)[
    #action[EXAMINE] entire body \
    for additional wounds.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Decision: additional bleeding?
  node((0, 2), align(center)[
    Additional bleeding \
    wounds found?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  node((1, 2), align(center)[
    #action[CONTROL] each wound: \
    direct pressure, packing, \
    or tourniquet as needed.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 2), (0.5, 3), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 2), (0, 3), "->",
    label: no-label,
    label-side: center),

  // Treat burns
  node((0, 3), align(center)[
    #action[COOL] burns with clean water. \
    Cover with non-adherent \
    dressing.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Monitor for shock
  node((0, 4), align(center)[
    #icon-monitor #action[MONITOR] for shock: \
    rapid pulse, pale skin, \
    confusion, rapid breathing.
    #v(3pt)
    #icon-calm Reassure. Keep warm.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: conscious and breathing?
  node((0, 5), align(center)[
    Victim conscious \
    and breathing?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #icon-monitor Continue monitoring \
    and reassurance. \
    Keep still and warm \
    until MDA arrives.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  node((-1, 5), align(center)[
    Unconscious but breathing? \
    #action[PLACE] in recovery position.
    #v(3pt)
    Not breathing? \
    #icon-heart #action[BEGIN] CPR (30:2).
    #v(3pt)
    Report to MDA dispatch.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
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
  [#underline(stroke: 1.5pt)[*Do NOT approach*] until security forces confirm the scene is safe -- secondary devices are a known tactic.],
  [#underline(stroke: 1.5pt)[*Do NOT remove embedded shrapnel or debris*] -- may cause uncontrollable bleeding.],
  [#underline(stroke: 1.5pt)[*Do NOT remove a tourniquet*] once applied -- only medical professionals should decide.],
  [#underline(stroke: 1.5pt)[*Do NOT remove clothing stuck to burns*] -- cut around it.],
  [#underline(stroke: 1.5pt)[*Do NOT let the victim move or walk*] until MDA arrives.],
  [#underline(stroke: 1.5pt)[*Do NOT use head-tilt for airway management*] in blast/trauma -- use jaw-thrust to protect cervical spine.],
  [#underline(stroke: 1.5pt)[*Do NOT administer epinephrine in hypovolemic trauma*] -- blood vessels are already constricted from shock.],
  [#underline(stroke: 1.5pt)[*Do NOT assume only one injury site*] -- blast victims have injuries from multiple mechanisms.],
))

#v(12pt)

#equipment-box((
  "Phone to call 101 (MDA)",
  "Sterile gauze or clean cloth for direct pressure",
  "Israeli bandage (emergency bandage)",
  "Gauze for wound packing",
  "Tourniquet (CAT preferred; improvised as last resort)",
  "Non-adherent dressings for burns",
  "Clean water for cooling burns",
  "Blanket for warmth",
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
    [Explosion], [פיצוץ], [pi-TSUTS],
    [Shrapnel], [רסיסים], [rsi-SIM],
    [Tourniquet], [חוסם עורקים], [kho-SEM or-KIM],
    [Bandage], [תחבושת], [takh-BO-shet],
    [Bleeding], [דימום], [di-MUM],
    [Pressure], [לחץ], [LA-khats],
    [Wound], [פצע], [PE-tsa],
    [Burns], [כוויות], [kvi-YOT],
    [Shock], [הלם], [HE-lem],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Are you injured?], [?אתה פצוע], [a-TA pa-TSU-a?],
    [Where does it hurt?], [?איפה כואב], [EI-fo ko-EV?],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — First Aid Guidelines: Blast and Shrapnel Injuries \
  #strong[URL:] https://www.mdais.org/media/4954/mda-first-aid-guidelines-en.pdf \
  #strong[Imported:] 2026-03-16 · #strong[Last verified:] 2026-03-16
]
