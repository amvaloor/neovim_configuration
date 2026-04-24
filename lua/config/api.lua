local create_autocmd = vim.api.nvim_create_autocmd
local clear = vim.api.nvim_create_augroup("UserConfig", { clear = true })
-- Keep tabs in Makefiles
create_autocmd("FileType", {
    group = clear,
    pattern = { "mk", "make" },
    callback = function()
        vim.opt_local.expandtab = false
    end,
})

-- Set color for inline hints
create_autocmd("ColorScheme", {
    group = clear,
    callback = function()
        vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#565f89", bg = "none", italic = true })
    end,
})
