local action = require("wezterm").action
local utils = require("utils")
local module = {}

module.apply = function(config)
  local keys = {
    { key = "/", mods = "SUPER", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "\\", mods = "SUPER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },

    -- Move between wezterm panes
    { key = "LeftArrow", mods = "SUPER", action = action.ActivatePaneDirection("Left") },
    { key = "DownArrow", mods = "SUPER", action = action.ActivatePaneDirection("Down") },
    { key = "UpArrow", mods = "SUPER", action = action.ActivatePaneDirection("Up") },
    { key = "RightArrow", mods = "SUPER", action = action.ActivatePaneDirection("Right") },

    -- Resize wezterm panes
    { key = "LeftArrow", mods = "SUPER|SHIFT", action = action.AdjustPaneSize({ "Left", 2 }) },
    { key = "DownArrow", mods = "SUPER|SHIFT", action = action.AdjustPaneSize({ "Down", 2 }) },
    { key = "UpArrow", mods = "SUPER|SHIFT", action = action.AdjustPaneSize({ "Up", 2 }) },
    { key = "RightArrow", mods = "SUPER|SHIFT", action = action.AdjustPaneSize({ "Right", 2 }) },
  }

  utils.append_to_list(config.keys, keys)
end

return module
