local wezterm = require("wezterm")
local action = wezterm.action

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

-- Attention that survives a workspace boundary.
--
-- The bell above cannot: wezterm delivers bell (and every other pane event) only
-- for panes the gui is currently showing, and a background workspace has no gui
-- window at all. So the tab marker never fires for the case you most need it —
-- something finishing in a workspace you are not looking at.
--
-- A user var does cross, because it is mux state rather than an event: this
-- reads panes in every workspace. attention.sh raises the flag; its value is a
-- nonce, so raising it twice registers twice.
local seen = {}

-- Called with the focused pane on every status update: being looked at is what
-- clears the flag.
module.mark_seen = function(pane)
  local vars = pane:get_user_vars()
  if vars and vars.attention then
    seen[pane:pane_id()] = vars.attention
  end
end

-- Every pane still waiting, in mux order.
local pending_panes = function()
  local panes = {}

  for _, mux_window in ipairs(wezterm.mux.all_windows()) do
    local workspace = mux_window:get_workspace()

    for _, tab in ipairs(mux_window:tabs()) do
      for _, mux_pane in ipairs(tab:panes()) do
        local vars = mux_pane:get_user_vars()
        local flag = vars and vars.attention

        if flag and flag ~= "" and seen[mux_pane:pane_id()] ~= flag then
          table.insert(panes, { workspace = workspace, tab = tab })
        end
      end
    end
  end

  return panes
end

-- Workspace names with a pane still waiting, deduplicated.
module.pending_workspaces = function()
  local found, workspaces = {}, {}

  for _, entry in ipairs(pending_panes()) do
    if not found[entry.workspace] then
      found[entry.workspace] = true
      table.insert(workspaces, entry.workspace)
    end
  end

  return workspaces
end

-- Go to the oldest pane still waiting. Arriving clears that pane's flag, so
-- pressing the key again lands on the next one and eventually stops moving.
module.focus_next_pending = function(window, pane)
  local next_pending = pending_panes()[1]

  if not next_pending then
    return
  end

  -- Same ordering trap as on_user_var below: select the tab first, because
  -- SwitchToWorkspace restores whichever tab that workspace last had active.
  next_pending.tab:activate()
  window:perform_action(action.SwitchToWorkspace({ name = next_pending.workspace }), pane)
end

-- Jump to a pane in whichever workspace it lives in. Driven by focus-pane.sh;
-- see that script for why the request arrives as a user var rather than through
-- `wezterm cli`.
--
-- `target` is a wezterm cli pane id, which is useless here: the gui and the mux
-- server number panes in separate id spaces, so cli pane 52 is pane 65 to this
-- code. zsh/zshrc bridges them, stamping each shell's own cli id onto its pane
-- as the wezterm-pane user var, which is readable from either side.
local on_user_var = function(window, pane, name, value)
  if name ~= "focus-pane" then
    return
  end

  local workspace, target = value:match("^(.-)|(%d+)|")
  if not workspace or workspace == "" then
    return
  end

  -- Select the tab before switching, not after: SwitchToWorkspace restores
  -- whichever tab that workspace last had active, so a selection made after it
  -- is immediately undone.
  for _, mux_window in ipairs(wezterm.mux.all_windows()) do
    for _, tab in ipairs(mux_window:tabs()) do
      for _, mux_pane in ipairs(tab:panes()) do
        local vars = mux_pane:get_user_vars()
        if vars and vars["wezterm-pane"] == target then
          tab:activate()
        end
      end
    end
  end

  window:perform_action(action.SwitchToWorkspace({ name = workspace }), pane)
end

module.apply = function(_)
  wezterm.on("bell", on_bell)
  wezterm.on("user-var-changed", on_user_var)
end

return module
