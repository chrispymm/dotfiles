return {
	{
		"dracula/vim",
		name = "dracula",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme dracula]])

			vim.cmd([[
				highlight ActiveWindow guibg=#282A36
				highlight InactiveWindow guibg=#30323E
				highlight WinSeparator guibg=NONE
				highlight WinSeparator guifg=#5B5D69
			]])

			local window_management = vim.api.nvim_create_augroup('vimrc', { clear = true })

			vim.api.nvim_create_autocmd({ "WinEnter" }, {
				pattern = '*',
				group = window_management,
				callback = function()
					vim.opt_local.winhighlight = "Normal:ActiveWindow,NormalNC:InactiveWindow"
					vim.opt_local.colorcolumn = "+1"
					vim.opt_local.cursorline = true
				end
			})

			vim.api.nvim_create_autocmd({ "WinLeave" }, {
				pattern = '*',
				group = window_management,
				callback = function()
					vim.opt_local.colorcolumn = "0"
					vim.opt_local.cursorline = false
				end
			})
		end,
	}
}
