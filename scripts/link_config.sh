#! /usr/bin/env bash

bat_dir=$HOME/.config/bat
claude_dir=$HOME/.claude
claude_agents_dir=$HOME/.claude/agents
claude_themes_dir=$HOME/.claude/themes
dotfiles_dir=$HOME/.dotfiles
zsh_dir=${ZDOTDIR:-"$HOME/.zsh"}
zim_dir=${ZIMHOME:-"$HOME/.zsh/.zim"}
tmux_dir=$HOME/.config/tmux

# Exit if $HOME/.dotfiles doesn't exist
if [ ! -d "$dotfiles_dir" ]; then
    echo "Error: $dotfiles_dir doesn't exist"
    echo "Please clone the dotfiles repo to $dotfiles_dir"
    exit 1
fi

# Create required directories
[ -d "$bat_dir" ] || mkdir -p "$bat_dir"
[ -d "$claude_dir" ] || mkdir -p "$claude_dir"
[ -d "$claude_agents_dir" ] || mkdir -p "$claude_agents_dir"
[ -d "$claude_themes_dir" ] || mkdir -p "$claude_themes_dir"
[ -d "$zim_dir" ] || mkdir -p "$zim_dir"
[ -d "$zsh_dir" ] || mkdir -p "$zsh_dir"
[ -d "$tmux_dir" ] || mkdir -p "$tmux_dir"

# Create a mapping of files to link
declare -A link_map

link_map["$dotfiles_dir/bat/config"]="$bat_dir/config"
link_map["$dotfiles_dir/bat/themes"]="$bat_dir/themes"
# Claude files are linked one by one, never whole directories: work installs its
# own agents and skills alongside these. settings.json is deliberately absent —
# Claude Code rewrites it at runtime (/model, /config, plugin toggles) and it
# holds work-only plugins and marketplaces.
link_map["$dotfiles_dir/claude/CLAUDE.md"]="$claude_dir/CLAUDE.md"
link_map["$dotfiles_dir/claude/RTK.md"]="$claude_dir/RTK.md"
link_map["$dotfiles_dir/claude/agents/refactorer.md"]="$claude_agents_dir/refactorer.md"
link_map["$dotfiles_dir/claude/notify.sh"]="$claude_dir/notify.sh"
link_map["$dotfiles_dir/claude/statusline.sh"]="$claude_dir/statusline.sh"
link_map["$dotfiles_dir/claude/theme.catppuccin.json"]="$claude_themes_dir/catppuccin.json"
link_map["$dotfiles_dir/editorconfig"]="$HOME/.editorconfig"
link_map["$dotfiles_dir/git/gitconfig"]="$HOME/.gitconfig"
link_map["$dotfiles_dir/git/gitignore"]="$HOME/.gitignore"
link_map["$dotfiles_dir/glow"]="$HOME/.config/glow"
link_map["$dotfiles_dir/lsd"]=$HOME/.config/lsd
link_map["$dotfiles_dir/nvim"]="$HOME/.config/nvim"
link_map["$dotfiles_dir/starship.toml"]="$HOME/.starship.toml"
link_map["$dotfiles_dir/tmux/tmux.conf"]="$HOME/.config/tmux/tmux.conf"
link_map["$dotfiles_dir/wezterm"]="$HOME/.config/wezterm"
link_map["$dotfiles_dir/yazi"]="$HOME/.config/yazi"
link_map["$dotfiles_dir/zsh/aliases.zsh"]="$zsh_dir/.aliases.zsh"
link_map["$dotfiles_dir/zsh/keybindings.zsh"]="$zsh_dir/.keybindings.zsh"
link_map["$dotfiles_dir/zsh/zfunc"]="$zsh_dir/.zfunc"
link_map["$dotfiles_dir/zsh/zim.zsh"]="$zsh_dir/.zim.zsh"
link_map["$dotfiles_dir/zsh/zimrc"]="$zsh_dir/.zimrc"
link_map["$dotfiles_dir/zsh/zprofile"]="$zsh_dir/.zprofile"
link_map["$dotfiles_dir/zsh/zshrc"]="$zsh_dir/.zshrc"

# Relink unless the symlink already points at this exact source, so renamed or
# moved sources heal instead of leaving a stale link in place.
for src in "${!link_map[@]}"; do
    dest=${link_map["$src"]}
    [[ "$(readlink "$dest")" == "$src" ]] || ln -fsn "$src" "$dest"
done

bat cache --build >/dev/null 2>&1
