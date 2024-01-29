local M = {
  "williamboman/mason.nvim",
}

function M.config()
  local mason = require("mason")

  mason.setup({
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })
end

return M
