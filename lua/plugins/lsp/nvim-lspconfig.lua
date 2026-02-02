-- Provides access to a multitude of LSPs
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
        },
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}),
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}),
        vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {}),
    }
}
