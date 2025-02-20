return {
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = {
      open_cmd = "noswapfile vnew",
    },
  },
  {
    "echasnovski/mini.splitjoin",
    opts = {
      mappings = {
        toggle = "",
        split = "gS",
        join = "gJ",
      },
    },
  },
}
