local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
        require("dap-python").test_method()
      end
    }
  }
}


M.conform = {
  n = {
      ["<leader>fm"] = {
      function(args)
        local conform = require("conform")
        conform.format({ bufnr = vim.api.bufnr, async = true, lsp_fallback = true })
      end,
      "Conform formatting",
    },
  }
}

-- M.lspconfig = {
--   n = {
--     ["<leader>gd"] = {
--       function (ev)
--         vim.lsp.buf.definition({buffer = vim.api.bufnr})
--       end
--     }
--   }
-- }

return M
