return {
  on_attach = function(client, bufnr)
    print("tsserver on_attach", vim.inspect(client))
    require("twoslash-queries").attach(client, bufnr)
  end,
}
