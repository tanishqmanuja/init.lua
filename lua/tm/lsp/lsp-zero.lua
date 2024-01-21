local M = {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  lazy = true,
  keys = {
    { "<leader>i", "<cmd>LspInfo<cr>", desc = "LSP Info" },
    { "<leader>I", "<cmd>LspInstall<cr>", desc = "LSP Install" },
  },
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  init = function()
    -- Disable automatic setup, we are doing it manually
    vim.g.lsp_zero_extend_cmp = 0
    vim.g.lsp_zero_extend_lspconfig = 0
  end,
}

function M.config()
  local lsp_zero = require("lsp-zero")

  local opts = { noremap = true, silent = true }
  lsp_zero.on_attach(function(_, bufnr)
    opts.buffer = bufnr

    opts.desc = "Goto Declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Goto Definition"
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

    opts.desc = "Goto Implementation"
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "Show LSP references"
    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Show LSP type definitions"
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc = "Show Signature Help"
    vim.keymap.set("n", "<C-M-H>", vim.lsp.buf.signature_help, opts)

    opts.desc = "Smart rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Show Workspace Symbols"
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)

    opts.desc = "Show LSP Diagnostics"
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

    opts.desc = "Show buffer diagnostics"
    vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "Go to previous diagnostic"
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_prev({ float = false })
    end, opts)

    opts.desc = "Go to next diagnostic"
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_next({ float = false })
    end, opts)

    opts.desc = "Hover Documentation"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end)
end

return M
