return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>e",
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd("Neotree close")
        else
          vim.cmd("Neotree focus")
        end
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
  },
  opts = {
    close_if_last_window = true,
    window = {
      position = "right",
    },
  },
}
