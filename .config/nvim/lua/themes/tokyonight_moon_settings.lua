local M = {}

function M.setup()
    local plugin = require "tokyonight"
    vim.o.background = "dark"
    plugin.setup({
        style = "moon",     -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
    })
end

return M
