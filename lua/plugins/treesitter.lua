return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = "master",
        build = ':TSUpdate',

        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                -- Parsers to have installed by default
                ensure_installed = {
                    "lua",
                    "html",
                    "css",
                    "vim",
                    "vimdoc",
                    "c",
                    "cpp",
                    "rust",
                    "go"
                },

                -- Parsers can download in the background while a file is being edited
                sync_install = false,

                -- If a filetype is opened without a parser, its parser will auto-install
                auto_install = true,

                -- Disable default syntax highlighting and activate Treesitter
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                -- Use Treesitter's auto-indentation
                indent = {
                    enable = true
                },
            })
        end
    }
}
