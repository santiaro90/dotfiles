return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  opts = {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    ensure_installed = {
      "bash",
      "javascript",
      "json",
      "json5",
      "jsonc",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      }
    }
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
