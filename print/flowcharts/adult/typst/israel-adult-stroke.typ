// Israel Adult Stroke Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-STROKE-001
// SOP: 027

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-STROKE-001"
#let sop-number = "027"
#let protocol-title = "Stroke (Cerebrovascular Event)"
#let protocol-subject = "STROKE"
#let scenario = "FAST ASSESSMENT"
#let age-group = "ADULT"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2022-01-01"
#let last-verified = "2026-03-15"
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
#let icon-clock = text(size: 12pt)[#emoji.clock]

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
// PAGE 1: FAST assessment, Call 101, positioning
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // FAST assessment
  node((0, 0), align(center)[
    #action[ASSESS] using FAST: \
    *F* -- Face: ask to smile, \
    check for one-sided drooping. \
    *A* -- Arms: extend both, \
    one drifting down? \
    *S* -- Speech: repeat a sentence, \
    slurred or unable? \
    *T* -- Time: note exact onset.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Call 101 immediately
  node((0, 0.55), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((0, 1), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    Even one FAST sign = \
    emergency evaluation.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Record time
  node((0, 2), align(center)[
    #icon-clock #action[RECORD] exact time \
    of symptom onset. \
    If woke with symptoms, \
    record time sleep began.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Decision: Conscious?
  node((0, 3), align(center)[
    #icon-monitor Is the person conscious?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #icon-person #action[LAY] down with head \
    slightly raised and supported.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (-1, 3), "->",
    label: no-label,
    label-side: center),

  node((-1, 3), align(center)[
    #icon-breath Breathing?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 3), (-0.6, 3.6), "->",
    label: yes-label,
    label-side: center),

  node((-0.6, 3.6), align(center)[
    #action[PLACE] in recovery \
    position (on side).
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 3), (-1.4, 3.6), "->",
    label: no-label,
    label-side: center),

  node((-1.4, 3.6), align(center)[
    #icon-heart #action[BEGIN] CPR \
    immediately.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 38mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 3), (0.5, 4.8), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),
  edge((-0.6, 3.6), (-0.5, 4.8), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 3), (0, 4.8), "->"),

  // Loosen clothing
  node((0, 4.8), align(center)[
    #action[LOOSEN] restrictive clothing: \
    scarves, ties, tight collars.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 1b: Vomiting decision, Monitor
// ============================================================
#pagebreak()

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Decision: Vomiting?
  node((0, 0), align(center)[
    Vomiting or risk of vomiting?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 0), (1, 0), "->",
    label: yes-label,
    label-side: center),

  node((1, 0), align(center)[
    #action[PLACE] on side \
    (recovery position) \
    to protect airway.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (-1, 0), "->",
    label: no-label,
    label-side: center),

  node((-1, 0), align(center)[
    #action[KEEP] lying down, \
    head slightly raised.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 0), (0.5, 1), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),
  edge((-1, 0), (-0.5, 1), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 0), (0, 1), "->"),

  // Monitor continuously
  node((0, 1), align(center)[
    #icon-monitor #action[MONITOR] continuously. \
    Watch for consciousness changes, \
    breathing difficulty. \
    Stay with the person.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 62mm, inset: 8pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 3: Continued monitoring and handover
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Monitoring & Handover]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (8mm, 5mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Decision: Loses consciousness or stops breathing?
    node((0, 0), align(center)[
      Person loses consciousness \
      or stops breathing \
      while waiting?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (1, 0), "->",
      label: yes-label,
      label-side: center),

    node((1, 0), align(center)[
      Not breathing? \
      #icon-heart #action[BEGIN] CPR immediately. \
      Update MDA dispatch. \
      #v(3pt)
      Unconscious but breathing? \
      #action[PLACE] in recovery position.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 42mm, inset: 6pt, corner-radius: 6pt),

    edge((0, 0), (-1, 0), "->",
      label: no-label,
      label-side: center),

    node((-1, 0), align(center)[
      #icon-monitor Continue monitoring \
      and reassurance until \
      paramedics arrive.
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 42mm, inset: 8pt, corner-radius: 6pt),

    edge((-1, 0), (0, 1), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    edge((0, 0), (0, 1), "->"),

    // Report to paramedics
    node((0, 1), align(center)[
      #action[REPORT] to arriving paramedics: \
      #v(3pt)
      -- Exact time symptoms began \
      -- Which FAST signs observed \
      -- Whether symptoms changed \
      -- Current medications (if known) \
      -- Medical history (if known) \
      -- Changes in consciousness level
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),
  )
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
  [#underline(stroke: 1.5pt)[*Do NOT give food or drink*] -- swallowing reflex may be impaired (dysphagia); aspiration risk.],
  [#underline(stroke: 1.5pt)[*Do NOT give any medications*], especially aspirin or blood thinners -- approximately 15% of strokes are hemorrhagic, and these medications worsen bleeding.],
  [#underline(stroke: 1.5pt)[*Do NOT delay calling 101*] -- do not drive the person to hospital yourself unless unavoidable. The ambulance crew pre-notifies the hospital stroke team.],
  [#underline(stroke: 1.5pt)[*Do NOT ignore transient symptoms*] -- even if symptoms resolve (possible TIA), the person needs emergency evaluation. Approximately 40% of TIA patients have a full stroke within three months.],
  [#underline(stroke: 1.5pt)[*Do NOT allow eating, drinking, or oral medications*] until a medical professional has assessed swallowing function.],
))

#v(12pt)

#equipment-box((
  "Phone to call 101 and record symptom onset time",
  "Pillow or support to slightly elevate the head",
))

#v(12pt)

// === FAST REFERENCE CARD ===
#rect(fill: rgb("#fef9e7"), stroke: 1pt + rgb("#ca8a04"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: clr-equip, weight: "bold", size: 14pt)[FAST Reference]
  #v(6pt)
  #set text(size: 11pt)
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    stroke: 0.5pt + rgb("#e5c07b"),
    inset: 8pt,
    fill: (x, y) => if y == 0 { rgb("#fef3c7") } else { none },
    [*Letter*], [*Assessment*],
    [*F*], [*Face* -- Ask to smile. One side drooping?],
    [*A*], [*Arms* -- Raise both arms. One drifting down?],
    [*S*], [*Speech* -- Repeat a sentence. Slurred or unable?],
    [*T*], [*Time* -- Note exact onset. Treatment window: ~6 hours. Target: hospital within 60 min.],
  )
  #v(4pt)
  #text(size: 9pt, fill: rgb("#92400e"), weight: "bold")[Even a single positive FAST sign = call 101 immediately.]
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
    [Stroke], [שבץ מוחי / אירוע מוחי], [SHVATZ mo-KHI / ei-RU-a mo-KHI],
    [Face], [פנים], [pa-NIM],
    [Arm], [זרוע], [zro-A],
    [Speech], [דיבור], [di-BUR],
    [Smile], [לחייך], [le-kha-YEKH],
    [Headache], [כאב ראש], [ke-EV ROSH],
    [Dizziness], [סחרחורת], [skhar-KHO-ret],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Can you raise your arms?], [?אתה יכול להרים את הידיים], [a-TA ya-KHOL le-ha-RIM et ha-ya-DA-yim?],
    [Can you speak?], [?אתה יכול לדבר], [a-TA ya-KHOL le-da-BER?],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — Stroke Recognition and First Aid \
  #strong[URL:] https://www.mdais.org/101/stroke \
  #strong[Publication date:] Standing public guidance \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-15
]
