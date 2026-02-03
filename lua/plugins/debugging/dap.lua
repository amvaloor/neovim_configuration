return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc =  "Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>d<Left>", dap.restart_frame, { desc = "Restart Frame" })
            vim.keymap.set("n", "<leader>d<Right>", dap.step_over, { desc = "Step Over" })
            vim.keymap.set("n", "<leader>d<Up>", dap.step_out, { desc = "Step Out" })
            vim.keymap.set("n", "<leader>d<Down>", dap.step_into, { desc = "Step Into" })
        end
    },
}
