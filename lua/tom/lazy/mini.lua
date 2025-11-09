return{
    { 'nvim-mini/mini.nvim',
        version = false ,
        config = function()

            require ('mini.git').setup()
            require('mini.diff').setup({
                view = {
                    style = 'sign',
                    signs = { add = '++', change = '~~', delete = '--' },
                },
            })

            local statusline = require 'mini.statusline'
            statusline.setup {use_icons = true}
            statusline.section_location = function()
                return '%2l:%-2v'
            end

            require ('mini.icons').setup()
            require ('mini.icons').mock_nvim_web_devicons()
            require ('mini.surround').setup()
            require ('mini.splitjoin').setup()

        end
    }

}
