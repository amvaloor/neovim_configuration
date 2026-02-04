return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local dap = require("dap")
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Launch Debug Session or Resume Execution"})
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc =  "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>d<Left>", dap.restart_frame, { desc = "Debug: Restart Frame" })
            vim.keymap.set("n", "<leader>d<Right>", dap.step_over, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<leader>d<Up>", dap.step_out, { desc = "Debug: Step Out" })
            vim.keymap.set("n", "<leader>d<Down>", dap.step_into, { desc = "Debug: Step Into" })
        end
    },
}
