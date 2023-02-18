return {
  n = {
    ["<leader>fa"] = { ":ASToggle<CR>", desc = "Toggle auto-save" },

    -- Center cursor on movements
    ["<C-d>"] = { "<C-d>zz", desc = "Move half page down" },
    ["<C-u>"] = { "<C-u>zz", desc = "Move half page down" },
    ["n"] = { "nzzzv", desc = "Next result" },
    ["N"] = { "Nzzzv", desc = "Previous result" },

    ["<leader>y"] = { "\"+y", desc = "Yank to clipboard" },
    ["<leader>Y"] = { "\"+Y", desc = "Yank line to clipboard" },
    ["<leader>d"] = { "\"_d", desc = "Cut" },

    -- UI
    ["<leader>uu"] = { "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", desc = "Toggle undotree" },
    ["<leader>ut"] = { "<cmd>TroubleToggle<CR>", desc = "Toggle trouble" },
    ["<leader>ft"] = { "<cmd>TodoTelescope<CR>", desc = "Find todos" },

    ["<leader>fr"] = { ":%s/\\<<C-r><h-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace word in file" },
    ["<leader>Q"] = { "<cmd>qa<CR>", desc = "Close all buffers" },

    -- Reset default
    ["<leader>w"] = false,
    ["<leader>ua"] = { function() require("alpha").start() end, desc = "Alpha Dashboard" },
    ["<leader>ue"] = { "<cmd>Neotree toggle action=show<cr>", desc = "Toggle Explorer" },

  },
  i = {
    ["<M-Tab>"] = { 'copilot#Accept("")', replace_keycodes = false, expr = true, desc = "Accept Copilot suggestion" },
    ["<M-\\>"] = { "<M-S>", desc = "Force Copilot suggestion" }
  },
  v = {
    -- Move lines
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line(s) up" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line(s) up" },

    ["<leader>y"] = { "\"+y", desc = "Yank to clipboard" },
    ["<leader>d"] = { "\"_d", desc = "Cut" },
  },
  x = {
    -- TODO move packages to P
    -- ["<leader>p"] = { "\"_dP" }
  }
}
