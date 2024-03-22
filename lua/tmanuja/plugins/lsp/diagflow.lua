return {
  'dgagn/diagflow.nvim',
  event = { 'LspAttach' },
  config = function()
    require('diagflow').setup({
      enable = true,
      scope = 'line',
      max_width = 60,
      max_height = 5,
      show_sign = false,
      show_borders = false,
      update_event = { 'DiagnosticChanged', 'BufReadPost' },
      render_event = { 'DiagnosticChanged', 'CursorMoved' },
    })
  end,
}
