local M = {}

function M.setup()
    local map = require "utils.map"

    vim.g.vimwiki_list = {
        {
            path   = "~/Dropbox/@docs/wiki/dev/",
            syntax = "markdown",
            ext    = ".md",
        },
        {
            path   = "~/Dropbox/@docs/wiki/ubuntu/",
            syntax = "markdown",
            ext    = ".md",
        },
        {
            path   = "~/Dropbox/@docs/wiki/nvim/",
            syntax = "markdown",
            ext    = ".md",
        },
        -- { not using it atm
        --     path   = "~/Dropbox/@docs/wiki/design/",
        --     syntax = "markdown",
        --     ext    = ".md",
        -- },
        {
            path   = "~/Dropbox/@docs/wiki/other/",
            syntax = "markdown",
            ext    = ".md",
        },
        {
            path   = "~/Dropbox/@docs/wiki/thoughts/",
            syntax = "markdown",
            ext    = ".md",
        },
    }
    vim.g.vimwiki_global_ext = 0

    map.call { "<Leader>vww", "Search toggle", ":VimwikiUISelect<CR>", mode = { "n" } }
    map.call { "<Leader>vwi", "Search toggle", ":VimwikiIndex<CR>", mode = { "n" } }
end

return M
