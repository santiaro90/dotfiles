return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    version = "*",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "MunifTanjim/nui.nvim" },
    },
    opts = {
      enable_diagnostics = true,
      filesystem = {
        use_libuv_file_watcher = true,
      },
      sources = {
        "filesystem",
      },
      window = {
        mappings = {
          ["<C-[>"] = "close_window",
          ["<Space>"] = "none",
          ["o"] = "toggle_node",
          ["u"] = "navigate_up",
          ["w"] = "none",
        },
      },
      default_component_configs = {
        icon = {
          folder_empty = "",
          folder_empty_open = "󰷏",
        },
      },
      document_symbols = {
        kinds = {
          File = { icon = "󰈙", hl = "Tag" },
          Namespace = { icon = "󰌗", hl = "Include" },
          Package = { icon = "󰏖", hl = "Label" },
          Class = { icon = "󰌗", hl = "Include" },
          Property = { icon = "󰆧", hl = "@property" },
          Enum = { icon = "󰒻", hl = "@number" },
          Function = { icon = "󰊕", hl = "Function" },
          String = { icon = "󰀬", hl = "String" },
          Number = { icon = "󰎠", hl = "Number" },
          Array = { icon = "󰅪", hl = "Type" },
          Object = { icon = "󰅩", hl = "Type" },
          Key = { icon = "󰌋", hl = "" },
          Struct = { icon = "󰌗", hl = "Type" },
          Operator = { icon = "󰆕", hl = "Operator" },
          TypeParameter = { icon = "󰊄", hl = "Type" },
          StaticMethod = { icon = '󰠄 ', hl = 'Function' },
        },
      },
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
  },
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
          lualine_b = { "branch", "diff" },
          lualine_c = { "diagnostics" },
          lualine_x = {},
          lualine_y = { "filetype" },
          lualine_z = { "location" },
        },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      { "catppuccin/nvim" },
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = function()
      local palette = require("catppuccin.palettes").get_palette()
      local bufferline_hl = require("catppuccin.groups.integrations.bufferline").get {
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
            modified = {
              bg = palette.mantle,
              fg = palette.peach,
            },
            modified_selected = {
              bg = palette.surface2,
            },
          }
        }
      }

      return {
        highlights = bufferline_hl,
        options = {
          indicator = {
            icon = "▐",
          },
          offsets = {
            {
              filetype = "neo-tree",
              separator = true
            },
          },
          separator_style = "thick",
          show_buffer_close_icons = false,
          show_buffer_icons = false,
          show_close_icon = false,
          tab_size = 16,
        }
      }
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      auto_close = true,
      focus = true,
      keys = {
        ["<C-["] = "close",
        ["zi"] = "fold_toggle",
      },
      use_diagnostic_signs = true,
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = function()
      return {
        definition = {
          keys = { quit = '<C-[>' },
        },
        finder = {
          keys = { quit = '<C-[>', toggle_or_open = 'o' },
        },
        outline = {
          keys = { jump = '<CR>', quit = '<C-[>', toggle_or_jump = 'o' },
          layout = "float",
        },
        rename = {
          keys = { quit = '<C-[>' },
        },
        lightbulb = {
          virtual_text = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
        ui = {
          title = false,
        },
      }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
  },
}
