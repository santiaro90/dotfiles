local utils = require("config.utils")

local avante = require("plugins.ai.avante")
local copilot = require("plugins.ai.copilot")

return utils.merge_plugins({ avante, copilot })
