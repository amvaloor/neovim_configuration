return {
    'stevearc/oil.nvim',
    opts = {
        view_options = {
            show_hidden = true,
        },
    },
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    keys = {
        { "-", "<CMD>Oil<CR>", mode = "n", desc = "Open parent directory" },
    },
}
