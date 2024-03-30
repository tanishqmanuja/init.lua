-- Just an alias for quitting
--  Helps when pressing `q` before releasing `shift`
vim.api.nvim_create_user_command('Q', 'q', {})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('user-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Source tmux.conf on save
vim.api.nvim_create_autocmd('BufWritePost', {
  desc = 'Source tmux.conf on save',
  group = vim.api.nvim_create_augroup('user-tmux-conf', { clear = true }),
  pattern = { '*tmux.conf' },
  command = "execute 'silent !tmux source <afile> --silent'",
})

-- Set filetype for .conf
vim.api.nvim_create_autocmd({ 'BufRead' }, {
  pattern = { '*.conf' },
  callback = function()
    vim.cmd([[set filetype=sh]])
  end,
})

-- Fix Telescope Prompt (smart-open)
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('user-telescope-picker', { clear = true }),
  pattern = { 'TelescopePrompt' },
  callback = function(event)
    vim.keymap.set('i', '<C-c>', function()
      require('telescope.actions').close(event.buf)
    end, { noremap = true, silent = true, buffer = event.buf })
  end,
})

-- FIX: Migrate below cmds to pure lua based autocmds

-- Disable commenting new lines
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Reopen from last cursor position
vim.cmd('autocmd BufReadPost * if line("\'\\"") > 1 && line("\'\\"") <= line("$") | exe "normal! g\'\\"" | endif')
