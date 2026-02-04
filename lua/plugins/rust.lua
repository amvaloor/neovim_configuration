-- LSP for Rust
return {
    {
        'mrcjkb/rustaceanvim',
        version = '^7', -- Recommended
        lazy = false, -- This plugin is already lazy
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(client, bufnr)
                        -- You can add Rust-specific keymaps here
                    end,
                    default_settings = {
                        ['rust-analyzer'] = {
                            checkOnSave = { command = "clippy" }, -- Use clippy for better linting
                        },
                    },
                },
            }
        end
    }
}
