local M = {}

function M.setup()
    local plugin = require "luasnip"
    local s = plugin.snippet
    local t = plugin.text_node
    local i = plugin.insert_node
    local r = require("luasnip.extras").rep

    plugin.add_snippets(nil, {
        ruby = {
            s("bp (binding.pry)", {
                t("binding.pry if @foo.nil? # REVERT_MM:"),
            }),
            s("bpi (binding.pry if ...)", {
                t("binding.pry if @foo.nil? && "),
                i(1, "condition"),
                t(" # REVERT_MM:"),
            }),
            s("clg (MM.log_info)", {
                t("MM.log_info \""),
                i(1, "message"),
                t("\" # REVERT_MM:"),
            }),
            s("tds (START_MM:)", {
                t("# START_MM: "),
                i(1, ""),
                t({ "", "" }), -- linebreak
                t("# ⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻"),
            }),
            s("tdd (TODO_MM:)", {
                t("# TODO_MM: "),
                i(1, ""),
                t({ "", "" }), -- linebreak
                t("# ⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻"),
            }),
            s("tdr (REVERT_MM:)", {
                t("# REVERT_MM: "),
                i(1, ""),
            }),
            s("tdc (COMMENT_MM:)", {
                t("# COMMENT_MM: "),
                i(1, ""),
                t({ "", "" }), -- linebreak
                t("# ⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻"),
            }),
            s("tdq (QUESTION_MM:)", {
                t("# QUESTION_MM: "),
                i(1, ""),
                t({ "", "" }), -- linebreak
                t("# ⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻"),
            }),
        },
        all = {
            s("print_var3", {
                t("print(\""),
                i(1, "desrc"),
                t(" | "),
                i(2, "the_variable"),
                t(" : \" .. "),
                r(2),
                t(")"),
            }),
        },
    })
end

return M
