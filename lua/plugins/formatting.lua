return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        vue = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        yml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        lua = { 'stylua' }, -- cargo install stylua
        glsl = { 'clang_format' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000,
      },
      formatters = {
        clang_format = {
          command = 'clang-format',
          args = { '-assume-filename=.glsl', '-style=file' },
        },
      },
    })

    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*.vs', '*.fs' },
        callback = function(args)
          require('conform').format({ bufnr = args.buf })
        end,
      })
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
