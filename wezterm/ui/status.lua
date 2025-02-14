local theme = require("ui.theme")
local wezterm = require("wezterm")

local module = {}

local update_left_status = function(window, pane)
  local cwd = pane:get_current_working_dir()

  if not cwd then
    return
  end

  window:set_left_status(wezterm.format({
    { Background = { Color = theme.palette.surface0 } },
    { Foreground = { Color = theme.palette.yellow } },
    { Attribute = { Intensity = "Bold" } },
    { Text = " " },
    { Text = wezterm.nerdfonts.custom_folder_open },
    { Text = " " .. cwd.file_path:gsub(os.getenv("HOME"), "~") .. " " },
    { Background = { Color = theme.palette.crust } },
    { Text = " " },
  }))
end

local update_right_status = function(window, pane)
  local key_table = window:active_key_table() or ""
  local separator = #key_table > 0 and " " or ""

  window:set_right_status(wezterm.format({
    { Background = { Color = theme.palette.mauve } },
    { Foreground = { Color = theme.palette.crust } },
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
