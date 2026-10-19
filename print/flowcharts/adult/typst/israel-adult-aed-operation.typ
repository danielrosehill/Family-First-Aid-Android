// Israel Adult AED Operation Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-AED-OPERATION-001
// SOP: 002

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-AED-OPERATION-001"
#let sop-number = "002"
#let protocol-title = "AED Operation"
#let protocol-subject = "AED OPERATION"
#let scenario = "CARDIAC ARREST"
#let age-group = "ADULT"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2025-01-01"
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
#let icon-zap = text(size: 12pt)[#emoji.lightning]
#let icon-person = text(size: 12pt)[#emoji.person]

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
// PAGE 1: Confirm arrest, call 101, begin CPR
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Assess responsiveness and breathing
  node((0, 0), align(center)[
    #icon-breath #action[CHECK] responsiveness \
    and breathing (max 10 s).
    #v(3pt)
    Gasping is NOT normal breathing.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: Unresponsive and not breathing?
  node((0, 1), align(center)[
    Unresponsive and \
    not breathing normally?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: no-label,
    label-side: center),

  node((1, 1), align(center)[
    Recovery position \
    if unconscious but breathing.
    #v(3pt)
    Provide appropriate first aid.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->",
    label: yes-label,
    label-side: center),

  // MDA logo above call box
  node((0, 1.45), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Call 101
  node((0, 2), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    Use speakerphone.
    #v(3pt)
    Dispatcher can unlock \
    nearest smart stand AED.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Begin CPR
  node((0, 3), align(center)[
    #icon-heart #action[BEGIN] CPR immediately.
    #v(3pt)
    100--120 compressions/min \
    5--6 cm depth. Full recoil.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: helper available?
  node((0, 4), align(center)[
    Another person available \
    to retrieve AED?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 4), align(center)[
    #action[SEND] them for AED. \
    Continue CPR.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 4), (0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (-1, 4), "->",
    label: no-label,
    label-side: center),

  node((-1, 4), align(center)[
    If AED is nearby, \
    retrieve quickly. \
    Otherwise continue CPR.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 4), (-0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (0, 5), "->"),

  // Locate AED
  node((0, 5), align(center)[
    #action[LOCATE] AED: Eifo-Defi app, \
    MDA smart stands, \
    public buildings.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: AED pad placement and shock delivery
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[AED Pad Placement & Shock Delivery]
]
#v(6pt)

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Open AED
  node((0, 0), align(center)[
    #icon-zap #action[OPEN] AED. \
    Follow voice prompts.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Prepare chest
  node((0, 1), align(center)[
    #action[EXPOSE] bare chest. \
    Dry any moisture.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Decision: special conditions?
  node((0, 2), align(center)[
    Excessive hair, patches, \
    pacemaker, or metal surface?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  node((1, 2), align(center)[
    Shave hair at pad sites. \
    Remove medication patches. \
    Place pads 2.5 cm from \
    pacemaker. Move off metal.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 2), (0.5, 3), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 2), (0, 3), "->",
    label: no-label,
    label-side: center),

  // Apply pads
  node((0, 3), align(center)[
    #action[APPLY] pads per diagram: \
    Pad 1: below right collarbone. \
    Pad 2: left side below armpit.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // AED analysis
  node((0, 4), align(center)[
    #action[STAND CLEAR] during \
    AED rhythm analysis. \
    No one touches patient.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: shock advised?
  node((0, 5), align(center)[
    AED advises shock?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #icon-zap #action[PRESS] shock button. \
    Announce "Stand clear!" \
    ("Hitrachku!").
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 5), (0.5, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  node((-1, 5), align(center)[
    No shock needed. \
    Resume CPR immediately.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 5), (-0.5, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 5), (0, 6), "->"),

  // Resume CPR
  node((0, 6), align(center)[
    #icon-heart #action[RESUME] CPR immediately. \
    Continue for 2 minutes \
    (5 cycles of 30:2).
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 3: Continued cycles and signs of life
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Continued AED / CPR Cycles]
]
#v(6pt)

#diagram(
  spacing: (12mm, 10mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // After 2 min, AED re-analyses
  node((0, 0), align(center)[
    After 2 minutes, AED \
    automatically re-analyses. \
    #action[STOP] CPR. Stand clear.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 60mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  node((0, 1), align(center)[
    #action[FOLLOW] AED prompts. \
    Shock if advised, then \
    resume CPR. Repeat cycle.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 60mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Decision: signs of life?
  node((0, 2), align(center)[
    Person shows signs of life? \
    (breathing, movement, coughing)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 60mm, inset: 8pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  node((1, 2), align(center)[
    #action[STOP] CPR. \
    Recovery position. \
    Keep AED pads attached \
    and device on.
    #v(3pt)
    #icon-monitor Monitor until \
    MDA arrives.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (-1, 2), "->",
    label: no-label,
    label-side: center),

  node((-1, 2), align(center)[
    #icon-heart Continue CPR + \
    AED cycles until MDA \
    arrives or you cannot \
    continue.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 4: Reference Notes
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Reference Notes]
]
#v(8pt)

#do-not-box((
  [#underline(stroke: 1.5pt)[*Do NOT use AED on a conscious, breathing person*] -- AEDs are only for cardiac arrest.],
  [#underline(stroke: 1.5pt)[*Do NOT apply pads in water*] -- move to dry ground and dry the chest first.],
  [#underline(stroke: 1.5pt)[*Do NOT use near flammable gases*] -- risk of fire or explosion.],
  [#underline(stroke: 1.5pt)[*Do NOT place pads directly over a pacemaker*] -- place at least 2.5 cm away.],
  [#underline(stroke: 1.5pt)[*Do NOT place pads over medication patches*] -- remove and wipe skin first.],
  [#underline(stroke: 1.5pt)[*Do NOT touch patient during analysis or shock delivery*] -- electrocution risk.],
  [#underline(stroke: 1.5pt)[*Do NOT turn off AED or disconnect pads*] -- even if person regains consciousness.],
  [#underline(stroke: 1.5pt)[*Do NOT delay defibrillation*] -- survival drops 7--10% per minute of delay.],
  [#underline(stroke: 1.5pt)[*Do NOT interrupt compressions for more than 10 seconds*].],
  [#underline(stroke: 1.5pt)[*Do NOT let pads touch or overlap*] on the chest.],
  [#underline(stroke: 1.5pt)[*Do NOT use AED on a breathing, pulsed unconscious person*] -- use recovery position instead.],
))

#v(12pt)

#equipment-box((
  "AED (from MDA smart stands, public locations, or Eifo-Defi app)",
  "Razor (for shaving chest hair -- often in AED kits)",
  "Towel or cloth (for drying the chest)",
  "Scissors (for cutting clothing -- often in AED kits)",
  "Phone (to call 101 and use speakerphone)",
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
    [Defibrillator], [דפיברילטור], [de-fib-ri-LA-tor],
    [Stand clear!], [!התרחקו], [hit-rakh-KU!],
    [Cardiac arrest], [דום לב], [dom lev],
    [Chest compressions], [עיסויי חזה], [i-su-YEI kha-ZE],
    [Shock], [הלם / שוק], [HE-lem / shok],
    [Not breathing], [לא נושם], [lo no-SHEM],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [AED], [דפיברילטור חיצוני], [de-fib-ri-LA-tor khi-tso-NI],
    [Smart stand], [עמדה חכמה], [am-DA kha-kha-MA],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — AED Operation Protocol / AHA 2025 Guidelines \
  #strong[URL:] https://www.mdais.org/kursim/defibrillator \
  #strong[Publication date:] 2025-01-01 \
  #strong[Imported:] 2026-03-16 · #strong[Last verified:] 2026-03-16
]
