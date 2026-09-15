#!/bin/bash
# Claude Code hook: signal that a session wants attention.
#
# Wired to Stop (Claude finished answering) and Notification (Claude is waiting
# on a permission prompt) in ~/.claude/settings.json, which is not tracked here
# because Claude Code rewrites it at runtime.
#
# Both signals stay inside the terminal, and both persist until you look at the
# session rather than timing out on their own.

# Drain the hook payload. Nothing here reads it, but leaving it in the pipe
# risks EPIPE back in Claude Code.
cat >/dev/null

# tmux: ring the bell on the pane Claude runs in. monitor-bell (tmux.conf) turns
# that into a marker on the window, which survives until you visit the window.
if [ -n "$TMUX_PANE" ] && command -v tmux >/dev/null 2>&1; then
    pane_tty=$(tmux display-message -p -t "$TMUX_PANE" '#{pane_tty}' 2>/dev/null)
    [ -n "$pane_tty" ] && [ -w "$pane_tty" ] && printf '\a' >"$pane_tty"
fi

# wezterm: list this session's workspace in the status bar until it is looked at.
[ -n "$WEZTERM_PANE" ] && [ -x "$HOME/.config/wezterm/attention.sh" ] &&
    "$HOME/.config/wezterm/attention.sh" "$WEZTERM_PANE"

exit 0
