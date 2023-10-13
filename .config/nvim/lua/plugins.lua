local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require "lazy"

local plugins = {
    -- themes: enable one that is used
    -- {
    --     "folke/tokyonight.nvim",
    --     version = "*",
    --     priority = 1000,
    --     config = require("colorschemes.tokyonight-day").setup,
    -- },
    -- {
    --     "marko-cerovac/material.nvim",
    --     version = "*",
    --     priority = 1000,
    -- },
    -- {
    --     "Shatur/neovim-ayu",
    --     version = "*",
    --     priority = 1000,
    -- },
    -- {
    --     "rose-pine/neovim",
    --     version = "*",
    --     priority = 1000,
    --     config = require("colorschemes.rose-pine").setup,
    -- },

    {
        "rktjmp/lush.nvim",
        branch = "main",
    },

    { -- smooth scrolling
        "karb94/neoscroll.nvim",
        version = "*",
        config = require("plugins.neoscroll").setup,
    },

    -- essentials
    { -- whitespace trimming autocommand needs it
        "echasnovski/mini.trailspace",
        version = "*",
        event = "BufEnter",
        config = require("plugins.mini-trailspace").setup,
    },

    {
        "nvim-tree/nvim-web-devicons",
        version = "*",
        config = require("plugins.devicons").setup,
    },

    -- lsp (linting and formatting)
    {
        "williamboman/mason.nvim",
        version = "*",
    },

    {
        "williamboman/mason-lspconfig.nvim",
        version = "*",
    },

    { -- .Configs for Nvim LSP client
        "neovim/nvim-lspconfig",
        event = "BufEnter",
        config = require("plugins.lspconfig").setup,
    },

    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        branch = "main",
        event = "BufEnter",
        config = require("plugins.lsp-lines").setup,
    },

    {
        "folke/neodev.nvim",
        version = "*",
    },

    { -- sessions management
        "gennaro-tedesco/nvim-possession",
        version = "*",
        dependencies = {
            "ibhagwan/fzf-lua",
        },
        config = true,
        init = require("plugins.possession").setup,
    },

    {
        "glepnir/lspsaga.nvim",
        branch = "main", -- TODO_MM: Go back to stable after the current version is released
        event = "BufEnter",
        init = require("plugins.lspsaga").setup,
    },

    { -- vscode-like pictograms for neovim built-in lsp
        "onsails/lspkind-nvim",
        version = "*",
    },

    -- autocompletions
    { -- supports LSP
        "hrsh7th/nvim-cmp",
        version = "*",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "saadparwaiz1/cmp_luasnip",
        },
        config = require("plugins.cmp").setup,
    },

    {
        "github/copilot.vim",
        version = "*",
    },

    -- { -- using fugitive for now
    --     "kdheepak/lazygit.nvim",
    --     version = "*",
    --     dependencies = {
    --         "nvim-telescope/telescope.nvim",
    --         "nvim-lua/plenary.nvim",
    --     },
    --     config = function()
    --         require("telescope").load_extension("lazygit")
    --     end,
    -- },

    {
        "L3MON4D3/LuaSnip",
        version = "*",
        event = "InsertEnter",
        config = require("plugins.luasnip").setup,
    },

    {
        "folke/todo-comments.nvim",
        version = "*",
        event = "BufEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require("plugins.todo-comments").setup,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        event = "BufEnter",
        config = require("plugins.treesitter").setup,
        build = ":TSUpdate",
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        version = "*",
        event = "BufEnter",
    },

    {
        "ziontee113/syntax-tree-surfer",
        version = "*",
        event = "BufEnter",
        config = require("plugins.syntax-tree-surfer").setup,
    },

    {
        "windwp/nvim-autopairs",
        version = "*",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },

    {
        "tpope/vim-rails",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = require("plugins.vim-rails").setup,
    },

    {
        "vim-test/vim-test",
        version = "*",
        config = require("plugins.vim-test").setup,
    },


    -- search/replace
    {
        "nvim-pack/nvim-spectre",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = require("plugins.spectre").setup,
    },

    {
        "rlane/pounce.nvim",
        version = "*",
        event = "BufEnter",
        config = require("plugins.pounce").setup,
    },

    {
        "mbbill/undotree",
        version = "*",
        event = "BufEnter",
        config = require("plugins.undotree").setup,
    },

    -- comments

    {
        "numToStr/Comment.nvim",
        version = "*",
        event = "BufEnter",
        config = require("plugins.comment").setup,
    },

    -- tab & status bar
    {
        "nvim-lualine/lualine.nvim",
        version = "*",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = require("plugins.lualine").setup,
    },

    {
        "tpope/vim-fugitive",
        version = "*",
        config = require("plugins.fugitive").setup,
        dependencies = {
            "junegunn/gv.vim",
            "tpope/vim-rhubarb",
        },
    },

    {
        "sindrets/diffview.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require("plugins.diffview").setup,
    },


    -- TODO_MM: disabled for now as it often fails on rspecs
    -- {
    --     "lewis6991/gitsigns.nvim",
    --     branch = "main",
    --     event = "BufEnter",
    --     config = require("plugins.gitsigns").setup,
    -- },

    {
        "ludovicchabant/vim-gutentags",
        version = "*",
        config = function()
            -- TODO_MM: does it work? Move to its config
            vim.cmd("set tags+=tags,.git/tags")
            vim.g.gutentags_enabled = 1
            vim.g.gutentags_generate_on_missing = 1
            vim.g.gutentags_generate_on_write = 1
            vim.g.gutentags_resolve_symlinks = 1
            vim.g.gutentags_ctags_tagfile = ".git/tags"
            vim.g.gutentags_project_root = { ".git" }
            vim.g.gutentags_ctags_extra_args = { "--fields=+l" }
            vim.g.gutentags_add_default_project_roots = 0
            vim.g.gutentags_ctags_executable = "/usr/bin/ctags"
            vim.g.gutentags_ctags_extra_args_ruby = { "--ignore-unsupported-options", "--recursive" }
            -- vim.g.gutentags_trace = 1
        end,
    },

    -- navigation

    { -- improves next/prev buffers to be scoped to window
        "mihaifm/bufstop",
        version = "*",
        event = "BufEnter",
    },

    { -- deleting a buffer no longer closes its window or split
        "qpkorr/vim-bufkill",
        version = "*",
        event = "BufEnter",
    },

    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require("plugins.telescope").setup,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = require("plugins.neo-tree").setup,
    },

    { -- fancy indentation with . . .
        "lukas-reineke/indent-blankline.nvim",
        version = "*",
        config = require("plugins.indent-blankline").setup,
    },

    {
        "vimwiki/vimwiki",
        version = "*",
        init = require("plugins.vimwiki").setup,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = require("plugins.which-key").setup,
    },

    -- misc
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = require("plugins.surround").setup,
    },

    {
        "nanozuki/tabby.nvim",
        version = "*",
        config = require("plugins.tabby").setup,
        -- event = "VeryLazy",
        -- config = require("plugins.surround").setup,
    },

    {
        "subnut/nvim-ghost.nvim",
        lazy = false,
        config = function()
            vim.g.nvim_ghost_super_quiet = 1
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        version = "*",
        lazy = true,
        -- config = require("plugins.colorizer").setup,
    },

    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            "kkharji/sqlite.lua",
            "nvim-telescope/telescope.nvim",
        },
        event = { "BufReadPost", "BufNewFile" },
        config = require("plugins.neoclip").setup,
    },




    -- database
    {
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            -- "kristijanhusak/vim-dadbod-completion", -- TODO_MM: breaks completion
        },
        config = require("plugins.dadbod").setup,
    },

    -- my plugins

    {
        dir = "/mnt/dev/my/vim_plugins/stackmap.nvim",
        version = "*",
        event = "VimEnter",
        priority = 1000,
    },

    {
        dir = "/mnt/dev/my/vim_plugins/rose-pine.nvim",
        version = "*",
        priority = 1000,
        config = require("colorschemes.rose-pine").setup,
    },
}

local options = {
    defaults = {
        lazy = false,
    },

    performance = {
        cache = {
            enabled = true,
        },

        rtp = {
            disabled_plugins = {
                "gzip",
                -- "netrwPlugin",
                "rplugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },

    ui = {
        size = { width = 0.9, height = 0.9 },
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
    },

    checker = {
        -- automatically check for plugin updates
        enabled = false,
    },
}

lazy.setup(plugins, options)