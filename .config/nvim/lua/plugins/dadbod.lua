local M = {}

function M.setup()
    vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

    local map = require "utils.map"

    map.call { "<Leader>db", "Dadbod DBUI", ":DBUI<CR>", mode = { "n" } }
end

return M
