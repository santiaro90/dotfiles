local mappings = require("config.plugin_mappings")
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
    { import = "plugins.colourscheme" },
    { import = "plugins.treesitter" },
    { import = "plugins.telescope" },
    { import = "plugins.lsp" },
    { import = "plugins.code_quality" },
    { import = "plugins.completion" },
    { import = "plugins.git" },
    { import = "plugins.editing" },
    { import = "plugins.ui" },
  },
  defaults = {
    lazy = false,
  },
  install = {
    missing = true,
  },
  checker = {
    enabled = false,
  },
})

vim.cmd.colorscheme("catppuccin-frappe")

-- Load plugin mappings and make them available
-- for which-key to document
for _, mapping in ipairs(mappings) do
  if not mapping.group then
    local keystroke = mapping[1]
    local cmd = mapping[2]
    local opts = {
      desc = mapping.desc or nil,
      silent = true,
    }

    vim.keymap.set("n", keystroke, cmd, opts)
  end
end
