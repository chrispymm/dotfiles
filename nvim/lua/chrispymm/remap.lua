vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ve", "<cmd>e ~/.config/nvim/init.lua<CR>")
--vim.keymap.set("n", "<leader>vr", "<cmd>so ~/.config/nvim/init.lua<CR>")

vim.keymap.set("n", "<leader>rnu", "<cmd>set relativenumber!")

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
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Make Y behave like the other capitals
vim.keymap.set("n", "Y", "yg$")

vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<CR>")

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set("n", "j", function()
    if vim.v.count == 0 then
        return 'gj'
    else
       return 'j'
    end
end, { silent = true, expr = true })

vim.keymap.set("n", "k", function()
    if vim.v.count == 0 then
        return 'gk'
    else
       return 'k'
    end
end, { silent = true, expr = true })

-- Start search and replace for word under cursor
vim.keymap.set("n", "<leader>s", [[%s/\<<C-r><C-w>\>/]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true })

vim.keymap.set("n", "<C-A-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-A-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-A-Right>", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<C-A-Left>", "<cmd>vertical resize -5<CR>")

vim.keymap.set("n", "<leader>-", "<cmd>wincmd _<CR><cmd>wincmd |<CR>")
vim.keymap.set("n", "<leader>=", "<cmd>wincmd =<CR>")

vim.keymap.set("n", "<leader>vx", "<cmd>Vexplore<CR>")
vim.keymap.set("n", "<leader>sx", "<cmd>Sexplore<CR>")

vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})

