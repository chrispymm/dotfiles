-- Re-balance windows on resize
vim.api.nvim_create_autocmd({ "VimResized" }, {
	pattern = "*",
	command = "wincmd =",
})

-- Strip trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function()
		print(vim.bo.filetype)
		if vim.bo.filetype ~= "javascriptreact" then
			return
		end
		vim.cmd([[%s/\s\+$//e]])
	end,
})

-- Set nunjucks files to have a filetype of html for syntax highlighting
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.njk",
	callback = function()
		vim.opt_local.filetype = "html.jinja"
	end,
})
-- Function to determine which runner to use based on file path
local function get_test_runner()
	local current_file = vim.fn.expand("%:p")
	if string.match(current_file, "/e2e/") or string.match(current_file, "%.playwright%.spec%.") then
		return "playwright"
	else
		return "jest"
	end
end

-- Auto-set the runner based on current file
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("VimTestRunner", { clear = true }),
	pattern = { "*.js", "*.jsx", "*.mjs", "*.coffee", "*.ts", "*.tsx" },
	callback = function()
		local runner = get_test_runner()
		vim.g["test#javascript#runner"] = runner
	end,
})
