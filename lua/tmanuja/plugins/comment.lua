return {
  'numToStr/Comment.nvim',
  event = 'VeryLazy',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring', -- helps with tsx, jsx support
  },
  config = function()
    local opts = {
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        line = '<leader>/',
        block = 'gbc',
      },

      ---LHS of operator mappings in NORMAL and VISUAL mode
      opleader = {
        line = '<leader>/',
        block = 'gb',
      },

      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }

    -- speed up loading
    vim.g.skip_ts_context_commentstring_module = true

    ---@diagnostic disable-next-line: missing-fields
    require('ts_context_commentstring').setup({
      enable_autocmd = false,
    })

    require('Comment').setup(opts)
  end,
}
