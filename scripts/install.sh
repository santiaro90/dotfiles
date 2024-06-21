dotfiles_dir=~/.dotfiles

# Exit if ~/.dotfiles doesn't exist
if [ ! -d $dotfiles_dir ]; then
  echo "Error: $dotfiles_dir doesn't exist"
  echo "Please clone the dotfiles repo to $dotfiles_dir"
  exit 1
fi

# Install Homebrew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install formulae/casks using Brewfile
if [ $(/usr/bin/uname -m) = "arm64" ]; then # Apple Silicon macOS
  HOMEBREW_PREFIX="/opt/homebrew"
else # Intel macOS
  HOMEBREW_PREFIX="/usr/local"
fi

$HOMEBREW_PREFIX/bin/brew bundle install --file=$dotfiles_dir/Brewfile

# Vim plugins
if [ ! -d $dotfiles_dir/vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $dotfiles_dir/vim/bundle/Vundle.vim
fi

# Link files
# /bin/bash $dotfiles_dir/link_config.sh
