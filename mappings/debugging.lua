local utils = require("astronvim.utils")

local M = {}

function M.debugging(maps)
	maps.n["<leader>d"] = false
	maps.n["<leader>D"] = { desc = utils.get_icon("Debugger", 1, true) .. "Debugger" }

	maps.v["<leader>d"] = false
	maps.v["<leader>D"] = { desc = utils.get_icon("Debugger", 1, true) .. "Debugger" }

	-- modified function keys found with `showkey -a` in the terminal to get key code
	-- run `nvim -V3log +quit` and search through the "Terminal info" in the `log` file for the correct keyname
	maps.n["<leader>db"] = false
	maps.n["<leader>Db"] = {
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "Toggle Breakpoint (F9)",
	}

	maps.n["<leader>dB"] = false
	maps.n["<leader>DB"] = {
		function()
			require("dap").clear_breakpoints()
		end,
		desc = "Clear Breakpoints",
	}

	maps.n["<leader>dc"] = false
	maps.n["<leader>Dc"] = {
		function()
			require("dap").continue()
		end,
		desc = "Start/Continue (F5)",
	}

	maps.n["<leader>dC"] = false
	maps.n["<leader>DC"] = {
		function()
			vim.ui.input({ prompt = "Condition: " }, function(condition)
				if condition then
					require("dap").set_breakpoint(condition)
				end
			end)
		end,
		desc = "Conditional Breakpoint (S-F9)",
	}

	maps.n["<leader>di"] = false
	maps.n["<leader>Di"] = {
		function()
			require("dap").step_into()
		end,
		desc = "Step Into (F11)",
	}

	maps.n["<leader>do"] = false
	maps.n["<leader>Do"] = {
		function()
			require("dap").step_over()
		end,
		desc = "Step Over (F10)",
	}

	maps.n["<leader>dO"] = false
	maps.n["<leader>DO"] = {
		function()
			require("dap").step_out()
		end,
		desc = "Step Out (S-F11)",
	}

	maps.n["<leader>dq"] = false
	maps.n["<leader>Dq"] = {
		function()
			require("dap").close()
		end,
		desc = "Close Session",
	}

	maps.n["<leader>dQ"] = false
	maps.n["<leader>DQ"] = {
		function()
			require("dap").terminate()
		end,
		desc = "Terminate Session (S-F5)",
	}

	maps.n["<leader>dp"] = false
	maps.n["<leader>Dp"] = {
		function()
			require("dap").pause()
		end,
		desc = "Pause (F6)",
	}

	maps.n["<leader>dr"] = false
	maps.n["<leader>Dr"] = {
		function()
			require("dap").restart_frame()
		end,
		desc = "Restart (C-F5)",
	}

	maps.n["<leader>dR"] = false
	maps.n["<leader>DR"] = {
		function()
			require("dap").repl.toggle()
		end,
		desc = "Toggle REPL",
	}

	maps.n["<leader>ds"] = false
	maps.n["<leader>Ds"] = {
		function()
			require("dap").run_to_cursor()
		end,
		desc = "Run To Cursor",
	}

	if utils.is_available("nvim-dap-ui") then
		maps.n["<leader>dE"] = false
		maps.n["<leader>DE"] = {
			function()
				vim.ui.input({ prompt = "Expression: " }, function(expr)
					if expr then
						require("dapui").eval(expr, { enter = true })
					end
				end)
			end,
			desc = "Evaluate Input",
		}

		maps.v["<leader>dE"] = false
		maps.v["<leader>DE"] = {
			function()
				require("dapui").eval()
			end,
			desc = "Evaluate Input",
		}

		maps.n["<leader>du"] = false
		maps.n["<leader>Du"] = {
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle Debugger UI",
		}

		maps.n["<leader>dh"] = false
		maps.n["<leader>Dh"] = {
			function()
				require("dap.ui.widgets").hover()
			end,
			desc = "Debugger Hover",
		}
	end

	return maps
end

return M
