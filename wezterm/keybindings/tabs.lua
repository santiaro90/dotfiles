local wezterm = require("wezterm")
local action = wezterm.action
local utils = require("utils")
local module = {}

module.apply = function(config)
  local keys = {
    -- tmux-style tab bindings, mirroring tmux.conf's own prefix table
    { key = "t", mods = "LEADER", action = action.SpawnTab("CurrentPaneDomain") },
    { key = "[", mods = "LEADER", action = action.ActivateTabRelative(-1) },
    { key = "]", mods = "LEADER", action = action.ActivateTabRelative(1) },
    {
      key = ",",
      mods = "LEADER",
      action = action.PromptInputLine({
        description = "Rename tab",
        action = wezterm.action_callback(function(window, _, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }),
    },
  }

  for i = 1, 9 do
    table.insert(keys, { key = tostring(i), mods = "LEADER", action = action.ActivateTab(i - 1) })
  end

  utils.append_to_list(config.keys, keys)
end

return module
