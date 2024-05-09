local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = {"biome"},
    html = {"prettier"},
    json = {'jq'},
    javascriptreact = {"biome"},
    typescriptreact = {"biome"},
    python = {"black"},
  },
  notify_on_error = false,
})


-- vim.api.nvim_create_autocmd({"TextChanged", "InsertLeave"}, {
--   pattern = "*",
--   callback = function(args)
--     conform.format({ bufnr = args.buf, async = true })
--   end,
-- })
