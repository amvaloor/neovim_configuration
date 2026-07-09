local ft = vim.filetype.add
-- Recognize reason files
ft({
    extension = {
        re = 'reason',
        rei = 'reason',
    },
})
