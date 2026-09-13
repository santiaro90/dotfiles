local utils = require("utils")
local module = {}

module.apply = function(config)
  utils.apply_modules(config, {
    "ui.notify",
    "ui.status",
    "ui.tab",
    "ui.theme",
    "ui.window",
  })

  config.default_cursor_style = "SteadyBlock"
  config.term = "xterm-256color"
end

return module
