---@type LazySpec
return {
	"AstroNvim/astrolsp",
	---@type AstroLSPOpts
	opts = {
		features = {
			codelens = true,
			inlay_hints = true,
			semantic_tokens = true,
			signature_help = true,
		},
		formatting = {
			format_on_save = { enabled = false },
			timeout_ms = 1000,
			filter = function(client)
				if vim.bo.filetype == "rust" then return client.name == "rust-analyzer" end
				if vim.bo.filetype == "toml" then return client.name == "taplo" end
				if vim.bo.filetype == "go" then return client.name == "gopls" end
				return client.name == "null-ls"
			end,
		},
		---@diagnostic disable: missing-fields
		config = {},
		handlers = {},
		mappings = {},
	},
}
