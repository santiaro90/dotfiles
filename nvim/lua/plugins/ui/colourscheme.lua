return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  { "marko-cerovac/material.nvim" },
  { "sainnhe/edge" },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "warm",
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}
