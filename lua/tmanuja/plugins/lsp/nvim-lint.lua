return {
  'mfussenegger/nvim-lint',
  enabled = false,
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      typescript = { 'eslint_d', 'eslint' },
      javascript = { 'eslint_d', 'eslint' },
      typescriptreact = { 'eslint_d', 'eslint' },
      javascriptreact = { 'eslint_d', 'eslint' },
    }

    -- Fix for eslint_d
    local eslint = lint.linters.eslint_d
    eslint.args = {
      '--no-warn-ignored', -- this is the key argument
      '--format',
      'json',
      '--stdin',
      '--stdin-filename',
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('user-lint-group', { clear = true }),
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
