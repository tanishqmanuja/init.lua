return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = {
          preselect = function(ctx)
            return not require("blink.cmp").snippet_active({ direction = 1 })
          end,
        },
      },
    },
    keymap = {
      preset = "super-tab",
    },
  },
}
