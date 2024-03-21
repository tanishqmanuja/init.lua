-- Open netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Clear search highlight on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move up/down a highlighted block
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move block down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move block up' })

-- Jumping pages keeps cursor in the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Jump page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Jump page up' })

vim.keymap.set('n', '{', '{zz', { desc = 'Jump block down' })
vim.keymap.set('n', '}', '}zz', { desc = 'Jump block up' })

-- Keep search terms in the middle of the screen
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Jump to next search term' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Jump to previous search term' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent Left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent Right' })

-- Overwrite selected text
vim.keymap.set('x', 'p', '"_dP', { desc = 'Paste (Overwrite)' })

-- Find and Replace in current buffer
vim.keymap.set('n', 'S', function()
  local cmd = ':%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>' -- Replace current word
  local keys = vim.api.nvim_replace_termcodes(cmd, true, true, true)
  vim.api.nvim_feedkeys(keys, 'n', true)
end, { desc = 'Find and Replace' })

-- Redo
vim.keymap.set('n', 'U', '<C-r>', { desc = 'Redo' })

-- Disable Space key
vim.keymap.set('n', '<Space>', '<Nop>')

-- Switch Last Buffer
vim.keymap.set('n', "<leader>'", '<C-^>', { desc = 'Switch Last Buffer' })

-- Faster line navigation
vim.keymap.set({ 'n', 'o', 'x' }, '<s-h>', '^', { desc = 'Jump to start of line' })
vim.keymap.set({ 'n', 'o', 'x' }, '<s-l>', 'g_', { desc = 'Jump to end of line' })

-- Ctrl + s to save file
vim.keymap.set('n', '<C-s>', ':update<CR>', { silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:update<CR>', { silent = true })
vim.keymap.set('v', '<C-s>', '<Esc>:update<CR>', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Move focus to the right window' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
--  NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Easy Quit
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { silent = true })
vim.keymap.set('n', '<leader>Q', '<cmd>qa!<CR>', { silent = true })

-- Make file executable
vim.keymap.set('n', '<leader>mx', '<cmd>!chmod +x %<CR>', { silent = true })

-- Quick mode escape
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', '<C-c>', '<Esc>')
