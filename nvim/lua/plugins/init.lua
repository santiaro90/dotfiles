local utils = require("config.utils")

local code_quality = require("plugins.code_quality")
local editing = require("plugins.editing")
local lsp = require("plugins.lsp")
local navigation = require("plugins.navigation")
local ui = require("plugins.ui")

return utils.merge_plugins({
  code_quality,
  editing,
  lsp,
  navigation,
  ui
})
