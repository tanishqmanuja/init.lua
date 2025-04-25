-- Auto-load session if Neovim is started without arguments
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("Persistence", { clear = true }),
  callback = function()
    -- NOTE: Before restoring the session, check:
    -- 1. No arg passed when opening nvim, means no `nvim --some-arg ./some-path`
    -- 2. No pipe, e.g. `echo "Hello world" | nvim`
    if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
      -- vim.defer_fn(function()
      require("persistence").load()
      -- end, 100)
    end
  end,
  -- HACK: need to enable `nested` otherwise the current buffer will not have a filetype(no syntax)
  nested = true,
})

return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    need = 1,
  },
  config = function(_, opts)
    local persistence = require("persistence")
    persistence.setup(opts)
  end,
}
