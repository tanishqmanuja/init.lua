-- use R to run any file! very nice
-- this overrides the vim native replace mode, which i never use
return {
  "CRAG666/code_runner.nvim",
  event = "LazyFile",
  config = true,
  opts = {
    mode = "term",
    startinsert = true,
    filetype = {
      typescript = "bun run",
      python = "python3 -u",
    },
    term = {
      position = "vert", -- horiz, top, vert
      size = 93,
    },
    float = {
      border = "rounded",
      close_key = "<ESC>",
      blend = 10,
    },
  },
  keys = {
    { "<leader>cx", "<cmd>RunFile float<cr>", desc = "[C]ode e[X]ecute" }, -- K --> up --> floating window
    -- { "RK", "<cmd>RunFile float<cr>", desc = "Run Code in Float" }, -- K --> up --> floating window
    -- { "RJ", "<cmd>RunFile term<cr>", desc = "Run Code in Term" }, -- J --> down --> bottom split
  },
}
