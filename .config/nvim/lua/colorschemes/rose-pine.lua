local M = {}

-- colors: https://rosepinetheme.com/palette/ingredients/
function M.setup()
    local plugin = require "rose-pine"

    plugin.setup({
        variant = "dawn",

        groups = {
            background = "#fafaf7",
        },
        highlight_groups = {
            SpectreFile = { fg = "love" },
            SpectreSearch = { bg = "highlight_med", fg = "foam" },
        },
    })
    -- plugin.setup({
    --     variant = "moon",
    -- })
end

return M
