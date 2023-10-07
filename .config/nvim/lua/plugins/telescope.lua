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

    local map = require "utils.map"

    map.call { "<leader>tg", "telescope tags", builtin.help_tags, mode = { "n" } }
    map.call { "<leader>bl", "telescope buffers", builtin.buffers, mode = { "n" } }
    map.call { "<leader>ld", "telescope diagnostics", builtin.diagnostics, mode = { "n" } }
    map.call { "<leader>sb", "telescope fuzzy search in current buffer", current_buffer_fuzzy_find, mode = { "n" } }
    map.call { "<leader>ff", "telescope find files", find_files, mode = { "n" } }
    map.call { "<leader>ss", "telescope live grep (word)", builtin.grep_string, mode = { "n" } }
    map.call { "<leader>ss", "telescope live grep (selection)", live_grep_visual, mode = { "v" } }
    map.call { "<leader>sm", "telescope live grep (manual)", builtin.live_grep, mode = { "n" } }
    map.call { "<leader>km", "telescope keymaps", builtin.keymaps, mode = { "n" } }
    map.call { "<leader>fh", "telescope previously opened files", oldfiles, mode = { "n" } }
    map.call { "<leader>gc", "telescope git commits", builtin.git_commits, mode = { "n" } }
    map.call { "<leader>gt", "telescope git stash", builtin.git_stash, mode = { "n" } }
    map.call { "<leader>gs", "telescope git status", builtin.git_status, mode = { "n" } }
    -- todos are set in luasnip.lua
    map.call { "<leader>s1", "telescope TODO (START_MM)", ":TodoTelescope keywords=START_MM initial_mode=normal<CR>", mode = {
        "n" } }
    map.call { "<leader>s2", "telescope TODO (TODO_MM)", ":TodoTelescope keywords=TODO_MM initial_mode=normal<CR>", mode = {
        "n" } }
    map.call { "<leader>s3", "telescope TODO (QUESTION_MM)",
        ":TodoTelescope keywords=QUESTION_MM initial_mode=normal<CR>", mode = { "n" } }
    map.call { "<leader>s4", "telescope TODO (COMMENT_MM)", ":TodoTelescope keywords=COMMENT_MM initial_mode=normal<CR>", mode = {
        "n" } }
    map.call {
        "<leader>s5",
        "telescope TODO (all _MM)",
        ":lua require('telescope.builtin').grep_string({ search = \"_MM:\", initial_mode=\"normal\"})<CR>",
        mode = { "n" },
    }
    map.call {
        "<leader>s6",
        "telescope TODO (all _MM)",
        ":lua require('telescope.builtin').grep_string({ search = \": mikhail\"})<CR>",
        mode = { "n" },
    }
    map.call {
        "<leader>s8",
        "telescope binding.pry",
        ":lua require('telescope.builtin').grep_string({ search = \" binding.pry\"})<CR>",
        mode = { "n" },
    }
    map.call {
        "<leader>s9",
        "telescope debugger",
        ":lua require('telescope.builtin').grep_string({ search = \"debugger; // eslint-disable-line\"})<CR>",
        mode = { "n" },
    }
end

return M
