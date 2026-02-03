return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc =  "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>d<Left>", dap.restart_frame, { desc = "Debug: Restart Frame" })
            vim.keymap.set("n", "<leader>d<Right>", dap.step_over, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<leader>d<Up>", dap.step_out, { desc = "Debug: Step Out" })
            vim.keymap.set("n", "<leader>d<Down>", dap.step_into, { desc = "Debug: Step Into" })
        end
    },
}
