local codeium_status = function(icon, separator)
  return {
    'vim.fn["codeium#GetStatusString"]()',
    fmt = function(str)
      local status = str:lower():match("^%s*(.-)%s*$")
      if status == "" or status == "*" then
        return ""
      else
        return (icon or "codeium") .. (separator or " ") .. status
      end
    end,
  }
end

local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
}

function M.config()
  local opts = {
    options = {
      icons_enabled = false,
      theme = "onedark",
      globalstatus = true,
      component_separators = { right = "«", left = "»" },
      section_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = {
        codeium_status(),
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  }

  require("lualine").setup(opts)
end

return M
