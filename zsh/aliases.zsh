# Navigation and listing
alias -- -="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias dotf="[[ -d $DOTDIR ]] && cd $DOTDIR"

if command -v exa > /dev/null 2>&1; then
  alias ls="exa"
  alias l="ls -a1 --icons"
  alias la="ls -alh --icons --git"
  alias lt="l -TL 3"
else
  alias l="ls -A1p"
  alias la="ls -Alhp"
  alias lt="tree -L 3"
fi

# Git
alias g="git"

# Edit config files
alias ealias="e $DOTDIR/zsh/aliases.zsh +\"cd $DOTDIR\" && source $DOTDIR/zsh/aliases.zsh"
alias efunc="e $DOTDIR/zsh/zfunc +\"cd $DOTDIR\" && exec $SHELL"
alias ecomp="e $DOTDIR/zsh/zcomp +\"cd $DOTDIR\" && exec $SHELL"
alias ezshrc="e $DOTDIR/zsh/zshrc +\"cd $DOTDIR\" +bfirst && exec $SHELL"
alias eenv="e $DOTDIR/zsh/zprofile +\"cd $DOTDIR\" +bfirst && source $DOTDIR/zsh/zprofile"
alias egit="e $DOTDIR/git/config +\"cd $DOTDIR\""
alias eprompt="e $DOTDIR/zsh/prompt.zsh +\"cd $DOTDIR\" && exec $SHELL"
alias evim="e $DOTDIR/nvim/init.lua +\"cd $DOTDIR/nvim\""

# Misc
command -v pbcopy > /dev/null 2>&1 || alias pbcopy="xsel -ib"
command -v pbpaste > /dev/null 2>&1 || alias pbpaste="xsel -ob"
alias off="sudo shutdown -h now"
alias reboot="sudo reboot"

# Npm
alias ni="npm install"
alias nig="npm install --global"
alias nls="npm ls --depth=0"
alias nout="npm outdated"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"
alias nun="npm uninstall"
alias nup="npm update"

# Pyenv
alias pyi="pyenv install"
alias pys="pyenv shell"
alias pyu="pyenv uninstall"
alias pyv="pyenv versions"
alias pyve="pyenv virtualenv"
alias pyvea="pyenv activate"
alias pyved="pyenv deactivate"
alias pyvex="pyenv virtualenv-delete"
alias pyves="pyenv virtualenvs"

# Disable corrections
alias rm="nocorrect rm"
