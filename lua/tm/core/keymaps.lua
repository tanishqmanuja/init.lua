-- Open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move up/down a highlighted block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- Jumping pages keeps cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump page up" })

-- Keep search terms in the middle of the screen
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next search term" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous search term" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- Overwrite selected text
vim.keymap.set("x", "p", '"_dP', { desc = "Paste (Overwrite)" })

-- Faster line navigation
vim.keymap.set({ "n", "o", "x" }, "<s-h>", "^", { desc = "Jump to start of line" })
vim.keymap.set({ "n", "o", "x" }, "<s-l>", "g_", { desc = "Jump to end of line" })

-- Ctrl + s to save file
vim.keymap.set("n", "<C-s>", ":write<CR>", { silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:write<CR>", { silent = true })
vim.keymap.set("v", "<C-s>", "<Esc>:write<CR>", { silent = true })

-- Quick mode escape
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")
