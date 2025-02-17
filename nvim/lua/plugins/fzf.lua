return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
      local actions = require("fzf-lua.actions")

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
        files = {
          actions = {
            ["ctrl-s"] = actions.file_split,
            ["ctrl-v"] = actions.file_vsplit,
          },
          cwd_prompt = false,
        },
        buffers = {
          actions = {
            ["ctrl-s"] = actions.buf_split,
            ["ctrl-v"] = actions.buf_vsplit,
          },
        },
      })
    end,
  },
}
