local utils = require("config.utils")

local bufferline = require("plugins.ui.bufferline")
local colourscheme = require("plugins.ui.colourscheme")
local lualine = require("plugins.ui.lualine")
local which_key = require("plugins.ui.which_key")

return utils.merge_plugins({
  bufferline,
  colourscheme,
  lualine,
  which_key
})
