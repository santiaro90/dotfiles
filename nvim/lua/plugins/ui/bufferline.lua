return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      { "catppuccin/nvim" },
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = function()
      local palette = require("catppuccin.palettes").get_palette()
      local bufferline_hl = require("catppuccin.special.bufferline").get_theme({
        custom = {
          all = {
            buffer = {
              bg = palette.mantle,
              fg = palette.subtext0,
            },
            buffer_selected = {
              bg = palette.surface2,
              fg = palette.text,
              style = { "bold" },
            },
            duplicate = {
              bg = palette.mantle,
              fg = palette.subtext0,
              style = { "italic" },
            },
            duplicate_selected = {
              bg = palette.surface2,
              fg = palette.text,
              style = { "italic" },
            },
            indicator_selected = {
              bg = palette.surface2,
              sp = palette.peach,
            },
            modified = {
              bg = palette.mantle,
              fg = palette.peach,
            },
            modified_selected = {
              bg = palette.surface2,
            },
            tab = {
              bg = palette.mantle,
              fg = palette.subtext0,
            },
            tab_selected = {
              bg = palette.peach,
              fg = palette.crust,
              style = { "bold" },
            },
          },
        },
      })

      return {
        highlights = bufferline_hl,
        options = {
          indicator = {
            icon = "▎",
            style = "icon",
          },
          modified_icon = "+",
          offsets = {
            {
              filetype = "neo-tree",
              separator = false,
              text = "File Explorer",
            },
          },
          separator_style = { "", "" },
          show_buffer_close_icons = false,
          show_buffer_icons = false,
          show_close_icon = false,
          tab_size = 16,
          truncate_names = false,
        },
      }
    end,
  },
}
