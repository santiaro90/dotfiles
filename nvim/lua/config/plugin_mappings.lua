return {
  ["<leader>."] = {
    name = "Neotree",
    ['.'] = { ":Neotree toggle filesystem<CR>", "Open File Explorer" },
  },
  ["<leader>d"] = {
    name = "Diagnostics",
    d = { ":Trouble document_diagnostics<CR>", "Open Document Diagnostics" },
    p = { ":Trouble workspace_diagnostics<CR>", "Open Project Diagnostics" },
  },
  ["<leader>g"] = {
    name = "Git",
    ["["] = { ":Gitsigns prev_hunk<CR>", "Previous Change" },
    ["]"] = { ":Gitsigns next_hunk<CR>", "Next Change" },
    d = { ":Gvdiffsplit<CR>", "Git Diff" },
    h = { ":Gitsigns preview_hunk_inline<CR>", "Preview Change" },
    p = { ":Gitsigns stage_hunk<CR>", "Stage Change" },
    r = { ":Gread<CR>", "Git Reset File" },
    s = { ":Git<CR>", "Git Status" },
    u = { ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Change" },
    w = { ":Gwrite<CR>", "Git Add File" },
  },
  ["<leader>l"] = {
    name = "LSP",
    d = { ":Lspsaga goto_type_definition<CR>", "Go to Definition" },
    f = { ":Lspsaga lsp_finder<CR>", "See References" },
    k = { ":Lspsaga hover_doc<CR>", "Show Docs" },
    r = { ":Lspsaga rename<CR>", "Rename" },
    s = { ":Lspsaga outline<CR>", "See Document Symbols" },
    t = { ":Lspsaga goto_type_definition<CR>", "Go to Type Definition" },
  },
  ["<leader>s"] = {
    d = { ":Telescope buffers<CR>", "Search Buffers" },
    f = { ":Telescope find_files hidden=true<CR>", "Search Files" },
    h = { ":Telescope oldfiles<CR>", "Search History Files" },
    p = { ":Telescope live_grep<CR>", "Search String in Project" },
  },
  ["<leader>t"] = {
    name = "Terminal",
    t = { ":ToggleTerm<CR>", "Toggle Terminal" },
  },
}
