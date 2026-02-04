return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            delay = 300,
            spec = {
                { "<leader>d", group = "Debug" },
                { "<leader>f", group = "Telescope" },
                { "<leader>s", group = "Split Screen" }
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    }
}
