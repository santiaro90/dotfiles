local M = {}

function M.merge_plugins(plugins)
  local config = {}

  for _, module in ipairs(plugins) do
    config = vim.list_extend(config, module)
  end

  return config
end

return M
