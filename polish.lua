return function()
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
end
