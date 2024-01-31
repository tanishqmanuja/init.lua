local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VimEnter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
}

local DEFAULT_LANGUAGES = {
  "bash",
  "c",
  "cpp",
  "css",
  "gitignore",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "markdown",
  "scss",
  "tsx",
  "typescript",
  "yaml",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = DEFAULT_LANGUAGES,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" },
    },
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    auto_install = true,
    sync_install = false,
    ignore_install = {},
    modules = {},
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
