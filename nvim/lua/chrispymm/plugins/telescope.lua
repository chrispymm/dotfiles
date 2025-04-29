return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
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
						theme = "get_cursor",
					},
					find_files = {
						find_command = { "fd", "--hidden", "--glob", "" },
					},
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = false,
						override_file_sorter = true,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({
				-- hidden = true,
    --             no_ignore = false,
				find_command = { "fd", "--hidden", "--glob", "--exclude", ".git" },
			})
		end, { desc = "Find files in cwd" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find in vim help" })
		vim.keymap.set("n", "<leader>fr", builtin.live_grep, { desc = "Find string in cwd" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fgb", builtin.git_branches, { desc = "Find git branches" })
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "Find in neovim config" })
	end,
}
