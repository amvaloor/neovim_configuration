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
                        local ts = require('telescope.builtin')

                        vim.keymap.set('n', 'gd', ts.lsp_definitions, { desc = 'Telescope Definition' })
                        vim.keymap.set('n', 'gr', ts.lsp_references, { desc = 'Telescope References' })
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
                                enable = true,
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
