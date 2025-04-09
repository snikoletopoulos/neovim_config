---@type LazySpec
return {
	"folke/snacks.nvim",
	keys = {
		{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
		{ "<leader>fS", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
		{ "<leader>ua", function() Snacks.dashboard.open() end, desc = "Toggle home screen" },
		{ "<leader>gL", function() Snacks.git.blame_line() end, desc = "View full Git blame" },
		{ "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "Find todo comments" },
	},
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			preset = {
				keys = {
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = function() Snacks.dashboard.pick("files") end,
					},
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "w",
						desc = "Find Text",
						action = function() Snacks.dashboard.pick("live_grep") end,
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = function() Snacks.dashboard.pick("oldfiles") end,
					},
					{
						icon = " ",
						key = "g",
						desc = "Lazygit",
						action = function()
							require("astrocore").toggle_term_cmd({ cmd = "lazygit ", direction = "float" })
						end,
					},
					{ icon = " ", key = "p", desc = "Select project", action = "<CMD>ProjectMgr<CR>" },
					{
						icon = " ",
						key = "s",
						desc = "Restore Session",
						action = function() require("resession").load("Last Session") end,
					},
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},

				header = [[
 ███    ██ ██ ██  ██ ██████ ██████   ██████
 ████   ██ ██ ██ ██  ██     ██   ██ ██    ██
 ██ ██  ██ ██ ████   ████   ██████  ██    ██
 ██  ██ ██ ██ ██ ██  ██     ██   ██ ██    ██
 ██   ████ ██ ██  ██ ██████ ██   ██  ██████]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{
					icon = " ",
					title = "Recent Files",
					section = "recent_files",
					indent = 2,
					padding = 1,
				},
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				function()
					local in_git = Snacks.git.get_root() ~= nil
					local cmds = {
						{
							pane = 2,
							icon = " ",
							desc = "Browse Repo",
							padding = 1,
							key = "b",
							action = function() Snacks.gitbrowse() end,
						},
						{
							title = "Notifications",
							cmd = "gh notify -s -a -n5",
							action = function() vim.ui.open("https://github.com/notifications") end,
							key = "n",
							icon = " ",
							height = 5,
						},
						{
							title = "Open Issues",
							cmd = " if gh issue list -L 3; then gh issue list -L 3; fi",
							key = "i",
							action = function() vim.fn.jobstart("gh issue list --web", { detach = true }) end,
							icon = " ",
							height = 7,
						},
						{
							icon = " ",
							title = "Open PRs",
							cmd = "gh pr list -L 3",
							key = "P",
							action = function() vim.fn.jobstart("gh pr list --web", { detach = true }) end,
							height = 7,
						},
						{
							icon = " ",
							title = "Git Status",
							cmd = "git diff --stat",
							height = 10,
						},
					}
					return vim.tbl_map(
						function(cmd)
							return vim.tbl_extend("force", {
								pane = 2,
								section = "terminal",
								enabled = in_git,
								padding = 1,
								ttl = 5 * 60,
								indent = 3,
							}, cmd)
						end,
						cmds
					)
				end,
				{ section = "startup" },
			},
		},
		image = { enabled = false }, -- TODO: set it up
		quickfile = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = {
			right = { "git", "fold" },
			folds = { open = true },
		},
		picker = {
			matcher = {
				cwd_bonus = true,
				frecency = true,
			},
			previewers = { git = { native = true } },
			win = {
				input = {
					keys = {
						["<C-x>"] = { "edit_split", mode = { "i", "n" } },
					},
				},
				list = {
					keys = {
						["<C-x>"] = "edit_split",
					},
				},
			},
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				_G.dd = function(...) Snacks.debug.inspect(...) end
				_G.bt = function() Snacks.debug.backtrace() end
				vim.print = _G.dd
			end,
		})
	end,
}
