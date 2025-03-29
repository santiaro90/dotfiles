return {
  golangcilint = {
    args = {
      "run",
      "--output.json.path=stdout",
      "--issues-exit-code=0",
      "--show-stats=false",
      function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
      end,
    },
  },
}
