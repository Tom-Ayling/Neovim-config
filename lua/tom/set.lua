-- Line numbers
vim.o.nu = true
vim.o.relativenumber = true

-- Smart case when searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Minimum number of lines above or below the cursor
vim.o.scrolloff = 10

-- Highlight the current line the cursor is on
vim.o.cursorline = true

-- Time in ms to wait for mapped sequence to complete
vim.o.timeoutlen = 1000

-- Wrapped lines will keep indentation of the initial line
vim.o.breakindent = true

-- Set tabs to 4 spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Enable undofile, stores undo history between sessions
vim.o.undofile = true

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Use 24bit colour
vim.o.termguicolors = true

-- Always show signcolumn
vim.o.signcolumn = "yes"

-- Add marker at column 80
vim.opt.colorcolumn = "80"

-- Enable nerd font
vim.g.have_nerd_font = true

-- Disable showing editor mode as it is provided by mini.statusline
vim.o.showmode = false

-- Decrease update time
vim.o.updatetime = 250

-- -- Diagnostics settings (erros, warnings, etc... from external tools such as lsp)
-- vim.diagnostic.config({
--     virtual_text = true,   -- show diagnostic messages inline
--     signs = true,          -- show signs in the gutter
--     underline = true,      -- underline the problem
--     update_in_insert = false, -- don't update diagnostics while typing
-- })
