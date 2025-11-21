return {
  {
    "neovim/nvim-lspconfig", -- collection of LSP servers for the Nvim LSP client
  },
  {
    "mason-org/mason.nvim", -- package manager for LSP servers, formatters, linters
    opts = {},
  },
  {
    -- bridges nvim-lspconfig and mason
    -- will automatically vim.lsp.enable() lsp servers installed via Mason
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- these will automatically be installed by Mason if they are not already installed
      ensure_installed = {
        "pyright",
        "clangd",
        "julials",
        "lua_ls",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
}
