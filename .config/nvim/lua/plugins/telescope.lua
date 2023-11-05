local M = {}

function M.setup()
    local plugin = require "telescope"
    local builtin = require "telescope.builtin"
    local actions = require "telescope.actions"
    local layout = require "telescope.actions.layout"
    local previewers = require "telescope.previewers"

    plugin.setup {
        defaults = {
            initial_mode = "normal",
            winblend = 10,
            layout_strategy = "vertical",
            layout_config = {
                vertical = {
                    width = 0.8,
                    height = 0.95,
                    preview_cutoff = 10,
                    mirror = true,
                },
            },
            mappings = {
                i = {
                    ["<M-p>"] = layout.toggle_preview,
                },
                n = {
                    ["qq"] = actions.close,
                    ["<M-p>"] = layout.toggle_preview,
                },
            },
            prompt_prefix = "🔎 ",
            file_ignore_patterns = {
                "%.git/",
                "node_modules",
                "docker",
                "undodir",
            },
            pickers = {
                oldfiles = {
                    initial_mode = "insert",
                },
            },
        },
    }

    -- Bindings

    local function current_buffer_fuzzy_find()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
            initial_mode = "insert",
            previewer = false,
        })
    end

    local function find_files()
        builtin.find_files({
            hidden = true,
            no_ignore = false,
            initial_mode = "insert",
            previewer = true,
        })
    end

    local function oldfiles()
        builtin.oldfiles({
            initial_mode = "insert",
        })
    end

    local function get_visual_selection()
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg("v")
        vim.fn.setreg("v", {})

        text = string.gsub(text, "\n", "")
        if #text > 0 then
            return text
        else
            return ""
        end
    end

    local function live_grep_visual()
        local text = get_visual_selection()
        builtin.grep_string({
            search = text,
        })
    end

    local function live_grep()
        builtin.live_grep({
            initial_mode = "insert",
        })
    end

    map { "<leader>tg", "telescope tags", builtin.help_tags, mode = { "n" } }
    map { "<leader>bl", "telescope buffers", builtin.buffers, mode = { "n" } }
    map { "<leader>ld", "telescope diagnostics", builtin.diagnostics, mode = { "n" } }
    map { "<leader>sb", "telescope fuzzy search in current buffer", current_buffer_fuzzy_find, mode = { "n" } }
    map { "<leader>ff", "telescope find files", find_files, mode = { "n" } }
    map { "<leader>ss", "telescope live grep (word)", builtin.grep_string, mode = { "n" } }
    map { "<leader>ss", "telescope live grep (selection)", live_grep_visual, mode = { "v" } }
    map { "<leader>sm", "telescope live grep (manual)", live_grep, mode = { "n" } }
    map { "<leader>km", "telescope keymaps", builtin.keymaps, mode = { "n" } }
    map { "<leader>fh", "telescope previously opened files", oldfiles, mode = { "n" } }
    map { "<leader>gl", "telescope git log", builtin.git_commits, mode = { "n" } }
    map { "<leader>gh", "telescope git stash", builtin.git_stash, mode = { "n" } }
    map { "<leader>gs", "telescope git status", builtin.git_status, mode = { "n" } }

    -- TODOs are set in luasnip.lua
    local ts_grep = ":lua require('telescope.builtin').grep_string({ search = "
    local ts_keys = ":TodoTelescope keywords="
    local todo_desc = "telescope TODO "

    local todo_mappings = {
        { "<leader>s1", " (START_MM)",                ts_keys .. "START_MM initial_mode=normal<CR>" },
        { "<leader>s2", todo_desc .. "(TODO_MM)",     ts_keys .. "TODO_MM initial_mode=normal<CR>" },
        { "<leader>s3", todo_desc .. "(QUESTION_MM)", ts_keys .. "QUESTION_MM initial_mode=normal<CR>" },
        { "<leader>s4", todo_desc .. "(COMMENT_MM)",  ts_keys .. "COMMENT_MM initial_mode=normal<CR>" },
        { "<leader>s5", todo_desc .. "(all _MM)",     ts_grep .. "\"_MM:\", initial_mode=\"normal\"})<CR>" },
        { "<leader>s6", todo_desc .. "(all _MM)",     ts_grep .. "\": mikhail\"})<CR>" },
        { "<leader>s7", todo_desc .. "(BOOKMARK_MM)", ts_keys .. "BOOKMARK_MM initial_mode=normal<CR>" },
        { "<leader>s8", "telescope binding.pry",      ts_grep .. "\" binding.pry\"})<CR>" },
        { "<leader>s9", "telescope debugger",         ts_grep .. "\"debugger; // eslint-disable-line\"})<CR>" },
    }

    for _, mapping in ipairs(todo_mappings) do
        map {
            mapping[1], -- key
            mapping[2], -- description
            mapping[3], -- command
            mode = { "n" },
        }
    end
end

return M
