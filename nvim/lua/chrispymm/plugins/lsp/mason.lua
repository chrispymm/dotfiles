return {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				-- these will be buffer-local keybindings
				-- because they only work if you have an active language server

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end,
		})
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
			automatic_enable = true,
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
				"eslint",
			},
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = lsp_capabilities,
					})
				end,
				stylelint_lsp = function()
					lspconfig.stylelint_lsp.setup({
						capabilities = lsp_capabilities,
						settings = {
							stylelintplus = {
								autoFixOnFormat = true,
							},
						},
					})
				end,
				eslint = function()
					lspconfig.eslint.setup({
						capabilities = lsp_capabilities,
						settings = {
							autoFixOnFormat = true,
						},
					})
				end,
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
