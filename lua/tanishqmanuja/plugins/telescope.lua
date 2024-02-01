local M = {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    { "nvim-telescope/telescope-fzy-native.nvim" },
    { "danielfalk/smart-open.nvim", dependencies = { "kkharji/sqlite.lua" } },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
}

M.keys = {
  { "<leader>pf", "<cmd>Telescope find_files hidden=true<cr>", desc = "Project Files" },
  { "<leader>pgf", "<cmd>Telescope git_files<cr>", desc = "project Git Files" },
  { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Project Search" },
  {
    "<leader>fw",
    function()
      require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
    end,
    desc = "Find Word",
  },
  {
    "<leader>fW",
    function()
      require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") })
    end,
    desc = "Find Word Extended",
  },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
  { "<leader>vh", "<cmd>Telescope help_tags<cr>", desc = "Vim Help" },
}

function M.config()
  local telescope = require("telescope")

  local opts = {
    defaults = {
      prompt_prefix = " ",
      file_ignore_patterns = { "^.git", "node_modules", ".next" },
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
      smart_open = {
        cwd_only = true,
        filename_first = true,
        show_scores = false,
        ignore_patterns = { "*.git/*", "*/tmp/*" },
        match_algorithm = "fzy",
        disable_devicons = false,
        open_buffer_indicators = { previous = "•", others = "∘" },
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          -- even more opts
        }),
      },
    },
  }

  telescope.setup(opts)
  -- load plugins
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("fzy_native")
  require("telescope").load_extension("ui-select")

  -- smart open
  vim.cmd([[command! -nargs=0 SmartOpen :Telescope smart_open]])
end

return M
