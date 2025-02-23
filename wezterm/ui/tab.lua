local wezterm = require("wezterm")

local module = {}

local get_tab_colours = function(is_active)
  local theme = require("ui.theme").tabs

  if is_active then
    return {
      title = theme.active_title,
      separator = theme.active_separator,
      number = theme.active_number,
    }
  end

  return {
    title = theme.title,
    separator = theme.separator,
    number = theme.number,
  }
end

local format_tab_title = function(tab)
  local colours = get_tab_colours(tab.is_active)
  local text_intensity = tab.is_active and "Bold" or "Half"

  local tab_number = tab.tab_index + 1
  local tab_title = tab.active_pane.title:gsub("Copy mode: ", "")

  return {
    { Background = { Color = colours.separator.background } },
    { Foreground = { Color = colours.separator.foreground } },
    { Text = " " },
    { Attribute = { Intensity = text_intensity } },
    { Background = { Color = colours.number.background } },
    { Foreground = { Color = colours.number.foreground } },
    { Text = " " .. tostring(tab_number) .. " " },
    { Background = { Color = colours.title.background } },
    { Foreground = { Color = colours.title.foreground } },
    { Text = " " .. tab_title .. " " },
  }
end

module.apply = function(config)
  wezterm.on("format-tab-title", format_tab_title)

  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = false
  config.show_new_tab_button_in_tab_bar = false
end

return module
