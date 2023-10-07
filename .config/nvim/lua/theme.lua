-- [[ Tips ]]
-- You can use :source $VIMRUNTIME/syntax/hitest.vim to see all highlighting groups.
-- You can use :lua print(vim.inspect(require('ayu.colors'))) command to check all available colors.
-- To see all the hightligt groups: :highlight
-- To see the color of element under cursor: :Inspect
-- To update the color returned by :Inspect update what it says it "links to": hi @variable guifg=#FF0000

-- [[ Config ]]
-- local lush = require "lush"
-- Lushify-ed themes

---- Theme: tokyonight_day_lush
-- local theme = require "colorschemes/tokyonight_day_lush"
-- lush(theme)

---- Theme: tokyonight
-- require("tokyonight").setup({
--     -- your configuration comes here
--     -- or leave it empty to use the default settings
--     style = "day",       -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--     light_style = "day", -- The theme is used when the background is set to light
-- })
-- vim.cmd [[colorscheme tokyonight]]

---- Theme: rose-pine
vim.cmd [[colorscheme rose-pine]]

---- Theme: ayu
-- Shatur/neovim-ayu: https://github.com/Shatur/neovim-ayu/tree/master
-- vim.o.background = "light"
-- require("ayu").setup({
--     overrides = {
--         -- Directory = { },    -- ???
--         -- Title = { },        -- ???
--         -- Define = { },       -- ???
--         -- Statement = { },    -- keywords: class, do/end, def, return etc
--         -- Identifier = { fg = "#FF0000" }, -- ???
--         -- Type = { },         -- classes names, modules names etc
--         -- Structure = { },    -- ???
--         Normal = { bg = "#FFFFFF", fg = "#4A525C" }, -- alacritty bg color and darker font color
--         Comment = { fg = "#8BA0B5" },                -- more dark version
--         Constant = { fg = "#934BDC" },               -- increase saturation and darkness
--         Operator = { fg = "#934BDC" },               -- change color
--         String = { fg = "#79A100" },                 -- more dark version
--         Function = { fg = "#E3890D" },               -- more dark version
--         Special = { fg = "#E1A756" },                -- more dark version
--         Tag = { fg = "#0093DC" },                    -- more dark and saturated version
--         TabLine = { bg = "#EEEEEE" },                -- TODO: update
--         TabLineSel = { fg = "#934BDC" },             -- TODO: update
--     },
-- })
-- require("ayu").colorscheme()
