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

local format_tab_title = function(tab)
  local colours = get_tab_colours(tab.is_active)
  local text_intensity = tab.is_active and "Bold" or "Half"

  local tab_number = tab.tab_index + 1
  local tab_title = tab.active_pane.title:gsub("Copy mode: ", "")

  return {
    colours.background,
    colours.foreground,
    { Attribute = { Intensity = text_intensity } },
    { Text = " " .. tab_number .. ":" .. tab_title .. " " },
    colours.separator_background,
    colours.separator_foreground,
    { Text = " " },
  }
end

module.apply = function(config)
  wezterm.on("format-tab-title", format_tab_title)

  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = false
  config.show_new_tab_button_in_tab_bar = false
end

return module
