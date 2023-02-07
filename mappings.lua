return {
    n = {
        ["<leader>as"] = { ":ASToggle<CR>", desc = "Toggle auto-save" },

        -- Center cursor on movements
        ["<C-d>"] = { "<C-d>zz" },
        ["<C-u>"] = { "<C-u>zz" },
        ["n"] = { "nzzzv" },
        ["N"] = { "Nzzzv" },

        ["<leader>y"] = { "\"+y", desc = "Yank to clipboard" },
        ["<leader>Y"] = { "\"+Y", desc = "Yank line to clipboard" },
        ["<leader>d"] = { "\"_d", desc = "Cut" },

        ["<leader>ut"] = { "<cmd>UndotreeToggle<CR>", desc = "Toogle undotree" },

        ["<leader>ra"] = { ":%s/\\<<C-r><h-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace word in file" },

        -- Reset default
        ["<leader>w"] = false,
        ["<leader>ua"] = { function() require("alpha").start() end, desc = "Alpha Dashboard" },
        ["<leader>ue"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },

        ["<leAder>ux"] = { "<cmd>TroubleToggle<cr>", desc = "Toggle trouble" }
    },
    i = {
        ["<M-Tab>"] = {'copilot#Accept("")', expr = true},
        ["<M-\\>"] = { "<M-S>" }
    },
    v = {
        -- Move lines
        ["J"] = { ":m '>+1<CR>gv=gv" },
        ["K"] = { ":m '<-2<CR>gv=gv" },

        ["<leader>y"] = { "\"+y", desc = "Yank to clipboard" },
        ["<leader>d"] = { "\"_d", desc = "Cut" },
    },
    x = {
        -- TODO
        -- ["<leader>p"] = { "\"_dP" }
    }
}
