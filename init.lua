-- Enable line numbers
vim.opt.number = true

-- Show status line w/ file
vim.opt.laststatus = 3

-- Substitute tabs with four spaces
vim.opt.expandtab = true    -- typing tabs replaces them with spaces
vim.opt.tabstop = 4         -- nvim displays \t characters as four spaces long
vim.opt.shiftwidth = 4      -- auto-indents are four spaces wide
vim.opt.softtabstop = 4     -- the tab and backspace characters affect 4 spaces

-- Keep tabs in Makefiles
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "mk", "make" },
    callback = function()
        vim.opt_local.expandtab = false
    end,
})

-- Set leader key to <space>
vim.g.mapleader = "<space>"

-- Set up package manager
require("config.lazy")
