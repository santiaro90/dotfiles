-- Global LSP capabilities for blink.cmp
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities({}, true),
})

-- Enable all configured LSP servers
vim.lsp.enable({
  "lua_ls",
  "pyright",
  "ruff",
  "ts_ls",
  "eslint",
  "bashls",
})

-- Diagnostics configuration
local signs = { ERROR = "⏺", WARN = "⏺", INFO = "⏺", HINT = "⏺" }
local diagnostic_signs = {}

for type, icon in pairs(signs) do
  diagnostic_signs[vim.diagnostic.severity[type]] = icon
end

vim.diagnostic.config({
  signs = { text = diagnostic_signs },
  underline = true,
  virtual_text = false,
  float = {
    border = "single",
    source = "if_many",
  },
})

vim.o.updatetime = 250

-- Show diagnostic float on entering a new line; close on leaving or dismiss
local _diag_float = { win = nil, line = nil }

local function close_diag_float()
  if _diag_float.win and vim.api.nvim_win_is_valid(_diag_float.win) then
    pcall(vim.api.nvim_win_close, _diag_float.win, false)
  end
  _diag_float.win = nil
  _diag_float.line = nil
end

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function(event)
    local line = vim.api.nvim_win_get_cursor(0)[1]
    if _diag_float.line == line then return end -- already handled this line
    _diag_float.line = line
    local _, win = vim.diagnostic.open_float({
      border = "single",
      bufnr = event.buf,
      focus = false,
      source = "if_many",
    })
    _diag_float.win = win
  end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "BufLeave", "InsertEnter" }, {
  callback = function(event)
    if event.event == "CursorMoved" then
      local line = vim.api.nvim_win_get_cursor(0)[1]
      if _diag_float.line == nil or line == _diag_float.line then return end
    end
    close_diag_float()
  end,
})

-- LSP Attach autocommand for document highlighting
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if
      client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight)
    then
      local highlight_augroup =
        vim.api.nvim_create_augroup("custom-lsp-highlight", { clear = false })

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("custom-lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "custom-lsp-highlight", buffer = event2.buf })
        end,
      })
    end
  end,
})
