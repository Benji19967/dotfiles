local ls = require "luasnip"

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("pytrig1", {
        i(1, "insert_here")
    }),
	s("pytrig2", {
        i(1), t" text ", i(2), t" text again ", i(3)
    }),
	s("def", {
        t"def ", i(1, "name"), t"(", i(2, "args"), t": ", i(3, "type"), t") -> ", i(4, "type"), t({":", ""}),
        t'    """', i(5, "description"), t({'"""', "    "}),
        i(6)
    }),

}

