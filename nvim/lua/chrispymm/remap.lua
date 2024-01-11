vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ve", "<cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Edit init.lua" })
-- vim.keymap.set("n", "<leader>vr", "<cmd>so ~/.config/nvim/init.lua<CR>")

vim.keymap.set("n", "<leader>rn", "<cmd>set relativenumber!", { desc = "Toggle relative numbering" })

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set("v", "y", "myy`y")
vim.keymap.set("v", "Y", "myY`y")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste replace visual selection without copying it
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Make Y behave like the other capitals
vim.keymap.set("n", "Y", "yg$")

vim.keymap.set("i", "jj", "<esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "jk", "<esc>", { desc = "Exit insert mode" })

vim.keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<CR>", { desc = "View symbols outline for buffer" })

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set("n", "j", function()
	if vim.v.count == 0 then
		return "gj"
	else
		return "j"
	end
end, { silent = true, expr = true })

vim.keymap.set("n", "k", function()
	if vim.v.count == 0 then
		return "gk"
	else
		return "k"
	end
end, { silent = true, expr = true })

-- Start search and replace for word under cursor
vim.keymap.set("n", "<leader><leader>s", [[%s/\<<C-r><C-w>\>/]], { desc = "Search and replace word under cursor" })

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Allows for navigating panes using the same keys as in tmux --
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true })

-- resizing --
vim.keymap.set("n", "<C-A-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-A-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-A-Right>", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<C-A-Left>", "<cmd>vertical resize -5<CR>")

-- splits --
vim.keymap.set("n", "<leader>sm", "<cmd>wincmd _<CR><cmd>wincmd |<CR>", { desc = "Maximise current split" }) --maximize split
vim.keymap.set("n", "<leader>se", "<cmd>wincmd =<CR>", { desc = "Equalize splits" }) --equealize splits
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>sx", "<cmd>vsplit %:h<CR>", { desc = "Vertical split with file tree" })

-- tabs --
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- fat fingers --
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
