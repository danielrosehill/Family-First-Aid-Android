#!/usr/bin/env bash
# Emulator smoke test, run by .github/workflows/smoke.yml. Installs the APK,
# taps through the main screens by visible text, fails on any crash, and leaves
# screenshots in smoke/ for review.
set -euo pipefail
APK="$1"; PKG=com.danielrosehill.firstaid; OUT=smoke; mkdir -p "$OUT"
adb install -r "$APK"
adb logcat -c
adb shell am start -n "$PKG/.MainActivity"; sleep 6

dump() { adb shell uiautomator dump /sdcard/ui.xml >/dev/null; adb shell cat /sdcard/ui.xml; }
shot() { adb exec-out screencap -p > "$OUT/$1.png"; }
expect() { dump | grep -q "$1" || { echo "MISSING on screen: $1"; dump | grep -o 'text="[^"]*"' | head -40; shot fail; exit 1; }; echo "ok: $1"; }
tap() {  # tap the centre of the first node whose text contains $1
  local b; b=$(dump | python3 -c "
import sys,re
x=sys.stdin.read()
for m in re.finditer(r'<node [^>]*>', x):
    n=m.group(0)
    if 'text=\"' in n and '''$1''' in re.search(r'text=\"([^\"]*)\"', n).group(1):
        a=list(map(int,re.findall(r'\d+', re.search(r'bounds=\"([^\"]*)\"', n).group(1))))
        print((a[0]+a[2])//2, (a[1]+a[3])//2); break")
  [ -n "$b" ] || { echo "cannot tap: $1"; shot fail; exit 1; }
  adb shell input tap $b; sleep 2
}
tapnav() {  # tap a bottom-bar section: the lowest node whose text is exactly $1 (breadcrumbs reuse the labels)
  local b; b=$(dump | python3 -c "
import sys,re
best=None
for m in re.finditer(r'<node [^>]*>', sys.stdin.read()):
    n=m.group(0); t=re.search(r'text=\"([^\"]*)\"', n)
    if t and t.group(1)=='''$1''':
        a=list(map(int,re.findall(r'\d+', re.search(r'bounds=\"([^\"]*)\"', n).group(1))))
        c=((a[0]+a[2])//2, (a[1]+a[3])//2)
        if best is None or c[1]>best[1]: best=c
if best: print(*best)")
  [ -n "$b" ] || { echo "cannot tap nav: $1"; shot fail; exit 1; }
  adb shell input tap $b; sleep 2
}
scrollto() { for _ in $(seq 1 25); do dump | grep -q "$1" && return 0; adb shell input swipe 540 1700 540 700 250; sleep 1; done; }
back() { adb shell input keyevent KEYCODE_BACK; sleep 2; }

expect "Before you start"; shot 01-disclaimer
tap "I understand";        expect "Topics"; shot 02-home
tap "Emergency decision guide"; expect "Collapsed"; shot 03-triage
tap "Collapsed";           expect "breathing normally"; shot 04-triage-unresponsive
tap "NO / not sure";       expect "Step-by-step decision guide"; shot 05-cpr
tap "Step-by-step decision guide"; expect "step 1 of"; expect "Step by step"; shot 06-walkthrough
back; back; back; back
tapnav "Topics";         expect "CPR"; tap "Search"; adb shell input text bleeding; sleep 2; adb shell input keyevent KEYCODE_BACK; sleep 1; expect "Severe bleeding"; shot 07-topics-search
tap "Severe bleeding";     expect "Step-by-step decision guide"; shot 08-topic
tap "See the whole flowchart"; expect "Walk me through it"; shot 08b-topic-flowchart; back
scrollto "Your progress"; tap "Your progress"; scrollto "Mark as completed"; tap "Mark as completed"; expect "Mark as reviewed"; shot 09-completed
back; expect "due in"; tap "Severe bleeding"; tap "Child / infant"; scrollto "Your progress"; tap "Your progress"; scrollto "Mark as completed"; expect "Mark as completed"; shot 10-child
back; back
tapnav "Flowcharts";      expect "full map"; shot 14-flowcharts
tap "full map";           expect "breathing normally"; shot 15-triage-map; back
tap "Choking";            expect "Walk me through it"; shot 16-flowchart; back
tapnav "Resources";       expect "Hebrew glossary"; shot 17-resources
tap "Review schedule";    expect "1 of 56 completed"; shot 11-review; back
tap "Phone numbers";      expect "Magen David Adom (ambulance)"; shot 12-numbers; scrollto "Maccabi Moked"; expect "Maccabi Moked"; shot 13-numbers-kupah; back
tap "Terem urgent care";  expect "Romema Sarei Israel"; shot 18-terem; back
tap "Hebrew glossary";    expect "hatsilu"; tap "Help!"; sleep 1; shot 19-glossary

if adb logcat -d | grep -E "FATAL EXCEPTION|AndroidRuntime: .*$PKG"; then echo "crash in logcat"; exit 1; fi
adb shell pidof "$PKG" >/dev/null || { echo "app not running"; exit 1; }
echo "SMOKE PASS"
