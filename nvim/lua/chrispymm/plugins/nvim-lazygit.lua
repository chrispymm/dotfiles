vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = "~/.config/lazygit/config.yml" -- custom config file path

return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		{ "<leader>G", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
}
