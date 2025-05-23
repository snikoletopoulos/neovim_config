---@type LazySpec
return {
	"AstroNvim/astroui",
	---@type AstroUIOpts
	opts = {
		colorscheme = require("colorscheme"),
		highlights = {
			init = {
				DiagnosticUnderlineError = { undercurl = true, sp = "#ef596f" },
				DiagnosticUnderlineHint = { undercurl = true, sp = "#2bbac5" },
				DiagnosticUnderlineInfo = { undercurl = true, sp = "#61afef" },
				DiagnosticUnderlineWarn = { undercurl = true, sp = "#e5c07b" },
			},
			onedark_vivid = {
				LspInlayHint = { fg = "#555566", bg = "#333344" },
				["@markup.list.checked"] = { fg = "#d55fde", bg = "NONE" },
			},
		},
		icons = {
			LSPLoading1 = "⠋",
			LSPLoading2 = "⠙",
			LSPLoading3 = "⠹",
			LSPLoading4 = "⠸",
			LSPLoading5 = "⠼",
			LSPLoading6 = "⠴",
			LSPLoading7 = "⠦",
			LSPLoading8 = "⠧",
			LSPLoading9 = "⠇",
			LSPLoading10 = "⠏",
		},
		status = {
			colors = {
				diag_ERROR = "#ec5f67",
				diag_WARN = "#ebae34",
				diag_INFO = "#40d9ff",
				diag_HINT = "#ff9640",
			},
			icon_highlights = {
				breadcrumbs = true,
				file_icon = {
					statusline = true,
					winbar = true,
				},
			},
		},
	},
}
