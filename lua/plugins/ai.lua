---@type LazySpec
return {
	{
		"zbirenbaum/copilot.lua",
		opts = {
			filetypes = { yaml = true, markdown = true },
			suggestion = { enabled = false },
			panel = { enabled = false },
			server_opts_overrides = {
				settings = {
					telemetry = { telemetryLevel = "off" },
				},
			},
		},
	},
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	opts = {
	-- 		keymaps = {
	-- 			accept_suggestion = "<M-l>",
	-- 			clear_suggestion = "<M-h>",
	-- 			accept_word = "<M-w>",
	-- 		},
	-- 	},
	-- },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = { "zbirenbaum/copilot.lua", "nvim-lua/plenary.nvim" },
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatClose",
			"CopilotChatToggle",
			"CopilotChatStop",
			"CopilotChatReset",
			"CopilotChatSave",
			"CopilotChatLoad",
			"CopilotChatPrompts",
			"CopilotChatModels",
			"CopilotChatAgents",
			"CopilotChatExplain",
			"CopilotChatReview",
			"CopilotChatFix",
			"CopilotChatOptimize",
			"CopilotChatDocs",
			"CopilotChatTests",
			"CopilotChatCommit",
		},
		opts = {
			question_header = "## User ",
			answer_header = "## Copilot ",
			error_header = "## Error ",
			separator = " ",
			auto_follow_cursor = false,
			show_help = true,
			window = { relative = "win" },
			mappings = { reset = { normal = "<C-r>", insert = "<C-r>" } },
		},
	},
}
