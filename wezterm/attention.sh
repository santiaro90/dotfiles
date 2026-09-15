#!/bin/bash
# Flag a wezterm pane as wanting attention. Its workspace is then listed in the
# status bar until you look at the pane. Takes a `wezterm cli` pane id,
# defaulting to the calling pane's own.
#
#   attention.sh           # flag the pane you are in
#   attention.sh 12        # flag pane 12
#   long-build; attention.sh
#
# This is the in-terminal half of a notification; pair it with focus-pane.sh to
# get back. Rendering lives in ui/notify.lua and ui/status.lua.
#
# The flag is a user var rather than a bell because wezterm delivers bell events
# only for panes its gui is currently showing, which excludes every pane in a
# background workspace — exactly the ones worth flagging. User vars are mux
# state, so config code can read them from any workspace.

pane_id=${1:-$WEZTERM_PANE}
[ -n "$pane_id" ] || exit 0

command -v wezterm >/dev/null 2>&1 || exit 0
command -v jq >/dev/null 2>&1 || exit 0

tty=$(wezterm cli list --format json 2>/dev/null |
    jq -r --argjson id "$pane_id" '.[] | select(.pane_id == $id) | .tty_name')

[ -n "$tty" ] && [ -w "$tty" ] || exit 0

# A nonce, so raising the flag again on a pane you already dismissed counts as a
# new request: wezterm drops a SetUserVar that repeats the pane's stored value.
printf '\033]1337;SetUserVar=attention=%s\007' \
    "$(printf '%s' "$RANDOM$$" | base64)" >"$tty"
