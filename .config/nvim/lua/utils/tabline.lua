-- extracts only the filename without the path and extension
function MyTabLabel(tabnum)
    local full_path = vim.fn.bufname(vim.fn.tabpagebuflist(tabnum)[1])
    local filename = vim.fn.fnamemodify(full_path, ":t")
    return vim.fn.fnamemodify(filename, ":r")
end

-- Show shortened filenames in the tabline
function MyTabLine()
    local s = ""

    for i = 1, vim.fn.tabpagenr("$") do
        local filename = MyTabLabel(i)
        if string.len(filename) > 20 then
            filename = ".." .. string.sub(filename, -15)
        end

        if i == vim.fn.tabpagenr() then
            s = s .. "%#TabLineSel#"
        else
            s = s .. "%#TabLine#"
        end

        s = s .. "%" .. i .. "T"
        s = s .. " " .. filename .. " "
    end

    s = s .. "%#TabLineFill#%T"

    if vim.fn.tabpagenr("$") > 1 then
        s = s .. "%=%#TabLine#%999Xclose"
    end

    return s
end

vim.o.tabline = "%!v:lua.MyTabLine()"
