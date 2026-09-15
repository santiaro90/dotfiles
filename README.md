# Dotfiles

macOS config for zsh, WezTerm, tmux, Neovim, git, yazi and Claude Code.

## Install

The repo must live at `~/.dotfiles` — the scripts hardcode that path.

```sh
git clone git@github.com:santiaro90/dotfiles.git ~/.dotfiles
~/.dotfiles/scripts/install.sh
```

`install.sh` installs Homebrew, runs `brew bundle`, writes `export ZDOTDIR=$HOME/.zsh`
into `~/.zshenv` (zsh needs this before anything else is sourced), then calls
`link_config.sh`.

`link_config.sh` is idempotent and safe to re-run on its own after adding a file to
the link map.

## Local overrides

Nothing here holds work or machine-specific config. These files are gitignored or
outside the repo, and you create them by hand:

| File | Purpose |
| --- | --- |
| `~/.gitconfig.local` | Work identity and one-off aliases |
| `~/.zsh/.zprofile.local` | Machine-specific exports |
| `~/.zsh/.zshrc.local` | Machine-specific shell setup |
| `~/.zsh/.aliases.local` | Work aliases |

## Claude Code

Claude files are symlinked one by one, never as a directory, because work plugins
install their own agents and skills into the same tree.

`~/.claude/settings.json` is **not** symlinked — Claude Code rewrites it at runtime.
Copy the stable half out of `claude/settings.reference.json` by hand on a new
machine; that is what wires up `statusline.sh`, `notify.sh` and the `rtk` hook.

## Notes

- `brew bundle` only installs. It never removes anything already on the machine, so
  the Brewfile can stay narrower than `brew list`.
- `wezterm/attention.sh <pane-id>` flags a pane as wanting you, which lists its
  workspace in the status bar until you look at it. `wezterm/focus-pane.sh
  <pane-id>` is the way back: it switches workspace and tab to reach any pane.
  Both default to the calling pane, so anything long-running can end with
  `attention.sh`. Leader `b` jumps to the next flagged pane wherever it is.
  `claude/notify.sh` raises the flag when a session wants you.
