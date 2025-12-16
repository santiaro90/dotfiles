local utils = require("config.utils")

local bufferline = require("plugins.ui.bufferline")
local colourscheme = require("plugins.ui.colourscheme")
local lualine = require("plugins.ui.lualine")
local twilight = require("plugins.ui.twilight")
local which_key = require("plugins.ui.which_key")

return utils.merge_plugins({
  bufferline,
  colourscheme,
  lualine,
  twilight,
  which_key,
})
