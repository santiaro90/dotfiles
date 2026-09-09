local theme = require("ui.theme").window

local module = {}

module.apply = function(config)
  -- Don't forward wheel scroll as arrow keys to alt-screen apps (tmux); tmux
  -- has mouse off, so there's nothing useful for it to do with them anyway.
  config.alternate_buffer_wheel_scroll_speed = 0

  config.window_decorations = "RESIZE"
  config.window_padding = {
    left = "0.5cell",
    right = "0.5cell",
    top = "0.25cell",
    bottom = "0",
  }
  config.background = {
    {
      source = { Color = theme.background },
      width = "100%",
      height = "100%",
    },
  }
end

return module
