return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  config = function()
    local function setFormat(filetypes, formatter)
      local config = {}
      for _, filetype in ipairs(filetypes) do
        config[filetype] = { formatter }
      end
      return config
    end

    local formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
    }

    formatters_by_ft = vim.tbl_extend(
      'keep',
      formatters_by_ft,
      setFormat({
        'astro',
        'scss',
        'jsonc',
        'typescript',
        'typescriptreact',
        'javascript',
        'javascriptreact',
        'html',
        'markdown',
        'css',
        'json',
        'yaml',
        'json',
        'svelte',
        'YAML',
        'toml',
        'vue',
      }, { 'prettierd', 'prettier' })
    )

    require('conform').setup({
      -- Dont notify
      notify_on_error = false,

      -- Define your formatters
      formatters_by_ft = formatters_by_ft,

      -- Set up format-on-save
      format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { 'sql' }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end

        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match('/node_modules/') then
          return
        end

        -- Disable LSP fallback for certain languages
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,

      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2' },
        },
      },
    })

    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })
    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })

    vim.keymap.set('n', '<leader>cfe', '<cmd>FormatEnable<cr>', { silent = true, desc = 'Code [F]ormat [E]nable' })
    vim.keymap.set('n', '<leader>cfd', '<cmd>FormatDisable<cr>', { silent = true, desc = 'Code [F]ormat [D]isable' })
    vim.keymap.set('n', '<leader>cfD', '<cmd>FormatDisable!<cr>', { silent = true, desc = 'Code [F]ormat [D]isable for Buffer' })
  end,
}
