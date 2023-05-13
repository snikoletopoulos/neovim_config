return {
  {
    "onsails/lspkind.nvim",
    opts = function(_, opts)
      opts.mode = "symbol_text"
      opts.preset = "codicons"

      opts.menu = {
        nvim_lua = "[api]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        buffer = "[Buffer]",
        path = "[Path]",
        npm = "[NPM]",
      }

      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
        Text = " ",
        Method = " ",
        Function = " ",
        Constructor = " ",
        Field = " ",
        Variable = " ",
        Class = " ",
        Interface = " ",
        Module = " ",
        Property = " ",
        Unit = " ",
        Value = " ",
        Enum = " ",
        Keyword = " ",
        Snippet = " ",
        Color = " ",
        File = " ",
        Reference = " ",
        Folder = " ",
        EnumMember = " ",
        Constant = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
      }
      return opts
    end
  }
}
