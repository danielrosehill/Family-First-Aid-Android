// Israel Adult Allergic Reaction / Anaphylaxis Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-ALLERGIC-REACTION-001
// SOP: 003

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-ALLERGIC-REACTION-001"
#let sop-number = "003"
#let protocol-title = "Anaphylaxis / Allergic Reaction"
#let protocol-subject = "ANAPHYLAXIS"
#let scenario = "ALLERGIC REACTION"
#let age-group = "ADULT"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2024-04-01"
#let last-verified = "2026-03-16"
#let generation-date = "2026-03-16"
#let version = "3.0"

// === ICON PATHS ===
#let mda-logo = "../../../../icons/mda/mda.png"

// === ICONS (inline helpers) ===
#let icon-phone = text(size: 12pt)[#emoji.phone]
#let icon-breath = text(size: 12pt)[#emoji.wind]
#let icon-med = text(size: 12pt)[#emoji.pill]
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-person = text(size: 12pt)[#emoji.person]
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
// PAGE 1: Recognition, call 101, remove allergen, manage airway
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Recognise signs
  node((0, 0), align(center)[
    #icon-monitor #action[RECOGNISE] signs: \
    rash, swelling, breathing \
    difficulty, weak pulse, confusion.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Decision: anaphylaxis?
  node((0, 1), align(center)[
    Signs of anaphylaxis? \
    (breathing, circulation, \
    or consciousness affected)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (1, 1), "->",
    label: no-label,
    label-side: center),

  node((1, 1), align(center)[
    #icon-monitor Mild reaction only. \
    Monitor for worsening. \
    Call 101 if deteriorates.
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
    Speakerphone on. \
    Identify allergen if possible.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Remove allergen
  node((0, 3), align(center)[
    #action[REMOVE] offending agent. \
    Scrape bee stinger sideways. \
    Stop any infusion.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Manage airway
  node((0, 4), align(center)[
    #icon-breath #action[MANAGE] airway. \
    Clear mouth. Loosen clothing \
    around neck and chest.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: conscious?
  node((0, 5), align(center)[
    Is the patient conscious?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #icon-person Breathing difficulty: \
    #action[SIT] upright. \
    Shock/hypotension: \
    #action[LIE] down, elevate legs.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 5), (0.5, 6), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  // Unconscious branch
  node((-1, 5), align(center)[
    #icon-breath Breathing?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 5), (-1, 6), "->",
    label: yes-label,
    label-side: center),

  node((-1, 6), align(center)[
    #action[PLACE] in recovery \
    position. Proceed \
    to EpiPen.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 5), (0, 6), "->",
    label: no-label,
    label-side: center),

  node((0, 6), align(center)[
    #icon-heart #action[BEGIN] CPR \
    immediately.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: EpiPen administration and monitoring
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[EpiPen & Monitoring]
]
#v(6pt)

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Decision: EpiPen available?
  node((0, 0), align(center)[
    EpiPen available?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (1, 0), "->",
    label: yes-label,
    label-side: center),

  node((1, 0), align(center)[
    #icon-med #action[ADMINISTER] EpiPen: \
    Remove blue cap. \
    Orange tip to outer thigh. \
    Press firmly until click. \
    Hold 10 seconds. \
    Can inject through clothing.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (-1, 0), "->",
    label: no-label,
    label-side: center),

  // MDA logo above no-EpiPen box
  node((-1, -0.55), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((-1, 0), align(center)[
    #icon-phone Inform 101 dispatcher: \
    no EpiPen available. \
    Maintain airway and \
    positioning until EMS.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 0), (0.5, 1), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 0), (0, 1), "->"),

  // Reassess after 5 min
  node((0, 1), align(center)[
    #icon-monitor #action[REASSESS] after 5 minutes. \
    Check airway, breathing, \
    circulation, consciousness.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Decision: improved?
  node((0, 2), align(center)[
    Has condition improved?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (1, 2), "->",
    label: yes-label,
    label-side: center),

  node((1, 2), align(center)[
    #icon-monitor Continue monitoring. \
    Effects last ~20 min; \
    symptoms may recur. \
    Hospital evaluation required.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (-1, 2), "->",
    label: no-label,
    label-side: center),

  node((-1, 2), align(center)[
    #icon-med #action[ADMINISTER] second \
    EpiPen dose if available.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 2), (-0.5, 3), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 2), (0, 3), "->"),

  // Continue monitoring
  node((0, 3), align(center)[
    #icon-monitor #action[MONITOR] continuously \
    until MDA arrives.
    #v(3pt)
    Be prepared for CPR.
    #v(3pt)
    All patients require \
    hospital evaluation.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
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
  [#underline(stroke: 1.5pt)[*Do NOT delay calling 101*] -- anaphylaxis is life-threatening.],
  [#underline(stroke: 1.5pt)[*Do NOT delay epinephrine*] -- it is the only effective first-line treatment. Over 50% of deaths occur within 60 minutes.],
  [#underline(stroke: 1.5pt)[*Do NOT substitute antihistamines for epinephrine*] -- antihistamines are not effective against anaphylaxis.],
  [#underline(stroke: 1.5pt)[*Do NOT make a hypotensive patient stand or sit up suddenly*] -- this can cause cardiac arrest.],
  [#underline(stroke: 1.5pt)[*Do NOT leave the patient unattended*] after epinephrine -- symptoms may recur (biphasic reaction).],
  [#underline(stroke: 1.5pt)[*Do NOT assume safety after symptom resolution*] -- hospital evaluation is mandatory.],
  [#underline(stroke: 1.5pt)[*Do NOT waste time removing clothing*] -- EpiPen can be administered through trousers.],
  [#underline(stroke: 1.5pt)[*Do NOT inject EpiPen into a vein*] -- intramuscular outer thigh only.],
  [#underline(stroke: 1.5pt)[*Do NOT give food or drink*] to a patient experiencing anaphylaxis.],
))

#v(12pt)

#equipment-box((
  "Epinephrine auto-injector (EpiPen) -- adult 0.3 mg",
  "Phone to call MDA at 101",
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
    [Allergic reaction], [תגובה אלרגית], [tgu-VA a-LER-git],
    [Anaphylaxis], [אנפילקסיס], [a-na-fi-LAK-sis],
    [EpiPen], [אפיפן], [E-pi-pen],
    [Swelling], [נפיחות], [ne-fi-KHUT],
    [Hard to breathe], [קשה לנשום], [ka-SHE lin-SHOM],
    [Rash / hives], [פריחה / סרפדת], [pri-KHA / sar-PE-det],
    [Injection], [זריקה], [zri-KA],
    [Thigh], [ירך], [ya-REKH],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Are you allergic?], [?יש לך אלרגיה], [yesh le-KHA a-ler-GI-ya?],
    [Where is the EpiPen?], [?איפה האפיפן], [EI-fo ha-E-pi-pen?],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — ALS Protocol Manual April 2024 \
  #strong[URL:] https://www.mdais.org/101/allergy \
  #strong[Publication date:] 2024-04-01 \
  #strong[Imported:] 2026-03-15 · #strong[Last verified:] 2026-03-15
]
