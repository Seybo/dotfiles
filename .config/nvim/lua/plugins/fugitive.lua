local M = {}

function M.setup()
    local map = require "utils.map"

    map.call { "<leader>gt", "Git status", ":tab new<CR>:Git<CR><C-w>k:q<CR>", mode = { "n" } }
    map.call { "<leader>gbl", "Git blame", ":Git blame<CR>", mode = { "n" } }
    map.call { "<leader>gbb", "Git browse", ":GBrowse<CR>", mode = { "n", "v" } }
    map.call { "<leader>gbo", "Git browse origin", ":GBrowse origin:%<CR>", mode = { "n", "v" } }
end

return M
