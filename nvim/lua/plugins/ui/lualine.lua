return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      { "catppuccin/nvim" },
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = function()
      local palette = require("catppuccin.palettes").get_palette()
      local theme = require("catppuccin.utils.lualine")()

      theme.normal.a = {
        bg = palette.surface2,
        fg = palette.text,
        gui = "bold",
      }

      return {
        options = {
          theme = theme,
          component_separators = "",
          section_separators = "",
          disabled_filetypes = {
            statusline = { "neo-tree" },
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "branch", icon = "" },
            "diff",
          },
          lualine_c = {
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = "󰌶 " },
            },
          },
          lualine_x = { "copilot" },
          lualine_y = { "filetype" },
          lualine_z = { "location" },
        },
      }
    end,
  },
  {
    "AndreM222/copilot-lualine",
    dependencies = {
      { "nvim-lualine/lualine.nvim" },
    },
  },
}
