-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "pastelDark",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
  term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.3, vsp = 0.8 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },
  nvdash = {
    load_on_startup = false,
    header = {
      "███████ ██████  ██    ██ ███████  █████  ██████  ███████ ██    ██ ",
      "██      ██   ██ ██    ██ ██      ██   ██ ██   ██ ██      ██    ██ ",
      "█████   ██████  ██    ██ ███████ ███████ ██   ██ █████   ██    ██ ",
      "██      ██   ██ ██    ██      ██ ██   ██ ██   ██ ██       ██  ██  ",
      "██      ██   ██  ██████  ███████ ██   ██ ██████  ███████   ████   ",
    },
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
    },
  },
}

vim.api.nvim_exec(
  [[
  autocmd BufRead,BufNewFile *.v setfiletype vlang
]],
  false
)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("CdProject")
  end
})
-- vim.diagnostic.config({ virtual_text = false })

return M
