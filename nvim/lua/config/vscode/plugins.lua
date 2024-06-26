local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Load plugins specs
require("lazy").setup({
  spec = {
    {
      "echasnovski/mini.ai",
      event = "VeryLazy",
      opts = {},
    },
    {
      "echasnovski/mini.surround",
      opts = {
        mappings = {
          add = "ys",
          delete = "ds",
          find = "",
          find_left = "",
          highlight = "",
          replace = "cs",
          update_n_lines = "",
        },
      },
      init = function()
          vim.keymap.set("n", "yss", "ys_", { remap = true })
      end,
    },
  },
  defaults = {
    lazy = false,
  },
})
