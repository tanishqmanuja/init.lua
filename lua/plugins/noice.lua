return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        hover = {
          silent = true,
        },
        signature = {
          auto_open = {
            enabled = false,
          },
        },
      },
    },
  },
}
