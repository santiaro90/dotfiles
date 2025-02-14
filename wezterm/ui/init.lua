local utils = require("utils")
local module = {}

module.apply = function(config)
  utils.apply_modules(config, {
    "ui.status",
    "ui.tab",
    "ui.theme",
    "ui.window",
  })

  config.default_cursor_style = "SteadyBlock"
end

return module
