local wezterm = require("wezterm")

local module = {}

-- tab_id -> true; read by ui.tab to render the attention marker
module.attention = {}

local on_bell = function(window, pane)
  local tab = pane:tab()
  if not tab then
    return
  end

  module.attention[tab:tab_id()] = true

  local active_tab = window:active_tab()
  local is_current = window:is_focused() and active_tab and active_tab:tab_id() == tab:tab_id()

  if not is_current then
    window:toast_notification("WezTerm", pane:get_title(), nil, 5000)
  end
end

module.apply = function(_)
  wezterm.on("bell", on_bell)
end

return module
