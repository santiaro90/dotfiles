local action = require("wezterm").action
local utils = require("utils")
local module = {}

module.apply = function(config)
  local keys = {
    -- Lost to tmux windows now; unbind so the habit dies
    { key = "]", mods = "SUPER", action = action.DisableDefaultAssignment },
    { key = "[", mods = "SUPER", action = action.DisableDefaultAssignment },
    { key = "t", mods = "SUPER", action = action.DisableDefaultAssignment },
  }

  utils.append_to_list(config.keys, keys)
end

return module
