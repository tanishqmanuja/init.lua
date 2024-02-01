local M = {
  "folke/trouble.nvim",
  event = { "LspAttach" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.keys = {
  { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle trouble" },
  { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
  { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
  { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List" },
}

function M.config()
  require("trouble").setup({})
end

return M
