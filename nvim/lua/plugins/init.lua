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
for prefix, mapping in pairs(mappings) do
  for k, def in pairs(mapping) do
    if k ~= "name" then
      local mode = def["mode"] or "n"

      ---@diagnostic disable-next-line: param-type-mismatch,deprecated
      vim.keymap.set(mode, prefix .. k, def[1], {
        desc = def[2] or nil,
        silent = true,
      })
    end
  end
end
