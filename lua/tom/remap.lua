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
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format file with Conform" })

-- Jump to the beginning/end of the line
vim.keymap.set("n", "<C-A>", "0", { desc = "Jump to the beginning of the line" })
vim.keymap.set("n", "<C-E>", "$", { desc = "Jump to the end of the line" })
