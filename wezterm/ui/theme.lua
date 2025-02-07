local wezterm = require("wezterm")
local module = {}

module.apply = function(config)
  config.color_scheme = "Catppuccin Frappe"
  config.cursor_thickness = 2
  config.default_cursor_style = "SteadyBar"
  config.font = wezterm.font_with_fallback({
    {
      family = "JetBrains Mono",
      weight = "Medium",
    },
    {
      family = "FiraCode Nerd Font",
      weight = "Medium",
    },
  })
  config.font_size = 20.0
end

return module
