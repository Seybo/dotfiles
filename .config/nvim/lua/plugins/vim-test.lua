local M = {}

function M.setup()
    -- so the focus doesnt switch to the terminal window
    local function NoFocusSwitch(cmd)
        -- Save the buffer if there are changes
        vim.cmd("update")
        vim.cmd("bel 15 new")
        vim.fn.termopen(cmd)
        vim.cmd("wincmd p") -- switch back to the last window
        -- vim.api.nvim_feedkeys("``", "n", false) -- for some reason it jumps to the beginning of buffer
    end

    vim.g["test#custom_strategies"] = { no_focus_switch = NoFocusSwitch }
    vim.g["test#strategy"] = "no_focus_switch"
    -- vim.g["test#javascript#runner"] = "jest"
    -- vim.g["test#javascript#jest#executable"] = "yarn test"
    -- vim.g["test#javascript#jest#file_pattern"] = ".*\\.test\\.jsx$"
    -- vim.g["test#project_root"] = "/mnt/dev/shaka/popmenu"

    map { "<Leader>tss", "Test single", vim.cmd.TestNearest, mode = { "n" } }
    map { "<Leader>tsr", "Test single (reopen terminal)", "<C-w>jii:TestNearest<CR>", mode = { "n" } }
    map { "<Leader>tff", "Test file", vim.cmd.TestFile, mode = { "n" } }
    map { "<Leader>tfr", "Test file (reopen terminal)", "<C-w>jii:TestFile<CR>", mode = { "n" } }
    map { "<Leader>tll", "Test last", vim.cmd.TestLast, mode = { "n" } }
    map { "<Leader>tlr", "Test last (reopen terminal)", "<C-w>jii:TestLast<CR>", mode = { "n" } }
    -- close opened test window
    map { "<Leader>tx", "Test (close terminal)", "<C-w>jii<CR>", mode = { "n" } }
end

return M
