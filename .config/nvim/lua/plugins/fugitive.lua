local M = {}

function M.setup()
    map { "<A-g>bl", "Fugitive: Git blame", ":Git blame<CR>", mode = { "n" } }
    map { "<A-g>bb", "Fugitive: Git browse", ":GBrowse<CR>", mode = { "n", "v" } }
    map { "<A-g>bo", "Fugitive: Git browse origin", ":GBrowse origin:%<CR>", mode = { "n", "v" } }
end

return M
