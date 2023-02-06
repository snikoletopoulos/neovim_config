local config = {
  plugins = {
    init = {
      { "github/copilot.vim" },
      { "bkad/CamelCaseMotion" },
      { "pocco81/auto-save.nvim" },
      { "styled-components/vim-styled-components" },
      { "hail2u/vim-css3-syntax" },
      { "mbbill/undotree" },
      { "wellle/targets.vim" },
      { "tpope/vim-surround" }
    },

    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup function call
      local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      }

      return config -- return final config table
    end,
  },

  options = {
    g = {
      camelcasemotion_key = "<leader>"
    }
  },

  mappings = {
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
      ["<leader>ue"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
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
