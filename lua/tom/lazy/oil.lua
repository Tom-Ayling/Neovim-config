return {
	"stevearc/oil.nvim",
	opts = {},
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = false,
			skip_confirm_for_simple_edits = true,
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
