local M = {}

function M.setup()
    map { "<leader>gt", "Git status", ":tab new<CR>:Git<CR><C-w>k:q<CR>", mode = { "n" } }
    map { "<leader>gbl", "Git blame", ":Git blame<CR>", mode = { "n" } }
    map { "<leader>gbb", "Git browse", ":GBrowse<CR>", mode = { "n", "v" } }
    map { "<leader>gbo", "Git browse origin", ":GBrowse origin:%<CR>", mode = { "n", "v" } }
end

return M
