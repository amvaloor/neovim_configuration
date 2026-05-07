return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs      = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_', show_count = true },
            topdelete    = { text = '‾', show_count = true },
            changedelete = { text = '~', show_count = true },
            untracked    = { text = '┆' },
        },
        -- This makes the signs look like a solid bar (VSCode style)
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    },
}
