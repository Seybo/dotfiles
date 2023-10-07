local M = {}

function M.setup()
    local plugin = require "spectre"
    local map = require "utils.map"

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

    map.call { "<Leader>st", "Search toggle", toggle, mode = { "n" } }
    map.call { "<Leader>sr", "Search toggle", "<cmd>lua require('spectre').resume_last_search()<CR>", mode = { "n" } }
    map.call { "<Leader>sw",
        "Search word under cursor",
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
        mode = { "n" },
    }
    map.call { "<Leader>sw", "Search selection", "<cmd>lua require('spectre').open_visual()<CR>", mode = { "v" } }
    map.call { "<Leader>sf", "Search on current file",
        "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", mode = {
        "v" } }
end

return M
