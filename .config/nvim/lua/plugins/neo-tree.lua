local M = {}

function M.setup()
    local plugin = require "neo-tree"


    local function copy_path(state, fmt)
        local fs = require "utils.fs"
        local function yank(text)
            vim.fn.setreg("+", text)
        end

        local node = state.tree:get_node()
        local filepath = node:get_id()

        local result = fs.format(filepath, fmt)

        if result ~= nil then
            yank(result)
            print("Copied to clipboard: " .. result)
            vim.defer_fn(function() vim.cmd.echo('""') end, 5000)
        end
    end

    plugin.setup {
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = false,
        use_default_mappings = false, -- enable later when all my mappings are done
        filesystem = {
            components = {
                name = function(config, node, state)
                    local highlights = require "neo-tree.ui.highlights"

                    local text = node.name
                    local highlight = config.highlight or highlights.FILE_NAME

                    if node.type == "directory" then
                        highlight = highlights.DIRECTORY_NAME
                    end
                    if node:get_depth() == 1 then
                        text = string.upper(vim.fn.fnamemodify(node.path, ":t"))
                        highlight = highlights.ROOT_NAME
                    else
                        if config.use_git_status_colors == nil or config.use_git_status_colors then
                            local git_status = state.components.git_status({}, node, state)
                            if git_status and git_status.highlight then
                                highlight = git_status.highlight
                            end
                        end
                    end
                    return {
                        text = text,
                        highlight = highlight,
                    }
                end,
            },
            filtered_items = {
                visible = true, -- when true, the below will just be displayed differently
                hide_dotfiles = true,
                hide_gitignored = true,
                hide_hidden = true,
            },
        },
        window = {
            width = 60,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
            mappings = {
                ["<CR>"] = "open",
                ["l"] = "open",
                ["oh"] = "open_split",
                ["ov"] = "open_vsplit",
                ["h"] = "close_node",
                ["H"] = "close_all_nodes",
                ["p"] = { "toggle_preview", config = { use_float = true } },
                ["P"] = "focus_preview",
                ["R"] = "refresh",
                ["?"] = "show_help",
                [">"] = "next_source",
                ["<"] = "prev_source",
                ["fa"] = {
                    "add",
                    config = {
                        show_path = "none", -- "none", "relative", "absolute"
                    },
                },
                ["fA"] = "add_directory",
                ["fd"] = "delete",
                ["fr"] = "rename",
                ["fy"] = "copy_to_clipboard",
                ["fc"] = "cut_to_clipboard",
                ["fp"] = "paste_from_clipboard",
                ["fla"] = function(state) copy_path(state, "absolute") end,
                ["flr"] = function(state) copy_path(state, "relative") end,
                ["flf"] = function(state) copy_path(state, "filename") end,
                ["fln"] = function(state) copy_path(state, "filestem") end,
            },
        },
        git_status = {
            window = {
                mappings = {
                    ["A"]  = "git_add_all",
                    ["gu"] = "git_unstage_file",
                    ["ga"] = "git_add_file",
                    ["gr"] = "git_revert_file",
                    ["gc"] = "git_commit",
                    ["gp"] = "git_push",
                    ["gg"] = "git_commit_and_push",
                },
            },
        },
        event_handlers = {
            { -- auto close on file open
                event = "file_opened",
                handler = function()
                    require("neo-tree.command").execute({ action = "close" })
                end,
            },

        },
    }

    local function open_file_tree()
        vim.cmd "Neotree source=filesystem position=left toggle=true reveal=true"
    end

    local function open_git_tree()
        vim.cmd "Neotree source=git_status position=float toggle=true reveal=true"
    end

    local map = require "utils.map"

    map.call { "<C-f><C-f>", "Neo-tree All Files tree", open_file_tree, mode = { "n" } }
    map.call { "<C-f><C-g>", "Neo-tree Git changed Files tree", open_git_tree, mode = { "n" } }
    map.call { "<C-f><C-s>", "Neo-tree (session files)", ":Neotree ~/.local/share/nvim/sessions<CR>", mode = { "n" } }
    map.call { "<C-f><C-v>", "Neo-tree (oldvim config)", ":Neotree ~/.myconfig/vim<CR>", mode = { "n" } }
end

return M
