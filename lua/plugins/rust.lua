-- LSP for Rust
return {
    {
        'mrcjkb/rustaceanvim',
        version = '^7', -- Recommended
        lazy = false, -- This plugin is already lazy
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.g.rustaceanvim = {
                server = {
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        -- You can add Rust-specific keymaps here
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    end,
                    default_settings = {
                        ['rust-analyzer'] = {
                            check = {
                                command = "clippy",
                            },
                            procMacro = { enable = true },
                            cargo = { allFeatures = true },
                            inlayHints = {
                                bindingModeHints = { enable = true },
                                chainingHints = { enable = true },
                                closingBraceHints = { enable = true },
                                parameterHints = { enable = true },
                                typeHints = { enable = true },
                            },
                        },
                    },
                },
            }
        end
    }
}
