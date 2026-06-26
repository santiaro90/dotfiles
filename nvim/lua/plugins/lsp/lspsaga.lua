return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {
      definition = {
        keys = { quit = "<C-[>" },
      },
      finder = {
        keys = { quit = "<C-[>", toggle_or_open = "o" },
      },
      outline = {
        keys = { jump = "<CR>", quit = "<C-[>", toggle_or_jump = "o" },
        layout = "float",
        -- Show only functions, classes, methods, constructors, interfaces
        symbol_filter = {
          ignore = {
            "Variable", "Constant", "Property", "Field", "EnumMember",
            "Module", "Namespace", "Package", "File", "String", "Number",
            "Boolean", "Array", "Object", "Key", "Null", "Event",
            "Operator", "TypeParameter", "Enum",
          },
        },
      },
      rename = {
        keys = { quit = "<C-[>" },
      },
      lightbulb = {
        virtual_text = false,
        sign = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
      ui = {
        title = false,
      },
    },
  },
}
