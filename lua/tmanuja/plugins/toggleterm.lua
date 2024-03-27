return {
  'akinsho/toggleterm.nvim',
  version = '*',
  event = 'VeryLazy',
  config = function()
    require('toggleterm').setup({
      --  NOTE: Ctrl + Backtick doesn't work by default in terminals
      --  Manual setup is required.
      open_mapping = '<C-`>',
    })
  end,
}
