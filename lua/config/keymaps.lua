local set = vim.keymap.set

-- Split related keymaps
set('n', '<leader>sp', '<cmd>split<CR>', { desc = 'split horizontally' })
set('n', '<leader>sv', '<cmd>vsplit<CR>', { desc = 'split vertically' })
set('n', '<leader>sc', '<cmd>hide<CR>', { desc = 'hide current window' })
set('n', '<leader>so', '<cmd>only<CR>', { desc = 'close all except current window' })

-- Navigate splits with <leader>s + hjkl
set('n', '<leader>sh', '<C-w>h', { desc = 'move to left split' })
set('n', '<leader>sj', '<C-w>j', { desc = 'move to bottom split' })
set('n', '<leader>sk', '<C-w>k', { desc = 'move to top split' })
set('n', '<leader>sl', '<C-w>l', { desc = 'move to right split' })
set('n', '<leader>ss', '<C-w>w', { desc = 'move to next split' })

-- Resize splits with arrows
set('n', '<C-Up>', '<cmd>resize +2<CR>')
set('n', '<C-Down>', '<cmd>resize -2<CR>')
set('n', '<C-Left>', '<cmd>vertical resize -2<CR>')
set('n', '<C-Right>', '<cmd>vertical resize +2<CR>')
