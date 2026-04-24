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
-- -- 1. Enable hints when entering Normal Mode
-- create_autocmd({ "InsertLeave", "BufEnter" }, {
-- group = clear,
-- pattern = "*.rs", -- Specifically for Rust where the server is heaviest
-- callback = function()
-- vim.lsp.inlay_hint.enable(true)
-- end,
-- })
--
-- -- 2. Disable hints when entering Insert Mode to prevent "Out of Range" errors
-- create_autocmd("InsertEnter", {
-- group = clear,
-- pattern = "*.rs",
-- callback = function()
-- vim.lsp.inlay_hint.enable(false)
-- end,
-- })
