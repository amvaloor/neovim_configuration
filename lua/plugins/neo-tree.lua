return {
    -- Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        visible = true,          -- master switch to show hidden files/dotfiles
                        hide_dotfiles = false,   -- makes neo-tree show files that start with a dot
                        hide_gitignored = false, -- makes neo-tree show files that are in the .gitignore
                    },
                },
                window = {
                    mappings = {
                        ["A"]  = "git_add_all",
                        ["gu"] = "git_unstage_file",
                        ["ga"] = "git_add_file",
                        ["gr"] = "git_revert_file",
                        ["gc"] = "git_commit",
                        ["gp"] = "git_push",
                        ["gg"] = "git_commit_and_push",
                    }
                },
                default_component_configs = {
                    git_status = {
                        symbols = {
                            -- Change these to icons that are harder to mistake for "boxes"
                            unstaged = "✗", -- The "box" you see
                            staged   = "✓", -- A checkmark
                        },
                    },
                }
            })

            -- Keymap to toggle the sidebar
            vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', { desc = "Enter file explorer" })
            vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Toggle file explorer" })
        end
    },

    -- Auto-update imports when renaming files
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neo-tree/neo-tree.nvim",
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
}
