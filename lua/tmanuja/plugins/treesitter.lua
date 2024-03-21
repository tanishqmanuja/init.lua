local DEFAULT_LANGUAGES = {
  'bash',
  'c',
  'cpp',
  'css',
  'gitignore',
  'html',
  'javascript',
  'jsdoc',
  'json',
  'lua',
  'markdown',
  'scss',
  'tsx',
  'typescript',
  'yaml',
}

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufReadPost',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = DEFAULT_LANGUAGES,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
      },
      autotag = { enable = true },
      indent = { enable = true },
      auto_install = true,
      sync_install = false,
    })

    -- MDX Support
    vim.filetype.add({
      extension = {
        mdx = 'mdx',
      },
    })
    vim.treesitter.language.register('markdown', 'mdx')
  end,
}
