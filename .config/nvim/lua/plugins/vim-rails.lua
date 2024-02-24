local M = {}

function M.setup()
    map { "ra", "", "ra", mode = "n" } -- revert the original binding replaced with :A
    map { "<A-r><A-a>", "Rails Alternative file", ":A<CR>", mode = "n" }
    map { "<A-r><A-s>", "Rails Alternative file", ":R<CR>", mode = "n" }
    map { "<A-g><A-f>",
        "TODO_MM:",
        'viw"sy:Efixtures <C-r>=tolower(substitute(substitute(@s, \'\\n\', \'\', \'g\'), \'/\', \'\\\\/\', \'g\'))<cr>_factories<cr>',
        mode = "n" }
    map { "<A-g><A-f>",
        "TODO_MM:",
        '"sy:Efixtures <C-r>=tolower(substitute(substitute(@s, \'\\n\', \'\', \'g\'), \'/\', \'\\\\/\', \'g\'))<cr>',
        mode = "v" }
end

return M
