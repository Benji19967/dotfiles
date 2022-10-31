
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("benji19967.lsp.mason")
require("benji19967.lsp.handlers").setup()
require("benji19967.lsp.null-ls")
