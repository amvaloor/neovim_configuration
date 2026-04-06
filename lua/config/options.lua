local opt = vim.opt

-- Enable line numbers
opt.number = true

-- Show status line w/ file
opt.laststatus = 3

-- Substitute tabs with four spaces
opt.expandtab = true -- typing tabs replaces them with spaces
opt.tabstop = 4      -- nvim displays \t characters as four spaces long
opt.shiftwidth = 4   -- auto-indents are four spaces wide
opt.softtabstop = 4  -- the tab and backspace characters affect 4 spaces

-- Share clipboard with system
vim.opt.clipboard = "unnamedplus"

-- Set up folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99 -- This ensures files start 'unfolded'
