return {
  'rcarriga/nvim-notify',
  enabled = true,
  event = 'VimEnter',
  config = function()
    require('notify').setup({
      stages = 'fade_in_slide_out',
      timeout = 1000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
      top_down = false
    })
  end,
}
