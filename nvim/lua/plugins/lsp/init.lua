local utils = require("config.utils")

local blink = require("plugins.lsp.blink")
local lspconfig = require("plugins.lsp.lspconfig")
local lspsaga = require("plugins.lsp.lspsaga")
local treesitter = require("plugins.lsp.treesitter")

return utils.merge_plugins({ blink, lspconfig, lspsaga, treesitter })
