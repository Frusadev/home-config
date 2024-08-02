-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "pyright", "nimls", "v_analyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig["pyright"].setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  python = {
    analysis = {
      autoSearchPaths = true,
      useLibraryCodeForTypes = true,
      diagnosticMode = "workspace",
      venvPath = ".venv",
      pythonPath = ".venv/venv/bin/python",
    },
  },
}

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function (ev)
--     local opts = {buffer = ev.buf}
--     vim.keymap.set('<leader>', 'gd', vim.lsp.buf.definition(), opts)
--   end
-- })
