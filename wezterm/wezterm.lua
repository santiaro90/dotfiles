local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_cwd = os.getenv("WEZTERM_START_DIR") or wezterm.home_dir
-- default_prog skips shell init, so PATH lacks brew; run through a login
-- shell so tmux resolves the same as it would in a normal terminal.
-- That shell is non-interactive (-c), so zshrc's `[[ -o interactive ]]`
-- guard skips `stty -ixon` — set it here or ctrl-s (tmux prefix) gets
-- eaten as XOFF before tmux ever sees it.
config.default_prog =
  { os.getenv("SHELL") or "/bin/zsh", "-l", "-c", 'stty -ixon; exec tmux new-session -c "' .. config.default_cwd .. '"' }

require("ui").apply(config)
require("keybindings").apply(config)

return config
