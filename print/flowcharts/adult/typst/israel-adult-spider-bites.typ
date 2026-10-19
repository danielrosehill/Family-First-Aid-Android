// Israel Adult Spider Bites Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-SPIDER-BITES-001
// SOP: 026

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-SPIDER-BITES-001"
#let sop-number = "026"
#let protocol-title = "Spider Bites"
#let protocol-subject = "SPIDER BITES"
#let scenario = "ENVENOMATION"
#let age-group = "ADULT"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2022-01-01"
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
#let icon-camera = text(size: 12pt)[#emoji.camera]

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
// PAGE 1: Initial response — clean, compress, identify, assess
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Stay calm and move away
  node((0, 0), align(center)[
    #icon-calm #action[REASSURE] the victim. \
    Move away from spider.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Clean the bite
  node((0, 1), align(center)[
    #action[CLEAN] bite with mild \
    soap and water.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Apply cool compress
  node((0, 2), align(center)[
    #action[APPLY] cool compress \
    (wrapped cloth or ice pack). \
    15 min per hour.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Elevate
  node((0, 3), align(center)[
    #action[ELEVATE] bitten area \
    above heart level. \
    Minimise movement.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Can photograph spider?
  node((0, 4), align(center)[
    #icon-camera Can the spider be \
    safely photographed?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #action[PHOTOGRAPH] and note \
    features. Share with \
    medical responders.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (-1, 4), "->",
    label: no-label,
    label-side: center),

  node((-1, 4), align(center)[
    Report any observed \
    details to paramedics.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 4), (0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),
  edge((-1, 4), (-0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (0, 5), "->"),

  // Decision: Systemic symptoms?
  node((0, 5), align(center)[
    Severe pain, muscle cramps, \
    difficulty breathing, nausea, \
    spreading redness, or \
    systemic symptoms?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  // MDA logo
  node((1, 4.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((1, 5), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    Also call Poison Center: \
    04-7771900. \
    Proceed to Page 2.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  node((-1, 5), align(center)[
    #icon-monitor #action[MONITOR] the bite. \
    Call Poison Center \
    (04-7771900) for guidance. \
    Seek medical attention \
    if symptoms worsen.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Spider type assessment and continued monitoring
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Species Assessment & Monitoring]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (8mm, 5mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // Decision: Black widow suspected?
    node((0, 0), align(center)[
      Black widow suspected? \
      (pain onset within 1 hour, \
      muscle cramps/spasms, \
      abdominal pain, sweating)
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
      #icon-phone #action[CALL] 101 immediately. \
      Requires hospital evaluation \
      and possible antivenom. \
      #action[MONITOR] breathing closely.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (-1, 0), "->",
      label: no-label,
      label-side: center),

    node((-1, 0), align(center)[
      Recluse suspected? \
      (painless bite progressing \
      to burning, blistering, \
      blue-white-red pattern)
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((-1, 0), (-1, 1), "->"),

    node((-1, 1), align(center)[
      #icon-phone #action[CALL] Poison Center \
      (04-7771900) for guidance. \
      Seek medical attention. \
      No antivenom available.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((-1, 1), (0, 2), "->",
      stroke: 1pt + clr-rejoin,
      dash: "dashed"),

    edge((0, 0), (0, 2), "->"),

    // Continued monitoring
    node((0, 2), align(center)[
      #icon-monitor #action[MONITOR] continuously. \
      Watch for worsening local \
      symptoms and systemic signs.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->"),

    // Decision: Conscious and breathing?
    node((0, 3), align(center)[
      #icon-breath Conscious and \
      breathing adequately?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (1, 3), "->",
      label: yes-label,
      label-side: center),

    node((1, 3), align(center)[
      #icon-monitor Continue monitoring. \
      Keep elevated, compress \
      applied, victim calm.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (-1, 3), "->",
      label: no-label,
      label-side: center),

    node((-1, 3), align(center)[
      Unconscious but breathing? \
      #action[PLACE] in recovery position. \
      Not breathing? \
      #icon-heart #action[BEGIN] CPR.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
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
  [#underline(stroke: 1.5pt)[*Do NOT apply a tourniquet*] -- spider venom is not stopped by tourniquets; causes tissue damage.],
  [#underline(stroke: 1.5pt)[*Do NOT cut, suck, or apply suction*] to the bite wound -- ineffective and increases infection risk.],
  [#underline(stroke: 1.5pt)[*Do NOT apply heat*] to the bite -- use only cool compresses.],
  [#underline(stroke: 1.5pt)[*Do NOT attempt to catch the spider*] at risk of additional bites -- photograph from a safe distance.],
  [#underline(stroke: 1.5pt)[*Do NOT excise a recluse bite*] -- early surgical excision is contraindicated and worsens outcomes.],
  [#underline(stroke: 1.5pt)[*Do NOT apply ice directly*] to skin -- wrap in cloth first.],
  [#underline(stroke: 1.5pt)[*Do NOT ignore mild symptoms*] -- recluse bites are often painless at first but progress to serious necrosis over hours to days.],
  [#underline(stroke: 1.5pt)[*Do NOT assume it is a spider bite*] without confirmation -- 83.5% of cases presenting as "spider bites" are actually other conditions.],
))

#v(12pt)

#equipment-box((
  "Phone to call 101 (MDA) and 04-7771900 (Israel Poison Center)",
  "Phone or camera to photograph the spider if safe",
  "Mild soap and clean water for wound cleaning",
  "Clean cloth or wrapped ice pack for cool compress",
))

#v(12pt)

// === ISRAELI SPIDERS OF MEDICAL SIGNIFICANCE ===
#rect(fill: rgb("#fef9e7"), stroke: 1pt + rgb("#ca8a04"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: clr-equip, weight: "bold", size: 12pt)[Medically Significant Spiders in Israel]
  #v(6pt)
  #set text(size: 9pt)
  #table(
    columns: (1fr, 1fr, 1fr),
    align: (left, left, left),
    stroke: 0.5pt + rgb("#e5c07b"),
    inset: 6pt,
    fill: (x, y) => if y == 0 { rgb("#fef3c7") } else { none },
    [*Species*], [*Venom Type*], [*Antivenom*],
    [Mediterranean recluse \ (Loxosceles rufescens) \ "violin spider"], [Necrotoxic -- painless bite \ progressing to tissue necrosis], [Not available],
    [Mediterranean black widow \ (Latrodectus tredecimguttatus)], [Neurotoxic -- pain, muscle \ cramps, abdominal spasms], [Available for severe cases],
  )
  #v(4pt)
  #text(size: 8pt, fill: rgb("#6b7280"))[Israel Poison Information Center: 04-7771900 (24/7, Rambam Hospital, Haifa)]
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
    [Spider], [עכביש], [ak-a-VISH],
    [Spider bite], [עקיצת עכביש], [a-ki-TSAT ak-a-VISH],
    [Swelling], [נפיחות], [ne-fi-KHUT],
    [Pain], [כאב], [ke-EV],
    [Muscle cramps], [התכווצויות שרירים], [hit-kav-tsu-YOT shri-RIM],
    [Poison center], [מרכז רעלים], [mer-KAZ re-a-LIM],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [I was bitten], [ננשכתי], [ni-SHAKH-ti],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — First Aid for Spider Bites \
  #strong[URL:] https://www.mdais.org/media/4954/mda-first-aid-guidelines-en.pdf \
  #strong[Publication date:] Standing public guidance \
  #strong[Imported:] 2026-03-16 · #strong[Last verified:] 2026-03-16
]
