local wezterm = require("wezterm")
local config = {}

require("ui").apply(config)
require("keybindings").apply(config)

wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  if name then
    name = "TABLE: " .. name
  end
  window:set_right_status(name or "")
end)

return config
