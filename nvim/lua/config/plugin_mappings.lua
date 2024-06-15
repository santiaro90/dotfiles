return {
  ["<leader>."] = {
    name = "Neotree",
    ["."] = { ":Neotree toggle filesystem<CR>", "Open File Explorer" },
  },
  ["<leader>f"] = {
    name = "Format",
    d = {
      function()
        require("conform").format({ async = true, timeout_ms = 10000 })
      end,
      "All Buffer",
    },
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
    x = { ":GDelete<CR>", "Git Remove File" },
  },
  ["g"] = {
    name = "Go to",
    d = { ":Lspsaga goto_definition<CR>", "Definition" },
    r = { ":Lspsaga finder<CR>", "References" },
    s = { ":Lspsaga outline<CR>", "Document Symbols" },
    t = { ":Lspsaga goto_type_definition<CR>", "Type Definition" },
  },
  ["<leader>l"] = {
    name = "LSP",
    d = { ":Lspsaga goto_definition<CR>", "Go to Definition" },
    f = { ":Lspsaga finder<CR>", "Find References" },
    k = { ":Lspsaga hover_doc<CR>", "Show Docs" },
    r = { ":Lspsaga rename<CR>", "Rename" },
    s = { ":Lspsaga outline<CR>", "See Document Symbols" },
    t = { ":Lspsaga goto_type_definition<CR>", "Go to Type Definition" },
  },
  ["<leader>p"] = {
    name = "Diagnostics",
    d = { ":Trouble diagnostics filter.buf=0<CR>", "Open Document Diagnostics" },
    p = { ":Trouble diagnostics<CR>", "Open Project Diagnostics" },
  },
  ["<leader>s"] = {
    name = "FZF",
    d = { ":FzfLua buffers<CR>", "Search Buffers" },
    f = { ":FzfLua files<CR>", "Search Files" },
    h = { ":FzfLua oldfiles<CR>", "Search History Files" },
    p = { ":FzfLua live_grep<CR>", "Search String in Project" },
    r = { ":lua require('spectre').open()<CR>", "Replace in Files" },
  },
}
