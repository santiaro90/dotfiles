local module = {}

module.apply = function(config)
  config.window_decorations = "RESIZE"
  config.window_padding = {
    left = "0.5cell",
    right = "0.5cell",
    top = "0.25cell",
    bottom = "0",
  }
end

return module
