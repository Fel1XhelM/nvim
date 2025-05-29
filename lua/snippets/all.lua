-- nvim/after/plugin/luasnip.lua

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

-- example snippet
--	s("hello", {
--		t('print("hello world")')
--	}),

-- another snippet
--	s("lol",{
--		t('lololol')
--	}),
}
