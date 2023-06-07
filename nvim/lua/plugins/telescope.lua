return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    opts = function ()
      local actions = require("telescope.actions")
      local layout_actions = require("telescope.actions.layout")

      return {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.preview_scrolling_down,
              ["<C-k>"] = actions.preview_scrolling_up,
              ["<C-t>"] = layout_actions.toggle_preview,
              ["<C-u>"] = false,
              ["<C-[>"] = actions.close,
            },
          },
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
