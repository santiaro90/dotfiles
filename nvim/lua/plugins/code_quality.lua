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
  { -- Linters
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {}

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
