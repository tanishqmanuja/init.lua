local M = {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  init = false,
}

function M.opts()
  local dashboard = require('alpha.themes.dashboard')
  local logo = [[
  __                  _     __
 /\ \__             /' \  /'_ `\
 \ \ ,_\   ___ ___ /\_, \/\ \L\ \
  \ \ \/ /' __` __`\/_/\ \/_> _ <_
   \ \ \_/\ \/\ \/\ \ \ \ \/\ \L\ \
    \ \__\ \_\ \_\ \_\ \ \_\ \____/
     \/__/\/_/\/_/\/_/  \/_/\/___/
                                      ]]
  dashboard.section.header.val = vim.split(logo, '\n')

  dashboard.section.buttons.val = {
    dashboard.button('f', ' ' .. ' Find file', '<cmd> Telescope find_files hidden=true <cr>'),
    dashboard.button('n', ' ' .. ' New file', '<cmd> ene <BAR> startinsert <cr>'),
    dashboard.button('r', ' ' .. ' Recent files', '<cmd> Telescope oldfiles <cr>'),
    dashboard.button('q', ' ' .. ' Quit', '<cmd> qa <cr>'),
  }
  for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = 'AlphaButtons'
    button.opts.hl_shortcut = 'AlphaShortcut'
  end
  dashboard.section.header.opts.hl = 'AlphaHeader'
  dashboard.section.buttons.opts.hl = 'AlphaButtons'
  dashboard.section.footer.opts.hl = 'AlphaFooter'
  --  dashboard.opts.layout[1].val = 5
  return dashboard
end

function M.config(_, dashboard)
  -- close Lazy and re-open when the dashboard is ready
  if vim.o.filetype == 'lazy' then
    vim.cmd.close()
    vim.api.nvim_create_autocmd('User', {
      once = true,
      pattern = 'AlphaReady',
      callback = function()
        require('lazy').show()
      end,
    })
  end

  require('alpha').setup(dashboard.opts)

  local function nvim_version()
    local v = vim.version()
    local ret = table.concat({ v.major, v.minor, v.patch }, '.')
    if v.prerelease then
      ret = ret .. '-' .. v.prerelease
    end
    return ret
  end

  vim.api.nvim_create_autocmd('User', {
    once = true,
    pattern = 'LazyVimStarted',
    callback = function()
      local stats = require('lazy').stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = 'Neovim'
        .. ' v'
        .. nvim_version()
        .. ' • '
        .. 'loaded '
        .. stats.loaded
        .. '/'
        .. stats.count
        .. ' plugins in '
        .. ms
        .. 'ms'
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
end

return M
