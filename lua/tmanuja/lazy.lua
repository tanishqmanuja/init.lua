-- Install `lazy.nvim` plugin manager
--  See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Options for lazy.nvim
local opts = {
  install = {
    missing = true,
    colorscheme = { 'habamax' },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  ui = {
    border = 'rounded',
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

-- Plugin specs for lazy.nvim
local plugins = {
  { import = 'tmanuja.plugins' }, -- load and merge all specs inside specified folder
  { import = 'tmanuja.plugins.lsp' }, -- load lsp stuff after normal plugins
}

require('lazy').setup(plugins, opts)

vim.keymap.set('n', '<leader>pm', ':Lazy<CR>', { silent = true, noremap = true, desc = 'Lazy [P]ackage [M]anager' })
