local vscode = require("vscode")

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- Swap : and ; in Normal/Visual mode
vim.keymap.set({ "n", "v" }, ":", ";")
vim.keymap.set({ "n", "v" }, ";", ":")

-- Remove highlighting
vim.keymap.set("n", "<leader>c", function ()
  vim.cmd("noh")
end, { silent = true })

-- Insert blank lines below/above
vim.keymap.set("n", "<leader>o", "@='mzo<C-V><ESC>`z'<CR>", { silent = true })
vim.keymap.set("n", "<leader>O", "@='mzO<C-V><ESC>`z'<CR>", { silent = true })

-- Splits
vim.keymap.set("n", "<leader>-", function ()
  vscode.call("workbench.action.splitEditorDown")
end)

vim.keymap.set("n", "<leader>\\", function ()
  vscode.call("workbench.action.splitEditorRight")
end)

-- Window movement
vim.keymap.set("n", "<C-h>", function ()
  vscode.call("workbench.action.navigateLeft")
end)

vim.keymap.set("n", "<C-j>", function ()
  vscode.call("workbench.action.navigateDown")
end)

vim.keymap.set("n", "<C-k>", function ()
  vscode.call("workbench.action.navigateUp")
end)

vim.keymap.set("n", "<C-l>", function ()
  vscode.call("workbench.action.navigateRight")
end)

-- Tab movement
vim.keymap.set("n", "L", function ()
  vscode.call("workbench.action.nextEditor")
end)

vim.keymap.set("n", "H", function ()
  vscode.call("workbench.action.previousEditor")
end)

-- Command palette
vim.keymap.set("n", "<C-p>", function ()
  vscode.call("workbench.action.quickOpen")
end)

vim.keymap.set("n", "<C-S-p>", function ()
  vscode.call("workbench.action.showCommands")
end)

-- Panels
-- -- Sidebar
-- vim.keymap.set("n", "<leader>..", function ()
  -- vscode.eval_async([[
  --   const isExplorerVisible = vscode.workspace.getConfiguration('explorer').get('openEditors.visible') > 0;
  --   if (!isExplorerVisible) {
  --     return await vscode.commands.executeCommand('workbench.view.explorer');
  --   } else {
  --     return await vscode.commands.executeCommand('workbench.action.closeSidebar');
  --   }
  -- ]])
-- end)

-- -- Bottom panel
vim.keymap.set("n", "<C-[>", function ()
  vscode.call("workbench.action.closePanel")
end)