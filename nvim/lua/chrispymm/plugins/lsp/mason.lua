return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local lsp_zero = require("lsp-zero")
		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"custom_elements_ls",
				"cssls",
				"jsonls",
				"lua_ls",
				"ruby_ls",
				"pylsp",
			},
			handlers = {
				lsp_zero.default_setup, -- default setup for all mason installed servers
				ruby_ls = lsp_zero.noop, -- configured manually in lsp-zero.lua
				lua_ls = lsp_zero.noop, -- configured manually in lsp-zero.lua
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				--     "pylint", -- python linter
				--     "eslint_d", -- js linter
			},
		})
	end,
}
