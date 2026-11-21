#!/bin/sh
# After a Space change macOS can leave the keyboard on an app from another Space.
# If the front app has no window of its own on this Space, focus the top window that does.
# Sticky windows, like Wispr Flow's status window, are on every Space, so they don't count.
Y=/opt/homebrew/bin/yabai
JQ=/opt/homebrew/bin/jq

# A switch can fire twice; give focus_app.sh time to finish its own jump first.
LOCK="${TMPDIR:-/tmp}/yabai-settle.lock"
[ -d "$LOCK" ] && [ $(($(date +%s) - $(stat -f %m "$LOCK"))) -gt 5 ] && rmdir "$LOCK"
mkdir "$LOCK" 2>/dev/null || exit 0
trap 'rmdir "$LOCK"' EXIT
perl -e 'select(undef, undef, undef, 0.4)'

front=$(lsappinfo visibleProcessList | cut -d'"' -f2 | tr _ ' ')
case "$front" in Raycast|Homerow) exit 0 ;; esac
windows=$("$Y" -m query --windows --space)
printf %s "$windows" | "$JQ" -e --arg app "$front" 'any(.[]; .app == $app and ."is-sticky" == false)' >/dev/null && exit 0
target=$(printf %s "$windows" | "$JQ" -r 'map(select(."is-sticky" == false and ."is-minimized" == false and ."is-hidden" == false))[0].id // empty')
[ -n "$target" ] && "$Y" -m window --focus "$target"
exit 0
