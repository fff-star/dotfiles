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

local function matrix(_, parent)
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
			table.insert(nodes, t({ " \\\\", "\t" }))
		end
	end
	return sn(nil, nodes)
end

--
-- Now write the snippets
--

return {
	s(
		{ trig = "ff", condition = tex_utils.in_mathzone, snippetType = "autosnippet" },
		fmta("\\frac{<>}{<>}", {
			i(1),
			i(2),
		})
	),
	s(
		{ trig = "rm", condition = tex_utils.in_mathzone },
		fmta("\\mathrm{<>}", {
			d(1, get_visual),
		})
	),
	s(
		{ trig = "bb", condition = tex_utils.in_mathzone },
		fmta("\\mathbb{<>}", {
			d(1, get_visual),
		})
	),
	s(
		{ trig = "ca", condition = tex_utils.in_mathzone },
		fmta("\\mathcal{<>}", {
			d(1, get_visual),
		})
	),
	s(
		{
			trig = "([%a%)%]%}])(%d+)",
			regTrig = true,
			wordTrig = false,
			hidden = true,
			condition = tex_utils.in_mathzone,
			priority = 500,
		},
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
		})
	),
	s(
		{
			trig = "p(%d+)x(%d+)",
			regTrig = true,
			hidden = true,
			wordTrig = false,
			condition = tex_utils.in_mathzone,
		},
		fmta(
			[[
            \begin{pmatrix}
                <>
            \end{pmatrix}
        ]],
			{ d(1, matrix) }
		)
	),
	s(
		{
			trig = "b(%d+)x(%d+)",
			regTrig = true,
			hidden = true,
			wordTrig = false,
			condition = tex_utils.in_mathzone,
		},
		fmta(
			[[
            \begin{bmatrix}
                <>
            \end{bmatrix}
        ]],
			{ d(1, matrix) }
		)
	),
	s({ trig = ";a", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\alpha"),
	}),
	s({ trig = ";b", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\beta"),
	}),
	s({ trig = ";g", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\gamma"),
	}),
	s({ trig = ";l", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\lambda"),
	}),
	s({ trig = ";d", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\delta"),
	}),
	s({ trig = ";D", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\Delta"),
	}),
	s({ trig = ";f", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\phi"),
	}),
	s({ trig = ";F", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\Phi"),
	}),
	s({ trig = ";p", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\pi"),
	}),
	s({ trig = ";s", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\sigma"),
	}),
	s({ trig = ";S", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\Sigma"),
	}),
	s({ trig = ";o", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\omega"),
	}),
	s({ trig = ";O", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\Omega"),
	}),
	s({ trig = ";th", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\theta"),
	}),
	s({ trig = ";ve", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\varepsilon"),
	}),
	s({ trig = ";vf", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\varphi"),
	}),
	s({ trig = ";in", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\in"),
	}),
	s({ trig = ";ex", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\exists"),
	}),
	s({ trig = ";fa", snippetType = "autosnippet", condition = tex_utils.in_mathzone }, {
		t("\\forall"),
	}),
	s(
		{ trig = "sq", condition = tex_utils.in_mathzone, snippetType = "autosnippet" },
		fmta("\\sqrt{<>}", {
			i(1),
		})
	),
}
