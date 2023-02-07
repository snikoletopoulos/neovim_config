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
        }
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
