-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Quick escape
vim.keymap.set("i", "jj", "<Esc>")

-- Lazy remap
-- vim.keymap.del("n", "<leader>l")
-- vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Terminal
local win_term = { wo = { winbar = "" } }

vim.keymap.set("n", "<leader>ft", function()
  Snacks.terminal(nil, { cwd = LazyVim.root(), win = win_term })
end, { desc = "Terminal (Root Dir)" })
vim.keymap.set("n", "<C-`>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root(), win = win_term })
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Comment
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comment line" })
vim.keymap.set("x", "<C-/>", "gc", { remap = true, desc = "Comment line" })

vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Comment line" })
vim.keymap.set("x", "<C-_>", "gc", { remap = true, desc = "Comment line" })

-- Faster line navigation
vim.keymap.set({ "n", "o", "x" }, "<s-h>", "^", { desc = "Jump to start of line" })
vim.keymap.set({ "n", "o", "x" }, "<s-l>", "g_", { desc = "Jump to end of line" })

-- Quick Buffer
vim.keymap.set("n", "<leader><leader>", "<cmd>b#<cr>", { desc = "Quick Buffer" })

-- LazyGit
if vim.fn.executable("lazygit") == 1 then
  vim.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit({ cwd = LazyVim.root.git(), win = {
      border = "rounded",
    } })
  end, { desc = "Lazygit (Root Dir)" })

  vim.keymap.set("n", "<leader>gG", function()
    Snacks.lazygit({
      win = {
        border = "rounded",
      },
    })
  end, { desc = "Lazygit (cwd)" })
end
