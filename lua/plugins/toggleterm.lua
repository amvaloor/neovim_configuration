return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require('toggleterm').setup({
                -- The key to toggle the terminal (Ctrl + \)
                open_mapping = [[<c-\>]],

                -- Force floating windows by default
                direction = 'float',

                -- Styling the floating window
                float_opts = {
                    border = 'curved', -- 'single', 'double', 'shadow', 'curved'
                    winblend = 3,      -- Transparency
                },

                -- Hardware-friendly defaults
                start_in_insert = true, -- Automatically enter insert mode
                persist_size = true,    -- Remember the size of the window
                close_on_exit = true,   -- Close the window when the shell process dies
            })

            -- Apply terminal navigation shortcuts
            function _G.set_terminal_keymaps()
                local opts = { buffer = 0 }
                -- Map Esc to exit Terminal Mode
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                -- Standard window navigation from within the terminal
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            end

            -- Automatically apply these keymaps when a terminal is opened
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end
    }
}
