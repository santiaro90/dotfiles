local module = {}

module.apply = function(config)
  -- config.macos_window_background_blur = 15
  -- config.window_background_opacity = 0.95
  config.window_decorations = "RESIZE"
  config.window_padding = {
    left = "1cell",
    right = "1cell",
    top = "0",
    bottom = "0",
  }
end

return module
