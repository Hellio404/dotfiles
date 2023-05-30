local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
capabilities.offsetEncoding = { "utf-16" }

local lspconfig = require "lspconfig"
local servers = {
	"clangd",
	"tsserver",
	"rust_analyzer",
	"bashls",
	"cssls",
	"dockerls",
	"docker_compose_language_service",
	-- "gopls",
	"html",
	"perlnavigator",
	"pyright",
	-- "ruby_ls",
	"sqlls",
	"jsonls",
}

for _, lsp in ipairs(servers) do
	-- ignore rust_analyzer as it will be handled by rust-tools.nvim
	if lsp == "rust_analyzer" then
		goto continue
	end

	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	::continue::
end

return {
	ensure_installed = servers
}
