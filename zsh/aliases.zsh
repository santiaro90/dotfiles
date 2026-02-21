# Navigation and listing
alias -- -="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias dotf="[[ -d $DOTDIR ]] && cd $DOTDIR"

if command -v lsd >/dev/null 2>&1; then
    alias ls="lsd"
    alias l="ls -A1 --icon always"
    alias la="ls -Alh --icon always --git"
    alias lt="l --tree --depth 3"
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
alias eshell="e $DOTDIR/zsh/zshrc +\"cd $DOTDIR\" +bfirst && exec $SHELL"
alias eterm="e $DOTDIR/wezterm/wezterm.lua +\"cd $DOTDIR\""
alias eenv="e $DOTDIR/zsh/zprofile +\"cd $DOTDIR\" +bfirst && source $DOTDIR/zsh/zprofile"
alias egit="e $DOTDIR/git/gitconfig +\"cd $DOTDIR\""
alias eprompt="e $DOTDIR/starship.toml +\"cd $DOTDIR\" && exec $SHELL"
alias evim="e $DOTDIR/nvim +\"cd $DOTDIR/nvim\""

# Misc
command -v pbcopy >/dev/null 2>&1 || alias pbcopy="xsel -ib"
command -v pbpaste >/dev/null 2>&1 || alias pbpaste="xsel -ob"
alias off="sudo shutdown -h now"
alias reboot="sudo reboot"

# Use pnpm if available; otherwise try enabling via corepack once, then fall back to npm. Passes all
# args through unchanged.
function _pnpm() {
    if exists pnpm; then
        pnpm "$@"
        return $?
    fi

    # One-time attempt to make pnpm available via corepack (Node 16.10+/18+). We memoize the attempt
    # in the current shell session.
    if [[ -z "${PN__COREPACK_TRIED:-}" ]]; then
        PN__COREPACK_TRIED=1

        if exists corepack; then
            corepack enable >/dev/null 2>&1 || true
        fi

        if exists pnpm; then
            pnpm "$@"
            return $?
        fi
    fi

    npm "$@"
}

# Npm
alias ni="_pnpm install"
alias nig="_pnpm install --global"
alias nls="_pnpm ls --depth=0"
alias nout="_pnpm outdated"
alias nr="_pnpm run"
alias ns="_pnpm start"
alias nt="_pnpm test"
alias nun="_pnpm uninstall"
alias nup="_pnpm update"

# Python
alias pv="uv python list" # Python versions
alias pip="uv pip"

alias rm="nocorrect rm -r"
alias mk="mkdir -vp"
