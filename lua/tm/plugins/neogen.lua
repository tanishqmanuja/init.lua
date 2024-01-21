return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  keys = {
    { "<leader>ngf", "<cmd>lua require('neogen').generate({ type = 'func' })<cr>" },
    { "<leader>ngt", "<cmd>lua require('neogen').generate({ type = 'type' })<cr>" },
    { "<leader>ngc", "<cmd>lua require('neogen').generate({ type = 'class' })<cr>" },
  },
  config = true,
}
