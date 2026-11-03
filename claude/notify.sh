#!/bin/bash
# Claude Code hook: signal that a session wants attention.
#
# Wired to Stop (Claude finished answering) and Notification (Claude is waiting
# on a permission prompt) in settings.json.
#
# Two signals: an in-terminal marker that persists until you look at the session,
# and a desktop toast titled with the session name carrying Claude's message.
# Under wezterm the toast times out on its own (ui/notify.lua); elsewhere it is
# an OSC 777 toast, which stays in Notification Center until clicked.

input=$(cat)

# tmux: ring the bell on the pane Claude runs in. monitor-bell (tmux.conf) turns
# that into a marker on the window, which survives until you visit the window.
if [ -n "$TMUX_PANE" ] && command -v tmux >/dev/null 2>&1; then
    pane_tty=$(tmux display-message -p -t "$TMUX_PANE" '#{pane_tty}' 2>/dev/null)
    [ -n "$pane_tty" ] && [ -w "$pane_tty" ] && printf '\a' >"$pane_tty"
fi

# The payload carries no session name, so read it from the transcript: a
# /rename or --name title wins over the generated one.
transcript=$(jq -r '.transcript_path // empty' <<<"$input")
title=
if [ -r "$transcript" ]; then
    for kind in custom-title ai-title; do
        title=$(grep -F "\"type\":\"$kind\"" "$transcript" | tail -1 | jq -r '.customTitle // .aiTitle // empty')
        [ -n "$title" ] && break
    done
fi
[ -n "$title" ] || title=$(basename "$(jq -r '.cwd // empty' <<<"$input")")

body=$(jq -r '.message // .last_assistant_message // "Needs your attention"' <<<"$input")

# `;` separates OSC 777 fields, and control bytes would end the sequence early.
clean() { printf '%s' "$1" | tr '\n;' '  ' | tr -d '\000-\037' | cut -c1-200; }

# wezterm: list this session's workspace in the status bar until it is looked
# at, and toast once.
if [ -n "$WEZTERM_PANE" ] && [ -x "$HOME/.config/wezterm/attention.sh" ]; then
    "$HOME/.config/wezterm/attention.sh" "$WEZTERM_PANE" "$(clean "$title")" "$(clean "$body")"
    exit 0
fi

# Delivered through Claude Code's own terminal write path: hooks have no tty.
seq=$(printf '\033]777;notify;%s;%s\007' "$(clean "$title")" "$(clean "$body")")
jq -nc --arg seq "$seq" '{terminalSequence: $seq}'
