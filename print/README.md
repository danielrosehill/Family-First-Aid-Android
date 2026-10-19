# Printable flowcharts

Typst A4 decision flowcharts for each protocol, carried over from the retired
`Israel-First-Aid` repo on 2026-10-20. Use them for a paper copy (fridge, first aid kit).

- `flowcharts/combined/*.pdf` — ready-to-print books (all / adult / child).
- `flowcharts/{adult,child}/*.typ` — per-protocol sources. Build one with `typst compile <file>.typ`.
- `templates/` — the Typst templates the sources import.
- `FLOWCHART_STYLE_GUIDE.md` — layout rules for the printed charts.

These were generated from the same protocol JSONs the app bundles, but they are
**not regenerated automatically**. If a protocol in `app/src/main/assets/protocols/`
changes, the matching flowchart must be rebuilt by hand.
