return {
  'Exafunction/windsurf.vim',
  event = 'BufEnter',
  config = function()
    -- C-y接受
    vim.keymap.set('i', '<C-y>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })
    -- C-x清除提示
    vim.keymap.set('i', '<c-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true })
    vim.g.codeium_no_map_tab = 1
  end,
}
