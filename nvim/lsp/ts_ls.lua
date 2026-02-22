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
}
