local M = {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
}

M.keys = {
  { "<leader>S", "<cmd>lua require('spectre').open()<cr>", desc = "Open Spectre" },
  { "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = "Search current word" },
  { "<leader>sw", "<cmd>lua require('spectre').open_visual<cr>", mode = "v", desc = "Search current word" },
  {
    "<leader>sp",
    "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>",
    desc = "Search current file",
  },
}

function M.config()
  require("spectre").setup()
end

return M
