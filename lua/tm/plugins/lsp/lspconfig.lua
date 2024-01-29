local M = {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "VonHeikemen/lsp-zero.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    "folke/neoconf.nvim",
  },
}

local LSP_SETTINGS = "tm.plugins.lsp.settings"

local DEFAULT_SERVERS = {
  "tsserver",
  "html",
  "cssls",
  "tailwindcss",
  "svelte",
  "lua_ls",
  "jsonls",
  "graphql",
  "emmet_ls",
  "prismals",
  "pyright",
}

function M.config()
  local lspconfig = require("lspconfig")
  local lsp_zero = require("lsp-zero")
  local mason_lspconfig = require("mason-lspconfig")

  -- start neoconf before lspconfig
  require("neoconf").setup({})

  -- link with nvim-cmp
  lsp_zero.extend_lspconfig()

  local default_setup = function(server_name)
    local ok, settings = pcall(require, LSP_SETTINGS .. "." .. server_name)
    if ok then
      lspconfig[server_name].setup(settings)
    else
      lsp_zero.default_setup(server_name)
    end
  end

  mason_lspconfig.setup({
    ensure_installed = DEFAULT_SERVERS,
    handlers = {
      default_setup,
      lua_ls = function()
        require("neodev").setup()
        local lua_opts = lsp_zero.nvim_lua_ls()
        lspconfig.lua_ls.setup(lua_opts)
      end,
    },
    automatic_installation = true,
  })
end

return M
