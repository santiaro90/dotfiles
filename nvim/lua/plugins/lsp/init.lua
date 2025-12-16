local utils = require("config.utils")

local blink = require("plugins.lsp.blink")
local lspsaga = require("plugins.lsp.lspsaga")
local mason = require("plugins.lsp.mason")
local treesitter = require("plugins.lsp.treesitter")

return utils.merge_plugins({ blink, lspsaga, mason, treesitter })
