-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true

-- Powershell
if LazyVim.is_win() then
  LazyVim.terminal.setup("pwsh")

  -- https://github.com/neovim/neovim/issues/17455
  -- if vim.o.shell == "pwsh" then
  -- vim.o.shell = "pwsh -nol"
  -- end
end
