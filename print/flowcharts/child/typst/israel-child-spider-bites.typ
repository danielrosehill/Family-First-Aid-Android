// Israel Child Spider Bites Flowchart — V3
// Generated: 2026-03-16
// Source: Magen David Adom (MDA)
// Protocol ID: IL-CHILD-SPIDER-BITES-001
// SOP: 054

#import "@preview/fletcher:0.5.7": diagram, node, edge

// === METADATA ===
#let protocol-id = "IL-CHILD-SPIDER-BITES-001"
#let sop-number = "054"
#let protocol-title = "Spider Bites — Child"
#let protocol-subject = "SPIDER BITES"
#let scenario = "ENVENOMATION"
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
#let icon-calm = text(size: 12pt)[#emoji.hands.open]
#let icon-water = text(size: 12pt)[#emoji.drops]
#let icon-cold = text(size: 12pt)[#emoji.ice]
#let icon-camera = text(size: 12pt)[#emoji.camera]
#let icon-spider = text(size: 12pt)[#emoji.spider]

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
// PAGE 1: Initial Response — Wound Care through Species ID
// ============================================================

#diagram(
  spacing: (8mm, 5mm),
  node-stroke: 1pt,
  edge-stroke: 1.5pt,

  // Move child away, capture/photo spider
  node((0, 0), align(center)[
    #icon-spider #action[MOVE] child away \
    from spider. \
    #icon-camera Safely capture or \
    photograph spider for ID.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 0), (0, 1), "->"),

  // Wash bite
  node((0, 1), align(center)[
    #icon-water #action[WASH] bite area with \
    water and soap.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 1), (0, 2), "->"),

  // Cold compress
  node((0, 2), align(center)[
    #icon-cold #action[APPLY] cold compress \
    wrapped in cloth, 10–15 min. \
    Remove 10 min, reapply.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 2), (0, 3), "->"),

  // Immobilise
  node((0, 3), align(center)[
    #action[IMMOBILISE] bitten limb \
    at heart level. \
    #action[KEEP] child still.
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 3), (0, 4), "->"),

  // Decision: Systemic symptoms?
  node((0, 4), align(center)[
    #icon-monitor Systemic symptoms? \
    (severe pain, abdominal cramps, \
    breathing difficulty, sweating, \
    muscle cramps)
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 4), (1, 4), "->",
    label: yes-label,
    label-side: center),

  node((1, 3.5), align(center)[
    #image(mda-logo, width: 24pt)
  ],
    shape: rect, fill: none, stroke: none,
    width: 14mm, inset: 0pt),

  node((1, 4), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    Possible black widow bite. \
    Keep child calm and still. \
    #action[PREPARE] for transport.
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((1, 4), (0.5, 5), "->",
    stroke: 1pt + clr-rejoin,
    dash: "dashed"),

  edge((0, 4), (0, 5), "->",
    label: no-label,
    label-side: left),

  // Decision: Black widow suspected?
  node((0, 5), align(center)[
    #icon-spider Spider identified as \
    or suspected Black Widow?
  ],
    shape: rect, fill: clr-decision, stroke: 2pt + clr-decision-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (1, 5), "->",
    label: yes-label,
    label-side: center),

  node((1, 5), align(center)[
    #icon-phone #action[CALL] 101 immediately. \
    Antivenom available at \
    Israeli hospitals. \
    #action[TRANSPORT] urgently.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-warning-fill, stroke: 2pt + clr-warning,
    width: 42mm, inset: 6pt, corner-radius: 6pt),

  edge((0, 5), (0, 6), "->",
    label: no-label,
    label-side: left),

  // Transport to hospital
  node((0, 6), align(center)[
    #action[SEEK] medical evaluation \
    for all spider bites in children. \
    Bring captured/photographed spider. \
    First 6–8 hours are critical.
    #v(2pt)
    #line(length: 100%, stroke: 1.5pt + clr-terminal)
  ],
    shape: rect, fill: clr-step, stroke: 1pt + clr-step-stroke,
    width: 52mm, inset: 6pt, corner-radius: 6pt),
)

// ============================================================
// PAGE 2: Reference Notes
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 16pt, weight: "bold", fill: clr-condition)[Reference Notes]
]
#v(8pt)

#do-not-box((
  [#underline(stroke: 1.5pt)[*Do NOT apply a tourniquet*] — tourniquets worsen envenomation outcomes by concentrating venom.],
  [#underline(stroke: 1.5pt)[*Do NOT cut the bite site*] — causes additional injury and does not remove venom.],
  [#underline(stroke: 1.5pt)[*Do NOT attempt to suck out the venom*] — ineffective and risks infection.],
  [#underline(stroke: 1.5pt)[*Do NOT apply antiseptic, alcohol, or any substance*] other than water and soap.],
  [#underline(stroke: 1.5pt)[*Do NOT bandage tightly*] over the bite site.],
  [#underline(stroke: 1.5pt)[*Do NOT delay medical evaluation*] for any spider bite in a child.],
  [#underline(stroke: 1.5pt)[*Do NOT ignore a painless bite*] — brown recluse bites are often painless initially but develop serious necrotic wounds hours later.],
  [#underline(stroke: 1.5pt)[*Do NOT give the child medications*] (painkillers, antihistamines) without medical direction.],
))

#v(12pt)

#equipment-box((
  "Water and soap (for wound cleaning)",
  "Ice or cold compress wrapped in cloth",
  "Container or glass (to safely capture the spider for identification)",
  "Phone (to call 101 and photograph the spider)",
))

#v(12pt)

// === SPECIES IDENTIFICATION ===
#rect(fill: rgb("#fef9e7"), stroke: 1pt + rgb("#d97706"), radius: 6pt, width: 100%, inset: 10pt)[
  #text(fill: rgb("#92400e"), weight: "bold", size: 13pt)[Venomous Spiders in Israel]
  #v(6pt)
  #set text(size: 10pt)
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    [
      *Brown Recluse* (shshan chum) \
      Small, brown, long legs \
      Lives indoors (wardrobes, shoes) \
      Bite barely felt initially \
      Effects appear hours later \
      Causes local necrotic wound
    ],
    [
      *Black Widow* (almana shchora) \
      Black with markings \
      Found outdoors (gardens, walls) \
      Immediate pain and burning \
      Rapid systemic symptoms \
      Female bite is dangerous \
      *Antivenom available*
    ],
  )
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
    [Black widow], [אלמנה שחורה], [al-ma-NA shcho-RA],
    [Brown recluse], [שושן חום], [sho-SHAN KHUM],
    [Venom], [ארס], [E-res],
    [Antivenom], [נוגדן נגד ארס], [nog-DAN NE-ged E-res],
    [Swelling], [נפיחות], [ne-fi-KHUT],
    [Pain], [כאב], [ke-EV],
    [Ambulance], [אמבולנס], [am-bu-LANS],
    [Emergency], [חירום], [khe-RUM],
    [The child was bitten by a spider], [הילד נעקץ על ידי עכביש], [ha-YE-led ne-e-KATS al ye-DEI ak-a-VISH],
  )
]

#v(12pt)

#rect(fill: rgb("#f9fafb"), stroke: 0.5pt + rgb("#d1d5db"), radius: 4pt, width: 100%, inset: 10pt)[
  #set text(size: 8pt, fill: rgb("#6b7280"))
  #strong[Source:] Magen David Adom (MDA) — MDA Spider Bite First Aid Guidelines — Pediatric \
  #strong[URL:] https://www.mdais.org/101/first-aid \
  #strong[Publication date:] 2026-01-01 \
  #strong[Imported:] 2026-03-16 · #strong[Last verified:] 2026-03-16
]
