local action = require("wezterm").action
local utils = require("utils")
local module = {}

module.apply = function(config)
  local keys = {
    { key = "d", mods = "SUPER", action = action.ShowDebugOverlay },
    { key = "p", mods = "SUPER", action = action.ActivateCommandPalette },
  }

  utils.append_to_list(config.keys, keys)
end

return module
