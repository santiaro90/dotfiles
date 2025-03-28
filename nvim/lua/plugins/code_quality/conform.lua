return {
  { -- Formatters
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      log_level = vim.log.levels.INFO,
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don"t
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt

        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = "never"
        else
          lsp_format_opt = "fallback"
        end

        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters = {
        prettierd = {
          require_cwd = true,
        },
        shfmt = {
          prepend_args = { "-i", "4", "-ci" },
        },
      },
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        lua = { "stylua" },
        python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
        sh = { "shfmt" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        vue = { "prettierd" },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}
