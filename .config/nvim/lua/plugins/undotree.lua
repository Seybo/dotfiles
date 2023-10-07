local M = {}

function M.setup()
    local map = require "utils.map"

    map.call { "<F5>", "Undo tree", vim.cmd.UndotreeToggle, mode = { "n" } }
end

return M
