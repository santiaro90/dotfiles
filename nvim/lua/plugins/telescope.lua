return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<C-p>", ":Telescope find_files hidden=true<CR>", desc = "Search Files" }
    },
    opts = function ()
      local actions = require("telescope.actions")
      local layout_actions = require("telescope.actions.layout")

      return {
        defaults = {
          file_ignore_patterns = {
            "*-lock*",
            "*.lock",
            ".git",
            "build",
            "dist",
            "node_modules",
          },
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
