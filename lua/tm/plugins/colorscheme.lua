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
    term_colors = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false,
    lualine = {
      transparent = false,
    },
    highlights = {
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
    },
    diagnostics = {
      darker = true, -- darker colors for diagnostic
      undercurl = true, -- use undercurl instead of underline for diagnostics
      background = true, -- use background color for virtual text
    },
  })

  onedark.load()
end

return M
