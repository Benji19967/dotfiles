-- Check this works: `:LspInfo`
vim.lsp.config("pylsp", {
  -- Server-specific settings. See `:help lsp-quickstart`
  settings = {
    ["pylsp"] = {
      plugins = {
        pycodestyle = {
          ignore = { "E501" }, -- ignore line too long
          maxLineLength = 88,
        },
      },
    },
  },
})
