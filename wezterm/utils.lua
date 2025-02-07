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

return module
