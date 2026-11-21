#!/bin/sh
# Jump to an app's window; when already on one, go to that app's next window.
# yabai reports no subrole for windows on Spaces it hasn't visited yet, so blank counts.
# Usage: focus_app.sh "<yabai app name>" <bundle id>
Y=/opt/homebrew/bin/yabai
next=$("$Y" -m query --windows | /opt/homebrew/bin/jq -r --arg app "$1" '
  [.[] | select(.app == $app and ((.subrole // "") == "" or .subrole == "AXStandardWindow") and ."is-minimized" == false and ."is-hidden" == false)]
  | (map(.id) | sort) as $ids
  | (map(select(."has-focus"))[0].id) as $cur
  | if ($ids | length) == 0 then empty
    elif $cur then $ids[(($ids | index($cur)) + 1) % ($ids | length)]
    else .[0].id end')
# Focus can fail on a stale window id; opening the app still gets you there.
if [ -z "$next" ] || ! "$Y" -m window --focus "$next" 2>/dev/null; then open -b "$2"; exit 0; fi
# Crossing Spaces can lose the focus while the switch animates, so ask once more.
perl -e 'select(undef, undef, undef, 0.25)'
[ "$(lsappinfo visibleProcessList | cut -d'"' -f2 | tr _ ' ')" = "$1" ] || "$Y" -m window --focus "$next" 2>/dev/null
exit 0
