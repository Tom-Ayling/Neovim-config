return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()

		-- Telescope UI integration
		local conf = require("telescope.config").values

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		-- Open Harpoon via Telescope
		vim.keymap.set("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open Harpoon (Telescope)" })

		-- Add current file to Harpoon
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add file to Harpoon" })

		-- Prepend file to Harpoon
		vim.keymap.set("n", "<leader>A", function()
			harpoon:list():prepend()
		end, { desc = "Prepend file to Harpoon" })

		-- Direct jumps to Harpoon items
		vim.keymap.set("n", "<M-q>", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon 1" })
		vim.keymap.set("n", "<M-w>", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon 2" })
		vim.keymap.set("n", "<M-e>", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon 3" })
		vim.keymap.set("n", "<M-r>", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon 4" })

		-- Replace Harpoon item
		vim.keymap.set("n", "<leader><M-q>", function()
			harpoon:list():replace_at(1)
		end, { desc = "Harpoon: Replace slot 1" })

		vim.keymap.set("n", "<leader><M-w>", function()
			harpoon:list():replace_at(2)
		end, { desc = "Harpoon: Replace slot 2" })

		vim.keymap.set("n", "<leader><M-e>", function()
			harpoon:list():replace_at(3)
		end, { desc = "Harpoon: Replace slot 3" })

		vim.keymap.set("n", "<leader><M-r>", function()
			harpoon:list():replace_at(4)
		end, { desc = "Harpoon: Replace slot 4" })

		-- Navigate previous/next Harpoon entries
		-- Ctrl + Shift + p / n
		vim.keymap.set("n", "<M-p>", function()
			harpoon:list():prev()
		end, { desc = "Harpoon: Previous file" })
		vim.keymap.set("n", "<M-n>", function()
			harpoon:list():next()
		end, { desc = "Harpoon: Next file" })

		vim.keymap.set("n", "<leader><M-z>", function()
			harpoon:list():clear()
		end, { desc = "Harpoon: Clear all files" })

		-- Optional Extensions (Highlight current file in list)
		local harpoon_extensions = require("harpoon.extensions")
		harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
	end,
}
