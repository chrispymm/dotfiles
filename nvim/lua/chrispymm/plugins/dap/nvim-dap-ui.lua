return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.adapters.php = {
			type = "executable",
			command = "node",
			-- change this to where you build vscode-php-debug
			args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
		}

		dap.configurations.php = {
			-- to run php right from the editor
			{
				name = "run current script",
				type = "php",
				request = "launch",
				port = 9003,
				cwd = "${fileDirname}",
				program = "${file}",
				runtimeExecutable = "php",
			},
			-- to listen to any php call
			{
				name = "listen for Xdebug local",
				type = "php",
				request = "launch",
				port = 9003,
			},
		}

		-- toggle the UI elements after certain events
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		dapui.setup()

		local function map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend("force", options, opts)
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end

		vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

		map("n", "<F5>", require("dap").continue, {})
		map("n", "<F10>", require("dap").step_over, {})
		map("n", "<F11>", require("dap").step_into, {})
		map("n", "<F12>", require("dap").step_out, {})
		map("n", "<leader>b", require("dap").toggle_breakpoint, {})
		map("n", "<leader>du", ":lua require'dapui'.toggle()<cr>", {})

		-- you'll want this because we don't want xdebug to start automatically everytime
		function insert_xdebug()
			local pos = vim.api.nvim_win_get_cursor(0)[2]
			local line = vim.api.nvim_get_current_line()
			local nline = line:sub(0, pos) .. "xdebug_break();" .. line:sub(pos + 1)
			vim.api.nvim_set_current_line(nline)
		end

		map("n", "<leader>ds", "<cmd>lua insert_xdebug()<cr>")
	end,
}
