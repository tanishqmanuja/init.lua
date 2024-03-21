return {
  'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
  keys = {
    {
      '<leader>vdt',
      function()
        require('toggle_lsp_diagnostics').toggle_virtual_text()
      end,
      desc = 'Toggle LSP Diagnostics Virtual Text',
    },
  },
  config = function()
    require('toggle_lsp_diagnostics').init(vim.diagnostic.config())
  end,
}
