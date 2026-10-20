# Agent notes

- Content is data: edit `app/src/main/assets/*` rather than Kotlin for anything topical. Protocol files must keep the shape in `docs/protocol-schema.json`; `Content.kt` parses them with `org.json`. Missing optional fields are fine, but missing required ones crash at startup.
- Topic slugs are filenames (`severe-bleeding`), **not** the `category` field inside the JSON (`severe_bleeding`). `topics.json` and `triage.json` reference slugs.
- No Android SDK on the maintainer's laptop. Build and iterate in CI: push, then `gh run view <id> --log-failed`. Release = push tag `vX.Y.Z`.
- The release keystore is in GitHub secrets. Keep the same key forever, or users can't upgrade in place.
- `print/` flowcharts are not regenerated from the JSON. Flag that if you change a protocol.
- No INTERNET permission. Keep the app offline.
- This repo is public. Before copying anything in from a private predecessor, grep it for family names and personal details (this happened once: the curriculum archive named a child and was pulled out of history on 2026-10-20).
- Shipping a release to the family: email the GitHub release asset URL (`…/releases/download/vX.Y.Z/family-first-aid-X.Y.Z.apk`), never the APK as an attachment. Gmail bounces `.apk` as a blocked executable (bounced on 2026-10-20; the send itself reports success). Drive copy: `rclone copyto <apk> "residencedrive:Android/Family First Aid/<apk>"`. Move the old one into `previous/`.
- `terem.json` comes from terem.com's own feed `https://www.terem.com/wp-json/wp/v2/clinic?per_page=100`; the branch-list page renders with JS. Branch pages publish no phone numbers. Some English slugs are odd but correct (Kiryat Gat = `kiryat-malachi-2`, Petah Tikva = `1440`, Kiryat Bialik = `1436`).
- Glossary audio: `uvx --from edge-tts python scripts/gen-glossary-audio.py`. All 77 clips were checked by Gemini transcription on 2026-10-20 and came back as the intended words.
