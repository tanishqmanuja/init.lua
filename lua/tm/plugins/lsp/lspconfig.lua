local M = {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    "folke/neoconf.nvim",
  },
}

local LSP_SETTINGS = "tm.lsp.settings"
local LSP_KEYMAPS = "tm.lsp.keymaps"

M.keys = {
  { "<leader>il", "<cmd>silent! LspInfo<cr>", desc = "LspInfo" },
}

function M.config()
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")

  -- start neoconf before lspconfig
  require("neoconf").setup({})
  require("neodev").setup({})

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  if pcall(require, "cmp_nvim_lsp") then
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  end

  local default_setup = function(server_name)
    local ok, s = pcall(require, LSP_SETTINGS .. "." .. server_name)
    if ok then
      s.capabilities = capabilities
      lspconfig[server_name].setup(s)
    else
      lspconfig[server_name].setup({ capabilities = capabilities })
    end
  end

  mason_lspconfig.setup({
    automatic_installation = true,
    handlers = {
      default_setup,
    },
  })

  local group = vim.api.nvim_create_augroup("LspKeymaps", {})
  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(event)
      local opts = { buffer = event.buf }
      require(LSP_KEYMAPS).on_attach(opts)
    end,
  })
end

return M
