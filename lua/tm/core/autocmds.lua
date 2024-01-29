local auto_group = vim.api.nvim_create_augroup
local auto_command = vim.api.nvim_create_autocmd

-- Just an alias for quitting
vim.api.nvim_create_user_command("Q", "q", {})

-- Highlight yanked text
local highlight_group = auto_group("YankHighlight", { clear = true })
auto_command("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Disable commenting new lines
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
