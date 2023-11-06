local M = {}

function M.setup()
    map { "ra", "", "ra", mode = "n" } -- revert the original binding replaced with :A
    map { "<Leader>ra", "Rails Alternative file", ":A<CR>", mode = "n" }
    map { "<Leader>rs", "Rails Alternative file", ":R<CR>", mode = "n" }
    map { "<Leader>gf",
        "TODO:",
        'viw"sy:Efixtures <C-r>=tolower(substitute(substitute(@s, \'\\n\', \'\', \'g\'), \'/\', \'\\\\/\', \'g\'))<cr>_factories<cr>',
        mode = "n" }
    map { "<Leader>gf",
        "TODO:",
        '"sy:Efixtures <C-r>=tolower(substitute(substitute(@s, \'\\n\', \'\', \'g\'), \'/\', \'\\\\/\', \'g\'))<cr>',
        mode = "v" }
end

return M
