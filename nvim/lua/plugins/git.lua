return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = true,
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "┃" },
        untracked = { text = "┃" },
      },
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  {
    "tpope/vim-fugitive",
  },
}
