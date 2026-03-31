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

return {
	s(
		{ trig = "sign", desc = "quick sign a file" },
		fmta(
			[[
            <>
            ]],
			{
				f(function()
					local cs = vim.bo.commentstring
					if cs == "" or not cs:find("%%s") then
						cs = "-- %s"
					end
					local filename = vim.fn.expand("%:t")
					local time = os.date("%y-%m-%d")
					local filename_line = cs:format(filename)
					local author_line = cs:format("author fff")
					local time_line = cs:format(time)
                    return {
                        filename_line,
                        author_line,
                        time_line
                    }
				end),
			}
		)
	),
}
