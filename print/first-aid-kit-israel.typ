// First Aid Kit Checklist -- Israel
// Structured reference document for A4 printing
// Source: MDA, United Hatzalah, Ministry of Transportation (synthesised)
// Generated: 2026-03-15

#set page(paper: "a4", margin: 1.5cm)
#set text(font: ("IBM Plex Sans", "IBM Plex Sans Hebrew"), size: 10pt)

// === HEBREW HELPER ===
#let heb(content) = {
  text(font: "IBM Plex Sans Hebrew", dir: rtl)[#content]
}

// === STYLES ===
#let section-heading(title) = {
  v(10pt)
  rect(
    fill: rgb("#1e3a5f"),
    radius: 4pt,
    width: 100%,
    inset: 8pt,
  )[
    #set text(fill: white, weight: "bold", size: 13pt)
    #title
  ]
  v(4pt)
}

#let sub-heading(title) = {
  v(6pt)
  text(weight: "bold", size: 11pt, fill: rgb("#1e3a5f"))[#title]
  v(2pt)
}

#let checklist-item(item) = {
  box(inset: (left: 4pt, y: 1.5pt))[
    #box(stroke: 1pt + rgb("#6b7280"), width: 10pt, height: 10pt, baseline: 1.5pt)[]
    #h(5pt)
    #item
  ]
  linebreak()
}

#let warning-note(content) = {
  rect(
    fill: rgb("#fef2f2"),
    stroke: 1.5pt + rgb("#dc2626"),
    radius: 4pt,
    width: 100%,
    inset: 8pt,
  )[
    #text(fill: rgb("#dc2626"), weight: "bold", size: 10pt)[#content]
  ]
}

// =============================================================================
// DOCUMENT
// =============================================================================

// --- HEADER ---
#align(center)[
  #text(size: 22pt, weight: "bold")[FIRST AID KIT CHECKLIST]
  #v(2pt)
  #text(size: 14pt, fill: rgb("#374151"))[Israel #heb[ישראל] -- Home, Vehicle & Family]
]

#v(8pt)

// --- EMERGENCY NUMBERS STRIP ---
#rect(
  fill: rgb("#dc2626"),
  radius: 6pt,
  width: 100%,
  inset: 10pt,
)[
  #set text(fill: white, weight: "bold", size: 11pt)
  #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), gutter: 6pt,
    align(center)[MDA #heb[מד״א]\ #text(size: 16pt)[101]],
    align(center)[Police #heb[משטרה]\ #text(size: 16pt)[100]],
    align(center)[Fire #heb[כיבוי]\ #text(size: 16pt)[102]],
    align(center)[Hatzalah #heb[הצלה]\ #text(size: 16pt)[1221]],
    align(center)[Poison Center\ #text(size: 14pt)[04-7771900]],
  )
]

#v(6pt)

// =============================================================================
// SECTION 1: ESSENTIAL (Every Home)
// =============================================================================
#section-heading[1. ESSENTIAL -- Every Home]

#grid(columns: (1fr, 1fr), gutter: 12pt,
  [
    #sub-heading[Wound Care & Bandaging]
    #checklist-item[Sterile gauze pads 10x10 cm *(x10)*]
    #checklist-item[Rolled gauze bandage 5 cm *(x3)*]
    #checklist-item[Rolled gauze bandage 10 cm *(x2)*]
    #checklist-item[Israeli Emergency Bandage 4" *(x1)*]
    #checklist-item[Adhesive bandages / plasters, assorted *(x20)*]
    #checklist-item[Butterfly closure strips *(1 pack)*]
    #checklist-item[Triangular bandage + safety pins *(x2)*]
    #checklist-item[Elastic bandage 6 cm *(x1)*]
    #checklist-item[Medical tape / micropore *(1 roll)*]
    #checklist-item[Non-adherent wound dressing *(x5)*]

    #sub-heading[Bleeding Control]
    #checklist-item[Hemostatic gauze pads (SIDA-CEL / Celox) *(x2)*]
    #checklist-item[Hemostatic agent packets *(x3)*]

    #sub-heading[Burns]
    #checklist-item[Burn dressings (Burnshield 4"x4") *(x3)*]
    #checklist-item[Burn gel sachets *(x3)*]
  ],
  [
    #sub-heading[Tools & Equipment]
    #checklist-item[Trauma shears 7.5" *(x1)*]
    #checklist-item[Tweezers *(x1)*]
    #checklist-item[Digital thermometer *(x1)*]
    #checklist-item[Safety pins *(x6)*]
    #checklist-item[Permanent marker *(x1)*]
    #checklist-item[Pen torch / flashlight *(x1)*]

    #sub-heading[Infection Prevention]
    #checklist-item[Nitrile gloves, pairs *(x5)*]
    #checklist-item[Alcohol prep pads *(x10)*]
    #checklist-item[Antiseptic -- Polydine #heb[פולידין] *(1 bottle)*]
    #checklist-item[Hand sanitiser *(1 small bottle)*]
    #checklist-item[Sterile eye wash ampoules *(x2)*]

    #sub-heading[CPR & Rescue]
    #checklist-item[CPR pocket mask with one-way valve *(x1)*]
    #checklist-item[Emergency rescue blanket *(x1)*]

    #sub-heading[Other]
    #checklist-item[Waterproof / dustproof container or bag]
    #checklist-item[Emergency numbers card *(x1)*]
  ],
)

// =============================================================================
// SECTION 2: FOR FAMILIES WITH CHILDREN
// =============================================================================
#section-heading[2. FOR FAMILIES WITH CHILDREN -- Pediatric Additions]

#grid(columns: (1fr, 1fr), gutter: 12pt,
  [
    #sub-heading[Equipment]
    #checklist-item[Pediatric CPR mask (infant size) *(x1)*]
    #checklist-item[Rectal thermometer (for infants) *(x1)*]
    #checklist-item[Infant nasal aspirator *(x1)*]
    #checklist-item[Paediatric dosing syringe / cup *(x1)*]
    #checklist-item[Child-sized plasters *(x20)*]
    #checklist-item[Oral rehydration salts (ORS) sachets *(x5--10)*]
    #checklist-item[Saline nasal drops *(x1)*]
  ],
  [
    #sub-heading[Children's Medications]
    #checklist-item[Acamol Tsinuk / Acamol Li (paracetamol liquid)]
    #checklist-item[Advil / Nurofen for Children (ibuprofen liquid)]
    #checklist-item[Telfast / Fenistil drops (antihistamine)]
    #checklist-item[Saline nasal drops (Physiomer)]
    #v(6pt)
    #sub-heading[EpiPen (prescription required)]
    #checklist-item[EpiPen 0.3 mg -- adults / children >30 kg]
    #checklist-item[EpiPen Junior 0.15 mg -- children 15--30 kg]
    #text(size: 9pt, fill: rgb("#6b7280"))[Covered by kupot cholim for diagnosed allergies. Store 15--25 C. Check expiry every 12--18 months.]
  ],
)

// =============================================================================
// SECTION 3: CLIMATE & ENVIRONMENT
// =============================================================================
#section-heading[3. CLIMATE & ENVIRONMENT -- Israel-Specific]

#grid(columns: (1fr, 1fr), gutter: 12pt,
  [
    #sub-heading[Heat & Sun]
    #checklist-item[Electrolyte sachets (e.g. Slow Sodium, ORS) *(x5)*]
    #checklist-item[Sunscreen SPF 50+ *(x1)*]
    #checklist-item[Aloe vera gel *(x1)*]
    #checklist-item[Cooling towels]
    #checklist-item[Extra bottled water (2L / person / day)]
  ],
  [
    #sub-heading[Stings & Bites]
    #checklist-item[Sting relief pads / antihistamine cream]
    #checklist-item[Instant cold packs *(x2)*]
    #checklist-item[Antihistamine tablets (Telfast / cetirizine)]
    #checklist-item[Elastic bandage (for snakebite immobilisation)]
    #checklist-item[Tweezers (for tick removal)]
  ],
)

#v(4pt)
#warning-note[Scorpion stings (deathstalker) and snakebites (Palestine viper): Call MDA 101 immediately. Transport to hospital for antivenom. Home first aid is supportive only. Do NOT apply tourniquet for snakebite.]

// =============================================================================
// SECTION 4: SECURITY / TRAUMA KIT (Optional)
// =============================================================================
#section-heading[4. SECURITY / TRAUMA KIT -- Civilian Additions (Optional)]

#grid(columns: (1fr, 1fr), gutter: 12pt,
  [
    #checklist-item[CAT or SAM-XT tourniquet *(x1--2)*]
    #checklist-item[Israeli Emergency Bandage 6" *(x2)*]
    #checklist-item[Chest seal, vented (e.g. HyFin / SAM) *(1 pair)*]
    #checklist-item[Hemostatic combat gauze, z-fold *(x2)*]
  ],
  [
    #checklist-item[Compressed gauze for packing *(x2)*]
    #checklist-item[NPA airway *(x1)* -- only if trained]
    #checklist-item[TCCC card (English or Hebrew) *(x1)*]
    #checklist-item[Trauma shears *(x1)*]
    #checklist-item[Permanent marker *(x1)*]
  ],
)
#text(size: 9pt, fill: rgb("#6b7280"))[Source: MDA / United Hatzalah civilian "Stop the Bleed" curriculum. Practice with the specific tourniquet model you own.]

// =============================================================================
// VEHICLE KIT
// =============================================================================
#pagebreak()

#align(center)[
  #text(size: 20pt, weight: "bold")[VEHICLE FIRST AID KIT]
  #v(2pt)
  #text(size: 12pt, fill: rgb("#374151"))[Ministry of Transportation Standard + Recommended Additions]
]
#v(8pt)

// Emergency strip (repeated for standalone page)
#rect(
  fill: rgb("#dc2626"),
  radius: 6pt,
  width: 100%,
  inset: 10pt,
)[
  #set text(fill: white, weight: "bold", size: 11pt)
  #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), gutter: 6pt,
    align(center)[MDA #heb[מד״א]\ #text(size: 16pt)[101]],
    align(center)[Police #heb[משטרה]\ #text(size: 16pt)[100]],
    align(center)[Fire #heb[כיבוי]\ #text(size: 16pt)[102]],
    align(center)[Hatzalah #heb[הצלה]\ #text(size: 16pt)[1221]],
    align(center)[Poison Center\ #text(size: 14pt)[04-7771900]],
  )
]

#v(8pt)

#rect(
  fill: rgb("#eff6ff"),
  stroke: 1pt + rgb("#3b82f6"),
  radius: 4pt,
  width: 100%,
  inset: 8pt,
)[
  #text(size: 9pt, fill: rgb("#374151"))[
    *Legal note:* A vehicle first aid kit is *recommended but not legally mandatory* for private cars in Israel. It *is mandatory* for security vehicles, trucks, and public transport.
  ]
]

#v(8pt)

#grid(columns: (1fr, 1fr), gutter: 16pt,
  [
    #sub-heading[Ministry of Transportation Standard (Minimum)]
    #checklist-item[Israeli Emergency Bandage (sterile) *(x1)*]
    #checklist-item[Triangular bandage *(x1)*]
    #checklist-item[Adhesive bandages / plasters *(x10)*]
    #checklist-item[Sterile gauze strip *(x1)*]
    #checklist-item[Binding bandage 6 cm *(x1)*]
    #checklist-item[Bandage scissors *(x1)*]
  ],
  [
    #sub-heading[Recommended Additions]
    #checklist-item[Nitrile gloves *(2 pairs)*]
    #checklist-item[Burn dressing *(x1)*]
    #checklist-item[Emergency blanket *(x1)*]
    #checklist-item[Emergency light stick, green 6" *(x1)*]
    #checklist-item[CPR mask *(x1)*]
    #checklist-item[Reflective safety vest *(legally required)*]
    #checklist-item[Bottled water 0.5L *(for wound irrigation)*]
  ],
)

#v(8pt)

#rect(
  fill: rgb("#fefce8"),
  stroke: 1pt + rgb("#ca8a04"),
  radius: 4pt,
  width: 100%,
  inset: 8pt,
)[
  #text(weight: "bold", fill: rgb("#92400e"), size: 10pt)[Vehicle Kit Storage & Maintenance]
  #v(4pt)
  #text(size: 9pt)[
    - Store in glove compartment or door pocket -- *not in the boot/trunk* (must be quickly accessible)\
    - Sealed bag resistant to heat, moisture, humidity\
    - Check contents every *3--4 months* (heat degrades items faster)\
    - General kit validity: *5 years*, but check individual expiry dates\
    - Israeli summers (40 C+) accelerate degradation of medications and adhesives
  ]
]

// =============================================================================
// OTC MEDICATIONS TABLE
// =============================================================================
#v(12pt)
#section-heading[OTC MEDICATIONS -- Israeli Brand Names]

#table(
  columns: (1.2fr, 1.2fr, 1fr, 1.5fr),
  inset: 6pt,
  stroke: 0.5pt + rgb("#d1d5db"),
  fill: (_, row) => if row == 0 { rgb("#1e3a5f") } else if calc.odd(row) { rgb("#f9fafb") } else { white },
  table.header(
    text(fill: white, weight: "bold")[Medication],
    text(fill: white, weight: "bold")[Israeli Brand],
    text(fill: white, weight: "bold")[Use],
    text(fill: white, weight: "bold")[Notes],
  ),
  [Paracetamol], [*Acamol* (Teva), Dexamol], [Pain, fever], [500 mg tablets. Most common analgesic in Israel],
  [Dipyrone], [*Optalgin* (Teva)], [Pain, fever], [Widely used in Israel. Tablets, drops, suppositories],
  [Ibuprofen], [*Advil*, *Nurofen*], [Pain, inflammation], [200--400 mg tablets],
  [Diclofenac gel], [*Voltaren Gel*], [Topical pain], [For sprains, muscle pain],
  [Cetirizine / Loratadine], [*Telfast*, *Histec*], [Allergies], [Non-drowsy options preferred],
  [Diphenhydramine], [*Benadryl*], [Allergic reactions], [Causes drowsiness; less common in Israel],
  [Activated charcoal], [Available at pharmacies], [Poisoning], [*Only if directed by Poison Center*],
  [Oral rehydration salts], [Various brands], [Dehydration], [Dissolve in water],
  [Antacid], [*Rennie*, *Tums*], [Heartburn], [],
  [Anti-diarrhoeal], [*Imodium* (loperamide)], [Diarrhoea], [],
  [Povidone-iodine], [*Polydine* #heb[פולידין]], [Antiseptic], [Widely used in Israel],
)

// =============================================================================
// WHERE TO BUY
// =============================================================================
#v(10pt)
#section-heading[WHERE TO BUY IN ISRAEL]

#grid(columns: (1fr, 1fr), gutter: 12pt,
  [
    #text(weight: "bold")[Pharmacies & Chains]
    #v(2pt)
    #text(size: 9pt)[
      *Super-Pharm* -- super-pharm.co.il\
      Largest chain. First aid kits, medications. Online ordering.\
      #v(3pt)
      *Community pharmacies* #heb[בית מרקחת]\
      Found in every neighbourhood. Pharmacists can advise on kit contents.\
      #v(3pt)
      *MDA Shop* -- via IFMDA (ifmda.org.il)\
      Kits available through training courses.\
      #v(3pt)
      *United Hatzalah Shop* -- shop.1221.org.il\
      Home/car first aid kit (~60 ILS).\
    ]
  ],
  [
    #text(weight: "bold")[Specialist & Online]
    #v(2pt)
    #text(size: 9pt)[
      *Israeli First Aid* -- israelifirstaid.com\
      Israeli-made kits with hemostatic products. Basic ~\$40, "tactical" ~\$91.\
      #v(3pt)
      *Ariel Medic* -- a101.co.il\
      Comprehensive emergency equipment.\
      #v(3pt)
      *S-Medic* -- s-medic.co.il\
      Vehicle kits from 29 ILS.\
      #v(3pt)
      *Kasda* -- kasda.co.il\
      Advanced IFAK kits for civilian and security use.\
      #v(3pt)
      *Mimram Medical* -- mimrame.co.il\
      Ministry of Transportation standard vehicle kits.\
    ]
  ],
)

// =============================================================================
// EXPIRY TRACKING
// =============================================================================
#v(10pt)
#section-heading[EXPIRY TRACKING]

#rect(
  fill: rgb("#fefce8"),
  stroke: 1pt + rgb("#ca8a04"),
  radius: 4pt,
  width: 100%,
  inset: 10pt,
)[
  #grid(columns: (1fr, 1fr), gutter: 12pt,
    [
      #text(weight: "bold", size: 10pt)[Check twice a year:]
      #v(4pt)
      #text(size: 10pt)[
        #box(stroke: 1pt + rgb("#6b7280"), width: 10pt, height: 10pt, baseline: 1.5pt)[] #h(4pt) *Rosh Hashana* #heb[ראש השנה] (September/October)\
        #box(stroke: 1pt + rgb("#6b7280"), width: 10pt, height: 10pt, baseline: 1.5pt)[] #h(4pt) *Pesach* #heb[פסח] (March/April)\
      ]
      #v(6pt)
      #text(weight: "bold", size: 10pt)[Shortest shelf lives:]
      #v(2pt)
      #text(size: 9pt)[
        EpiPen: *12--18 months*\
        Medications: *2--3 years*\
        Sterile dressings: *3--5 years*\
        Adhesive bandages: *3--5 years*\
        Burn gel: *3--4 years*\
        Hemostatic gauze: *3--5 years*\
        Antiseptic wipes: *2--3 years*\
        Nitrile gloves: *3--5 years*\
      ]
    ],
    [
      #text(weight: "bold", size: 10pt)[Key reminders:]
      #v(4pt)
      #text(size: 9pt)[
        - Tape an inventory list inside the kit lid or store digitally\
        - *Replace used items immediately* -- do not wait for 6-month check\
        - Israeli heat (35--45 C) shortens shelf life of adhesives, gels, and medications\
        - *Vehicle kits:* check every 3--4 months due to heat exposure\
        - Seal broken = item no longer sterile -- replace\
      ]
    ],
  )
]

// =============================================================================
// EMERGENCY NUMBERS CARD (cut-out)
// =============================================================================
#v(1fr)

#rect(
  stroke: (paint: rgb("#374151"), thickness: 1.5pt, dash: "dashed"),
  radius: 4pt,
  width: 100%,
  inset: 10pt,
)[
  #align(center)[
    #text(size: 8pt, fill: rgb("#6b7280"))[-- CUT ALONG DASHED LINE -- PLACE IN KIT --]
  ]
  #v(4pt)
  #align(center)[
    #text(size: 14pt, weight: "bold")[EMERGENCY NUMBERS -- ISRAEL #heb[מספרי חירום]]
  ]
  #v(6pt)
  #grid(columns: (1fr, 1fr, 1fr), gutter: 8pt,
    [
      #text(weight: "bold")[MDA (Ambulance):] *101*\
      #text(weight: "bold")[Police:] *100*\
      #text(weight: "bold")[Fire:] *102*\
    ],
    [
      #text(weight: "bold")[United Hatzalah:] *1221*\
      #text(weight: "bold")[Home Front Command:] *104*\
      #text(weight: "bold")[Electric Company:] *103*\
    ],
    [
      #text(weight: "bold")[Poison Center:] *04-7771900*\
      #text(weight: "bold")[Mental Health (ERAN):] *1201*\
      #text(weight: "bold")[Domestic Violence:] *1-800-220-000*\
    ],
  )
  #v(4pt)
  #align(center)[
    #text(size: 8pt, fill: rgb("#6b7280"))[From mobile (international): +972 + number]
  ]
]

// =============================================================================
// FOOTER
// =============================================================================
#v(8pt)
#line(length: 100%, stroke: 0.5pt + rgb("#d1d5db"))
#v(4pt)
#text(size: 8pt, fill: rgb("#9ca3af"))[
  Sources: Magen David Adom, United Hatzalah, Israeli Ministry of Transportation, Israeli First Aid (israelifirstaid.com) \
  Date accessed: 2026-03-15 | Last verified: 2026-03-15 \
  *Personal reference only -- not medical advice.* Always call 101 in an emergency.
]
