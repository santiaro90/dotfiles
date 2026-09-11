#!/bin/bash
# Claude Code hook: signal that a session wants attention.
#
# Wired to Stop (Claude finished answering) and Notification (Claude is waiting
# on a permission prompt) in ~/.claude/settings.json, which is not tracked here
# because Claude Code rewrites it at runtime.
#
# Two signals, because neither alone covers both cases:
#   - a bell on the pane's tty, so tmux flags the window in the status bar and
#     you can see which of several sessions finished without switching to it
#   - a desktop notification, for when WezTerm is not the focused app

input=$(cat)

event=$(printf '%s' "$input" | jq -r '.hook_event_name // "Stop"')
cwd=$(printf '%s' "$input" | jq -r '.cwd // ""')
message=$(printf '%s' "$input" | jq -r '.message // ""')

project=$(basename "${cwd:-$PWD}")

case "$event" in
    Notification) title="Claude needs you"; body="${message:-Waiting for input}" ;;
    *)            title="Claude finished";  body="$project" ;;
esac

# tmux: ring the bell on the pane Claude runs in. monitor-bell (tmux.conf) turns
# that into a marker on the window, which survives until you visit the window.
if [ -n "$TMUX_PANE" ] && command -v tmux >/dev/null 2>&1; then
    pane_tty=$(tmux display-message -p -t "$TMUX_PANE" '#{pane_tty}' 2>/dev/null)
    [ -n "$pane_tty" ] && [ -w "$pane_tty" ] && printf '\a' >"$pane_tty"
fi

# Desktop: -sender makes the notification carry WezTerm's icon, -activate
# focuses WezTerm when the notification is clicked.
if command -v terminal-notifier >/dev/null 2>&1; then
    terminal-notifier \
        -title "$title" \
        -message "$body" \
        -sender com.github.wez.wezterm \
        -activate com.github.wez.wezterm \
        -group "claude-$project" \
        >/dev/null 2>&1
fi

exit 0
