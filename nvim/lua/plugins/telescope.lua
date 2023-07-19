return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function ()
      local actions = require("fzf-lua.actions")

      vim.keymap.set("n", "<C-p>", ":FzfLua files<CR>", { desc = "Search Files", silent = true })

      require("fzf-lua").setup({
        "fzf-native",
        actions = {
          files = {
            ["default"] = actions.file_edit,
          },
        },
        keymap = {
          fzf = {
            ["ctrl-j"] = "preview-page-down",
            ["ctrl-k"] = "preview-page-up",
            ["ctrl-t"] = "toggle-preview",
          },
        },
      })
    end,
  },
}
