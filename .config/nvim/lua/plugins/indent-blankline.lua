local M = {}

function M.setup()
  local plugin = require "indent_blankline"

  plugin.setup {
    char = "⋅",
  }
end

return M
