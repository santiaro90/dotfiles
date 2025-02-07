local module = {}

module.apply = function(config)
  config.leader = { key = "'", mods = "CTRL", timeout_milliseconds = 500 }
  config.keys = {}
  config.key_tables = {}

  require("keybindings.panes").apply(config)
end

return module
