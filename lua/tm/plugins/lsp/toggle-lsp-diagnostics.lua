local M = {
  "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
  event = { "LspAttach" },
}

M.keys = {
  {
    "<leader>vdt",
    function()
      require("toggle_lsp_diagnostics").toggle_virtual_text()
    end,
    desc = "Toggle LSP Diagnostics Virtual Text",
  },
}

function M.config()
  require("toggle_lsp_diagnostics").init(vim.diagnostic.config())
end

return M
