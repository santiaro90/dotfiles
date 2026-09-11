local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_cwd = os.getenv("WEZTERM_START_DIR") or wezterm.home_dir

require("ui").apply(config)
require("keybindings").apply(config)

return config
