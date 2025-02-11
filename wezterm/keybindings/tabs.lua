local action = require("wezterm").action
local utils = require("utils")
local module = {}

module.apply = function(config)
  local keys = {
    { key = "]", mods = "SUPER", action = action.ActivateTabRelative(1) },
    { key = "[", mods = "SUPER", action = action.ActivateTabRelative(-1) },
  }

  utils.append_to_list(config.keys, keys)
end

return module
