---@type LazySpec
return {
	{
		"zbirenbaum/copilot.lua",
		opts = { filetypes = { yaml = true, markdown = true } },
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = { "zbirenbaum/copilot.lua", "nvim-lua/plenary.nvim" },
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatClose",
			"CopilotChatToggle",
			"CopilotChatReset",
			"CopilotChatSave",
			"CopilotChatLoad",
			"CopilotChatDebugInfo",
			"CopilotChatExplain",
			"CopilotChatTests",
			"CopilotChatFix",
			"CopilotChatOptimize",
			"CopilotChatDocs",
			"CopilotChatFixDiagnostic",
			"CopilotChatCommit",
			"CopilotChatCommitStaged",
		},
		keys = {
			{
				"<leader>cca",
				function()
					vim.ui.input({ prompt = "Quick Chat" }, function(input)
						if not input or input == "" then return end
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end)
				end,
				desc = "Quick chat",
				mode = { "n", "v" },
			},
			{
				"<leader>cch",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.help_actions())
				end,
				desc = "Help actions",
				mode = { "n", "v" },
			},
			{
				"<leader>ccp",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "Prompt actions",
				mode = { "n", "v" },
			},
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
		config = function(_, opts)
			require("CopilotChat").setup(opts)

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-*",
				callback = function()
					local ft = vim.bo.filetype
					if ft == "copilot-chat" then vim.bo.filetype = "markdown" end
				end,
			})
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		enabled = vim.env.CHAT_GPT_API_KEY,
		opts = { api_key_cmd = "echo " .. (vim.env.CHAT_GPT_API_KEY or "") },
	},
}
