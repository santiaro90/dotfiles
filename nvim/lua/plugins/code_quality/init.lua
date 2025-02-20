local utils = require("config.utils")

local conform = require("plugins.code_quality.conform")
local lint = require("plugins.code_quality.lint")
local trouble = require("plugins.code_quality.trouble")

return utils.merge_plugins({ conform, lint, trouble })
