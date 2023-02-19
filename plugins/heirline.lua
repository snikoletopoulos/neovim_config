return function(config)
  config[1] = {
    hl = { fg = "fg", bg = "bg" },
    astronvim.status.component.mode({ mode_text = { padding = { left = 1, right = 1 } } }),
    astronvim.status.component.git_branch(),
    astronvim.status.component.file_info(
      (astronvim.is_available "bufferline.nvim" or vim.g.heirline_bufferline)
      and { filetype = {}, filename = false, file_modified = false }
      or nil
    ),
    astronvim.status.component.git_diff(),
    astronvim.status.component.fill(),
    astronvim.status.component.cmd_info(),
    astronvim.status.component.fill(),
    astronvim.status.component.diagnostics({ padding = { right = 0 }, surround = { separator = "none" } }),
    -- LSP
    astronvim.status.component.builder(
      astronvim.status.utils.setup_providers(
        {
          lsp_client_names = {
            str = " ",
            update = { "LspAttach", "LspDetach", "BufEnter" },
            icon = { kind = "ActiveLSP", padding = { right = 0 } },
          },
          hl = astronvim.status.hl.get_attributes "lsp",
          surround = { separator = "right", color = "lsp_bg", condition = astronvim.status.condition.lsp_attached },
          on_click = {
            name = "heirline_lsp",
            callback = function()
              vim.defer_fn(function() vim.cmd.LspInfo() end, 100)
            end,
          },
        },
        { "lsp_client_names" },
        function(p_opts)
          return {
            flexible = 1,
            astronvim.status.utils.build_provider(p_opts, astronvim.status.provider.str(p_opts)),
          }
        end
      )
    ),
    astronvim.status.component.treesitter(),
    astronvim.status.component.nav(),
  }
  return config
end
