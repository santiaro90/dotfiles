local wezterm = require("wezterm")
local theme = require("ui.theme").window

local module = {}

local format_window_title = function(tab)
  local workspace = wezterm.mux.get_active_workspace()
  local cwd = tab.active_pane.current_working_dir
  local dir = cwd and cwd.file_path:gsub(os.getenv("HOME"), "~") or ""

  return workspace .. " — " .. dir
end

module.apply = function(config)
  wezterm.on("format-window-title", format_window_title)

  -- Don't forward wheel scroll as arrow keys to alt-screen apps (tmux); tmux
  -- has mouse off, so there's nothing useful for it to do with them anyway.
  config.alternate_buffer_wheel_scroll_speed = 0

  -- Don't dim/desaturate unfocused panes; every pane should render identically
  config.inactive_pane_hsb = { hue = 1.0, saturation = 1.0, brightness = 1.0 }

  -- Closing/quitting never prompts: panes live on the "main" mux domain,
  -- so nothing is actually lost.
  config.window_close_confirmation = "NeverPrompt"

  config.window_decorations = "RESIZE"
  config.window_padding = {
    left = "0.5cell",
    right = "0.5cell",
    top = "0.25cell",
    bottom = "0",
  }
  config.background = {
    {
      source = { Color = theme.background },
      width = "100%",
      height = "100%",
    },
  }
end

return module
