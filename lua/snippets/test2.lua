local ls = require "luasnip"  -- Load LuaSnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("all", {
    s("hello", {
        t({
            "bye"
        }),
        
    }),
})
