return {
    -- TODO: remove system clipboard
    clipboard = false,
    plugins = {
        -- TODO
        -- ["mason-nvim-dap"] = {
        -- ensure_installed = { "python" },
        -- },
        -- TODO
        -- ["mason-null-ls"] = {
        -- ensure_installed = { "prettier", "stylua" },
        -- },
        -- TODO
        cmp = {
            entry_filter = function(entry, context)
                print("hi")
                -- local kind = entry:get_kind()
                -- local node = ts_utils.get_node_at_cursor():type()
                --
                -- local line = context.cursor_line
                -- local col = context.cursor.col
                -- local char_before_cursor = string.sub(line, col - 1, col - 1)
                --
                -- if char_before_cursor == "." then
                --     return kind == 2 or kind == 5
                -- elseif string.match(line, "^%s*%w*$") then
                --     return kind == 3 or kind == 6
                -- elseif node == "arguments" then
                --     return kind == 6
                -- end
                return true
            end,
        },
    },
    cmp = {
        source_priority = {
            nvim_lsp = 1000,
            luasnip = 750,
            buffer = 500,
            path = 250,
        },
    },
    header = {
        "███    ██ ██ ██  ██ ██████ ██████   ██████",
        "████   ██ ██ ██ ██  ██     ██   ██ ██    ██",
        "██ ██  ██ ██ ████   ████   ██████  ██    ██",
        "██  ██ ██ ██ ██ ██  ██     ██   ██ ██    ██",
        "██   ████ ██ ██  ██ ██████ ██   ██  ██████",
        " ",
        "     ███    ██ ██    ██ ██ ███    ███",
        "     ████   ██ ██    ██ ██ ████  ████",
        "     ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "     ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "     ██   ████   ████   ██ ██      ██",
    },
    options = {
        g = {
            camelcasemotion_key = "<leader>",
            copilot_no_tab_map = true,
            loaded_perl_provider = 0,
        },
        opt = {
            swapfile = false,
        }
    },
    lsp = {
        formatting = {
            format_on_save = false,
            filter = function(client)
                if client.name == "sumneko_lua" then
                    return true
                end
                return client.name == "null-ls"
            end
        }
    },
}
