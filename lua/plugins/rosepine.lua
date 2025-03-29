return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("rose-pine").setup({
        styles = {
          transparency = true,
        },
      })

      -- vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local theme = require("lualine.themes.rose-pine")
      local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
      for _, mode in ipairs(modes) do
        theme[mode].b.bg = "NONE"
      end

      opts.options.theme = theme
    end,
  },
}
