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
          StaticMethod = { icon = "󰠄 ", hl = "Function" },
        },
      },
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
  },
}
