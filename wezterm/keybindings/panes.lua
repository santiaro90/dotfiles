local action = require("wezterm").action
local utils = require("utils")
local module = {}

module.apply = function(config)
  local keys = {
    { key = "v", mods = "LEADER", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "s", mods = "LEADER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },

    -- Move between panes
    { key = "h", mods = "LEADER", action = action.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER", action = action.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER", action = action.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER", action = action.ActivatePaneDirection("Right") },

    -- Pane resize mode
    {
      key = "r",
      mods = "LEADER",
      action = action.ActivateKeyTable({
        name = "resize",
        one_shot = false,
        prevent_fallback = true,
        replace_current = true,
      }),
    },
  }

  local key_tables = {
    resize = {
      { key = "h", action = action.AdjustPaneSize({ "Left", 1 }) },
      { key = "j", action = action.AdjustPaneSize({ "Down", 1 }) },
      { key = "k", action = action.AdjustPaneSize({ "Up", 1 }) },
      { key = "l", action = action.AdjustPaneSize({ "Right", 1 }) },
      { key = "Enter", action = "PopKeyTable" },
    },
  }

  utils.append_to_list(config.keys, keys)
  utils.append_to_table(config.key_tables, key_tables)
end

return module
