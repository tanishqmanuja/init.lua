local M = {}

local neocodium_icons = {
  status = {
    [0] = "󰚩 ", -- enabled
    [1] = "󱚧 ", -- disabled globally
    [2] = "󱙻 ", -- disabled for buffer
    [3] = "󱙺 ", -- disabled for buffer filetype
    [4] = "󱙺 ", -- disabled for buffer with enabled function
    [5] = "󱚠 ", -- disabled for buffer encoding
  },
  server_status = {
    [0] = "󰣺 ", -- server connected
    [1] = "󰣻 ", -- server connecting
    [2] = "󰣽 ", -- server disconnected
  },
}

M.neocodeium_status = {
  ---@return string
  function()
    local status, server_status = require("neocodeium").get_status()
    if server_status ~= 0 then
      return neocodium_icons.server_status[server_status]
    end
    return neocodium_icons.status[status]
  end,
  color = function()
    return { fg = Snacks.util.color("Special") }
  end,
}

return M
