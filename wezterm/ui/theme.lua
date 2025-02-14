local wezterm = require("wezterm")

local module = {}
local palette = {
  base = "#303446",
  blue = "#8caaee",
  crust = "#232634",
  flamingo = "#eebebe",
  green = "#a6d189",
  lavender = "#babbf1",
  mantle = "#292c3c",
  maroon = "#ea999c",
  mauve = "#ca9ee6",
  overlay0 = "#737994",
  overlay1 = "#838ba7",
  overlay2 = "#949cbb",
  peach = "#ef9f76",
  pink = "#f4b8e4",
  red = "#e78284",
  rosewater = "#f2d5cf",
  sapphire = "#85c1dc",
  sky = "#99d1db",
  subtext0 = "#a5adce",
  subtext1 = "#b5bfe2",
  surface0 = "#414559",
  surface1 = "#51576d",
  surface2 = "#626880",
  teal = "#81c8be",
  text = "#c6d0f5",
  yellow = "#e5c890",
}

module.palette = palette
module.tabs = {
  active_tab = {
    background = palette.peach,
    foreground = palette.crust,
  },
  active_tab_separator = {
    background = palette.crust,
    foreground = palette.peach,
  },
  tab = {
    background = palette.surface0,
    foreground = palette.text,
  },
  tab_separator = {
    background = palette.crust,
    foreground = palette.surface0,
  },
}

module.status = {
  left = {
    background = palette.surface0,
    foreground = palette.yellow,
  },
  left_separator = {
    background = palette.crust,
  },
  right = {
    background = palette.mauve,
    foreground = palette.crust,
  },
}

module.apply = function(config)
  config.color_scheme = "Catppuccin Frappe"
  config.font = wezterm.font_with_fallback({
    {
      family = "JetBrains Mono",
      weight = "Medium",
    },
    {
      family = "InconsolataGo Nerd Font Mono",
      scale = 1.4,
    },
  })

  config.command_palette_font_size = 20
  config.font_size = 20
end

return module
