local wezterm = require("wezterm")
local action = wezterm.action
local utils = require("utils")
local module = {}

module.apply = function(config)
  local keys = {
    -- Workspace picker, the wezterm-native equivalent of tmux.conf's sesh-pick
    { key = "o", mods = "LEADER", action = action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
    {
      key = "n",
      mods = "LEADER",
      action = action.PromptInputLine({
        description = "New workspace",
        action = wezterm.action_callback(function(window, pane, line)
          if not line or line == "" then
            return
          end

          local cwd = pane:get_current_working_dir()
          window:perform_action(
            action.SwitchToWorkspace({
              name = line,
              spawn = { cwd = cwd and cwd.file_path or wezterm.home_dir },
            }),
            pane
          )
        end),
      }),
    },
  }

  utils.append_to_list(config.keys, keys)
end

return module
