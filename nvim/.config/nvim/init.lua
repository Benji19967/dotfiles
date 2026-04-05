if vim.g.vscode then
  -- VSCode-specific settings
  -- Only load "logic" plugins here
  print("Running in VS Code!")
else
  -- Standard Neovim settings (Telescope, Lualine, etc.)
  -- print("Running in Terminal!")
end

require("config.diagnostics")
require("config.lazy")
require("config.keymaps")

require("lsp.python")

require("lazy").setup("plugins")
