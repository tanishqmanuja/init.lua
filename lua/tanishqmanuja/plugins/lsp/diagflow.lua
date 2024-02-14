local M = {
  "dgagn/diagflow.nvim",
  event = "LspAttach",
}

function M.config()
  require("diagflow").setup({
    enable = true,
    max_width = 60, -- The maximum width of the diagnostic messages
    max_height = 5, -- the maximum height per diagnostics
    severity_colors = { -- The highlight groups to use for each diagnostic severity level
      error = "DiagnosticFloatingError",
      warning = "DiagnosticFloatingWarn",
      info = "DiagnosticFloatingInfo",
      hint = "DiagnosticFloatingHint",
    },
    format = function(diagnostic)
      return diagnostic.message
    end,
    gap_size = 1,
    scope = "line", -- 'cursor', 'line' this changes the scope, so instead of showing errors under the cursor, it shows errors on the entire line.
    padding_top = 0,
    padding_right = 0,
    text_align = "right", -- 'left', 'right'
    placement = "top", -- 'top', 'inline'
    inline_padding_left = 0, -- the padding left when the placement is inline
    update_event = { "DiagnosticChanged", "BufReadPost" }, -- the event that updates the diagnostics cache
    toggle_event = { "InsertEnter" }, -- if InsertEnter, can toggle the diagnostics on inserts
    render_event = { "DiagnosticChanged", "CursorMoved" },
    show_sign = false, -- set to true if you want to render the diagnostic sign before the diagnostic message
    show_borders = false,
  })
end

return M