local action = require("wezterm").action
local module = {}

module.apply = function(config)
  config.leader = { key = ";", mods = "CTRL", timeout_milliseconds = 500 }

  config.keys = {
    -- Disable keybindings that conflict with Neovim
    { key = "h", mods = "CTRL|SHIFT", action = action.DisableDefaultAssignment },
    { key = "j", mods = "CTRL|SHIFT", action = action.DisableDefaultAssignment },
    { key = "k", mods = "CTRL|SHIFT", action = action.DisableDefaultAssignment },
    { key = "l", mods = "CTRL|SHIFT", action = action.DisableDefaultAssignment },
  }
  config.key_tables = {}

  require("keybindings.panes").apply(config)
  require("keybindings.tabs").apply(config)
  require("keybindings.tools").apply(config)
end

return module
