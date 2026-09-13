local action = require("wezterm").action
local utils = require("utils")
local module = {}

module.apply = function(config)
  local keys = {
    { key = "d", mods = "SUPER", action = action.ShowDebugOverlay },
    { key = "p", mods = "SUPER", action = action.ActivateCommandPalette },
    { key = "i", mods = "SUPER", action = action.CharSelect },
    -- Shift+Enter for multi-line prompts when using Claude Code
    { key = "Enter", mods = "SHIFT", action = action({ SendString = "\x1b\r" }) },

    -- tmux-style utility bindings, mirroring tmux.conf's own prefix table
    { key = "Enter", mods = "LEADER", action = action.ActivateCopyMode },
    { key = "p", mods = "LEADER", action = action.PasteFrom("Clipboard") },
    { key = "R", mods = "LEADER", action = action.ReloadConfiguration },
    -- Quits the GUI client only; workspaces live on the "main" mux domain
    -- and keep running, so this is a tmux-style detach.
    { key = "q", mods = "LEADER", action = action.QuitApplication },
  }

  utils.append_to_list(config.keys, keys)
end

return module
