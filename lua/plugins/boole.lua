return {
  "nat-418/boole.nvim",
  event = "BufEnter",
  enabled = false,
  opts = {
    mappings = {
      increment = "<C-a>",
      decrement = "<C-x>",
      -- true
      -- no
      -- 6
    },
    additions = {
      { "production", "development" },
      { "let", "const" },
      { "start", "end" },
      { "import", "export" },
      { "before", "after" },
      { "plus", "minus" },
      { "left", "right" },
      { "is", "are" },
    },
  },
}
