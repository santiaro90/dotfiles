local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("ui").apply(config)
require("keybindings").apply(config)

return config
