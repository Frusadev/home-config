local options = {
  ensure_installed = { "lua" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  autotag = {
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = { "html" , "xml", "javascript", "javascriptreact", "typescript", "typescriptreact", "php"},
    enable = true,
  },

  indent = { enable = true },
}

return options
