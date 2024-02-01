local M = {
  "nvimtools/none-ls.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local null_ls = require("null-ls")
  local null_ls_utils = require("null-ls.utils")

  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
    sources = {
      diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file({
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            ".eslintrc.json",
          })
        end,
      }),
    },
  })
end

return M
