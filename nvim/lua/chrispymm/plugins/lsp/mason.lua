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
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"lua_ls",
				"pylsp",
				"ruby_lsp",
				"rubocop",
                "stylelint_lsp",
                "eslint"
			},
			handlers = {
				lsp_zero.default_setup, -- default setup for all mason installed servers
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				-- "rubocop", -- ruby formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
			},
		})
	end,
}
