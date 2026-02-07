-- Provides an easy way to install and manage LSPs
return {
    {
        "mason-org/mason.nvim",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            servers = {
                lua_ls = {
                }
            }
        },
        config = function(_, opts)
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            require("mason-lspconfig").setup({
                automatic_enable = {
                    true,
                    exclude = {
                        "rust_analyzer",
                    },
                },
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                }
            })

            for server, config in pairs(opts.servers) do
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end

            vim.diagnostic.config({
                virtual_text = true,
                -- virtual_lines = false,
                underline = true,
            })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
