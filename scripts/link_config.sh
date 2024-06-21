dotfiles_dir=$HOME/.dotfiles

# Exit if $HOME/.dotfiles doesn't exist
if [ ! -d $dotfiles_dir ]; then
  echo "Error: $dotfiles_dir doesn't exist"
  echo "Please clone the dotfiles repo to $dotfiles_dir"
  exit 1
fi

# ZSH
zsh_dir=${ZDOTDIR:-"$HOME/.zsh"}

[[ -d $zsh_dir ]] || mkdir $zsh_dir
[[ -L $zsh_dir/.zshrc && -e $zsh_dir/.zshrc ]] || ln -fs $dotfiles_dir/zsh/zshrc $zsh_dir/.zshrc
[[ -L $zsh_dir/.zprofile && -e $zsh_dir/.zprofile ]] || ln -fs $dotfiles_dir/zsh/zprofile $zsh_dir/.zprofile
[[ -L $zsh_dir/.aliases.zsh && -e $zsh_dir/.aliases.zsh ]] || ln -fs $dotfiles_dir/zsh/aliases.zsh $zsh_dir/.aliases.zsh
[[ -L $zsh_dir/.keybindings.zsh && -e $zsh_dir/.keybindings.zsh ]] || ln -fs $dotfiles_dir/zsh/keybindings.zsh $zsh_dir/.keybindings.zsh
[[ -L $zsh_dir/.prompt.zsh && -e $zsh_dir/.prompt.zsh ]] || ln -fs $dotfiles_dir/zsh/prompt.zsh $zsh_dir/.prompt.zsh
[[ -L $zsh_dir/.zcomp && -e $zsh_dir/.zcomp ]] || ln -fs $dotfiles_dir/zsh/zcomp $zsh_dir/.zcomp
[[ -L $zsh_dir/.zfunc && -e $zsh_dir/.zfunc ]] || ln -fs $dotfiles_dir/zsh/zfunc $zsh_dir/.zfunc
[[ -L $zsh_dir/.zfunc && -e $zsh_dir/.zfunc ]] || ln -fs $dotfiles_dir/zsh/zfunc $zsh_dir/.zfunc

# ZIM
[[ -L $zsh_dir/.zimrc && -e $zsh_dir/.zimrc ]] || ln -fs $dotfiles_dir/zsh/zimrc $zsh_dir/.zimrc
[[ -L $zsh_dir/.zim.zsh && -e $zsh_dir/.zim.zsh ]] || ln -fs $dotfiles_dir/zsh/zim.zsh $zsh_dir/.zim.zsh

# Neovim/Vim
[[ -L $HOME/.vim && -e $HOME/.vim ]] || ln -fs $dotfiles_dir/vim $HOME/.vim
[[ -L $HOME/.vimrc && -e $HOME/.vimrc ]] || ln -fs $dotfiles_dir/vim/vimrc $HOME/.vimrc
[[ -L $HOME/.config/nvim && -e $HOME/.config/nvim ]] || ln -fs $dotfiles_dir/nvim $HOME/.config/nvim

# Tools
[[ -L $HOME/.ctags && -e $HOME/.ctags ]] || ln -fs $dotfiles_dir/ctags $HOME/.ctags
[[ -L $HOME/.editorconfig && -e $HOME/.editorconfig ]] || ln -fs $dotfiles_dir/editorconfig $HOME/.editorconfig
[[ -L $HOME/.gitconfig && -e $HOME/.gitconfig ]] || ln -fs $dotfiles_dir/git/gitconfig $HOME/.gitconfig
[[ -L $HOME/.gitignore && -e $HOME/.gitignore ]] || ln -fs $dotfiles_dir/git/gitignore $HOME/.gitignore
[[ -L $HOME/.starship.toml && -e $HOME/.starship.toml ]] || ln -fs $dotfiles_dir/starship.toml $HOME/.starship.toml

# Bat
bat_dir=$HOME/.config/bat
[ -d $bat_dir ] || mkdir -p $bat_dir
[[ -L $bat_dir/config && -e $bat_dir/config ]] || ln -fs $dotfiles_dir/bat/config $bat_dir/config
[[ -L $bat_dir/themes && -e $bat_dir/themes ]] || ln -fs $dotfiles_dir/bat/themes $bat_dir/themes
