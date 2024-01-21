local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VimEnter",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "html",
      "css",
      "scss",
      "gitignore",
      "javascript",
      "typescript",
      "jsdoc",
      "tsx",
      "json",
      "yaml",
      "c",
      "cpp",
      "lua",
      "markdown",
    },
    ignore_install = {},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" },
    },
    indent = {
      enable = true,
    },
    modules = {},
    auto_install = true,
    sync_install = false,
  })

  -- MDX
  vim.filetype.add({
    extension = {
      mdx = "mdx",
    },
  })
  vim.treesitter.language.register("markdown", "mdx")
end

return M
