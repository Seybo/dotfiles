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
    {
        -- plugin here
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
