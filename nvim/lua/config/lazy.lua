local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Load plugins specs
require("lazy").setup("plugins")

vim.cmd.colorscheme("catppuccin-frappe")

-- Load plugin mappings and make them available
-- for which-key to document
local mappings = require("config.plugin_mappings")
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
