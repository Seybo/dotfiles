local M = {}

function M.setup()
    map { "ss", "Search in buffer", "<Cmd>Pounce<CR>", mode = { "n", "v" } }
    map { "SS", "Search in buffer", "<Cmd>PounceRepeat<CR>", mode = { "n", "v" } }
end

return M
