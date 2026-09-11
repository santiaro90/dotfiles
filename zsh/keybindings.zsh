# Set vi mode
bindkey -v

bindkey -M viins 'jk' vi-cmd-mode

# Movement
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^b' vi-backward-word-end
bindkey -M viins '^e' end-of-line
bindkey -M viins '^f' vi-forward-word

# Editing
bindkey -M viins '^k' kill-line
bindkey -M viins '^u' backward-kill-line
bindkey -M viins '^w' backward-kill-word

# History
bindkey -M viins '^n' down-history
bindkey -M viins '^p' up-history

# Completion
bindkey -M viins '^g' fzf-cd-widget
bindkey -M viins '^t' fzf-file-widget
bindkey -M viins '^ ' fzf-completion
bindkey -M viins '^i' $fzf_default_completion

# Sessions: pick a tmux session, project or zoxide dir and connect to it.
function sesh-connect() {
    # zle detaches the widget from the terminal; fzf needs it back.
    exec </dev/tty
    exec <&1

    sesh-pick

    zle reset-prompt >/dev/null 2>&1 || true
}
zle -N sesh-connect
bindkey -M viins '^o' sesh-connect
