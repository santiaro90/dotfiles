return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        {
          path = "luvit-meta/library",
          words = { "vim%.uv" },
        },
      },
    },
  },
  {
    "Bilal2453/luvit-meta",
    lazy = true,
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      -- Mason package names (different from LSP server names)
      local servers = {
        "bash-language-server",
        "eslint-lsp",
        "lua-language-server",
        "pyright",
        "ruff",
        "typescript-language-server",
      }

      -- Combine all tools for installation
      local formatters = require("config.formatters")
      local ensure_installed = vim.list_extend(vim.list_slice(servers), formatters)

      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    end,
  },
}
