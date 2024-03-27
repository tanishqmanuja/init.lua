-- NOTE: Checkout 'https://github.com/Exafunction/codeium.nvim' later maybe
return {
  'Exafunction/codeium.vim',
  event = 'InsertEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>cse', '<cmd>Codeium Enable<cr>', desc = '[C]ode [S]uggestions [E]nable' },
    { '<leader>csd', '<cmd>Codeium Disable<cr>', desc = '[C]ode [S]uggestions [D]isable' },
  },
  config = function()
    -- Ctrl+Enter to accept code suggestion
    --  NOTE: Doesn't work in every Terminal by default
    --  <C-J> catches Ctrl+Enter for some,
    --  Others may have to modify their terminal settings.
    vim.keymap.set('i', '<C-CR>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true })

    vim.keymap.set('i', '<M-]>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true })

    vim.keymap.set('i', '<M-[>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true })

    -- Ctrl+e or ESC to clear code suggestions
    vim.keymap.set('i', '<C-e>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true })

    vim.keymap.set('i', '<ESC>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true })
  end,
}
