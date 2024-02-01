return {
  "Exafunction/codeium.vim",
  event = "InsertEnter",
  keys = {
    { "<leader>cse", "<cmd>Codeium Enable<cr>", desc = "Codeium Enable" },
    { "<leader>csd", "<cmd>Codeium Disable<cr>", desc = "Codeium Disable" },
  },
  config = function()
    -- <C-J> catches Ctrl + Enter
    vim.keymap.set("i", "<C-J>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true })

    vim.keymap.set("i", "<M-]>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true })

    vim.keymap.set("i", "<M-[>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true })

    vim.keymap.set("i", "<C-e>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true })
  end,
}
