local config = {
    colorscheme = "tokyonight-storm",
    clipboard = "",
    plugins = {
        treesitter = {
            ensure_installed = { "astro", "bash", "css", "dockerfile", "dot", "graphql", "html", "javascript", "jsdoc", "json", "jsonc", "lua", "markdown", "prisma", "python", "regex", "tsx", "typescript", "yaml" }
        },
        ["mason-lspconfig"] = {
            ensure_installed = { "astro", "bashls", "cssls", "cssmodules_ls", "dockerls", "dotls", "emmet_ls", "graphql", "html", "jsonls", "sumneko_lua", "marksman", "prismals", "pyright", "tailwindcss", "tsserver", "yamlls" },
        },
        ['neo-tree'] = {
            window = {
                width = 40
            }
        },
        bufferline = {
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
    },
    highlights = {
        -- set highlights for all themes
        -- use a function override to let us use lua to retrieve colors from highlight group
        -- there is no default table so we don't need to put a parameter for this function
        init = function()
            -- get highlights from highlight groups
            local normal = astronvim.get_hlgroup "Normal"
            local fg, bg = normal.fg, normal.bg
            local bg_alt = astronvim.get_hlgroup("Visual").bg
            local green = astronvim.get_hlgroup("String").fg
            local red = astronvim.get_hlgroup("Error").fg
            -- return a table of highlights for telescope based on colors gotten from highlight groups
            return {
                TelescopeBorder = { fg = bg_alt, bg = bg },
                TelescopeNormal = { bg = bg },
                TelescopePreviewBorder = { fg = bg, bg = bg },
                TelescopePreviewNormal = { bg = bg },
                TelescopePreviewTitle = { fg = bg, bg = green },
                TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
                TelescopePromptNormal = { fg = fg, bg = bg_alt },
                TelescopePromptPrefix = { fg = red, bg = bg_alt },
                TelescopePromptTitle = { fg = bg, bg = red },
                TelescopeResultsBorder = { fg = bg, bg = bg },
                TelescopeResultsNormal = { bg = bg },
                TelescopeResultsTitle = { fg = bg, bg = bg },
            }
        end,
    },
    options = {
        g = {
            camelcasemotion_key = "<leader>",
            copilot_no_tab_map = true
        }
    },
    lsp = {
        formatting = {
            format_on_save = false,
            filter = function(client)
                print(client.name)
                if client.name == "sumneko_lua" then
                    return true
                end
                return client.name == "null-ls"
            end
        }
    },
    polish = function()
        local function alpha_on_bye(cmd)
            local bufs = vim.fn.getbufinfo { buflisted = true }
            vim.cmd(cmd)
            if require("core.utils").is_available "alpha-nvim" and not bufs[2] then
                require("alpha").start(true)
            end
        end

        vim.keymap.del("n", "<leader>c")
        if require("core.utils").is_available "bufdelete.nvim" then
            vim.keymap.set("n", "<leader>c", function()
                alpha_on_bye "Bdelete!"
            end, { desc = "Close buffer" })
        else
            vim.keymap.set("n", "<leader>c", function()
                alpha_on_bye "bdelete!"
            end, { desc = "Close buffer" })
        end
    end,
}

return config
