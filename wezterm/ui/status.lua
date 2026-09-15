local notify = require("ui.notify")
local palette = require("ui.theme").palette
local theme = require("ui.theme").status
local wezterm = require("wezterm")

local module = {}

local update_left_status = function(window, pane)
  local cwd = pane:get_current_working_dir()

  if not cwd then
    return
  end

  window:set_left_status(wezterm.format({
    { Background = { Color = theme.session.background } },
    { Foreground = { Color = theme.session.foreground } },
    { Attribute = { Intensity = "Bold" } },
    { Text = " " },
    { Text = wezterm.nerdfonts.cod_layout_panel_right },
    { Text = " " .. wezterm.mux.get_active_workspace() .. " " },
    { Background = { Color = theme.session.background } },
    { Foreground = { Color = theme.left.background } },
    { Text = wezterm.nerdfonts.ple_lower_right_triangle },
    { Background = { Color = theme.left.background } },
    { Foreground = { Color = theme.left.foreground } },
    { Attribute = { Intensity = "Bold" } },
    { Text = " " },
    { Text = wezterm.nerdfonts.custom_folder_open },
    { Attribute = { Italic = true } },
    { Text = " " .. cwd.file_path:gsub("(.)/$", "%1"):gsub(os.getenv("HOME"), "~") .. " " },
    { Background = { Color = theme.left_separator.background } },
    { Foreground = { Color = theme.left.background } },
    { Text = wezterm.nerdfonts.ple_upper_left_triangle },
    "ResetAttributes",
    { Text = " " },
  }))
end

local update_right_status = function(window, pane)
  notify.mark_seen(pane)

  local key_table = window:active_key_table() or ""
  local separator = #key_table > 0 and " " or ""

  local elements = {}

  -- Workspaces waiting on you, the only signal that a background workspace gets.
  -- Listed by name because the workspace picker (leader o) is how you get there.
  for _, workspace in ipairs(notify.pending_workspaces()) do
    table.insert(elements, { Background = { Color = theme.left_separator.background } })
    table.insert(elements, { Foreground = { Color = palette.yellow } })
    table.insert(elements, { Attribute = { Intensity = "Bold" } })
    table.insert(elements, { Text = " " .. wezterm.nerdfonts.md_bell_ring .. " " .. workspace .. " " })
  end

  table.insert(elements, { Background = { Color = theme.right.background } })
  table.insert(elements, { Foreground = { Color = theme.right.foreground } })
  table.insert(elements, { Text = separator })
  table.insert(elements, { Attribute = { Intensity = "Bold" } })
  table.insert(elements, { Text = key_table:upper() })
  table.insert(elements, { Text = separator })

  window:set_right_status(wezterm.format(elements))
end

module.apply = function(_)
  wezterm.on("update-status", update_left_status)
  wezterm.on("update-right-status", update_right_status)
end

return module
