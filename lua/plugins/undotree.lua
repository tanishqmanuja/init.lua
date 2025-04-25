if vim.fn.has("win32") == 1 then
  -- Fix for nvim not including diff and windows not having it in PATH
  -- Issue: https://github.com/mbbill/undotree/issues/168
  vim.g.undotree_DiffCommand = vim.fn.stdpath("config") .. "\\bin\\diff.exe"
end

return {
  "mbbill/undotree",
  keys = {
    { "<leader>su", "<cmd>UndotreeToggle<cr>", desc = "[U]ndotree Tree" },
  },
}
