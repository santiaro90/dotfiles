local mason_root = vim.fn.stdpath("data") .. "/mason/packages"

return {
  -- Lua - useful for Neovim/Wezterm config
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        -- You can toggle below to ignore Lua_LS"s noisy `missing-fields` warnings
        diagnostics = { disable = { "missing-fields" } },
      },
    },
  },

  -- Python
  pyright = {
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analyisis and let Ruff do the linting
          ignore = { "*" },
        },
      },
    },
  },

  ruff = {
    server_capabilities = {
      hoverProvider = false,
    },
  },

  -- Go
  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        semanticTokens = true,
      },
    },
  },

  -- Shell scripting
  bashls = {
    settings = {
      filetypes = { "sh", "zsh" },
    },
  },

  -- Web
  ts_ls = {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
    },
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = mason_root .. "/vue-language-server/node_modules/@vue/language-server",
          languages = { "vue" },
        },
      },
    },
  },

  eslint = {},

  volar = {},
}
