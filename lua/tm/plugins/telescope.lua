local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },
  lazy = false,
  keys = {
    { "<leader>pf", "<cmd>Telescope find_files hidden=true<cr>", desc = "Project Files" },
    { "<leader>pgf", "<cmd>Telescope git_files<cr>", desc = "project Git Files" },
    { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Project Search" },
    {
      "<leader>fw",
      '<cmd>lua require("telescope.builtin").grep_string({search = vim.fn.expand("<cword>")})<cr>',
      desc = "Find Word",
    },
    {
      "<leader>fW",
      '<cmd>lua require("telescope.builtin").grep_string({search = vim.fn.expand("<cWORD>")})<cr>',
      desc = "Find Word Extended",
    },
    { "<leader>vh", "<cmd>Telescope help_tags<cr>", desc = "Vim Help" },
  },
}

function M.config()
  local telescope = require("telescope")

  local opts = {
    defaults = {
      file_ignore_patterns = { ".git/", "node_modules" },
      prompt_prefix = " ",
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--hidden",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--trim",
        "--glob=!.git/",
      },

      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }

  telescope.setup(opts)
end

return M
