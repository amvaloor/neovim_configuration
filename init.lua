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

-- Share clipboard with system
vim.opt.clipboard = "unnamedplus"

-- Typing 'jk' quickly in insert mode will act as Escape
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Set color for inline hints
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#565f89", bg = "none", italic = true })
    end,
})
-- 1. Enable hints when entering Normal Mode
vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
    pattern = "*.rs", -- Specifically for Rust where the server is heaviest
    callback = function()
        vim.lsp.inlay_hint.enable(true)
    end,
})

-- 2. Disable hints when entering Insert Mode to prevent "Out of Range" errors
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*.rs",
    callback = function()
        vim.lsp.inlay_hint.enable(false)
    end,
})

-- Set up package manager
require("config.lazy")

-- Set up keymaps
require("config.keymaps")
