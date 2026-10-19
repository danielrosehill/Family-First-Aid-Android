#!/usr/bin/env python3
# Regenerates app/src/main/assets/glossary/<id>.mp3 from glossary.json using
# Microsoft Edge's neural TTS (edge-tts; needs network, runs on a dev machine,
# not in the app). Skips clips that already exist unless --force.
#   uvx --from edge-tts python scripts/gen-glossary-audio.py [--force]
import asyncio, json, pathlib, sys
import edge_tts

ROOT = pathlib.Path(__file__).resolve().parent.parent / "app/src/main/assets"

async def main(force: bool):
    g = json.loads((ROOT / "glossary.json").read_text())
    out = ROOT / "glossary"; out.mkdir(exist_ok=True)
    ids = set()
    for group in g["groups"]:
        for it in group["items"]:
            ids.add(it["id"])
            f = out / f"{it['id']}.mp3"
            if f.exists() and not force: continue
            # Slashes separate variants ("m / f"); read them as a pause.
            text = it.get("tts", it["he"]).replace(" / ", ", ").replace("…", "")
            await edge_tts.Communicate(text, g["voice"], rate="-15%").save(str(f))
            print("wrote", f.name)
    for f in out.glob("*.mp3"):
        if f.stem not in ids: f.unlink(); print("removed", f.name)

asyncio.run(main("--force" in sys.argv))
