-- Better colours for diffs
vim.api.nvim_set_hl(0, "DiffAdd", {
  bg = "#024f02",
})

vim.api.nvim_set_hl(0, "DiffChange", {
  bg = "#024f02",
})

vim.api.nvim_set_hl(0, "DiffDelete", {
  bg = "#610103",
})

vim.api.nvim_set_hl(0, "DiffText", {
  bg = "#048204",
})

-- Curly underlines for errors/warnings
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
  undercurl = true,
  sp = "#e5c890",
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  undercurl = true,
  sp = "#e78284",
})

vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Comment" })
