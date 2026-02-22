return {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function(_)
      -- Declare a global function to retrieve the current directory
      function _G.get_oil_winbar()
        local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
        local dir = require("oil").get_current_dir(bufnr)

        if dir then
          return vim.fn.fnamemodify(dir, ":~")
        else
          -- If there is no current directory (e.g. over ssh), just show the buffer name
          return vim.api.nvim_buf_get_name(0)
        end
      end

      require("oil").setup({
        lsp_file_methods = {
          autosave_changes = true,
        },
        keymaps = {
          ["<C-[>"] = { "actions.close", mode = "n" },
          ["<C-s>"] = { "actions.select", mode = "n", opts = { horizontal = true } },
          ["<C-v>"] = { "actions.select", mode = "n", opts = { vertical = true } },
          ["<C-j"] = { "actions.preview_scroll_down", mode = "n" },
          ["<C-k"] = { "actions.preview_scroll_up", mode = "n" },
          ["H"] = { "actions.toggle_hidden", mode = "n" },
          ["?"] = { "actions.show_help", mode = "n" },

          -- Disable these
          ["<C-h>"] = false,
          ["<C-c>"] = false,
          ["<C-p>"] = false,
          ["g?"] = false,
          ["g."] = false,
          ["_"] = false,
        },
        win_options = {
          winbar = "%!v:lua.get_oil_winbar()",
        },
      })
    end,
  },
}
