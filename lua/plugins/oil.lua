return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    keys = {
        { "-", "<CMD>Oil<CR>", mode = "n", desc = "Open parent directory" },
    },
}
