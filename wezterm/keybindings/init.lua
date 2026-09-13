local action = require("wezterm").action
local module = {}

module.apply = function(config)
  -- Leader mirrors tmux's own prefix workflow, on a key tmux never binds
  -- (its prefix is ctrl-s), so a manually-started/remote tmux is unaffected.
  config.leader = { key = ";", mods = "CTRL", timeout_milliseconds = 2000 }

  config.keys = {
    -- Disable keybindings that conflict with Neovim
    { key = "h", mods = "CTRL|SHIFT", action = action.DisableDefaultAssignment },
    { key = "j", mods = "CTRL|SHIFT", action = action.DisableDefaultAssignment },
    { key = "k", mods = "CTRL|SHIFT", action = action.DisableDefaultAssignment },
    { key = "l", mods = "CTRL|SHIFT", action = action.DisableDefaultAssignment },

    -- ctrl+[ is the same byte as Escape at the terminal level, but wezterm's
    -- own key tables (copy_mode, leader) match on key events, not raw bytes.
    -- Re-inject it as Escape so ctrl+[ closes them too.
    { key = "[", mods = "CTRL", action = action.SendKey({ key = "Escape" }) },
  }
  config.key_tables = {}

  require("keybindings.panes").apply(config)
  require("keybindings.tabs").apply(config)
  require("keybindings.tools").apply(config)
  require("keybindings.workspaces").apply(config)
end

return module
