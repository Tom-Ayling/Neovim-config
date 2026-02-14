ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s(
		{
			trig = "\\begintex",
			dscr = "Insert standard boilerplate for beginning a latex document",
			snippetType = "autosnippet",
		},
		fmt(
			[[
\documentclass{<>}

\usepackage[a4paper, margin=1in]{geometry}
\setlength{\parskip}{1em}
\setlength{\parindent}{0pt}

\begin{document}
\pagenumbering{gobble}

<>

\end{document}
]],
			{ i(1, "article"), i(2) },
			{ delimiters = "<>" }
		)
	),
}
