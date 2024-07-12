require("notify").setup {
  max_width = 80,
  render = "wrapped-compact",
  on_open = function(win)
    vim.api.nvim_win_set_option(win, "wrap", true)
  end,
}
