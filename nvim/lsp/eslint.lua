return {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = {
    ".git",
    "node_modules",
    "package-lock.json",
    "package.json",
    "yarn.lock",
  },
  settings = {
    validate = "on",
    packageManager = nil,
    useESLintClass = false,
    experimental = {
      useFlatConfig = false,
    },
    codeActionOnSave = {
      enable = false,
      mode = "all",
    },
    format = false, -- Use prettierd for formatting
    quiet = false,
    onIgnoredFiles = "off",
    rulesCustomizations = {},
    run = "onType",
    problems = {
      shortenToSingleLine = false,
    },
    nodePath = "",
    workingDirectory = { mode = "auto" },
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = {
        enable = true,
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Disable formatting - use prettierd via conform.nvim
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    local function eslint_fix_all()
      client:request_sync("workspace/executeCommand", {
        command = "eslint.applyAllFixes",
        arguments = {
          {
            uri = vim.uri_from_bufnr(bufnr),
            version = vim.lsp.util.buf_versions[bufnr],
          },
        },
      }, 2000, bufnr)
    end

    -- Auto-fix on save (runs before conform formatting)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = eslint_fix_all,
    })

    vim.api.nvim_buf_create_user_command(bufnr, "LspEslintFixAll", eslint_fix_all, {})
  end,
  handlers = {
    ["eslint/openDoc"] = function(_, result)
      if result then
        vim.ui.open(result.url)
      end
      return {}
    end,
    ["eslint/confirmESLintExecution"] = function(_, result)
      if not result then
        return
      end
      return 4 -- Auto-approve
    end,
    ["eslint/probeFailed"] = function()
      vim.notify("[LSP] ESLint probe failed.", vim.log.levels.WARN)
      return {}
    end,
    ["eslint/noLibrary"] = function()
      vim.notify("[LSP] Unable to find ESLint library.", vim.log.levels.WARN)
      return {}
    end,
  },
}
