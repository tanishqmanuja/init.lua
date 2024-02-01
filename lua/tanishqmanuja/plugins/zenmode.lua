local M = {
  "folke/zen-mode.nvim",
}

M.keys = {
  {
    "<leader>zz",
    function()
      require("zen-mode").toggle()
    end,
    desc = "ZenMode",
  },
}

function M.config()
  require("zen-mode").setup({
    plugins = {
      options = {
        laststatus = 0,
      },
      tmux = { enabled = true },
    },
  })
end

return M
