---@brief
---
--- https://github.com/ltex-plus/ltex-ls-plus
---
--- LTeX Language Server: LSP language server for LanguageTool 🔍✔️ with support for LaTeX 🎓, Markdown 📝, and others
---
--- To install, download the latest [release](https://github.com/ltex-plus/ltex-ls-plus) and ensure `ltex-ls-plus` is on your path.
---
--- This server accepts configuration via the `settings` key.
---
--- ```lua
---   settings = {
---     ltex = {
---       language = "en-GB",
---     },
---   },
--- ```
---
--- To support org files or R sweave, users can define a custom filetype autocommand (or use a plugin which defines these filetypes):
---
--- ```lua
--- vim.cmd [[ autocmd BufRead,BufNewFile *.org set filetype=org ]]
--- ```

local language_id_mapping = {
	bib = "bibtex",
	pandoc = "markdown",
	plaintex = "tex",
	rnoweb = "rsweave",
	rst = "restructuredtext",
	tex = "latex",
	text = "plaintext",
}

---@type vim.lsp.Config
return {
	cmd = { "ltex-ls-plus" },
	on_attach = function(client, bufnr)
		require("ltex-utils").on_attach(bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- Open custom dictionary modification window
		vim.keymap.set(
			"n",
			"<leader>ld",
			":LTeXUtils modify_dict<CR>",
			vim.tbl_extend("force", opts, { desc = "Modify [L]atex [d]ictionary" })
		)

		-- Open hidden false positives window
		vim.keymap.set(
			"n",
			"<leader>lp",
			":LTeXUtils modify_hiddenFalsePositives<CR>",
			vim.tbl_extend("force", opts, { desc = "Modify [L]atex false [p]ositives" })
		)

		-- Open disabled rules window
		vim.keymap.set(
			"n",
			"<leader>lr",
			":LTeXUtils modify_disabledRules<CR>",
			vim.tbl_extend("force", opts, { desc = "Modify [L]atex disabled [r]ules" })
		)
	end,
	filetypes = {
		"bib",
		"context",
		-- 'gitcommit',
		-- 'html',
		-- 'markdown',
		"org",
		"pandoc",
		"plaintex",
		"quarto",
		-- 'mail',
		"mdx",
		"rmd",
		"rnoweb",
		"rst",
		"tex",
		-- 'text',
		"typst",
		"xhtml",
	},
	root_markers = { ".git" },
	get_language_id = function(_, filetype)
		return language_id_mapping[filetype] or filetype
	end,
	settings = {
		ltex = {
			language = "en-GB",
			enabled = {
				"bib",
				"context",
				-- 'gitcommit',
				-- 'html',
				-- 'markdown',
				"org",
				"pandoc",
				"plaintex",
				"quarto",
				-- 'mail',
				"mdx",
				"rmd",
				"rnoweb",
				"rst",
				"tex",
				"latex",
				-- 'text',
				"typst",
				"xhtml",
			},
		},
	},
}
