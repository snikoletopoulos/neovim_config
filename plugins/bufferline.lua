return {
    options = {
        separator_style = "padded_slant",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
        end,
        hover = {
            enabled = true,
            delay = 0.5,
            reveal = { "close" }
        },
    }
}
