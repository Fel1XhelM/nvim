local ls = require "luasnip"  -- Load LuaSnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("all", {
    s("skizze", {
        t({
			'<img src="/Aaa/'
        }),
        i(1, "path to the image"),  -- Cursor starts here
        t({
            '.jpg">',
        }),
    }),
})
