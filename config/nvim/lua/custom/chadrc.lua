---@type ChadrcConfig
local M = {}

M.ui = { theme = 'yoru' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- require("custom.configs.ts_autag")
vim.api.nvim_exec([[
  autocmd BufRead,BufNewFile *.v setfiletype vlang
]], false)

return M
