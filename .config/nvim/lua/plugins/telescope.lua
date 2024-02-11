local M = {}

function M.setup()
    local plugin = require "telescope"
    local builtin = require "telescope.builtin"
    local actions = require "telescope.actions"
    local layout = require "telescope.actions.layout"

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
                    ["<A-p>"] = layout.toggle_preview,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
                n = {
                    ["qq"] = actions.close,
                    ["<A-p>"] = layout.toggle_preview,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
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

    map { "<A-f>t", "telescope tags", builtin.help_tags, mode = { "n" } }
    map { "<A-f>b", "telescope buffers", builtin.buffers, mode = { "n" } }
    map { "<A-f>d", "telescope diagnostics", builtin.diagnostics, mode = { "n" } }
    map { "<A-f><A-f>", "telescope find files", find_files, mode = { "n" } }
    map { "<A-f>sb", "telescope fuzzy search in current buffer", current_buffer_fuzzy_find, mode = { "n" } }
    map { "<A-f>ss", "telescope live grep (word)", builtin.grep_string, mode = { "n" } }
    map { "<A-f>ss", "telescope live grep (selection)", live_grep_visual, mode = { "v" } }
    map { "<A-f>sm", "telescope live grep (manual)", live_grep, mode = { "n" } }
    map { "<A-f>k", "telescope keymaps", builtin.keymaps, mode = { "n" } }
    map { "<A-f>h", "telescope previously opened files", oldfiles, mode = { "n" } }
    map { "<A-f>gl", "telescope git log", builtin.git_commits, mode = { "n" } }
    map { "<A-f>ga", "telescope git stash", builtin.git_stash, mode = { "n" } }
    map { "<A-f>gk", "telescope git status", builtin.git_status, mode = { "n" } }

    -- TODOs are set in luasnip.lua
    local ts_grep = ":lua require('telescope.builtin').grep_string({ search = "
    local ts_keys = ":TodoTelescope keywords="
    local todo_desc = "telescope TODO "

    local todo_mappings = {
        { "<A-m>s", " (START_MM)",                ts_keys .. "START_MM initial_mode=normal<CR>" },
        { "<A-m>t", todo_desc .. "(TODO_MM)",     ts_keys .. "TODO_MM initial_mode=normal<CR>" },
        { "<A-m>q", todo_desc .. "(QUESTION_MM)", ts_keys .. "QUESTION_MM initial_mode=normal<CR>" },
        { "<A-m>c", todo_desc .. "(COMMENT_MM)",  ts_keys .. "COMMENT_MM initial_mode=normal<CR>" },
        { "<A-m>a", todo_desc .. "(all _MM)",     ts_grep .. "\"_MM:\", initial_mode=\"normal\"})<CR>" },
        { "<A-m>b", todo_desc .. "(BOOKMARK_MM)", ts_keys .. "BOOKMARK_MM initial_mode=normal<CR>" },
        { "<A-m>p", "telescope binding.pry",      ts_grep .. "\" binding.pry\"})<CR>" },
        { "<A-m>d", "telescope debugger",         ts_grep .. "\"debugger; // eslint-disable-line\"})<CR>" },
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
