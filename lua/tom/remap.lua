-- Set leader key
vim.g.mapleader = " "

-- Open netrw
-- vim.keymap.set('n','<leader>ov', vim.cmd.Ex, {desc = 'Open netrw'})

-- Open oil.nvim
vim.keymap.set("n", "<leader>ov", "<CMD>Oil<CR>", { desc = "Open oil.nvim" })

-- Clear highlights on escape in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })

-- Move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[y]ank next motion to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank line to system clipboard" })

-- Format File using conform
vim.keymap.set("n", "<leader>ff", function()
	require("conform").format({ async = true })
end, { desc = "Format file with Conform" })

-- Enable or disable latex lsp
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
