local M = {}

function M.setup()
    map { "<Leader>gb", "Fugitive: Git blame", ":Git blame<CR>", mode = { "n" } }
    map { "<Leader>gr", "Fugitive: Git browse", ":GBrowse<CR>", mode = { "n", "v" } }
    map { "<Leader>go", "Fugitive: Git browse origin", ":GBrowse origin:%<CR>", mode = { "n", "v" } }
end

return M
