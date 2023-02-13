return {
    format_on_save = false,
    filter = function(client)
      if client.name == "sumneko_lua" then
        return true
      end
      return client.name == "null-ls"
    end
}
