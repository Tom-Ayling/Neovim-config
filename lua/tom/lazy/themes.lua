return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
            })
        end,
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
        end
    },

    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night", 
            })
        end,
    },
}

