#!/bin/bash
# Custom status line for Claude Code
input=$(cat)

# Extract data from JSON
model=$(echo "$input" | jq -r '.model.display_name')
branch=""
if git rev-parse --git-dir >/dev/null 2>&1; then
    branch=$(git branch --show-current 2>/dev/null)
fi

context_usage=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
session_cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
agent_name=$(echo "$input" | jq -r '.agent.name // ""')
vim_mode=$(echo "$input" | jq -r '.vim.mode // ""')

# Color codes
agent_colour='\033[38;2;153;209;219m'  # #99d1db
bg_colour='\033[48;2;48;52;70m'        # #303446 background
branch_colour='\033[38;2;133;193;220m' # #85c1dc
danger_colour='\033[38;2;231;130;132m' # red tone
reset_colour='\033[0m'
success_colour='\033[38;2;166;209;137m' # #a6d189 - primary green
vim_colour='\033[38;2;202;158;230m'     # #ca9ee6
warn_colour='\033[38;2;229;200;144m'    # #e5c890 - warn/orange

# Build progress bar with color-coded steps
context_usage_bar_width=10
context_usage_filled=$((context_usage * context_usage_bar_width / 100))
context_usage_free=$((context_usage_bar_width - context_usage_filled))
context_usage_bar=""
[ "$context_usage_filled" -gt 0 ] && context_usage_bar=$(printf "%${context_usage_filled}s" | tr ' ' '▓')
[ "$context_usage_free" -gt 0 ] && context_usage_bar="${context_usage_bar}$(printf "%${context_usage_free}s" | tr ' ' '░')"

# Choose bar color based on context percentage
if [ "$context_usage" -le 40 ]; then
    context_usage_bar_colour="$success_colour"
elif [ "$context_usage" -le 60 ]; then
    context_usage_bar_colour="$warn_colour"
else
    context_usage_bar_colour="$danger_colour"
fi

# Build status line
status_line=""

if [ -n "$branch" ]; then
    status_line="${status_line}${branch_colour} ${branch}${reset_colour} | "
fi

status_line="${status_line}[$model] ${context_usage_bar_colour}${context_usage_bar} ${context_usage}%${reset_colour}"

cost_format=$(printf '%.2f' "$session_cost")
# Color code the cost value
cost_value_usd=$(echo "$session_cost" | awk '{printf "%.0f", $1}')
if [ "$cost_value_usd" -lt 10 ]; then
    cost_colour="$success_colour"
elif [ "$cost_value_usd" -lt 20 ]; then
    cost_colour="$warn_colour"
else
    cost_colour="$danger_colour"
fi
status_line="${status_line} | 💵 Session cost: ${cost_colour}\$${cost_format}${reset_colour}"

if [ -n "$agent_name" ]; then
    status_line="${status_line} | ${agent_colour}${agent_name}${reset_colour}"
fi

if [ -n "$vim_mode" ]; then
    status_line="${status_line} | ${vim_colour}${vim_mode}${reset_colour}"
fi

# Apply background color and print
printf '%b' "${bg_colour}${status_line}${reset_colour}\n"
