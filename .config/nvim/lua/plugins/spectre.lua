local M = {}

function M.setup()
    local plugin = require "spectre"

    plugin.setup {
        default = {
            find = {
                cmd = "rg",
                options = {},
            },
            replace = {
                cmd = "sed",
                options = {},
            },
        },
    }

    local function toggle()
        plugin.toggle()
        plugin.resume_last_search()
    end

    map { "<A-s>t", "Search toggle", toggle, mode = { "n" } }
    map { "<A-s>r", "Search toggle", "<cmd>lua require('spectre').resume_last_search()<CR>", mode = { "n" } }
    map { "<A-s>w",
        "Search word under cursor",
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
        mode = { "n" },
    }
    map { "<A-s>w", "Search selection", "<cmd>lua require('spectre').open_visual()<CR>", mode = { "v" } }
    map { "<A-s>f", "Search on current file",
        "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", mode = {
        "v" } }
end

return M
