return {
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons"
  },
  { "mbbill/undotree", lazy = false },
  -- ["dhruvasagar/vim-dotoo"] = {},
  {
    "j-hui/fidget.nvim",
    lazy = false,
    config = function()
      require("fidget").setup({})
    end
  },
  {
    "anuvyklack/fold-preview.nvim",
    lazy = false,
    dependencies = 'anuvyklack/keymap-amend.nvim',
    requires = 'anuvyklack/keymap-amend.nvim',
    config = function()
      -- require('fold-preview').setup(astronvim.user_opts("plugins.fold-preview", {}))
      require('fold-preview').setup({})
    end
  },
  {
    "anuvyklack/pretty-fold.nvim",
    lazy = false,
    config = function()
      require('pretty-fold').setup({})
    end
  },
  {
    "folke/noice.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("noice").setup({
        lsp = {
          progress = { enabled = false },
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = { enabled = false },
          hover = { enabled = false },
        },
        views = {
          cmdline_popup = {
            border = {
              style = "none",
              padding = { 1, 2 },
            },
            filter_options = {},
            win_options = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
        },
        presets = {
          -- bottom_search = false,     -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true,            -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
      })
    end
  },
}
