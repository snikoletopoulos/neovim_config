return {
  icon_highlights = {
    breadcrumbs = true,
    file_icon = {
      tabline = function(self) return self.is_active or self.is_visible end,
      statusline = true,
      winbar = true,
    },
  }
}
