local utils = require("config.utils")

local fzf = require("plugins.navigation.fzf")
local neotree = require("plugins.navigation.neotree")

return utils.merge_plugins({ fzf, neotree })
