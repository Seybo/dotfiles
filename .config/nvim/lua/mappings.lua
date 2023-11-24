-- TODO_MM: sort out, categorize and comment all mappings

map { "*", "Don't jump on * (search word under cursor)", "<Cmd>keepjumps normal! mi*`i<CR>", mode = "n" }
map {
    "*",
    "Don't jump on * (search selection)",
    [["*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>]],
    mode = "v",
}

vim.keymap.set("i", "jk", "<Esc>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v", "t" }, "Q", ":qa!<CR>", { silent = true }) -- exit vim
vim.keymap.set("n", "qw", ":q<CR>", { silent = true })                -- close window
vim.keymap.set("n", "<Leader>w", ":w<CR>", { silent = true })

-- Copy & paste to system clipboard
-- makes sense only if not used set clipboard=unnamedplus
vim.keymap.set("v", "<Leader>y", "\"+y<CR>", { silent = true })
vim.keymap.set("v", "<Leader>d", "\"+d<CR>", { silent = true })
vim.keymap.set("v", "<Leader>p", "\"+p<CR>", { silent = true })
vim.keymap.set("n", "<Leader>y", "\"+y", { silent = true })
vim.keymap.set("n", "<Leader>dd", "\"+dd", { silent = true })
vim.keymap.set("n", "<Leader>p", "\"+p", { silent = true })

-- -- [[ Navigation ]] -- --

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Moving lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<C-j>", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", { silent = true }) -- add line above
vim.keymap.set("n", "<C-k>", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", { silent = true }) -- add line below
-- Indentation
vim.keymap.set("n", "<A-l>", ">>", { silent = true })
vim.keymap.set("n", "<A-h>", "<<", { silent = true })
vim.keymap.set("v", "<A-l>", ">gv", { silent = true })
vim.keymap.set("v", "<A-h>", "<gv", { silent = true })
-- Selection
vim.keymap.set("n", "<Leader>aa", "ggVG<CR>", { silent = true }) -- select all
vim.keymap.set("n", "<CR>", ":noh<CR><CR>", { silent = true })   -- clean all selections
vim.keymap.set("v", "<Leader>.", ":t'><CR>", { silent = true })  -- duplicate selection
-- Buffers. Also adds a scope to buffers browsing within window
-- (so next and prev buffers commands below are taken only from the current window)
vim.keymap.set("n", "<A-i>", ":BufstopBack<CR>", { silent = true })
vim.keymap.set("n", "<A-o>", ":BufstopForward<CR>", { silent = true })
-- Bufkill plugin mapping
vim.keymap.set("n", "qq", ":BD<CR>", { silent = true })
-- vim-rails
vim.keymap.set("n", "ra", ":A<CR>", { silent = true }) -- switch to spec

-- -- [[ Files ]] -- --

vim.keymap.set("n", "<Leader>fr", ":e!<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fot", ":e ./_mydev/temp.md<CR>", { silent = true })
-- filenames copying
vim.keymap.set("n", "<Leader>fpa", ":let @+ = expand('%:p')<CR>", { silent = true }) -- absulute
vim.keymap.set("n", "<Leader>fpr", ":let @+ = expand('%')<CR>", { silent = true })   -- relative
vim.keymap.set("n", "<Leader>fpf", ":let @+ = expand('%:t')<CR>", { silent = true }) -- filename

-- -- [[ LSP ]] -- --

vim.keymap.set("n", "do", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end)

-- -- [[ Terminal ]] -- --

local function open_or_switch_to_terminal()
    local term_tab_index = -1

    -- loop through tabs to find terminal
    for i = 1, vim.fn.tabpagenr("$") do
        if vim.fn.tabpagewinnr(i, "$") == 1 and
            vim.fn.getbufvar(vim.fn.tabpagebuflist(i)[1], "&buftype") == "terminal" then
            term_tab_index = i
            break
        end
    end

    -- if terminal tab found, switch to it
    if term_tab_index > -1 then
        vim.cmd("tabn " .. term_tab_index)
    else
        vim.cmd("tablast")
        vim.cmd("tabnew")
        vim.cmd("term")
    end
    vim.cmd("startinsert")
end

vim.keymap.set("n", "tt", open_or_switch_to_terminal, { silent = true }) -- launch terminal
vim.keymap.set("t", "jk", "<C-\\><C-n>", { silent = true })

-- -- [[ Tabs ]] -- --

vim.keymap.set("n", "to", ":tab new<CR>", { silent = true })
vim.keymap.set("n", "tx", ":tab close<CR>", { silent = true })
vim.keymap.set("n", "tp", ":tabp<CR>", { silent = true })
vim.keymap.set("n", "tn", ":tabn<CR>", { silent = true })
vim.keymap.set("n", "tl", ":tabl<CR>", { silent = true })
vim.keymap.set("n", "ta", "1gt", { silent = true })
vim.keymap.set("n", "ts", "2gt", { silent = true })
vim.keymap.set("n", "td", "3gt", { silent = true })
vim.keymap.set("n", "tf", "4gt", { silent = true })
vim.keymap.set("n", "th", "5gt", { silent = true })

-- -- [[ Windows ]] -- --

vim.keymap.set("n", "sp", ":sp<CR>", { silent = true })       -- split horizontal
vim.keymap.set("n", "sv", ":vsp<CR>", { silent = true })      -- split vertical
vim.keymap.set("n", "so", ":only<CR>", { silent = true })     -- leave only current window
vim.keymap.set("n", "sq", ":close<CR>", { silent = true })    -- close window
vim.keymap.set("n", "sh", "<c-w>h", { silent = true })        -- switch to left
vim.keymap.set("n", "sl", "<c-w>l", { silent = true })        -- switch to right
vim.keymap.set("n", "sj", "<c-w>j", { silent = true })        -- switch to down
vim.keymap.set("n", "sk", "<c-w>k", { silent = true })        -- switch to up
vim.keymap.set("n", "st", "<c-w><c-w>", { silent = true })    -- switch between recent
vim.keymap.set("n", "smm", "<c-w>_", { silent = true })       -- maximize current
vim.keymap.set("n", "smj", "<c-w>j<c-w>_", { silent = true }) -- maximize bottom
vim.keymap.set("n", "smk", "<c-w>k<c-w>_", { silent = true }) -- maximize up
vim.keymap.set("n", "sd", "<c-w>=", { silent = true })        -- revert maximize (d - default)
vim.keymap.set("n", "sr", "<c-w>r", { silent = true })        -- rotate
vim.keymap.set("n", "sH", "<c-w>H", { silent = true })        -- horizontal => vertical
vim.keymap.set("n", "sK", "<c-w>K", { silent = true })        -- vertical => horizontal
-- resizing
vim.keymap.set("n", "<right>", ":5wincmd ><CR>", { silent = true })
vim.keymap.set("n", "<left>", ":5wincmd <<CR>", { silent = true })
vim.keymap.set("n", "<up>", ":3wincmd +<CR>", { silent = true })
vim.keymap.set("n", "<down>", ":3wincmd -<CR>", { silent = true })

-- -- [[ Jumps ]] -- --

-- Jumping between underscores
vim.keymap.set("n", "su", "f_l", { silent = true })
vim.keymap.set("n", "Su", "F_", { silent = true })
vim.keymap.set("n", "cu", "ct_", { silent = true })
vim.keymap.set("n", "c2u", "c2t_", { silent = true })
vim.keymap.set("n", "c3u", "c3t_", { silent = true })
vim.keymap.set("n", "vu", "vt_", { silent = true })
vim.keymap.set("n", "v2u", "v2t_", { silent = true })
vim.keymap.set("n", "v3u", "v3t_", { silent = true })
vim.keymap.set("n", "du", "dt_", { silent = true })
vim.keymap.set("n", "d2u", "d2t_", { silent = true })
vim.keymap.set("n", "d3u", "d3t_", { silent = true })

-- Jumping between br  ackets    (using the opening squere bracket as "(")
vim.keymap.set("n", "s[", "f(", { silent = true })
vim.keymap.set("n", "S[", "F(", { silent = true })
vim.keymap.set("n", "vi[", "vi(", { silent = true })
vim.keymap.set("n", "ci[", "vi(", { silent = true })
vim.keymap.set("n", "di[", "di(", { silent = true })

-- Jumping between sp  aces
vim.keymap.set("n", "s<space>", "ft ", { silent = true })
vim.keymap.set("n", "s2<space>", "f2t ", { silent = true })
vim.keymap.set("n", "s3<space>", "f3t ", { silent = true })
vim.keymap.set("n", "c<space>", "ct ", { silent = true })
vim.keymap.set("n", "c2<space>", "c2t ", { silent = true })
vim.keymap.set("n", "c3<space>", "c3t ", { silent = true })
vim.keymap.set("n", "v<space>", "vt ", { silent = true })
vim.keymap.set("n", "v2<space>", "v2t ", { silent = true })
vim.keymap.set("n", "v3<space>", "v3t ", { silent = true })
vim.keymap.set("n", "d<space>", "dt ", { silent = true })
vim.keymap.set("n", "d2<space>", "d2t ", { silent = true })
vim.keymap.set("n", "d3<space>", "d3t ", { silent = true })

-- -- [[ Spellcheck ]] -- --

vim.keymap.set("n", "<Leader>lr", ":set spelllang=ru_yo<CR>", { silent = true }) -- RU
vim.keymap.set("n", "<Leader>le", ":set spelllang=en_us<CR>", { silent = true }) -- EN
local function ToggleSpellCheck()
    -- Toggle the 'spell' option
    vim.cmd("set spell!")

    -- Check the state of the 'spell' option and echo the corresponding message
    if vim.o.spell then
        print("Spellcheck ON")
    else
        print("Spellcheck OFF")
    end
end
vim.keymap.set("n", "<Leader>lc", ToggleSpellCheck, { silent = true })

-- -- [[ Misc ]] -- --

vim.keymap.set("n", "<Leader>ll", "i <Esc>", { silent = true })         -- add space
vim.keymap.set("n", "<Leader>lna", ":set nornu", { silent = true })     -- absolute line numbers
vim.keymap.set("n", "<Leader>lna", ":set rnu", { silent = true })       -- relative line numbers
vim.keymap.set("n", "<Leader>rr", ":%s/", { silent = true })            -- replace text
vim.keymap.set("n", "<Leader>rw", ":%s/<C-r><C-w>/", { silent = true }) -- replace word under cursor
-- replace selection
vim.keymap.set("v", "<Leader>rw", "\"sy:%s/<C-r>=substitute(@s, '\\n', '', 'g')<cr>/", { silent = true })
vim.keymap.set("n", "<A-t>", ":b#<CR>", { silent = true }) -- swetch between last two buffers
