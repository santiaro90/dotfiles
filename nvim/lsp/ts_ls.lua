return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = {
    "package.json",
    "tsconfig.json",
    "jsconfig.json",
    ".git",
  },
  settings = {
    typescript = {
      preferences = {
        importModuleSpecifierPreference = "non-relative",
      },
      suggest = {
        completeFunctionCalls = true,
      },
    },
    javascript = {
      preferences = {
        importModuleSpecifierPreference = "non-relative",
      },
      suggest = {
        completeFunctionCalls = true,
      },
    },
  },
  handlers = {
    -- When eslint is attached, suppress ts_ls lint-level warnings.
    -- TypeScript compilation errors (severity=ERROR) are always kept.
    ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
      if result and result.diagnostics then
        local bufnr = vim.uri_to_bufnr(result.uri)
        local eslint_clients = vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })
        if #eslint_clients > 0 then
          result.diagnostics = vim.tbl_filter(function(diag)
            return diag.severity == vim.diagnostic.severity.ERROR
          end, result.diagnostics)
        end
      end
      vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
    end,
  },
}
