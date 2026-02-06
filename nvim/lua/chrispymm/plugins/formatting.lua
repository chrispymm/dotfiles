return {
	"stevearc/conform.nvim",
	version = "^7.1.0",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	keys = {},
	config = function()
		local conform = require("conform")
		local util = require("conform.util")

		conform.setup({
			formatters_by_ft = {
                -- use lsp_format first to allow eslint and stylelint 
                -- to run and autofix before applying prettier formatting
				javascript = { "prettier", lsp_format = "first"},
				css = {  "prettier", lsp_format = "first" },
				scss = { "prettier", lsp_format = "first" },
				lua = { "stylua" },
				python = { "isort", "black" },
				--jinja = { "djlint" },
				--ruby = { "rubocop" }
				-- Rubocop via confirm does not work - instead we allow fallback
				-- to lsp (ruby-ls) which uses rubocop as a formatter.
			},
			formatters = {
				-- stylelint = {
				-- 	command = util.from_node_modules("stylelint"),
				-- 	args = { "--stdin", "--stdin-filename", "$FILENAME", "--fix" },
				-- 	exit_codes = { 0, 2 }, -- code 2 is given when trying file includees some non-autofixable errors
				-- 	stdin = true,
				-- 	cwd = util.root_file({
				-- 		"package.json",
				-- 	}),
				-- },
			},
            format_on_save = {
                lsp_fallback = false,
                timeout_ms = 1000
            }
			-- format_after_save = {
			-- 	lsp_fallback = false,
			-- 	async = true,
			-- 	timeout_ms = 1000,
			-- },
			-- Disabled for initial work with MOJ Design system
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = false,
				async = true,
				timeout_ms = 1000,
			})
		end, { desc = "CP Format file or range (in visual mode)" })
	end,
}
