return {
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
}
