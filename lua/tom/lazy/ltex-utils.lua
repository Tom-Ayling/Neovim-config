return {
	"jhofscheier/ltex-utils.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	opts = {},
	config = function()
		local utils = require("ltex-utils")
		------------------------------------------------------------
		-- START: Toggle Latex LSP (LTeX Plus) mapping <leader>gse
		------------------------------------------------------------

		vim.keymap.set("n", "<leader>gse", function()
			local clients = vim.lsp.get_active_clients({ bufnr = 0 })
			local attached = false

			for _, client in ipairs(clients) do
				if client.name == "ltex_plus" then
					attached = true
					vim.lsp.stop_client(client.id)
					vim.notify("LTeX Plus disabled for this buffer", vim.log.levels.INFO)
					return
				end
			end

			-- If not attached, start it
			vim.lsp.start({
				name = "ltex_plus",
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
				settings = {
					ltex = {
						language = "en-GB",
					},
				},
			})
			vim.notify("LTeX Plus enabled for this buffer", vim.log.levels.INFO)
		end, { desc = "Toggle Latex LSP" })
		------------------------------------------------------------
		-- END: Toggle Latex LSP (LTeX Plus) mapping <leader>gse
		------------------------------------------------------------
	end,
}
