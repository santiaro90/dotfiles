vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- Swap : and ; in Normal/Visual mode
vim.keymap.set({ "n", "v" }, ":", ";")
vim.keymap.set({ "n", "v" }, ";", ":")

-- Editing
vim.keymap.set("i", "jk", "<Esc>")
-- -- Remove highlighting
vim.keymap.set("n", "<leader>c", ":noh<CR>", { desc = "Clear Search Term", silent = true })
-- -- Insert blank lines below/above
vim.keymap.set("n", "<leader>o", "@='mzo<C-V><ESC>`z'<CR>", { desc = "Insert Blank Line Below", silent = true })
vim.keymap.set("n", "<leader>O", "@='mzO<C-V><ESC>`z'<CR>", { desc = "Insert Blank Line Above", silent = true })

-- File movement
-- -- Centre screen on search results
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "G", "Gzz", { silent = true })
vim.keymap.set("n", "*", "*zz", { silent = true })
vim.keymap.set("n", "#", "#zz", { silent = true })

-- Windows
-- -- Movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move Left", silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move Down", silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move Up", silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move Right", silent = true })
-- -- Management
vim.keymap.set("n", "<leader>wo", ":only<CR>", { desc = "Close Other Windows", silent = true })
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Swap Left", silent = true })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Swap Down", silent = true })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Swap Up", silent = true })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Swap Right", silent = true })
-- -- Floating windows
vim.keymap.set({ "n", "i" }, "<C-[>", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)

    if config.relative ~= "" then -- is floating window
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Close Floating Windows", silent = true })

-- Command line movement
vim.keymap.set("c", "<C-a>", "<C-b>")
vim.keymap.set("c", "<C-b>", "<C-Left>")
vim.keymap.set("c", "<C-f>", "<C-Right>")

-- Buffers
-- -- Movement
vim.keymap.set("n", "L", ":bnext<CR>zz", { silent = true })
vim.keymap.set("n", "H", ":bprev<CR>zz", { silent = true })
-- -- Management
vim.keymap.set("n", "<leader>bd", ":bdel<CR>", { desc = "Close Buffer", silent = true })
vim.keymap.set("n", "<leader>bx", ":%bdel<CR>", { desc = "Close All Buffers", silent = false })
vim.keymap.set("n", "<leader>ba", "<C-^>", { desc = "Open Alternate Buffer", silent = true })
