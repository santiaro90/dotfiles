local lua = {
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
}

local python = {
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
}

local typescript = {
  ts_ls = {},
}

local sh = {
  bashls = {
    settings = {
      filetypes = { "sh", "zsh" },
    },
  },
}

return vim.tbl_extend("force", lua, python, sh, typescript)
