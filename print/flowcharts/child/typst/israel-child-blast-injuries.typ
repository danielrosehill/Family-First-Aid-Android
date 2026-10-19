// Israel Child Blast Injuries Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-BLAST-INJURIES-001
// SOP: 032

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-BLAST-INJURIES-001"
#let sop-number = "032"
#let protocol-title = "Blast / Shrapnel Injuries"
#let protocol-subject = "BLAST INJURIES"
#let scenario = "SABCDE ASSESSMENT"
#let age-group = "CHILD"
#let country = "Israel"
#let emergency-number = "101"
#let emergency-service = "MDA"
#let source-authority = "Magen David Adom"
#let source-date = "2024-04-01"
#let last-verified = "2026-03-16"
#let generation-date = "2026-03-16"
#let version = "3.0"

#let mda-logo = "../../../../icons/mda/mda.png"

#let icon-phone = text(size: 12pt)[#emoji.phone]
#let icon-breath = text(size: 12pt)[#emoji.wind]
#let icon-monitor = text(size: 12pt)[#emoji.eye]
#let icon-calm = text(size: 12pt)[#emoji.hands.open]

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

#let clr-age-child = rgb("#0d9488")
#let clr-condition = rgb("#1e40af")
#let clr-scenario = rgb("#4b5563")

#let clr-page-bg = rgb("#1e293b")
#let clr-page-fg = white

#let clr-header-bg = rgb("#f8f9fb")
#let clr-header-border = rgb("#e2e5ea")

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
// PAGE 1: Scene Safety through Circulation (SABC)
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Scene safety
  node((0, 0), align(center)[
    #action[ENSURE] scene safety. \
    Check for secondary devices, \
    structural collapse, fire.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // MDA logo above call box
  node((0, 0.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  // Call 101
  node((0, 1), align(center)[
    #icon-phone #action[CALL] 101. Report blast, \
    location, casualties, children.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // A -- Airway
  node((0, 2), align(center)[
    *A* — #action[CHECK] airway. \
    Remove blood, debris, vomit. \
    Jaw thrust if spinal injury suspected.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Decision: Airway clear?
  node((0, 3), align(center)[
    Airway clear and open?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (1, 3), "->",
    label: yes-label,
    label-side: center),

  node((1, 3), align(center)[
    #action[PROCEED] to breathing \
    assessment.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (-1, 3), "->",
    label: no-label,
    label-side: center),

  node((-1, 3), align(center)[
    #action[CLEAR] airway manually. \
    Remove visible debris. \
    Position head to open airway.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // Rejoin
  edge((-1, 3), (-0.5, 4), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),

  edge((0, 3), (0, 4), "->"),

  // B -- Breathing
  node((0, 4), align(center)[
    *B* — #action[ASSESS] breathing. \
    Check chest rise symmetry. \
    Look for accessory muscle use.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (0, 5), "->"),

  // Decision: Breathing adequate?
  node((0, 5), align(center)[
    #icon-breath Breathing adequately \
    with symmetric chest rise?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #action[PROCEED] to circulation \
    assessment.
  ],
    shape: rect, fill: clr-yes-fill, stroke: 1pt + clr-yes,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (-1, 5), "->",
    label: no-label,
    label-side: center),

  node((-1, 5), align(center)[
    Not breathing: #action[BEGIN] CPR. \
    Asymmetric rise: suspect \
    pneumothorax -- injured side down.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  // Rejoin
  edge((1, 5), (0.5, 6), "->",
    stroke: 1pt + clr-rejoin, dash: "dashed"),

  edge((0, 5), (0, 6), "->"),

  // C -- Circulation
  node((0, 6), align(center)[
    *C* — #action[CONTROL] bleeding. \
    Check for massive haemorrhage.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 6), (0, 7), "->"),

  // Decision: Uncontrollable haemorrhage?
  node((0, 7), align(center)[
    Uncontrollable limb \
    haemorrhage?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 7), (1, 7), "->",
    label: yes-label,
    label-side: center),

  node((1, 7), align(center)[
    #action[APPLY] tourniquet \
    proximal to wound. \
    Record time.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 40mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 7), (-1, 7), "->",
    label: no-label,
    label-side: center),

  node((-1, 7), align(center)[
    #action[APPLY] direct pressure \
    with sterile gauze. \
    Elevate if no fracture.
  ],
    shape: rect, fill: clr-no-fill, stroke: 1pt + clr-no,
    width: 40mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: DE, Wounds, Monitor
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Disability, Exposure & Ongoing Care]
]
#v(6pt)

#block(breakable: false)[
  #diagram(
    spacing: (12mm, 10mm),
    node-stroke: 1pt,
    edge-stroke: 1.5pt,

    // D -- Disability
    node((0, 0), align(center)[
      *D* — #action[ASSESS] neurological \
      status (AVPU scale). \
      Check pupil size and reactivity.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 0), (0, 1), "->"),

    // E -- Exposure
    node((0, 1), align(center)[
      *E* — #action[EXPOSE] and examine \
      for additional wounds, burns, \
      embedded objects, fractures.
      #v(3pt)
      Then #action[COVER] immediately \
      to prevent hypothermia.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 1), (0, 2), "->"),

    // Cover wounds
    node((0, 2), align(center)[
      #action[COVER] open wounds \
      with sterile dressings. \
      #action[STABILISE] embedded objects \
      with padding around them.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 2), (0, 3), "->"),

    // Keep with parent
    node((0, 3), align(center)[
      #icon-calm #action[KEEP] child with \
      parent or caregiver. \
      Speak calmly and honestly.
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),

    edge((0, 3), (0, 4), "->"),

    // Monitor
    node((0, 4), align(center)[
      #icon-monitor #action[MONITOR] continuously. \
      Keep warm and covered. \
      Be prepared for CPR.
      #v(2pt)
      #line(length: 100%, stroke: 1.5pt + clr-terminal)
    ],
      shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
      width: 60mm, inset: 8pt, corner-radius: 6pt),
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
  [#underline(stroke: 1.5pt)[*Do NOT enter an unsafe blast scene*] -- risk of secondary devices and structural collapse.],
  [#underline(stroke: 1.5pt)[*Do NOT remove embedded objects*] (shrapnel, fragments) -- stabilise them in place.],
  [#underline(stroke: 1.5pt)[*Do NOT assume a quiet child is uninjured*] -- children may be in psychological shock.],
  [#underline(stroke: 1.5pt)[*Do NOT remove a tourniquet once applied*] -- hospital personnel will manage removal.],
  [#underline(stroke: 1.5pt)[*Do NOT forget to prevent hypothermia*] after examination -- children lose heat rapidly.],
  [#underline(stroke: 1.5pt)[*Do NOT separate the child from their parent*] or caregiver unnecessarily.],
  [#underline(stroke: 1.5pt)[*Do NOT ignore asymmetric chest rise*] -- indicates thoracic trauma requiring urgent attention.],
  [#underline(stroke: 1.5pt)[*Do NOT give food or drink*] if significant injuries present -- may need anaesthesia at hospital.],
))

#v(12pt)

#equipment-box((
  "Tourniquet (CAT or equivalent -- see tourniquet protocol for child-specific sizing)",
  "Sterile gauze and bandages",
  "Blankets (for hypothermia prevention)",
  "Rigid splints (for fracture immobilisation)",
  "Phone (to call 101)",
  "Supplemental oxygen and mask (if available)",
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
    [Shrapnel], [רסיסים], [re-si-SIM],
    [Rocket / missile], [רקטה / טיל], [ra-KE-ta / til],
    [Shelter (safe room)], [מקלט / ממ״ד], [mik-LAT / ma-MAD],
    [Bleeding], [דימום], [di-MUM],
    [Tourniquet], [חוסם עורקים], [kho-SEM or-KIM],
    [Wound], [פצע], [PE-tsa],
    [Breathing], [נשימה], [ne-shi-MA],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [Are you hurt?], [?אתה פצוע], [a-TA pa-TSU-a?],
    [Where does it hurt?], [?איפה כואב], [EI-fo ko-EV?],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) -- PHTLS-aligned trauma protocols, supplemented by Ichud Hatzalah missile strike response guidelines \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Publication date:] 2024-04-01 \
  #strong[Imported:] 2026-03-16 · #strong[Last verified:] 2026-03-16
]
