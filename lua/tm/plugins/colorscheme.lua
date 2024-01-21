local M = {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  local onedark = require("onedark")

  onedark.setup({
    style = "darker",
    transparent = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false,
    lualine = {
      transparent = false,
    },
    highlights = {
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
    },
  })

  onedark.load()
end

return M
