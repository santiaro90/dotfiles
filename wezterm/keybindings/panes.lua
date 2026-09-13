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

    -- tmux-style pane bindings, mirroring tmux.conf's own prefix table
    { key = "v", mods = "LEADER", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "s", mods = "LEADER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "h", mods = "LEADER", action = action.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER", action = action.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER", action = action.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER", action = action.ActivatePaneDirection("Right") },
    { key = "r", mods = "LEADER", action = action.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
  }

  utils.append_to_list(config.keys, keys)

  -- Sticky resize table: stays active across keypresses, like tmux.conf's
  -- own prefix+r table, until Enter/Escape/q pops it.
  config.key_tables.resize_pane = {
    { key = "h", action = action.AdjustPaneSize({ "Left", 2 }) },
    { key = "j", action = action.AdjustPaneSize({ "Down", 2 }) },
    { key = "k", action = action.AdjustPaneSize({ "Up", 2 }) },
    { key = "l", action = action.AdjustPaneSize({ "Right", 2 }) },
    { key = "Enter", action = action.PopKeyTable },
    { key = "Escape", action = action.PopKeyTable },
    { key = "q", action = action.PopKeyTable },
  }
end

return module
