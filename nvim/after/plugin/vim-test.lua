vim.g["test#runner_commands"] = {'Rspec', 'Mocha'}
vim.g["test#javascript#runner"] = "mocha"
vim.g["test#javascript#mocha#options"] = "--recursive"
vim.g["test#ruby#rspec#options"] =  "--format progress --require ~/code/support/rspec/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out"
vim.g["test#strategy"] = "vimux"

vim.keymap.set("n", "<leader>t", "<cmd>TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<leader>T", "<cmd>TestFile<CR>", { silent = true })
vim.keymap.set("n", "<leader>a", "<cmd>TestSuite<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", "<cmd>TestLast<CR>", { silent = true })

vim.keymap.set("n", "<leader>vq", "<cmd>VimuxCloseRunner<CR>")
vim.keymap.set("n", "<leader>qf", "<cmd>cg quickfix.out | cwindow<CR>")
vim.keymap.set("n", "<leader>vqf", "<cmd>VimuxCloseRunner<CR> <cmd>cg quickfix.out | cwindow<CR>")
