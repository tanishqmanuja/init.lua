return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    local nvim_tmux_nav = require('nvim-tmux-navigation')

    nvim_tmux_nav.setup({
      disable_when_zoomed = true,
    })

    vim.keymap.set({ 'n', 't' }, '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft, { silent = true, desc = 'Navigate Window Left' })
    vim.keymap.set({ 'n', 't' }, '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown, { silent = true, desc = 'Navigate Window Down' })
    vim.keymap.set({ 'n', 't' }, '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp, { silent = true, desc = 'Navigate Window Up' })
    vim.keymap.set({ 'n', 't' }, '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight, { silent = true, desc = 'Navigate Window Right' })
  end,
}
