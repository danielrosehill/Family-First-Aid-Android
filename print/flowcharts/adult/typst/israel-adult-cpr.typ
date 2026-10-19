// Israel Adult CPR Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-CPR-001
// SOP: 007

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-CPR-001"
#let sop-number = "007"
#let protocol-title = "CPR (Cardiopulmonary Resuscitation)"
#let protocol-subject = "CPR"
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
#let icon-person = text(size: 12pt)[#emoji.person]
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
// PAGE 1: Check responsiveness, breathing, call 101, begin CPR
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Check responsiveness
  node((0, 0), align(center)[
    #action[CHECK] responsiveness. \
    Call out, shake shoulders. \
    "Are you okay?"
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: responsive?
  node((0, 1), align(center)[
    Is the person responsive?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 1), align(center)[
    #action[ASSESS] condition. \
    Provide appropriate \
    first aid. Call 101 \
    if needed.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->",
    label: no-label,
    label-side: center),

  // Check breathing
  node((0, 2), align(center)[
    #icon-breath #action[CHECK] breathing \
    (max 10 seconds). \
    Look, listen, feel.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Decision: breathing normally?
  node((0, 3), align(center)[
    Breathing normally? \
    (Gasping is NOT normal)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #icon-person Recovery position. \
    #icon-phone Call 101. \
    #icon-monitor Monitor breathing.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->",
    label: no-label,
    label-side: center),

  // MDA logo above call box
  node((0, 3.45), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Call 101
  node((0, 4), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    Use speakerphone. \
    Request AED.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: helper available?
  node((0, 5), align(center)[
    Another person available?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #action[DIRECT] them to call 101 \
    and retrieve nearest AED. \
    Begin compressions.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 5), (0.5, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  node((-1, 5), align(center)[
    Call 101 yourself \
    (speakerphone). \
    Retrieve AED if nearby. \
    Begin compressions.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 5), (-0.5, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 5), (0, 6), "->"),

  // Position and begin compressions
  node((0, 6), align(center)[
    #icon-person #action[POSITION] supine on \
    firm surface. Heel of hand \
    on centre of chest.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Compressions, breaths, AED
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Compressions, Breaths & AED]
]
#v(6pt)

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Begin compressions
  node((0, 0), align(center)[
    #icon-heart #action[COMPRESS] hard and fast. \
    100--120/min, 5--6 cm depth. \
    Full recoil. Arms locked.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: trained and willing?
  node((0, 1), align(center)[
    Trained in CPR and \
    willing to give breaths?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: yes-label,
    label-side: center),

  node((1, 1), align(center)[
    After 30 compressions: \
    #action[TILT] head, lift chin. \
    #action[GIVE] 2 breaths \
    (1 sec each, visible \
    chest rise). \
    Continue 30:2 cycles.
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
    #icon-heart Hands-only CPR: \
    continuous compressions \
    at 100--120/min. \
    No breaths needed.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 1), (-0.5, 2), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 1), (0, 2), "->"),

  // AED arrives
  node((0, 2), align(center)[
    #icon-zap AED arrives: \
    #action[APPLY] pads immediately. \
    Right below collarbone; \
    left below armpit.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Decision: shock advised?
  node((0, 3), align(center)[
    AED advises shock?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #icon-zap "Stand clear!" \
    #action[DELIVER] shock. \
    Resume CPR immediately.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 3), (0.5, 4), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 3), (-1, 3), "->",
    label: no-label,
    label-side: center),

  node((-1, 3), align(center)[
    #icon-heart Resume CPR \
    immediately. AED \
    re-analyses in 2 min.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 3), (-0.5, 4), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 3), (0, 4), "->"),

  // Continue cycles
  node((0, 4), align(center)[
    #action[CONTINUE] CPR + AED cycles. \
    Rotate compressors every \
    2 min if 2+ rescuers.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: breathing on own?
  node((0, 5), align(center)[
    Person breathing \
    normally on their own?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #action[STOP] CPR. \
    Recovery position. \
    #icon-monitor Monitor until \
    MDA arrives.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  node((-1, 5), align(center)[
    #icon-heart Continue until MDA \
    takes over or you \
    cannot continue.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
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
  [#underline(stroke: 1.5pt)[*Do NOT delay calling 101*] -- early activation is critical for survival.],
  [#underline(stroke: 1.5pt)[*Do NOT spend more than 10 seconds checking breathing*] -- delays reduce survival.],
  [#underline(stroke: 1.5pt)[*Do NOT interrupt compressions for more than 10 seconds*] for any reason.],
  [#underline(stroke: 1.5pt)[*Do NOT lean on the chest between compressions*] -- allow full recoil.],
  [#underline(stroke: 1.5pt)[*Do NOT compress deeper than 6 cm*] to avoid internal injury.],
  [#underline(stroke: 1.5pt)[*Do NOT over-ventilate*] -- 1 second per breath, just enough for visible chest rise.],
  [#underline(stroke: 1.5pt)[*Do NOT touch the person during AED analysis or shock delivery*].],
  [#underline(stroke: 1.5pt)[*Do NOT delay AED use*] -- apply as soon as it arrives.],
  [#underline(stroke: 1.5pt)[*Do NOT wait for AED to re-analyse*] before resuming compressions after shock.],
  [#underline(stroke: 1.5pt)[*Do NOT move the person unnecessarily*] -- perform CPR where they are unless unsafe.],
  [#underline(stroke: 1.5pt)[*Do NOT assume gasping is normal breathing*] -- it is a sign of cardiac arrest.],
))

#v(12pt)

#equipment-box((
  "AED (Automated External Defibrillator)",
  "Barrier device or pocket mask (for rescue breaths, if available)",
  "Phone (to call 101 and use speakerphone for dispatcher-guided CPR)",
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
    [CPR], [החייאה], [ha-kha-ya-A],
    [Cardiac arrest], [דום לב], [dom lev],
    [Chest compressions], [עיסויי חזה], [i-su-YEI kha-ZE],
    [Rescue breaths], [הנשמות], [han-sha-MOT],
    [Are you okay?], [?אתה בסדר], [a-TA be-SE-der?],
    [Not breathing], [לא נושם], [lo no-SHEM],
    [Defibrillator], [דפיברילטור], [de-fib-ri-LA-tor],
    [Stand clear!], [!התרחקו], [hit-rakh-KU!],
    [Recovery position], [תנוחת התאוששות], [tnu-KHAT hit-o-she-SHUT],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Call an ambulance!], [!הזמינו אמבולנס], [haz-MI-nu am-bu-LANS!],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — CPR Protocol / AHA 2025 Guidelines \
  #strong[URL:] https://www.mdais.org/101/cpr-hands-only \
  #strong[Publication date:] 2025-01-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-15
]
