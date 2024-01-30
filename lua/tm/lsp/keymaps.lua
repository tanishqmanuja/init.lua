local M = {}

M.on_attach = function(opts)
  opts.desc = "Goto Declaration"
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

  opts.desc = "Goto Definition"
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

  opts.desc = "Goto Implementation"
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

  opts.desc = "Show LSP references"
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

  opts.desc = "Show LSP type definitions"
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

  opts.desc = "Show Signature Help"
  vim.keymap.set("n", "<C-M-H>", vim.lsp.buf.signature_help, opts)

  opts.desc = "Smart rename"
  vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

  opts.desc = "Format Current Buffer"
  vim.keymap.set("n", "<F3>", vim.lsp.buf.format, opts)

  opts.desc = "See available code actions"
  vim.keymap.set({ "n", "v" }, "<F4>", vim.lsp.buf.code_action, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

  opts.desc = "Show Workspace Symbols"
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)

  opts.desc = "Show LSP Diagnostics"
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

  opts.desc = "Show buffer diagnostics"
  vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

  opts.desc = "Hover Documentation"
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

return M
