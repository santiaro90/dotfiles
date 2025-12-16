return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
    ".git",
  },
  settings = {},
  -- Disable hover to avoid conflict with Pyright
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
  end,
}
