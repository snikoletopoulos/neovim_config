local maps = { n = {}, i = {}, v = {}, x = {}, o = {} }

-- Editing
-- maps.n["<C-d>"] = { "<C-d>zz", desc = "Move half page down" }
-- maps.n["<C-u>"] = { "<C-u>zz", desc = "Move half page down" }
maps.n.n = { "nzzzv", desc = "Next result" }
maps.n.N = { "Nzzzv", desc = "Previous result" }
maps.x["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line(s) up" }
maps.x["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line(s) up" }
maps.x["<leader>p"] = { "\"_dP", desc = "Paste without coping" }
maps.n["<leader>y"] = { "\"+y", desc = "Yank to clipboard" }
maps.x["<leader>y"] = { "\"+y", desc = "Yank to clipboard" }
maps.n["<leader>Y"] = { "\"+Y", desc = "Yank line to clipboard" }
maps.x["<leader>d"] = { "\"_d", desc = "Cut" }
maps.n["<leader>d"] = { "\"_d", desc = "Cut" }
maps.n["<leader>fr"] = { ":%s/\\<<C-r><h-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace word in file" } -- TODO: fix this

-- Neovim behavior
maps.n["<leader>c"] = {
  function()
    local bufs = vim.fn.getbufinfo({ buflisted = true })
    require("astronvim.utils.buffer").close(0)
    if require("astronvim.utils").is_available("alpha-nvim") and not bufs[2] then require("alpha").start(true) end
  end,
  desc = "Close buffer",
}
maps.n["<leader>Q"] = { "<cmd>qa<CR>", desc = "Close all buffers" }

-- UI
maps.n["<leader>fa"] = { ":ASToggle<CR>", desc = "Toggle auto-save" }
maps.n["<leader>P"] = { "<cmd>Telescope command_palette<CR>", desc = "Command palette" }
maps.n["<leader>uu"] = { "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", desc = "Toggle undotree" }
maps.n["<leader>ut"] = { "<cmd>TroubleToggle<CR>", desc = "Toggle trouble" }
maps.n["<leader>fd"] = { "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Toggle trouble for document" }
maps.n["<leader>ft"] = { "<cmd>TodoTelescope<CR>", desc = "Find todos" }
maps.n["<leader>s"] = { name = " Search" }
maps.x["<leader>s"] = { name = " Search" }
maps.n["<leader>sr"] = { function() require("ssr").open() end, desc = "Structural search and replace" }
maps.x["<leader>sr"] = { function() require("ssr").open() end, desc = "Structural search and replace" }

-- Change default
maps.n["<leader>ua"] = { function() require("alpha").start() end, desc = "Home screen" }
maps.n["<leader>ue"] = { "<cmd>Neotree toggle action=show<cr>", desc = "Toggle Explorer" }

-- Github Copilot
maps.i["<M-Tab>"] = { 'copilot#Accept("")', replace_keycodes = false, expr = true, desc = "Accept Copilot suggestion" }
maps.i["<M-\\>"] = { "<M-S>", desc = "Force Copilot suggestion" }

-- Harpoon
maps.n["<leader>h"] = { name = "󱡅 Harpoon" }
maps.n["<leader>hh"] = { "<cmd>Telescope harpoon marks<CR>", desc = "Toggle Harpoon" }
maps.n["<leader>uh"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon" }
maps.n["<leader>ha"] = { function() require("harpoon.mark").add_file() end, desc = "Add file to Harpoon" }
maps.n["[h"] = { function() require("harpoon.ui").nav_prev() end, desc = "Previous Harpoon file" }
maps.n["]h"] = { function() require("harpoon.ui").nav_next() end, desc = "Next Harpoon file" }
maps.n["<leader>h1"] = { function() require("harpoon.ui").nav_file(1) end, desc = "Go to Harpoon file 1" }
maps.n["<leader>h2"] = { function() require("harpoon.ui").nav_file(2) end, desc = "Go to Harpoon file 2" }
maps.n["<leader>h3"] = { function() require("harpoon.ui").nav_file(3) end, desc = "Go to Harpoon file 3" }
maps.n["<leader>h4"] = { function() require("harpoon.ui").nav_file(4) end, desc = "Go to Harpoon file 4" }
maps.n["<leader>h5"] = { function() require("harpoon.ui").nav_file(5) end, desc = "Go to Harpoon file 5" }

-- Just naming
maps.n.Y = { name = "Yank line" }
maps.v.g = { r = { name = "Selection" } }
maps.n["<leader>ge"] = { desc = "Previous end of camel case word" }

-- TODO: fix which key some mappings
maps.i["<S-Left>"] = { name = "Previous camel case word" }
maps.i["<S-Right>"] = { name = "Next camel case word" }
-- maps.n["<leader>b"] = { name = "Previous camel case word" }
maps.n["<leader>w"] = { name = "Next camel case word" }
maps.n["<leader>w"] = false
maps.n["<leader>e"] = { name = "Next end of camel case word" }
maps.n["<leader>e"] = false

return maps
