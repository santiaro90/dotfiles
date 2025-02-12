local module = {}

module.append_to_list = function(target, source)
  for _, item in ipairs(source) do
    table.insert(target, item)
  end
end

module.append_to_table = function(target, source)
  for key, value in pairs(source) do
    target[key] = value
  end
end

module.apply_module = function(config, module_name)
  local m = require(module_name)
  m.apply(config)
end

module.apply_modules = function(config, modules)
  for _, module_name in ipairs(modules) do
    module.apply_module(config, module_name)
  end
end

return module
