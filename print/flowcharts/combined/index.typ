// Index / Cover Page for Israel First Aid Protocol Flowcharts
// Generated: 2026-03-16

#set page(
  paper: "a4",
  margin: (top: 2cm, bottom: 2cm, left: 2cm, right: 2cm),
)

#set text(font: ("IBM Plex Sans", "IBM Plex Sans Hebrew"), size: 10pt)

// === COLOURS ===
#let clr-adult = rgb("#ea580c")
#let clr-child = rgb("#0d9488")
#let clr-blue = rgb("#1e40af")
#let clr-grey = rgb("#64748b")

// ============================================================
// COVER PAGE
// ============================================================

#v(3cm)

#align(center)[
  #text(size: 36pt, weight: "bold", fill: clr-blue, tracking: 1pt)[FIRST AID]
  #v(4pt)
  #text(size: 36pt, weight: "bold", fill: clr-blue, tracking: 1pt)[PROTOCOL FLOWCHARTS]
  #v(16pt)
  #text(size: 18pt, fill: clr-grey)[Israel — Based on MDA Guidelines]
  #v(8pt)
  #rect(fill: rgb("#f1f5f9"), radius: 6pt, inset: (x: 20pt, y: 10pt), stroke: 0.5pt + rgb("#e2e8f0"))[
    #text(size: 12pt, fill: clr-grey)[
      #text(fill: clr-adult, weight: "bold")[Adult] & #text(fill: clr-child, weight: "bold")[Child] Protocols
    ]
  ]
]

#v(2cm)

#align(center)[
  #rect(fill: rgb("#fef3c7"), radius: 6pt, inset: 14pt, stroke: 1pt + rgb("#f59e0b"), width: 80%)[
    #align(center)[
      #text(size: 11pt, fill: rgb("#92400e"), weight: "bold")[
        Personal reference only — not medical advice
      ]
      #v(4pt)
      #text(size: 9pt, fill: rgb("#92400e"))[
        This document is a personal study aid. In any emergency, call *101* (MDA) immediately. \
        Always follow the instructions of trained medical professionals.
      ]
    ]
  ]
]

#v(2cm)

#align(center)[
  #text(size: 10pt, fill: clr-grey)[
    Emergency Numbers (Israel):
  ]
  #v(6pt)
  #grid(
    columns: (auto, auto, auto),
    gutter: 20pt,
    [#text(weight: "bold", size: 14pt, fill: rgb("#dc2626"))[101] #text(size: 9pt, fill: clr-grey)[ MDA]],
    [#text(weight: "bold", size: 14pt, fill: rgb("#dc2626"))[100] #text(size: 9pt, fill: clr-grey)[ Police]],
    [#text(weight: "bold", size: 14pt, fill: rgb("#dc2626"))[102] #text(size: 9pt, fill: clr-grey)[ Fire]],
  )
]

#v(1fr)

#align(center)[
  #text(size: 8pt, fill: rgb("#94a3b8"))[
    Daniel Rosehill · Generated 2026-03-16 · Share with attribution \
    Source: Magen David Adom (MDA) guidelines
  ]
]

// ============================================================
// TABLE OF CONTENTS — ADULT
// ============================================================
#pagebreak()

#align(center)[
  #rect(fill: clr-adult, radius: 4pt, inset: (x: 16pt, y: 8pt))[
    #text(size: 20pt, weight: "bold", fill: white, tracking: 1pt)[ADULT PROTOCOLS]
  ]
]
#v(12pt)

#let toc-entry(name, sop, pages) = {
  grid(
    columns: (1fr, auto, auto),
    gutter: 6pt,
    text(size: 10pt, weight: "bold")[#name],
    text(size: 8pt, fill: clr-grey)[SOP #sop],
    text(size: 9pt, fill: clr-grey)[#pages pg],
  )
  v(2pt)
  line(length: 100%, stroke: 0.3pt + rgb("#e2e8f0"))
  v(2pt)
}

#toc-entry("AED Operation", "001", "5")
#toc-entry("Allergic Reaction / Anaphylaxis", "003", "4")
#toc-entry("Asthma — Acute Attack", "002", "3")
#toc-entry("Blast / Shrapnel Injuries", "004", "4")
#toc-entry("Burns — Thermal / Chemical / Electrical", "005", "4")
#toc-entry("Choking — Airway Obstruction", "006", "3")
#toc-entry("CPR — Cardiac Arrest", "007", "4")
#toc-entry("Dehydration", "008", "3")
#toc-entry("Diabetic Emergencies — Hypo / Hyper", "009", "5")
#toc-entry("Drowning", "010", "3")
#toc-entry("Electrocution", "011", "4")
#toc-entry("Eye Injuries", "012", "3")
#toc-entry("Fractures — Suspected Broken Bone", "013", "4")
#toc-entry("Head & Spinal Injury", "014", "4")
#toc-entry("Heart Attack", "015", "4")
#toc-entry("Heatstroke — Heat Illness", "016", "4")
#toc-entry("Hypothermia", "017", "2")
#toc-entry("Poisoning — All Routes", "018", "3")
#toc-entry("Recovery Position", "019", "3")
#toc-entry("Scorpion Stings", "020", "2")
#toc-entry("Seizures", "021", "4")
#toc-entry("Severe Bleeding — Hemorrhage Control", "022", "4")
#toc-entry("Shock", "023", "4")
#toc-entry("Smoke Inhalation", "024", "4")
#toc-entry("Snakebite", "025", "3")
#toc-entry("Spider Bites", "026", "4")
#toc-entry("Stroke — FAST Assessment", "027", "5")
#toc-entry("Tourniquet Application", "028", "4")

#v(1fr)
#align(center)[
  #text(size: 9pt, fill: clr-grey)[28 protocols · 103 pages]
]

// ============================================================
// TABLE OF CONTENTS — CHILD
// ============================================================
#pagebreak()

#align(center)[
  #rect(fill: clr-child, radius: 4pt, inset: (x: 16pt, y: 8pt))[
    #text(size: 20pt, weight: "bold", fill: white, tracking: 1pt)[CHILD PROTOCOLS]
  ]
]
#v(12pt)

#toc-entry("AED Operation — Pediatric", "001", "4")
#toc-entry("Allergic Reaction / Anaphylaxis", "003", "4")
#toc-entry("Asthma — Acute Attack", "002", "3")
#toc-entry("Blast / Shrapnel Injuries", "004", "4")
#toc-entry("Burns — Thermal / Chemical / Electrical", "005", "4")
#toc-entry("Choking — Airway Obstruction", "006", "4")
#toc-entry("CPR — Cardiac Arrest (Pediatric)", "007", "5")
#toc-entry("Dehydration", "008", "3")
#toc-entry("Diabetic Emergencies — Hypo / Hyper", "009", "4")
#toc-entry("Drowning", "010", "3")
#toc-entry("Electrocution", "011", "4")
#toc-entry("Eye Injuries", "012", "3")
#toc-entry("Fractures — Suspected Broken Bone", "013", "4")
#toc-entry("Head & Spinal Injury", "014", "4")
#toc-entry("Heart Attack", "015", "4")
#toc-entry("Heatstroke — Heat Illness", "016", "4")
#toc-entry("Hypothermia", "017", "4")
#toc-entry("Poisoning — All Routes", "018", "4")
#toc-entry("Recovery Position", "019", "3")
#toc-entry("Scorpion Stings", "020", "3")
#toc-entry("Seizures", "021", "4")
#toc-entry("Severe Bleeding — Hemorrhage Control", "022", "4")
#toc-entry("Shock", "023", "4")
#toc-entry("Smoke Inhalation", "024", "4")
#toc-entry("Snakebite", "025", "4")
#toc-entry("Spider Bites", "026", "3")
#toc-entry("Stroke — FAST Assessment", "027", "3")
#toc-entry("Tourniquet Application", "028", "4")

#v(1fr)
#align(center)[
  #text(size: 9pt, fill: clr-grey)[28 protocols · 105 pages]
]
