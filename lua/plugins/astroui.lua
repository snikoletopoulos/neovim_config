---@type LazySpec
return {
	"AstroNvim/astroui",
	opts = function(_, opts)
		local highlights_init = opts.highlights.init

		return require("astrocore").extend_tbl(opts, {
			colorscheme = require("colorscheme"),
			highlights = {
				init = function()
					local highlights = type(highlights_init) == "function" and highlights_init()
						or highlights_init

					local comment_highlight = require("utils.helpers"):get_highlight("Comment")

					---@type AstroUIOpts
					return require("astrocore").extend_tbl(highlights, {
						LspInlayHint = comment_highlight,

						-- VS code cmp
						CmpItemKindConstructor = { fg = "#f28b25" },
						CmpItemKindUnit = { fg = "#D4D4D4" },
						CmpItemKindProperty = { fg = "#D4D4D4" },
						CmpItemKindKeyword = { fg = "#D4D4D4" },
						CmpItemKindMethod = { fg = "#C586C0" },
						CmpItemKindFunction = { fg = "#C586C0" },
						CmpItemKindColor = { fg = "#C586C0" },
						CmpItemKindText = { fg = "#9CDCFE" },
						CmpItemKindInterface = { fg = "#9CDCFE" },
						CmpItemKindVariable = { fg = "#9CDCFE" },
						CmpItemKindField = { fg = "#9CDCFE" },
						CmpItemKindValue = { fg = "#9CDCFE" },
						CmpItemKindEnum = { fg = "#9CDCFE" },
						CmpItemKindEnumMember = { fg = "#9CDCFE" },
						CmpItemKindStruct = { fg = "#9CDCFE" },
						CmpItemKindReference = { fg = "#9CDCFE" },
						CmpItemKindTypeParameter = { fg = "#9CDCFE" },
						CmpItemKindSnippet = { fg = "#D4D4D4" },
						CmpItemKindClass = { fg = "#f28b25" },
						CmpItemKindModule = { fg = "#D4D4D4" },
						CmpItemKindOperator = { fg = "#D4D4D4" },
						CmpItemKindConstant = { fg = "#D4D4D4" },
						CmpItemKindFile = { fg = "#D4D4D4" },
						CmpItemKindFolder = { fg = "#D4D4D4" },
						CmpItemKindEvent = { fg = "#D4D4D4" },
						CmpItemAbbrMatch = { fg = "#18a2fe", bold = true },
						CmpItemAbbrMatchFuzzy = { fg = "#18a2fe", bold = true },
						CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },
						CmpItemAbbrDeprecated = {
							fg = "#7E8294",
							bg = "NONE",
							strikethrough = true,
						},
					})
				end,
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
				-- ScrollText = "",
				-- Diagnostic = "",
				-- Ellipsis = "",
				-- FileReadOnly = "",
				-- GitConflict = "",
				-- GitDelete = "",
				-- LSPLoaded = "",
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
		})
	end,
}
