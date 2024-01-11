return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>m", mark.add_file, { desc = "Add file to harpoon"})
		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle harpoon quickmenu"})

		vim.keymap.set("n", "<C-A-h>", function() ui.nav_file(1) end, { desc = "Jump to 1st harppon file"})
		vim.keymap.set("n", "<C-A-j>", function() ui.nav_file(2) end, { desc = "Jump to 2nd harppon file"})
		vim.keymap.set("n", "<C-A-k>", function() ui.nav_file(3) end, { desc = "Jump to 3rd harppon file"})
		vim.keymap.set("n", "<C-A-l>", function() ui.nav_file(4) end, { desc = "Jump to 4th harppon file"})
	end
}
