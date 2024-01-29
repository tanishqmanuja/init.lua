local M = {
  "folke/trouble.nvim",
  event = { "LspAttach" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  local trouble = require("trouble")

  trouble.setup({})

  vim.keymap.set("n", "<leader>xx", function()
    require("trouble").toggle()
  end)
  vim.keymap.set("n", "<leader>xw", function()
    require("trouble").toggle("workspace_diagnostics")
  end)
  vim.keymap.set("n", "<leader>xd", function()
    require("trouble").toggle("document_diagnostics")
  end)
  vim.keymap.set("n", "<leader>xq", function()
    require("trouble").toggle("quickfix")
  end)
end

return M
