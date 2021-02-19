# Set vi mode
bindkey -v

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
bindkey -M viins '^r' fzf-history-widget
bindkey -M viins '^ ' fzf-completion
bindkey -M viins '^i' $fzf_default_completion
