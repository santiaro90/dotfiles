local mappings = require("config.plugin_mappings")

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = {
        ellipsis = "...",
        group = "",
        mappings = false,
      },
      plugins = {
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
        },
        registers = false,
        spelling = false,
      },
      spec = mappings,
    },
  },
}
