local utils = require("config.utils")

local cmp = require("plugins.lsp.cmp")
local lspconfig = require("plugins.lsp.lspconfig")
local lspsaga = require("plugins.lsp.lspsaga")
local treesitter = require("plugins.lsp.treesitter")

return utils.merge_plugins({ cmp, lspconfig, lspsaga, treesitter })
