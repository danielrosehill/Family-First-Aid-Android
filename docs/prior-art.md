# Prior art review

Written 2026-10-20 when this repository was created. Two halves: what Daniel had
already built (this repo consolidates and supersedes it), and what exists
externally.

## Own earlier work (consolidated here)

| Repo | Visibility | Last push | What it was | What came across |
|---|---|---|---|---|
| `danielrosehill/Israel-First-Aid` | public | 2026-03-16 | Research repo: 56 machine-readable protocol JSONs (28 topics × adult/child) unified from MDA + United Hatzalah sources, a JSON Schema, Typst A4 flowcharts, kit checklists, per-source research notes | `reference/israel/` (112 per-source notes), `reference/numbers.md`, `reference/kit/` (shopping + stock-check lists), `docs/protocol-schema.json`. The protocol JSONs came via the app repo below (identical set). Typst A4 flowcharts + PDFs and their style guide → `print/` (the app renders flows interactively; `print/` is for paper copies) |
| `danielrosehill/Israel-First-Aid-App` | private | 2026-04-20 | Expo / React Native app over the same 56 protocols: adult/child switch, search, step view with YES/NO decision points, pinned "call 101" bar, triage tree. Built via EAS cloud | `app/src/main/assets/protocols/` (verbatim), the triage tree (converted from `src/data/triage.ts` to `assets/triage.json`), the pinned emergency bar and adult/child switch as UI ideas |
| `danielrosehill/First-Aid-Curriculum` | private | 2025-12-07 | Markdown curriculum for parents of an infant (26 guides, critical / urgent / important / prep tiers), PDF manual, TTS script, 26 AI-generated header images | Guides, curriculum and PDF manual archived under `reference/curriculum/`. The tiering informed topic grouping. The 26 images were decorative (not instructional) and were dropped; see `docs/illustration-style-guide.md` |
| `danielrosehill/Israel-Emergency-Guide-APK` | private | 2026-03-20 | Capacitor app for **wartime** preparedness (Home Front Command checklists) | Not consolidated — different subject. Its Gradle wrapper was reused |

What was missing from all of them, and is new here: **spaced review** (mark
completed → mark reviewed → next-due date), a **step-at-a-time interactive
walkthrough** of each protocol's decision points, Terem / Maccabi numbers, a
locally built-in-CI native APK, and a public, forkable home.

## External

Searched 2026-10-20 (two web searches; not exhaustive).

- **IFRC / national Red Cross "First Aid" apps** (Canada, NZ, American Red Cross) — preloaded offline content, step-by-step guides, quizzes, local emergency numbers. Closed source, not Israel-grounded, no scheduled review. <https://www.redcross.ca/apps>, <https://www.redcross.org.nz/first-aid-app/>
- **My MDA** (Magen David Adom) — one-tap call to MDA dispatch with location and medical profile, video streaming to dispatch. It is a dispatch tool, not a learning reference.
- **qehbo** — MIT-licensed Dutch first-aid trainer using spaced repetition with quizzes (Ionic/Cordova). Closest match for the review strand; no decision flows. <https://git.tdem.in/gandreadis/qehbo>
- **FirstAidGuide** (GitHub, itkhld1) — offline first-aid guide with TTS. <https://github.com/itkhld1/FirstAidGuide>
- **Brainscape / Anki decks** — spaced repetition, but generic flashcards, online.

Gap confirmed: nothing found combines offline Israeli-grounded protocols,
interactive decision flows and scheduled review in one sideloadable Android app.
