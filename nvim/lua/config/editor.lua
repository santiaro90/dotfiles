vim.o.autoread = true
vim.o.autowrite = true
vim.o.autowrite = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.gdefault = true
vim.o.ignorecase = true
vim.o.hidden = true
vim.o.laststatus = 2
vim.o.modeline = true
vim.o.mouse = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 5
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.wrap = false
vim.o.writebackup = false
vim.o.timeout = true
vim.o.timeoutlen = 500

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.diffopt:append("filler")
vim.opt.diffopt:append("iwhite")
vim.opt.diffopt:append("vertical")
vim.opt.foldenable = true
vim.opt.foldlevelstart = 6
vim.opt.foldnestmax = 6
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.listchars = { tab = "▸ ", trail = "⬝", eol = "¬" }
vim.opt.list = true
vim.opt.termguicolors = true

vim.cmd([[autocmd FileType * set formatoptions-=ro formatoptions+=j]])
vim.cmd([[autocmd FileType tf,tfvars set filetype=terraform]])
