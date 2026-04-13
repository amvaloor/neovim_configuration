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
                },
                gopls = {
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true, -- Highlights unused function parameters
                            },
                            staticcheck = true,      -- Enables advanced linting
                            gofumpt = true,          -- Helps the LSP understand gofumpt formatting
                        },
                    },
                },
                verible = {
                    root_dir = function(fname)
                        return vim.fs.root(fname, { ".git", "verible.filelist", ".verible-verilog-ls.conf" })
                    end,
                },
                pyright = {
                    root_dir = function(fname)
                        -- Look for standard Python project markers
                        return vim.fs.root(fname, {
                            ".git",
                            "pyproject.toml",
                            "setup.py",
                            "setup.cfg",
                            "requirements.txt",
                            "Pipfile",
                            "pyrightconfig.json"
                        })
                    end,
                    settings = {
                        python = {
                            analysis = {
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "workspace",
                                -- This tells Pyright to treat the root as a source path
                                extraPaths = { "." },
                            },
                        },
                    },
                },
            },
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
                    "gopls",
                    "verible",
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
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Get definition" })
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
            vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = "Signature help" })
        end
    }
}
