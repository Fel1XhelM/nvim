local ls = require "luasnip"  -- Load LuaSnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("all", {
    s("title", {
        t({
            "<!DOCTYPE html>",
            "<html lang='en'>",
            "<head>",
            "    <meta charset='UTF-8'>",
            "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>",
            "    <title>"
        }),
        i(1, "Your Title"),  -- Cursor starts here
        t({
            "</title>",
            "</head>",
            "<body>",
            "",
            "</body>",
            "</html>"
        }),
    }),
})
