local M = {
  "ThePrimeagen/harpoon",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim" },
}

M.keys = {
  { "<leader>ho", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon toggle menu" },
  { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Harpoon add file" },
  { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Harpoon remove file" },
  { "<leader>hc", "<cmd>lua require('harpoon.mark').clear_all()<cr>", desc = "Harpoon clear all" },

  { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Harpoon next" },
  { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Harpoon previous" },

  { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon file 1" },
  { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon file 2" },
  { "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon file 3" },
  { "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon file 4" },
}

function M.config()
  require("harpoon").setup({})
end

return M
