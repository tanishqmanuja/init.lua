return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options.component_separators = ""
    opts.options.section_separators = ""

    local mode_map = {
      ["NORMAL"] = "N",
      ["O-PENDING"] = "N?",
      ["INSERT"] = "I",
      ["VISUAL"] = "V",
      ["V-BLOCK"] = "VB",
      ["V-LINE"] = "VL",
      ["V-REPLACE"] = "VR",
      ["REPLACE"] = "R",
      ["COMMAND"] = "!",
      ["SHELL"] = "SH",
      ["TERMINAL"] = "T",
      ["EX"] = "X",
      ["S-BLOCK"] = "SB",
      ["S-LINE"] = "SL",
      ["SELECT"] = "S",
      ["CONFIRM"] = "Y?",
      ["MORE"] = "M",
    }

    opts.sections.lualine_a = {
      {
        "mode",
        fmt = function(s)
          return mode_map[s] or s
        end,
      },
    }

    opts.sections.lualine_b = {
      {
        "branch",
        icon = "",
      },
    }

    opts.sections.lualine_y = {
      { "progress" },
    }

    opts.sections.lualine_z = {
      { "location" },
    }
  end,
}
