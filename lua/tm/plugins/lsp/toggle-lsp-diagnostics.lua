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
  -- setup diagnostic config
  local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  vim.diagnostic.config({
    signs = true,
    virtual_text = false,
    update_in_insert = false,
    underline = false,
    severity_sort = true,
  })

  require("toggle_lsp_diagnostics").init(vim.diagnostic.config())
end

return M
