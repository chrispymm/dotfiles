return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		local set_keys = function(client, bufnr)
			local keymap = vim.keymap -- for conciseness
			local opts = { noremap = true, silent = true, buffer = bufnr }

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		lsp_zero.on_attach = function(client, bufnr)
			set_keys(client, bufnr)
		end

		lsp_zero.set_sign_icons({
			error = " ",
			warn = " ",
			hint = "󰠠 ",
			info = " ",
		})

		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

		require("lspconfig").ruby_ls.setup({
			cmd = { "bundle", "exec", "ruby-lsp" },
			on_attach = function(client, buffer)
				set_keys(client, buffer)
				local callback = function()
					local params = vim.lsp.util.make_text_document_params(buffer)

					client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
						if err then
							return
						end

						vim.lsp.diagnostic.on_publish_diagnostics(
							nil,
							vim.tbl_extend("keep", params, { diagnostics = result.items }),
							{ client_id = client.id }
						)
					end)
				end

				callback() -- call on attach

				vim.api.nvim_create_autocmd(
					{ "BufEnter", "BufWritePre", "BufReadPost", "InsertLeave", "TextChanged" },
					{
						buffer = buffer,
						callback = callback,
					}
				)
			end,
		})
	end,
}
