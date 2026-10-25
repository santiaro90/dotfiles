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

Two configs, picked with `CLAUDE_CONFIG_DIR`:

| Alias | Config dir | What |
| --- | --- | --- |
| `pcl` | `~/.claude-personal` -> `claude/` | Personal: tracked here, rtk + caveman only |
| `wcl` | `~/.claude-work` -> `~/.claude` | Work: untracked, all work plugins |

Plain `claude` is work, same login, memories and `~/.claude.json` as `wcl`.
`claude/.gitignore` whitelists what is tracked: setup only, never memories or
session data. `pcl` needs one `/login` with the personal account.

Work gets the shared files (`CLAUDE.md`, `RTK.md`, scripts, theme, agent) linked one
by one. Its `settings.json` is not linked: copy the hooks and `statusLine` from
`claude/settings.json` by hand on a new machine, with `~/.claude-personal` paths
changed to `~/.claude`.

## Notes

- `brew bundle` only installs. It never removes anything already on the machine, so
  the Brewfile can stay narrower than `brew list`.
- `wezterm/attention.sh <pane-id>` flags a pane as wanting you, which lists its
  workspace in the status bar until you look at it. `wezterm/focus-pane.sh
  <pane-id>` is the way back: it switches workspace and tab to reach any pane.
  Both default to the calling pane, so anything long-running can end with
  `attention.sh`. Leader `b` jumps to the next flagged pane wherever it is.
  `claude/notify.sh` raises the flag when a session wants you.
