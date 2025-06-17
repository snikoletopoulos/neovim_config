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
	{
		"jackMort/ChatGPT.nvim",
		enabled = vim.env.CHAT_GPT_API_KEY,
		opts = { api_key_cmd = "echo " .. (vim.env.CHAT_GPT_API_KEY or "") },
	},
	-- {
	-- 	"yetone/avante.nvim",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"echasnovski/mini.icons",
	-- 		"zbirenbaum/copilot.lua",
	-- 		{
	-- 			"HakonHarnes/img-clip.nvim",
	-- 			event = "VeryLazy",
	-- 			opts = {
	-- 				default = {
	-- 					embed_image_as_base64 = false,
	-- 					prompt_for_file_name = false,
	-- 					drag_and_drop = { insert_mode = true },
	-- 					use_absolute_path = true,
	-- 				},
	-- 			},
	-- 		},
	-- 		{
	-- 			"MeanderingProgrammer/render-markdown.nvim",
	-- 			opts = { file_types = { "markdown", "Avante" } },
	-- 			ft = { "markdown", "Avante" },
	-- 		},
	-- 	},
	-- 	opts = {
	-- 		provider = "claude",
	-- 		auto_suggestions_provider = "copilot",
	-- 		openai = { api_key_name = "CHAT_GPT_API_KEY" },
	-- 	},
	-- },
}
