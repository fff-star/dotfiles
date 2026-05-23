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

local function eval_math(_, parent)
	-- Return placeholder during static/docstring resolution (blink.cmp resolve)
	-- without blocking. parent or parent.snippet may be nil.
	local in_buffer = pcall(function()
		return parent.snippet:extmarks_valid()
	end)
	if not in_buffer then
		return sn(nil, t(""))
	end

	-- Real expansion: prompt for input.
	local expr = vim.fn.input("expr: ")
	if expr == "" then
		return sn(nil, t(""))
	end
	local env = { math = math }
	for k, v in pairs(math) do env[k] = v end
	env.sqrt = function(n, x)
		if x then return x ^ (1 / n) end
		return math.sqrt(n)
	end
	local fn, err = load("return " .. expr, "eval_ctx", "t", env)
	if not fn then
		return sn(nil, t(err or "invalid"))
	end
	local ok, result = pcall(fn)
	if not ok then
		return sn(nil, t("error"))
	end
	return sn(nil, t(tostring(result)))
end

return {
	s(
		{ trig = "calc", desc = "calculate the expression" },
		fmta("<>", { d(1, eval_math) })
	),
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
						time_line,
					}
				end),
			}
		)
	),
}
