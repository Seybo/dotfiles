local M = {}

function M.setup()
    local map = require "utils.map"

    map.call { "ss", "Search in buffer", "<Cmd>Pounce<CR>", mode = { "n", "v" } }
    map.call { "SS", "Search in buffer", "<Cmd>PounceRepeat<CR>", mode = { "n", "v" } }
end

return M
