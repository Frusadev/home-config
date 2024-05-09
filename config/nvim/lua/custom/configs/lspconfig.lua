local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = "python",
})

-- or nimls
lspconfig.nim_langserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = "nim"
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
})

lspconfig.v_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = "vlang",
  cmd = {
    "v-analyzer"
  },
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "scss"
  }
})

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "html",
    "javascript",
  }
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function (ev)
--     local opts = {buffer = ev.buf}
--     vim.keymap.set('<leader>', 'gd', vim.lsp.buf.definition(), opts)
--   end
-- })
