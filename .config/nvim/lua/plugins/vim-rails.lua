local M = {}

function M.setup()
    local map = require "utils.map"

    map.call { "ra", "", "ra", mode = "n" } -- revert the original binding replaced with :A
    map.call { "<Leader>ra", "Rails Alternative file", ":A<CR>", mode = "n" }
    map.call { "<Leader>rs", "Rails Alternative file", ":R<CR>", mode = "n" }
    map.call { "<Leader>rb",
        "TODO:",
        'viw"sy:Efixtures <C-r>=tolower(substitute(substitute(@s, \'\\n\', \'\', \'g\'), \'/\', \'\\\\/\', \'g\'))<cr>_factories<cr>',
        mode = "n" }
    map.call { "<Leader>rb",
        "TODO:",
        '"sy:Efixtures <C-r>=tolower(substitute(substitute(@s, \'\\n\', \'\', \'g\'), \'/\', \'\\\\/\', \'g\'))<cr>',
        mode = "v" }
end

return M
