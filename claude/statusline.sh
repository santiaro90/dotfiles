#!/bin/bash
# Custom status line for Claude Code
input=$(cat)

# Extract data from JSON
model=$(echo "$input" | jq -r '.model.display_name')
branch=""
repo=""
if git rev-parse --git-dir >/dev/null 2>&1; then
    branch=$(git branch --show-current 2>/dev/null)
    repo=$(basename "$(git rev-parse --show-toplevel 2>/dev/null)" 2>/dev/null)
fi

context_usage=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
session_cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
agent_name=$(echo "$input" | jq -r '.agent.name // ""')

# Subscription usage (Claude.ai Pro/Max/Team) — populated after first API response
usage_5h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty' | cut -d. -f1)
usage_7d=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty' | cut -d. -f1)

# Color codes
agent_colour='\033[38;2;153;209;219m'  # #99d1db
bg_colour='\033[48;2;48;52;70m'        # #303446 background
branch_colour='\033[38;2;133;193;220m' # #85c1dc
repo_colour='\033[38;2;229;200;144m'   # #e5c890 - yellow
danger_colour='\033[38;2;231;130;132m' # red tone
dirty_colour='\033[38;2;255;175;215m'  # color 218 - pink (git_status *)
grey_colour='\033[38;5;7m'             # color 7 - behind count
italic='\033[3m'
reset_colour='\033[0m'
success_colour='\033[38;2;166;209;137m' # #a6d189 - primary green
warn_colour='\033[38;2;229;200;144m'    # #e5c890 - warn/orange

bar_width=6

# Build a color-coded progress bar that fills to 100%
# $1 = percentage (0-100), $2 = colour
progress_bar() {
    local pct=$1 colour=$2 filled free bar
    [ "$pct" -gt 100 ] && pct=100
    filled=$((pct * bar_width / 100))
    free=$((bar_width - filled))
    bar=""
    [ "$filled" -gt 0 ] && bar=$(printf "%${filled}s" | tr ' ' '▓')
    [ "$free" -gt 0 ] && bar="${bar}$(printf "%${free}s" | tr ' ' '░')"
    printf '%s%s%s' "$colour" "$bar" "$reset_colour"
}

# Pick colour for a usage percentage (green <=40, orange <=75, red above)
usage_colour() {
    if [ "$1" -le 40 ]; then
        printf '%s' "$success_colour"
    elif [ "$1" -le 75 ]; then
        printf '%s' "$warn_colour"
    else
        printf '%s' "$danger_colour"
    fi
}

context_usage_bar=$(progress_bar "$context_usage" "$(usage_colour "$context_usage")")

# Build git_status segment, mirroring the starship git_status module:
#   pink * when dirty · ‼ conflicted · ⇣ behind / ⇡ ahead · 󰆺 stashed
git_status_seg=""
if [ -n "$branch" ]; then
    porcelain=$(git status --porcelain --branch 2>/dev/null)

    # dirty indicator: any tracked/untracked change (non-branch line)
    printf '%s\n' "$porcelain" | grep -qv '^##' \
        && git_status_seg="${dirty_colour}*${reset_colour}"

    conflicts=$(printf '%s\n' "$porcelain" | grep -cE '^(DD|AU|UD|UA|DU|AA|UU)')
    branch_line=$(printf '%s\n' "$porcelain" | head -1)
    ahead=$(printf '%s' "$branch_line"  | grep -oE 'ahead [0-9]+'  | grep -oE '[0-9]+')
    behind=$(printf '%s' "$branch_line" | grep -oE 'behind [0-9]+' | grep -oE '[0-9]+')
    stashed=$(git rev-list --walk-reflogs --count refs/stash 2>/dev/null || echo 0)

    sync=""
    [ "$conflicts" -gt 0 ] && sync="${sync} ${danger_colour}‼${reset_colour}"
    if [ -n "$ahead" ] && [ -n "$behind" ]; then
        sync="${sync} ${grey_colour}${behind}⇣${reset_colour}·${warn_colour}${ahead}⇡${reset_colour}"
    elif [ -n "$ahead" ]; then
        sync="${sync} ${warn_colour}${ahead}⇡${reset_colour}"
    elif [ -n "$behind" ]; then
        sync="${sync} ${grey_colour}${behind}⇣${reset_colour}"
    fi
    [ "${stashed:-0}" -gt 0 ] && sync="${sync} ${success_colour}󰆺${reset_colour}"

    [ -n "$sync" ] && git_status_seg="${git_status_seg} ~${sync}"
fi

# Build status line
status_line=""

if [ -n "$repo" ]; then
    status_line="${status_line}${italic}${repo_colour} ${repo}${reset_colour} "
fi

if [ -n "$branch" ]; then
    status_line="${status_line}${italic}${branch_colour} ${branch}${reset_colour}${git_status_seg} | "
fi

status_line="${status_line}${model} ${context_usage_bar} ${context_usage}%"

# Append subscription usage when present (Session = 5-hour, Week = 7-day)
usage_segs=""

if [ -n "$usage_5h" ]; then
    usage_5h_bar=$(progress_bar "$usage_5h" "$(usage_colour "$usage_5h")")
    usage_segs="Session ${usage_5h_bar} ${usage_5h}%"
fi

if [ -n "$usage_7d" ]; then
    usage_7d_bar=$(progress_bar "$usage_7d" "$(usage_colour "$usage_7d")")
    [ -n "$usage_segs" ] && usage_segs="${usage_segs} · "
    usage_segs="${usage_segs}Week ${usage_7d_bar} ${usage_7d}%"
fi

[ -n "$usage_segs" ] && status_line="${status_line} | Usage: ${usage_segs}"

# Apply background color and print
printf '%b' "${bg_colour}${status_line}${reset_colour}\n"

exit 0
