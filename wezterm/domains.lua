local module = {}

module.apply = function(config)
  -- Workspaces live in this mux domain, so they survive quitting/closing
  -- wezterm-gui (tmux-style detach/attach) instead of dying with the window.
  config.unix_domains = {
    { name = "main" },
  }

  -- Launching wezterm with no args attaches to it, same as `wezterm connect main`.
  config.default_gui_startup_args = { "connect", "main" }
end

return module
