---@type LazySpec
return {

	{
		"kevinhwang91/nvim-bqf",
		opts = function(_, opts)
			if not opts.preview then opts.preview = {} end
			if Snacks.util.is_transparent() then opts.preview.winblend = 0 end
			return opts
		end,
	},
}
