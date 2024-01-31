local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
}

M.config = function()
  local icons = {
    BoldLineMiddle = "┃",
    BoldLineDashedMiddle = "┋",
    TriangleShortArrowRight = "",
  }

  require("gitsigns").setup({
    signs = {
      add = { text = icons.BoldLineMiddle },
      change = { text = icons.BoldLineMiddle },
      delete = { text = icons.TriangleShortArrowRight },
      topdelete = { text = icons.TriangleShortArrowRight },
      changedelete = { text = icons.BoldLineMiddle },
      untracked = { text = icons.BoldLineDashedMiddle },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = false,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  })
end

return M
