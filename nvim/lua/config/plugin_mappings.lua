return {
  -- { "<leader>.", group = "Explorer" },
  { "<leader>.", ":Neotree toggle filesystem<CR>", desc = "File Explorer" },
  -- { "<leader>.s", ":Lspsaga outline<CR>", desc = "Symbols" },
  { "<leader>/", ":FzfLua live_grep<CR>", desc = "Search in Project" },
  { "<leader>f", group = "Format" },
  {
    "<leader>ff",
    function()
      require("conform").format({ async = true, lsp_format = "fallback" })
    end,
    desc = "All Buffer",
  },

  { "<leader>a", group = "AI" },

  { "<leader>g", group = "Git" },
  { "<leader>g[", ":Gitsigns prev_hunk<CR>", desc = "Previous Change" },
  { "<leader>g]", ":Gitsigns next_hunk<CR>", desc = "Next Change" },
  { "<leader>gd", ":Gvdiffsplit<CR>", desc = "Git Diff" },
  { "<leader>gh", ":Gitsigns preview_hunk_inline<CR>", desc = "Preview Change" },
  { "<leader>gp", ":Gitsigns stage_hunk<CR>", desc = "Stage Change" },
  { "<leader>gr", ":Gread<CR>", desc = "Git Reset File" },
  { "<leader>gs", ":Git<CR>", desc = "Git Status" },
  { "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Change" },
  { "<leader>gw", ":Gwrite<CR>", desc = "Git Add File" },
  { "<leader>gx", ":GDelete<CR>", desc = "Git Remove File" },
  { "<leader>h", ":FzfLua oldfiles<CR>", desc = "Open Recent" },

  { "<leader>l", group = "LSP" },
  { "<leader>lf", ":Lspsaga finder ref<CR>", desc = "Find References" },
  { "<leader>lk", ":Lspsaga hover_doc<CR>", desc = "Show Docs" },
  { "<leader>lr", ":Lspsaga rename<CR>", desc = "Rename" },
  { "<leader>ls", ":lua require('spectre').open()<CR>", desc = "Replace in Files" },

  { "<leader>p", group = "Linter" },
  { "<leader>pd", ":Trouble diagnostics filter.buf=0<CR>", desc = "Open Document Diagnostics" },
  { "<leader>pp", ":Trouble diagnostics<CR>", desc = "Open Project Diagnostics" },

  { "g", group = "Go to" },
  { "gd", ":Lspsaga goto_definition<CR>", desc = "Definition" },
  { "gi", ":Lspsaga finder imp<CR>", desc = "Implementation" },
  { "gr", ":Lspsaga finder ref<CR>", desc = "References" },
  { "gs", ":Lspsaga outline<CR>", desc = "Document Symbols" },
  { "gt", ":Lspsaga goto_type_definition<CR>", desc = "Type Definition" },
}
