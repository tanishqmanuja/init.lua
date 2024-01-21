local M = {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "VonHeikemen/lsp-zero.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
  },
}

function M.config()
  local lspconfig = require("lspconfig")
  local lsp_zero = require("lsp-zero")
  local mason_lspconfig = require("mason-lspconfig")

  -- link with nvim-cmp
  lsp_zero.extend_lspconfig()

  local default_setup = function(server_name)
    local require_ok, settings = pcall(require, "tm.lsp.settings." .. server_name)
    if require_ok then
      lspconfig[server_name].setup(settings)
    else
      lsp_zero.default_setup(server_name)
    end
  end

  mason_lspconfig.setup({
    ensure_installed = {
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
    },
    -- Link with LSP Zero
    handlers = {
      default_setup,
      lua_ls = function()
        require("neodev").setup()
        local lua_opts = lsp_zero.nvim_lua_ls()
        lspconfig.lua_ls.setup(lua_opts)
      end,
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function()
      lsp_zero.set_sign_icons({
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
      })

      vim.diagnostic.config({
        signs = true,
        virtual_text = false,
        update_in_insert = false,
        underline = false,
        severity_sort = true,
      })

      require("toggle_lsp_diagnostics").init(vim.diagnostic.config())

      vim.keymap.set("n", "<leader>vdt", function()
        require("toggle_lsp_diagnostics").toggle_virtual_text()
      end, { desc = "Toggle Diagnostic Virtual Text" })
    end,
  })
end

return M
