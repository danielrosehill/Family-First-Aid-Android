# Flowchart Style Guide

Standing design instructions for all Typst flowchart generation. These supplement the directions in `CLAUDE.md` and take precedence where they overlap.

## Header

- **Center-aligned** with vertical spacing between the title line and the SOP line.
- Format: `PATIENT TYPE — CONDITION — SCENARIO` with each segment in a **distinct colour** for quick visual scanning:
  - **Patient type** (ADULT / CHILD): use a warm colour (e.g., orange for adult, teal for child) so a reader flipping through a compiled book can instantly identify the age group.
  - **Condition** (e.g., ASTHMA): use the primary blue (`#1e40af`).
  - **Scenario** (e.g., ACUTE ATTACK): use a dark grey (`#4b5563`).
- SOP number appears on a separate line below in small grey text, e.g., `(SOP 001)`.
- Do **not** include "Call 101" or any emergency number in the header.

## Page Numbers

- **50% larger** than body text.
- **Neon yellow** (`#e6ff00`) background highlight.
- Appear in both header (top-right) and footer (bottom-right).

## Y/N Branch Labels

- Use **Y** and **N** (not YES/NO, not tick/cross).
- Green for Y, red for N.
- Must have clear spacing — never squished against arrows.

## Flowchart Content — Action-Positive Framing

- **Focus on what the responder SHOULD do**, not on what they shouldn't.
- Remove explanatory "why" text from action boxes (e.g., "anxiety worsens bronchospasm", "laying down worsens breathing"). The flowchart is for fast action under stress.
- Keep each box to a single clear instruction or question.
- "Do NOT" warnings and rationale belong **only on the Reference Notes page**, never inline in the algorithm.
- Warning side-boxes (e.g., the red WARNING callout) should be removed from the flowchart. All cautions go to the Reference Notes page.

## Step Numbering

- Do **not** number steps (Step 1, Step 2…) — it adds cognitive load without value in a flowchart.
- Lead each action box with a **bold action verb** (HELP, REASSURE, CALL, ADMINISTER, MONITOR, BEGIN).

## Icons

- Use icons **judiciously** to aid quick visual scanning.
- Recurring icon assignments:
  - Phone icon — call/emergency actions
  - Pill icon — medication administration
  - Eye icon — monitoring/observation
  - Heart icon — CPR
  - Wind icon — breathing assessment decisions
  - Person icon — positioning actions
- Provider logos (MDA, Hatzalah, etc.) from `/icons/{provider}/` appear inline next to call instructions.

## Rejoin Lines

- When a branch rejoins the main flow, use a **faint dashed grey line** to show the connection.
- Do not leave implicit jumps.

## End of Path

- Terminal nodes get a **single underline** at the bottom of the box to denote end-of-path.

## Page Layout

- **Algorithm pages**: contain only the flowchart diagram. Jump straight into the steps — no preamble, no "when to apply", no emergency numbers strip.
- **Reference Notes page**: always a **fully separate page** at the end, containing:
  - DO NOT box (warnings and cautions)
  - Equipment needed
  - Source / provenance metadata
- Never mix instructional reference material onto the same page as flowchart diagrams.

## Colour Coding for Age Groups

To support scanning through a compiled book of protocols:
- **Adult protocols**: orange accent (`#ea580c`) for the patient-type segment in the header.
- **Child protocols**: teal accent (`#0d9488`) for the patient-type segment in the header.

These colours should be consistent across all protocols so the age group is instantly identifiable.

## SOP Identifiers

- Each protocol gets a unique three-digit numeric SOP ID (e.g., `001`, `002`).
- Displayed in the header and on the title area for traceability.

## Fonts

- Primary: IBM Plex Sans (with IBM Plex Sans Hebrew fallback).
- Body text: 10pt.
- Action verbs in boxes: 11pt bold, primary blue.

## Footer

- Left: protocol ID, version, generation date, source authority.
- Centre: "Personal reference only — not medical advice" (bold).
- Right: page number with neon yellow background.
