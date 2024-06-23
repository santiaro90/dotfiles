#! /bin/bash
dotfiles_dir=$HOME/.dotfiles

# Exit if $HOME/.dotfiles doesn't exist
if [ ! -d $dotfiles_dir ]; then
  echo "Error: $dotfiles_dir doesn't exist"
  echo "Please clone the dotfiles repo to $dotfiles_dir"
  exit 1
fi

# Install Homebrew
command -v brew &> /dev/null || \
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install formulae/casks using Brewfile
if [ $(/usr/bin/uname -m) = "arm64" ]; then # Apple Silicon macOS
  HOMEBREW_PREFIX="/opt/homebrew"
else # Intel macOS
  HOMEBREW_PREFIX="/usr/local"
fi

$HOMEBREW_PREFIX/bin/brew bundle install --file=$dotfiles_dir/Brewfile
$HOMEBREW_PREFIX/bin/brew cleanup

  # ZSH won't load properly if $ZDOTDIR is being set in .zsh/.zprofile.
  # Therefore, ~/.zshenv needs to exist and have set the variable, before
  # everything else is sourced.
if [ ! -f $HOME/.zshenv ]; then
  echo "export ZDOTDIR=$zsh_dir" > $HOME/.zshenv
else
  grep -q "export ZDOTDIR=$zsh_dir" $HOME/.zshenv || \
    echo "export ZDOTDIR=$zsh_dir" >> $HOME/.zshenv
fi

$HOMEBREW_PREFIX/bin/bash $dotfiles_dir/scripts/link_config.sh

# Vim plugins
[ ! -d $HOME/.vim/bundle/Vundle.vim ] && \
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim && \
  vim +PluginInstall +qall
