-- Line numbering
vim.opt.number = true -- Set numbered lines
vim.opt.relativenumber = true -- Set relative numbered lines

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Hide tab bar
vim.opt.showtabline = 0 -- Always show tabs

-- Tab / Indentation
vim.opt.tabstop = 2 -- Insert 2 spaces for a tab
vim.opt.softtabstop = 2 -- Number of spaces tabs count for while editing
vim.opt.shiftwidth = 2 -- The number of spaces inserted for each indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Makes indenting smart
vim.opt.wrap = false -- Display long lines as just one line
vim.opt.breakindent = true -- Indent wrapped lines

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Search options
vim.opt.hlsearch = true -- Highlight on search
vim.opt.incsearch = true -- While typing a search command, show where the pattern matches

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Disable backup
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable Undo history
vim.opt.undodir = (os.getenv('HOME') or os.getenv('UserProfile')) .. '/.vim/undodir'
vim.opt.undofile = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Other General Settings
vim.opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.cmdheight = 1 -- More space in the neovim command line for displaying messages
vim.opt.updatetime = 250 -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.errorbells = false -- Disable error bells
