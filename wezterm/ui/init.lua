local module = {}

module.apply = function(config)
  require("ui.theme").apply(config)
  require("ui.window").apply(config)

  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = true
end

return module
