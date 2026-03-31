local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
--
-- shortcuts
--

local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end
return {
	s(
		{ trig = "code" ,priority=2000},
		fmt(
			[[
            ``` {}
            {}
            ```
            ]],
			{ i(1, "lang"), d(2, get_visual) }
		)
	),
	s(
		{ trig = "warn" },
		fmt(
			[[
            > [!WARNING]
            > {}
            ]],
			{ d(1, get_visual) }
		)
	),
	s(
		{ trig = "imp" },
		fmt(
			[[
            > [!IMPORTANT]
            > {}
            ]],
			{ d(1, get_visual) }
		)
	),
	s(
		{ trig = "tip" },
		fmt(
			[[
            > [!TIP]
            > {}
            ]],
			{ d(1, get_visual) }
		)
	),
	s(
		{ trig = "cau" },
		fmt(
			[[
            > [!CAUTION]
            > {}
            ]],
			{ d(1, get_visual) }
		)
	),
	s(
		{ trig = "note" },
		fmt(
			[[
            > [!NOTE]
            > {}
            ]],
			{ d(1, get_visual) }
		)
	),
}
