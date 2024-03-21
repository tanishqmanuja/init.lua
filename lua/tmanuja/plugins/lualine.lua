local codeium_status = function(icon, separator)
  return {
    'vim.fn["codeium#GetStatusString"]()',
    fmt = function(str)
      local status = str:lower():match('^%s*(.-)%s*$')
      if status == '' or status == '*' then
        return ''
      else
        return (icon or 'codeium') .. (separator or ' ') .. status
      end
    end,
  }
end

return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  opts = {
    options = {
      theme = 'auto',
      globalstatus = true,
      icons_enabled = true,
      component_separators = { right = '«', left = '»' },
      section_separators = '',
      disabled_filetypes = { 'alpha' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = {
        codeium_status(),
        { 'filetype', icons_enabled = false },
      },
      lualine_y = {
        {
          'progress',
          fmt = function(str)
            if str == 'Bot' then
              return 'End'
            else
              return str
            end
          end,
        },
      },
      lualine_z = { 'location' },
    },
  },
}
