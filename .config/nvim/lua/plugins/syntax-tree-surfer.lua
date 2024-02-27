local M = {}

function M.setup()
    require("syntax-tree-surfer").setup({
        highlight_group = "STS_highlight",
        disable_no_instance_found_report = false,
        default_desired_types = {
            "function",
            "arrow_function",
            "function_definition",
            "if_statement",
            "else_clause",
            "else_statement",
            "elseif_statement",
            "for_statement",
            "while_statement",
            "switch_statement",
        },
        left_hand_side = "fdsawervcxqtzb",
        right_hand_side = "jkl;oiu.,mpy/n",
        icon_dictionary = {
            ["if_statement"] = "",
            ["else_clause"] = "",
            ["else_statement"] = "",
            ["elseif_statement"] = "",
            ["for_statement"] = "ﭜ",
            ["while_statement"] = "ﯩ",
            ["switch_statement"] = "ﳟ",
            ["function"] = "",
            ["function_definition"] = "",
            ["variable_declaration"] = "",
        },
    })

    -- Syntax Tree Surfer
    local opts = { noremap = true, silent = true }

    -- Normal Mode Swapping:
    -- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
    vim.keymap.set("n", "vU", function()
        vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
        return "g@l"
    end, { silent = true, expr = true })
    vim.keymap.set("n", "vD", function()
        vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
        return "g@l"
    end, { silent = true, expr = true })

    -- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
    vim.keymap.set("n", "vd", function()
        vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
        return "g@l"
    end, { silent = true, expr = true })
    vim.keymap.set("n", "vu", function()
        vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
        return "g@l"
    end, { silent = true, expr = true })

    --> If the mappings above don't work, use these instead (no dot repeatable)
    -- vim.keymap.set("n", "vd", '<cmd>STSSwapCurrentNodeNextNormal<cr>', opts)
    -- vim.keymap.set("n", "vu", '<cmd>STSSwapCurrentNodePrevNormal<cr>', opts)
    -- vim.keymap.set("n", "vD", '<cmd>STSSwapDownNormal<cr>', opts)
    -- vim.keymap.set("n", "vU", '<cmd>STSSwapUpNormal<cr>', opts)

    -- Visual Selection from Normal Mode
    vim.keymap.set("n", "vx", "<cmd>STSSelectMasterNode<cr>", opts)
    vim.keymap.set("n", "vn", "<cmd>STSSelectCurrentNode<cr>", opts)

    -- Select Nodes in Visual Mode
    vim.keymap.set("x", "J", "<cmd>STSSelectNextSiblingNode<cr>", opts)
    vim.keymap.set("x", "K", "<cmd>STSSelectPrevSiblingNode<cr>", opts)
    vim.keymap.set("x", "H", "<cmd>STSSelectParentNode<cr>", opts)
    vim.keymap.set("x", "L", "<cmd>STSSelectChildNode<cr>", opts)

    -- Swapping Nodes in Visual Mode
    vim.keymap.set("x", "<A-j>", "<cmd>STSSwapNextVisual<cr>", opts)
    vim.keymap.set("x", "<A-k>", "<cmd>STSSwapPrevVisual<cr>", opts)
end

return M

-- keymaps
-- vx - select master node
-- vn - select current node
-- J - select next sibling node
-- K - select prev sibling node
-- H - select parent node
-- L - select child node
-- vd - swap current node with next sibling
-- vu - swap current node with prev sibling
-- vD - swap current node with next sibling and move cursor to the new node
-- vU - swap current node with prev sibling and move cursor to the new node
-- . - repeat the last swap command
