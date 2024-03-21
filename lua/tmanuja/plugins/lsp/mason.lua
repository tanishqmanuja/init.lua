local DEFAULT_SERVERS = {
  'cssls',
  'emmet_ls',
  'html',
  'jsonls',
  'lua_ls',
  'pyright',
  'tailwindcss',
  'tsserver',
}

local DEFAULT_FORMATTERS = {
  'shfmt',
  'stylua',
  'black',
  'isort',
  'prettier',
}

local DEFAULT_LINTERS = {
  'eslint',
  'eslint_d',
  'pylint',
}

return {
  'williamboman/mason.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup({
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    require('mason-tool-installer').setup({
      ensure_installed = vim.tbl_flatten({ DEFAULT_SERVERS, DEFAULT_FORMATTERS, DEFAULT_LINTERS }),
    })

    vim.keymap.set('n', '<leader>tm', ':Mason<CR>', { silent = true, noremap = true, desc = 'Mason [T]ool [M]anager' })
  end,
}
