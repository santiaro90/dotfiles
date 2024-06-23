vscode = require("vscode")

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- Swap : and ; in Normal/Visual mode
vim.keymap.set({ "n", "v" }, ":", ";")
vim.keymap.set({ "n", "v" }, ";", ":")

-- -- Insert blank lines below/above
vim.keymap.set("n", "<leader>o", "@='mzo<C-V><ESC>`z'<CR>", { silent = true })
vim.keymap.set("n", "<leader>O", "@='mzO<C-V><ESC>`z'<CR>", { silent = true })

-- File movement
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })

-- Window movement
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Tab movement
vim.keymap.set("n", "L", function ()
  vscode.call("workbench.action.nextEditor")
end, { silent = true })

vim.keymap.set("n", "H", function ()
  vscode.call("workbench.action.nextEditor")
end, { silent = true })
