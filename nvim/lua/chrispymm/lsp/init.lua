local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- require("chrispymm.lsp.lsp-installer")
require("mason").setup()
require("chrispymm.lsp.handlers").setup()
require("chrispymm.lsp.symbols-outline");
