#!/bin/bash
# Bring a wezterm pane to the front, wherever it is: switch to its workspace,
# select its tab, raise the app. Takes a `wezterm cli` pane id, defaulting to
# the calling pane's own.
#
#   focus-pane.sh          # raise the pane you are in
#   focus-pane.sh 12       # raise pane 12
#
# Meant for anything that runs in a pane and later wants you back in it: a
# notification's click action, a long build, a `-exec` from some watcher.
#
# `wezterm cli` alone cannot do this. There is no activate-workspace, and
# activate-pane no-ops across a workspace boundary. What does work is echoing an
# OSC 1337 SetUserVar into a pane's tty: wezterm consumes it (nothing is
# rendered, so a full-screen program in that pane is undisturbed) and fires
# user-var-changed, handled in ui/notify.lua.
#
# The catch is that wezterm only raises that event for a pane it is currently
# showing, and a background workspace has no gui window at all. So the request
# goes to whichever pane is focused, and names the target in the payload.

pane_id=${1:-$WEZTERM_PANE}
[ -n "$pane_id" ] || exit 0

if command -v wezterm >/dev/null 2>&1 && command -v jq >/dev/null 2>&1; then
    workspace=$(wezterm cli list --format json 2>/dev/null |
        jq -r --argjson id "$pane_id" '.[] | select(.pane_id == $id) | .workspace')

    focused=$(wezterm cli list-clients --format json 2>/dev/null |
        jq -r '.[0].focused_pane_id // empty')

    tty=$(wezterm cli list --format json 2>/dev/null |
        jq -r --argjson id "${focused:-null}" '.[] | select(.pane_id == $id) | .tty_name')

    # An empty workspace means the pane is gone. Falling through to `open` and
    # just raising wezterm is the right answer.
    if [ -n "$workspace" ] && [ -n "$tty" ] && [ -w "$tty" ]; then
        # The nonce is what makes a second request for the same target register:
        # wezterm drops a SetUserVar that repeats the pane's stored value.
        payload=$(printf '%s|%s|%s' "$workspace" "$pane_id" "$RANDOM$$" | base64)
        printf '\033]1337;SetUserVar=focus-pane=%s\007' "$payload" >"$tty"
    fi
fi

open -b com.github.wez.wezterm

exit 0
