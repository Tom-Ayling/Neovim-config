return {
    "stevearc/oil.nvim",
    opts = {},
    lazy = false,
    config = function()
        require("oil").setup({
            default_file_explorer = false,
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
        })
    end,
}
