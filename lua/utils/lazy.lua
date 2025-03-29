local M = {}

function M.disable_specs(tbl)
  local result = {}
  for _, item in ipairs(tbl) do
    if type(item) == "string" then
      table.insert(result, { item, enabled = false })
    elseif type(item) == "table" then
      item.enabled = false
      table.insert(result, item)
    end
  end
  return result
end

return M
