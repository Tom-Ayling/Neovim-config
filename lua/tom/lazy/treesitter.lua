return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',

    config = function()
        require 'nvim-treesitter'.setup {
            install_dir = vim.fn.stdpath('data') .. '/site',
        }

        -- List of core parsers to install
        local ensureInstalled = {
            'lua',
            'python',
            'latex',
            'markdown',
            'java',
            'diff',
            'html',
            'css',
            'vim',
            'vimdoc',
        }


        local ignoreFileTypes = {
            'TelescopePromt',
            'oil',

        }

        -- Install missing parsers on startup
        local alreadyInstalled = require("nvim-treesitter.config").get_installed()
        local parsersToInstall = vim.iter(ensureInstalled)
            :filter(function(parser)
                return not vim.tbl_contains(alreadyInstalled, parser)
            end)
            :totable()

        if #parsersToInstall > 0 then
            vim.schedule(function()
                vim.notify(
                    "Installing missing core parsers: " .. table.concat(parsersToInstall, ", "),
                    vim.log.levels.INFO
                )
                require("nvim-treesitter").install(parsersToInstall):wait(120000)
            end)
        end

        -- Auto-install missing parsers for FileType
        local function ensure_parser_installed(lang)
            if vim.tbl_contains(ignoreFileTypes, lang) then
                return
            end

            local installed = require("nvim-treesitter.config").get_installed()
            if not vim.tbl_contains(installed, lang) then
                vim.schedule_wrap(function()
                    vim.notify("Installing parser for filetype: " .. lang, vim.log.levels.INFO)
                    require('nvim-treesitter').install({ lang }):wait(120000)
                end)()
            end
        end

        -- Enable Treesitter features
        vim.api.nvim_create_autocmd('FileType', {
            pattern = '*',
            callback = function(args)
                local lang = args.match
                ensure_parser_installed(lang)

                local installed = require("nvim-treesitter.config").get_installed()
                if vim.tbl_contains(installed, lang) then
                    -- Enable highlighting
                    pcall(vim.treesitter.start)
                    -- Enable indentation
                    pcall(function()
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end)
                end
            end,
        })
    end,
}
