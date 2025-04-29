return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		vim.g["test#runner_commands"] = { "Rspec", "jest" }
		vim.g["test#javascript#runner"] = "jest"
		vim.g["test#javascript#mocha#options"] = ""
        vim.g["test#javascript#jest#file_pattern"] = '\\v(__tests__/.*|(spec|test))\\.(js|jsx|mjs|coffee|ts|tsx)$'
		vim.g["test#ruby#rspec#options"] =
			"--format progress --require ~/code/support/rspec/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out"
		vim.g["test#strategy"] = "vimux"

		vim.keymap.set("n", "<leader>tt", "<cmd>TestNearest<CR>", { silent = true, desc = "Run nearest test" })
		vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<CR>", { silent = true, desc = "Run current test file" })
		vim.keymap.set("n", "<leader>ts", "<cmd>TestSuite<CR>", { silent = true, desc = "Run test suite" })
		vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<CR>", { silent = true, desc = "Re-run last test" })

		vim.keymap.set("n", "<leader>vq", "<cmd>VimuxCloseRunner<CR>", { desc = "Close test runner window" })
		vim.keymap.set(
			"n",
			"<leader>qf",
			"<cmd>cg quickfix.out | cwindow<CR>",
			{ desc = "set test failures to quickfix list" }
		)
		vim.keymap.set(
			"n",
			"<leader>vqf",
			"<cmd>VimuxCloseRunner<CR> <cmd>cg quickfix.out | cwindow<CR>",
			{ desc = "Close test runner and set failures to quickfix list" }
		)
	end,
}
