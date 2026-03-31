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

-- Some LaTeX-specific conditional expansion functions (requires VimTeX)

local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
	return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
	return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
	return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function() -- itemize environment detection
	return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
	return tex_utils.in_env("tikzpicture")
end

local function make_table(_, parent)
	local rows = tonumber(parent.captures[1])
	local cols = tonumber(parent.captures[2])
	local nodes = {}
	local k = 1

	for r = 1, rows do
		for c = 1, cols do
			table.insert(nodes, i(k))
			k = k + 1
			if c ~= cols then
				table.insert(nodes, t(" & "))
			end
		end
		if r ~= rows then
			table.insert(nodes, t({ " \\\\", "\t\t" }))
		end
	end
	return sn(nil, nodes)
end

local function make_colspec(_, parent)
	local cols = tonumber(parent.captures[2])
	local nodes = {}
	for c = 1, cols do
		table.insert(nodes, t({ "X" }))
	end
	return sn(nil, nodes)
end

--
-- Now write the snippets
--

return {
	s({ trig = "bx" }, { t("% !TEX program = xelatex") }),
	s(
		{ trig = "env" },
		fmta(
			[[
                \begin{<>}
                    <>
                \end{<>}
            ]],
			{
				i(1),
				d(2, get_visual),
				rep(1),
			}
		)
	),
	s(
		{
			trig = "([^%a])mm",
			wordTrig = false,
			regTrig = true,
			hidden = true,
			desc = "Inline Math Mode with Visual Support",
		},
		fmta("<>$<>$", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),
	s(
		{ trig = "ttt", dscr = "Expands 'ttt' into LaTeX's texttt{} command." },
		fmta("\\texttt{<>}", {
			d(1, get_visual),
		})
	),
	s(
		{ trig = "tit", dscr = "Expands 'tit' into LaTeX's textit{} command." },
		fmta("\\textit{<>}", {
			d(1, get_visual),
		})
	),
	s(
		{ trig = "tbf", dscr = "Expands 'tit' into LaTeX's textit{} command." },
		fmta("\\textbf{<>}", { d(1, get_visual) })
	),
	s(
		{ trig = "t(%d+)x(%d+)", hidden = true, regTrig = true, wordTrig = true, dscr = "Quick make a table" },
		fmta(
			[[
        \begin{table}[htbp]
            \centering
            \caption{<>}
            \begin{tblr}{
                colspec={<>},
                width=<>\linewidth,
                hlines,
            }
                <>
            \end{tblr}
        \end{table}
        ]],
			{
				i(1),
				d(2, make_colspec),
				i(3),
				d(4, make_table),
			}
		)
	),
}
