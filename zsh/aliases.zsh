# Navigation and listing
alias -- -="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias dotf="[[ -d $DOTDIR ]] && cd $DOTDIR"
alias l="ls -A1p"
alias la="ls -Alhp"
alias lt="tree -L 3"

# Git
alias g="git"

# Edit config files
alias ealias="e $DOTDIR/zsh/aliases.zsh +\"cd $DOTDIR/zsh\""
alias efunc="e $DOTDIR/zsh/zfunc +\"cd $DOTDIR/zsh/zfunc\""
alias ecomp="e $DOTDIR/zsh/zcomp +\"cd $DOTDIR/zsh/zcomp\""
alias ezshrc="e $DOTDIR/zsh/zshrc +\"cd $DOTDIR/zsh\" +bfirst"
alias eenv="e $DOTDIR/zsh/zshenv +\"cd $DOTDIR/zsh\" +bfirst"
alias egit="e $DOTDIR/git +\"cd $DOTDIR/git\""
alias eprompt="e $DOTDIR/zsh/prompt.zsh +\"cd $DOTDIR/zsh\""
alias evim="e $DOTDIR/nvim +\"cd $DOTDIR/nvim\""

# Misc
command -v pbcopy > /dev/null 2>&1 || alias pbcopy="xsel -ib"
command -v pbpaste > /dev/null 2>&1 || alias pbpaste="xsel -ob"
alias off="sudo shutdown -h now"
alias reboot="sudo reboot"

# Npm
alias ni="npm install"
alias nls="npm ls --depth=0"
alias nout="npm outdated"
alias nun="npm uninstall"
alias nup="npm update"
alias nig="npm install --global"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"

# Disable corrections
alias rm="nocorrect rm"
