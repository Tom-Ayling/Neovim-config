return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })
        end,
    },
    {
        "MeanderingProgrammer/treesitter-modules.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesitter-modules").setup({
                ensure_installed = {
                    "lua",
                    "python",
                    "latex",
                    "markdown",
                    "java",
                    "diff",
                    "html",
                    "css",
                    "vim",
                    "vimdoc",
                },
                ignore_install = {
                    "TelescopePrompt",
                    "TelescopeResults",
                    "oil",
                    "netrw",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        node_decremental = "<BS>",
                    },
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
}
