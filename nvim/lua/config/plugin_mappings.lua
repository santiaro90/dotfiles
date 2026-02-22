return {
  { "<leader>.", ":Neotree toggle filesystem<CR>", desc = "File Explorer" },
  { "<C-.>", ":Oil<CR>", desc = "File Explorer (Oil)" },

  -- Labels for mappings defined elsewhere
  { "<leader>b", group = " Buffers" },

  -- fzf
  { "<C-p>", ":FzfLua files<CR>", desc = "Open File" },
  { "<C-/>", ":FzfLua live_grep<CR>", desc = "Search in Project" },
  { "<leader>h", ":FzfLua helptags<CR>", desc = "Show Help" },

  -- Windows
  { "<leader>w", group = " Windows" },
  {
    "<leader>wv",
    function()
      local fzf = require("fzf-lua")
      local actions = require("fzf-lua.actions")

      fzf.files({
        actions = { default = actions.file_vsplit },
        winopts = {
          preview = { vertical = "down:60%" },
          split = "belowright vnew",
        },
      })
    end,
    desc = "Open File in Vertical Split",
  },
  {
    "<leader>ws",
    function()
      local fzf = require("fzf-lua")
      local actions = require("fzf-lua.actions")

      fzf.files({
        actions = {
          ["default"] = actions.file_split,
        },
        winopts = {
          split = "belowright new",
        },
      })
    end,
    desc = "Open File in Horizontal Split",
  },

  { "<leader>f", group = "󰉶 Format" },
  {
    "<leader>ff",
    function()
      require("conform").format({ async = true, lsp_format = "fallback" })
    end,
    desc = "All Buffer",
  },

  { "<leader>g", group = " Git" },
  { "<leader>g[", ":Gitsigns prev_hunk<CR>", desc = "Previous Change" },
  { "<leader>g]", ":Gitsigns next_hunk<CR>", desc = "Next Change" },
  { "<leader>gd", ":Gvdiffsplit<CR>", desc = "Git Diff" },
  { "<leader>gh", ":Gitsigns preview_hunk_inline<CR>", desc = "Preview Change" },
  { "<leader>gm", ":Gdiff!<CR>", desc = "Git Conflicts" },
  { "<leader>gp", ":Gitsigns stage_hunk<CR>", desc = "Stage Change" },
  { "<leader>gr", ":Gread<CR>", desc = "Git Reset File" },
  { "<leader>gs", ":Git<CR>", desc = "Git Status" },
  { "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Change" },
  { "<leader>gw", ":Gwrite<CR>", desc = "Git Add File" },
  { "<leader>gx", ":GDelete<CR>", desc = "Git Remove File" },

  -- LSP
  { "<leader>l", group = " LSP" },
  { "<leader>lf", ":Lspsaga finder ref<CR>", desc = "Find References" },
  { "<leader>ls", ":lua require('spectre').open()<CR>", desc = "Replace in Files" },

  { "<M-CR>", ":Lspsaga code_action<CR>", desc = "Code Actions" },
  { "gs", ":Lspsaga outline<CR>", desc = "Document Symbols" },

  -- Linting
  { "<leader>p", group = "󰄹 Linter" },
  { "<leader>pd", ":Trouble diagnostics filter.buf=0<CR>", desc = "Open Document Diagnostics" },
  { "<leader>pp", ":Trouble diagnostics<CR>", desc = "Open Project Diagnostics" },
}
