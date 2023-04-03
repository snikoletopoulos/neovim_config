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
    ["<leader>fd"] = { "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Toggle trouble for document" },
    ["<leader>ft"] = { "<cmd>TodoTelescope<CR>", desc = "Find todos" },
    ["<leader>fr"] = { ":%s/\\<<C-r><h-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace word in file" },
    ["<leader>Q"] = { "<cmd>qa<CR>", desc = "Close all buffers" },
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo({ buflisted = true })
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available("alpha-nvim") and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },
    -- Reset default
    ["<leader>ua"] = { function() require("alpha").start() end, desc = "Alpha Dashboard" },
    ["<leader>ue"] = { "<cmd>Neotree toggle action=show<cr>", desc = "Toggle Explorer" },
    -- Just naming
    Y = { name = "Yank line" },
    ["<leader>w"] = { name = "Next camel case word" },
    ["<leader>b"] = { name = "Previous camel case word" },
    ["<leader>e"] = { name = "Next end of camel case word" },
    ["<leader>ge"] = { name = "Previous end of camel case word" },
    -- Harpoon
    ["<leader>h"] = "Harpoon",
    ["<leader>hh"] = { "<cmd>Telescope harpoon marks<CR>", desc = "Toggle Harpoon" },
    ["<leader>uh"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon" },
    ["<leader>ha"] = { function() require("harpoon.mark").add_file() end, desc = "Add file to Harpoon" },
    ["[h"] = { function() require("harpoon.ui").nav_prev() end, desc = "Previous Harpoon file" },
    ["]h"] = { function() require("harpoon.ui").nav_next() end, desc = "Next Harpoon file" },
    ["<leader>h1"] = { function() require("harpoon.ui").nav_file(1) end, desc = "Go to Harpoon file 1" },
    ["<leader>h2"] = { function() require("harpoon.ui").nav_file(2) end, desc = "Go to Harpoon file 2" },
    ["<leader>h3"] = { function() require("harpoon.ui").nav_file(3) end, desc = "Go to Harpoon file 3" },
    ["<leader>h4"] = { function() require("harpoon.ui").nav_file(4) end, desc = "Go to Harpoon file 4" },
    ["<leader>h5"] = { function() require("harpoon.ui").nav_file(5) end, desc = "Go to Harpoon file 5" },
  },
  i = {
    ["<M-Tab>"] = { 'copilot#Accept("")', replace_keycodes = false, expr = true, desc = "Accept Copilot suggestion" },
    ["<M-\\>"] = { "<M-S>", desc = "Force Copilot suggestion" },
    -- Just naming
    ["<S-Left>"] = { name = "Previous camel case word" },
    ["<S-Right>"] = { name = "Next camel case word" },
  },
  v = {
    -- Move lines
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line(s) up" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line(s) up" },
    ["<leader>y"] = { "\"+y", desc = "Yank to clipboard" },
    ["<leader>d"] = { "\"_d", desc = "Cut" },
    -- Just naming
    g = {
      r = { name = "Selection" }
    }
  },
  x = {
    -- TODO move packages to P
    -- ["<leader>p"] = { "\"_dP" },
    iw = { name = "Inner word" },
    ib = { name = "Inner previous word" },
    ie = { name = "Inner end of word" },
  },
  o = {
    iw = { name = "Inner word" },
    ib = { name = "Inner previous word" },
    ie = { name = "Inner end of word" },
  }
}
