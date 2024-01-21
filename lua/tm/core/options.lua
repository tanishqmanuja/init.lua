-- Indentation
vim.opt.showtabline = 0 -- Always show tabs
vim.opt.tabstop = 2 -- Insert 2 spaces for a tab
vim.opt.softtabstop = 2 -- Number of spaces tabs count for while editing
vim.opt.shiftwidth = 2 -- The number of spaces inserted for each indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Makes indenting smart

-- Search Settings
vim.opt.hlsearch = false -- Highlight on search
vim.opt.incsearch = true -- While typing a search command, show where the pattern matches

-- Line Numbering
vim.opt.number = true -- Set numbered lines
vim.opt.relativenumber = true -- Set relative numbered lines

-- Backup Settings
vim.opt.swapfile = false
vim.opt.backup = false

-- Undo Settings
vim.opt.undodir = (os.getenv "HOME" or os.getenv "UserProfile") .. "/.vim/undodir"
vim.opt.undofile = true

-- Popup Menu Settings
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.pumblend = 0 -- pop up menu transparency

-- Screen Offsets
vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.wrap = false -- Display long lines as just one line
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`

-- Other General Settings
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.cmdheight = 1 -- More space in the neovim command line for displaying messages
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.updatetime = 50 -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
