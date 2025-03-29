local logo = [[
  __                  _     __
 /\ \__             /' \  /'_ `\
 \ \ ,_\   ___ ___ /\_, \/\ \L\ \
  \ \ \/ /' __` __`\/_/\ \/_> _ <_
   \ \ \_/\ \/\ \/\ \ \ \ \/\ \L\ \
    \ \__\ \_\ \_\ \_\ \ \_\ \____/
     \/__/\/_/\/_/\/_/  \/_/\/___/
]]

---@diagnostic disable-next-line: cast-local-type
logo = vim.split(logo, "\n")

local max = 0

for _, line in ipairs(logo) do
  if #line > max then
    max = #line
  end
end

for i, line in ipairs(logo) do
  if #line < max then
    local padding = string.rep(" ", max - #line)
    logo[i] = line .. padding
  end
end

logo = table.concat(logo, "\n")

return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = logo,
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
