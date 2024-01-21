local M = {
  -- "0x100101/lab.nvim",
  "Edvid/lab.nvim", -- a fork with symbol fix
  build = "cd js && npm ci",
  lazy = false,
  keys = {
    { "<leader>lce", "<cmd>silent! Lab code run<cr>", desc = "Lab Enable" },
    { "<leader>lcd", "<cmd>Lab code stop<cr>", desc = "Lab Disable" },
    { "<leader>lcp", "<cmd>Lab code panel<cr>", desc = "Lab Panel" },
  },
}

function M.config()
  require("lab").setup {
    code_runner = {
      enabled = true,
    },
    quick_data = {
      enabled = false,
    },
  }
end

return M
