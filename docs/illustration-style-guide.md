# Illustration style guide

Status: **defined, not yet applied** (v0.1.0 ships text-only). Images will be
AI-generated and bundled in the APK under `app/src/main/assets/illustrations/`.

## Purpose

An illustration earns its place only if it shows **a body position or a hand
placement** that text conveys badly: CPR hand position and depth, infant back
blows, recovery position, tourniquet placement, abdominal thrusts, Israeli
bandage wrap. Decorative "mood" images (as in the old `First-Aid-Curriculum`
repo) are out.

## Style

- Flat vector, clean line art, 2–3 flat colours plus skin tone. No photorealism, no gradients, no blood splashes.
- White background. Square 1024×1024, subject centred with margin.
- Rescuer in **blue** clothing, casualty in **grey**; hands visible and anatomically correct (five fingers — check every image).
- Action arrows in **red** (`#C62828`) for motion / pressure direction.
- Adult vs child: child images show a visibly small child or infant, not a scaled adult.
- No text inside the image (labels live in the app, so they can be translated).
- Gender, skin tone and age of figures vary across the set.

## Accuracy bar

Every image is checked against the protocol step it illustrates before it is
committed. If a model cannot draw the position correctly after a few tries, ship
no image for that step rather than a wrong one.

## Wiring

Filename: `<topic>-<age>-step<N>.png` (e.g. `cpr-child-step4.png`). The app
will show it under step N when the file exists.
