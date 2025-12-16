return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },
  settings = {
    pyright = {
      disableOrganizeImports = true, -- Using Ruff for this
    },
    python = {
      analysis = {
        ignore = { "*" }, -- Using Ruff for linting
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
