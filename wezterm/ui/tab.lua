local wezterm = require("wezterm")
local module = {}

local get_tab_colours = function(is_active)
  local theme = require("ui.theme").tabs

  local background = theme.tab.background
  local foreground = theme.tab.foreground
  local separator_background = theme.tab_separator.background
  local separator_foreground = theme.tab_separator.foreground

  if is_active then
    background = theme.active_tab.background
    foreground = theme.active_tab.foreground
    separator_background = theme.active_tab_separator.background
    separator_foreground = theme.active_tab_separator.foreground
  end

  return {
    background = { Background = { Color = background } },
    foreground = { Foreground = { Color = foreground } },
    separator_background = { Background = { Color = separator_background } },
    separator_foreground = { Foreground = { Color = separator_foreground } },
  }
end

local format_tab = function(tab, tabs)
  local is_first = tab.tab_index == 0
  local is_last = tab.tab_index == #tabs - 1
  local tab_number = tab.tab_index + 1

  local title = { Text = " " .. tab_number .. ":" .. tab.active_pane.title .. " " }

  local left_separator = { Text = is_first and "" or "" }
  local rigth_separator = { Text = is_last and "" or "" }

  local colours = get_tab_colours(tab.is_active)
  local text_intensity = tab.is_active and "Bold" or "Half"

  return {
    colours.separator_background,
    colours.separator_foreground,
    left_separator,
    colours.background,
    colours.foreground,
    { Attribute = { Intensity = text_intensity } },
    title,
    colours.separator_background,
    colours.separator_foreground,
    rigth_separator,
  }
end

module.apply = function(config)
  wezterm.on("format-tab-title", format_tab)

  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = true
  config.show_new_tab_button_in_tab_bar = false
end

return module
