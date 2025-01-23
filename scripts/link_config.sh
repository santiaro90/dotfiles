bat_dir=$HOME/.config/bat
dotfiles_dir=$HOME/.dotfiles
zsh_dir=${ZDOTDIR:-"$HOME/.zsh"}
zim_dir=${ZIMHOME:-"$HOME/.zsh/.zim"}

# Exit if $HOME/.dotfiles doesn't exist
if [ ! -d "$dotfiles_dir" ]; then
  echo "Error: $dotfiles_dir doesn't exist"
  echo "Please clone the dotfiles repo to $dotfiles_dir"
  exit 1
fi

# Create required directories
[ -d "$bat_dir" ] || mkdir -p "$bat_dir"
[ -d "$zim_dir" ] || mkdir -p "$zim_dir"
[ -d "$zsh_dir" ] || mkdir -p "$zsh_dir"

# Create a mapping of files to link
declare -A link_map

link_map["$dotfiles_dir/zsh/aliases.zsh"]="$zsh_dir/.aliases.zsh"
link_map["$dotfiles_dir/zsh/keybindings.zsh"]="$zsh_dir/.keybindings.zsh"
link_map["$dotfiles_dir/zsh/prompt.zsh"]="$zsh_dir/.prompt.zsh"
link_map["$dotfiles_dir/zsh/zcomp"]="$zsh_dir/.zcomp"
link_map["$dotfiles_dir/zsh/zfunc"]="$zsh_dir/.zfunc"
link_map["$dotfiles_dir/zsh/zimrc"]="$zsh_dir/.zimrc"
link_map["$dotfiles_dir/zsh/zim.zsh"]="$zsh_dir/.zim.zsh"
link_map["$dotfiles_dir/zsh/zprofile"]="$zsh_dir/.zprofile"
link_map["$dotfiles_dir/zsh/zshrc"]="$zsh_dir/.zshrc"

link_map["$dotfiles_dir/bat/config"]="$bat_dir/config"
link_map["$dotfiles_dir/bat/themes"]="$bat_dir/themes"

link_map["$dotfiles_dir/git/gitconfig"]="$HOME/.gitconfig"
link_map["$dotfiles_dir/git/gitignore"]="$HOME/.gitignore"

link_map["$dotfiles_dir/vim"]="$HOME/.vim"
link_map["$dotfiles_dir/vim/vimrc"]="$HOME/.vimrc"
link_map["$dotfiles_dir/nvim"]="$HOME/.config/nvim"

link_map["$dotfiles_dir/ctags"]="$HOME/.ctags"
link_map["$dotfiles_dir/editorconfig"]="$HOME/.editorconfig"
link_map["$dotfiles_dir/starship.toml"]="$HOME/.starship.toml"

# Check if the files are already linked. If not, create the symlinks
for src in "${!link_map[@]}"; do
  dest=${link_map["$src"]}
  [[ -L "$dest" && -e "$dest" ]] || ln -fs "$src" "$dest"
done

bat cache --build >/dev/null 2>&1
