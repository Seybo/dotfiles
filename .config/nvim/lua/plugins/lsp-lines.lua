local M = {}

function M.setup()
    plugin = require("lsp_lines")
    plugin.setup()

    -- dont show by default
    vim.diagnostic.config({ virtual_lines = false })

    local map = require "utils.map"
    map.call { "<Leader>ls", "LSP Lines (Diagnostic)", plugin.toggle, mode = { "n" } }
end

return M