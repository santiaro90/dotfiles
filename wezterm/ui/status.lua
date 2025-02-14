local theme = require("ui.theme").status
local wezterm = require("wezterm")

local module = {}

local update_left_status = function(window, pane)
  local cwd = pane:get_current_working_dir()

  if not cwd then
    return
  end

  window:set_left_status(wezterm.format({
    { Background = { Color = theme.left.background } },
    { Foreground = { Color = theme.left.foreground } },
    { Attribute = { Intensity = "Bold" } },
    { Text = " " },
    { Text = wezterm.nerdfonts.custom_folder_open },
    { Text = " " .. cwd.file_path:gsub(os.getenv("HOME"), "~") .. " " },
    { Background = { Color = theme.left_separator.background } },
    { Text = " " },
  }))
end

local update_right_status = function(window, pane)
  local key_table = window:active_key_table() or ""
  local separator = #key_table > 0 and " " or ""

  window:set_right_status(wezterm.format({
    { Background = { Color = theme.right.background } },
    { Foreground = { Color = theme.right.foreground } },
    { Text = separator },
    { Attribute = { Intensity = "Bold" } },
    { Text = key_table:upper() },
    { Text = separator },
  }))
end

module.apply = function(_)
  wezterm.on("update-status", update_left_status)
  wezterm.on("update-right-status", update_right_status)
end

return module
