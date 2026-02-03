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
                        visible = true,             -- master switch to show hidden files/dotfiles
                        hide_dotfiles = false,      -- makes neo-tree show files that start with a dot
                        hide_gitignored = false,    -- makes neo-tree show files that are in the .gitignore
                    },
                },
            })
          
          -- Keymap to toggle the sidebar
          vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})
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
