return {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				prompt_prefix = " >",
				color_devicons = true,

				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

				pickers = {
					lsp_code_actions = {
						theme = "get_cursor"
					}
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					}
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = false,
						override_file_sorter = true,
					},
				},
			}
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'Find files in cwd' })
		vim.keymap.set("n", "<leader>fr", builtin.live_grep, { desc = 'Find string in cwd' })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = 'Find git files' })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = 'Find buffers' })
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = 'Find git branches' })
	end
}
