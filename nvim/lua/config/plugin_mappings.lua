return {
  ["<leader>l"] = {
    name = "LSP",
    d = { ":Lspsaga goto_type_definition<CR>", "Go to Definition" },
    r = { ":Lspsaga lsp_finder<CR>", "See References" },
    s = { ":Lspsaga outline<CR>", "See Document Symbols" },
    t = { ":Lspsaga goto_type_definition<CR>", "Go to Type Definition" },
    k = { ":Lspsaga hover_doc<CR>", "Show Docs" },
  },
  ["<leader>."] = {
    name = "Neotree",
    ['.'] = { ":Neotree toggle filesystem<CR>", "Open File Explorer" },
  },
  ["<leader>g"] = {
    name = "Git",
    s = { ":Git<CR>", "Git Status" },
    d = { ":Gvdiffsplit<CR>", "Git Diff" },
    w = { ":Gwrite<CR>", "Git Add File" },
    r = { ":Gread<CR>", "Git Reset File" },
    h = { ":Gitsigns preview_hunk_inline<CR>", "Preview Change" },
    p = { ":Gitsigns stage_hunk<CR>", "Stage Change" },
    u = { ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Change" },
  },
  ["<leader>d"] = {
    name = "Diagnostics",
    d = { ":Trouble document_diagnostics<CR>", "Open Document Diagnostics" },
    p = { ":Trouble workspace_diagnostics<CR>", "Open Project Diagnostics" },
  },
  ["<leader>s"] = {
    d = { ":Telescope buffers<CR>", "Search Buffers" },
    f = { ":Telescope find_files<CR>", "Search Files" },
    h = { ":Telescope oldfiles<CR>", "Search History Files" },
    p = { ":Telescope live_grep<CR>", "Search String in Project" },
  },
}
