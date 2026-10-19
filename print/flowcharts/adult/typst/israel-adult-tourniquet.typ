// Israel Adult Tourniquet Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-ADULT-TOURNIQUET-001
// SOP: 028

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-ADULT-TOURNIQUET-001"
#let sop-number = "028"
#let protocol-title = "Tourniquet Application"
#let protocol-subject = "TOURNIQUET"
#let scenario = "HEMORRHAGE CONTROL"
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
#let icon-drop = text(size: 12pt)[#emoji.drops]
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
// PAGE 1: Decision to apply tourniquet, application steps
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Decision: Direct pressure controlling bleeding?
  node((0, 0), align(center)[
    #icon-drop Life-threatening \
    limb hemorrhage. \
    Direct pressure controlling \
    the bleeding?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (1, 0), "->",
    label: yes-label,
    label-side: center),

  node((1, 0), align(center)[
    #action[CONTINUE] direct pressure. \
    #action[APPLY] Israeli bandage \
    for sustained pressure. \
    Verify distal pulse. Monitor.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->",
    label: no-label,
    label-side: center),

  // Expose wound
  node((0, 1), align(center)[
    #action[EXPOSE] the wound. \
    Cut or remove clothing \
    to identify bleeding source.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Position tourniquet
  node((0, 2), align(center)[
    #action[POSITION] tourniquet above \
    the injury, between wound \
    and heart. Prefer upper arm \
    or upper thigh (single bone).
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Decision: Commercial or improvised?
  node((0, 3), align(center)[
    Using a commercial \
    tourniquet (CAT or similar)?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #action[TIGHTEN] strap and fasten. \
    #action[TWIST] windlass rod \
    until bleeding stops. \
    #action[LOCK] windlass in clip.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (-1, 3), "->",
    label: no-label,
    label-side: center),

  node((-1, 3), align(center)[
    Improvised (shirt, towel, belt). \
    #action[APPLY] as tightly \
    as possible until \
    bleeding stops.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 3), (0.5, 4), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),
  edge((-1, 3), (-0.5, 4), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 3), (0, 4), "->"),

  // Verify bleeding stopped
  node((0, 4), align(center)[
    #icon-drop Bleeding stopped \
    completely?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (-1, 4), "->",
    label: no-label,
    label-side: center),

  node((-1, 4), align(center)[
    #action[APPLY] a second tourniquet \
    above the first one. \
    Tighten and verify again.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((-1, 4), (-0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (0, 5), "->",
    label: yes-label,
    label-side: center),

  // Document time
  node((0, 5), align(center)[
    #icon-clock #action[DOCUMENT] time of \
    tourniquet application. \
    Write on white tab, \
    patient's skin, or visible spot.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->"),

  // Call 101
  node((0, 5.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((0, 6), align(center)[
    #icon-phone #action[CALL] 101. Mention \
    tourniquet applied. Report \
    location, injury, and time.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Monitoring while awaiting MDA
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

    // Monitor for shock
    node((0, 0), align(center)[
      #icon-monitor #action[MONITOR] for shock signs: \
      rapid pulse, pale/cold skin, \
      confusion. Keep victim calm \
      and still.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // Decision: Conscious and breathing?
    node((0, 1), align(center)[
      #icon-breath Victim conscious \
      and breathing?
    ],
      shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (1, 1), "->",
      label: yes-label,
      label-side: center),

    node((1, 1), align(center)[
      #icon-monitor Continue monitoring \
      and reassurance. \
      Keep victim warm. \
      Await MDA arrival.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
      width: 50mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (-1, 1), "->",
      label: no-label,
      label-side: center),

    node((-1, 1), align(center)[
      Unconscious but breathing? \
      #action[PLACE] in recovery position. \
      #v(3pt)
      Not breathing? \
      #icon-heart #action[BEGIN] CPR. \
      Report status to MDA dispatch.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
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
  [#underline(stroke: 1.5pt)[*Do NOT remove the tourniquet*] once applied -- only medical professionals should decide on release or conversion.],
  [#underline(stroke: 1.5pt)[*Do NOT apply to junctional zones*] (groin, armpit, neck), head, or abdomen -- use direct pressure, wound packing, or pressure points for these areas.],
  [#underline(stroke: 1.5pt)[*Do NOT apply over a joint*] -- place on the limb above the wound, preferably over a single bone.],
  [#underline(stroke: 1.5pt)[*Do NOT loosen or adjust*] to "check if bleeding has stopped" -- this can restart hemorrhage.],
  [#underline(stroke: 1.5pt)[*Do NOT delay application*] in life-threatening hemorrhage due to fear of limb loss -- loss of a limb is preferable to loss of life.],
  [#underline(stroke: 1.5pt)[*Do NOT allow the victim to walk*] or move the affected limb after tourniquet application.],
  [#underline(stroke: 1.5pt)[*Do NOT attempt tourniquet conversion*] (replacing tourniquet with direct pressure) -- this is a professional-level decision under medical direction only.],
))

#v(12pt)

#equipment-box((
  "CAT tourniquet (Combat Application Tourniquet) -- preferred",
  "Improvised tourniquet material (shirt, towel, belt) as last resort",
  "Scissors or Leatherman Raptor for cutting clothing",
  "Pen or marker to document tourniquet application time",
  "Phone to call 101 (MDA)",
))

#v(12pt)

// === MDA HEMORRHAGE CONTROL SEQUENCE ===
#rect(fill: rgb("#fef9e7"), stroke: 1pt + rgb("#ca8a04"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: clr-equip, weight: "bold", size: 12pt)[MDA Progressive Hemorrhage Control]
  #v(6pt)
  #set text(size: 10pt)
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    stroke: 0.5pt + rgb("#e5c07b"),
    inset: 6pt,
    fill: (x, y) => if y == 0 { rgb("#fef3c7") } else { none },
    [*Step*], [*Method*],
    [1], [Direct pressure with hand or gauze],
    [2], [Israeli bandage (amtza'sh) for sustained pressure],
    [3], [Wound packing],
    [4], [Pressure points],
    [5], [Tourniquet (last resort or immediate in mass casualty)],
  )
  #v(4pt)
  #text(size: 8pt, fill: rgb("#6b7280"))[In multi-casualty or active-threat situations, skip directly to tourniquet. ~500,000 Israeli civilians trained by MDA in 2024.]
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
    [Israeli bandage], [אמצ״ש], [am-TZA-sh],
    [Wound], [פצע], [PE-tsa],
    [Pressure], [לחץ], [LA-khats],
    [Tighten], [להדק], [le-ha-DEK],
    [Time], [זמן / שעה], [ZMAN / sha-A],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [There is heavy bleeding], [יש דימום חזק], [YESH di-MUM kha-ZAK],
    [I applied a tourniquet], [הנחתי חוסם עורקים], [hi-NAKH-ti kho-SEM or-KIM],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — MDA First Aid Guidelines and "First Seven Minutes" initiative \
  #strong[URL:] https://www.mdais.org/media/4954/mda-first-aid-guidelines-en.pdf \
  #strong[Publication date:] Standing public guidance \
  #strong[Imported:] 2026-03-16 · #strong[Last verified:] 2026-03-16
]
