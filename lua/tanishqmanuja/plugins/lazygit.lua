local M = {
  "kdheepak/lazygit.nvim",
  cmd = { "LazyGit", "LazyGitConfig" },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
}

return M
