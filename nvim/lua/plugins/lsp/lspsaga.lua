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
