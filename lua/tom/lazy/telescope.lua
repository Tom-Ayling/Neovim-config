return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
			cond = function()
				return vim.fn.executable("cmake") == 1
			end,
		},
		"andrew-george/telescope-themes",
		"nvim-telescope/telescope-ui-select.nvim",
	},

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				themes = {
					enable_previewer = true,
					enable_live_preview = true,
					persist = {
						enabled = true,
						path = vim.fn.stdpath("config") .. "/lua/tom/after/colorscheme.lua",
					},
				},
				fzf = {},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Load extensions
		telescope.load_extension("fzf")
		pcall(telescope.load_extension, "themes")
		telescope.load_extension("ui-select")

		-- Hotkeys
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sp", builtin.find_files, { desc = "[S]earch [P]roject Files" })
		vim.keymap.set("n", "<leader>s<C-f>", builtin.git_files, { desc = "[S]earch Git Files" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>s/", builtin.current_buffer_fuzzy_find, { desc = "[S]earch current buffer" })
		vim.keymap.set(
			"n",
			"<leader>st",
			":Telescope themes<CR>",
			{ noremap = true, silent = true, desc = "[S]witch [T]hemes" }
		)
		vim.keymap.set("n", "<leader>sf", function()
			builtin.find_files({
				cwd = vim.fn.expand("%:p:h"), -- directory of current buffer
			})
		end, { desc = "[S]earch [F]iles in current buffer directory" })
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "[S]earch current [N]eovim config" })
	end,
}
