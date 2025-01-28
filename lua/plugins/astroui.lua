---@type LazySpec
return {
	"AstroNvim/astroui",
	opts = function(_, opts)
		---@type AstroUIOpts
		local config = {
			colorscheme = require("colorscheme"),
			highlights = {
				init = function()
					local highlights = {}
					if opts.highlights then
						highlights = type(opts.highlights.init) == "function" and opts.highlights.init()
							or opts.highlights.init
					end

					local base_highlights = require("astrocore").extend_tbl(highlights, {
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
						CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
					})

					if not require("snacks").util.is_transparent() then
						return require("astrocore").extend_tbl(
							base_highlights,
							require("utils.telescope"):get_highlight()
						)
					end

					return base_highlights
				end,
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
		}
		return require("astrocore").extend_tbl(opts, config)
	end,
}
