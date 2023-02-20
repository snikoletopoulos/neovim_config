return function(hl)
  local C = require("default_theme.colors")

  hl.diag_ERROR = C.red_1
  hl.diag_WARN = C.yellow_1
  hl.diag_INFO = C.blue_1
  hl.diag_HINT = C.orange_1

  return hl
end
