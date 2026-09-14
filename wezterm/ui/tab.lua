local wezterm = require("wezterm")
local notify = require("ui.notify")
local palette = require("ui.theme").palette

local module = {}

local format_tab_title = function(tab, tabs)
  if tab.is_active then
    notify.attention[tab.tab_id] = nil
  end

  local tab_number = tab.tab_index + 1
  local is_first = tab_number == 1
  local is_last = tab_number == #tabs

  local colours = require("ui.theme").tabs(tab.is_active, is_first)
  local text_intensity = tab.is_active and "Bold" or "Half"

  -- A manually-set title (leader ,) sticks; otherwise fall back to the
  -- active pane's title, which changes with every command.
  local tab_title = tab.tab_title ~= "" and tab.tab_title
    or tab.active_pane.title:gsub("Copy mode: ", "")
  tab_title = wezterm.truncate_right(tab_title, 24)

  local elements = {
    { Background = { Color = colours.separator_left.background } },
    { Foreground = { Color = colours.separator_left.foreground } },
    { Text = "" },
    { Attribute = { Intensity = text_intensity } },
    { Background = { Color = colours.number.background } },
    { Foreground = { Color = colours.number.foreground } },
    { Text = " " .. tostring(tab_number) .. " " },
    { Background = { Color = colours.separator_right.background } },
    { Foreground = { Color = colours.separator_right.foreground } },
    { Text = " " },
    { Attribute = { Italic = not tab.is_active } },
    { Background = { Color = colours.title.background } },
    { Foreground = { Color = colours.title.foreground } },
    { Text = tab_title .. " " },
    { Attribute = { Italic = false } },
    { Background = { Color = palette.crust } },
    { Foreground = { Color = colours.title.background } },
    { Text = is_last and "" or "" },
  }

  if notify.attention[tab.tab_id] then
    table.insert(elements, { Background = { Color = colours.title.background } })
    table.insert(elements, { Foreground = { Color = palette.yellow } })
    table.insert(elements, { Text = "● " })
  end

  return elements
end

module.apply = function(config)
  wezterm.on("format-tab-title", format_tab_title)

  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = false
  config.show_new_tab_button_in_tab_bar = false
  config.tab_max_width = 32
end

return module
