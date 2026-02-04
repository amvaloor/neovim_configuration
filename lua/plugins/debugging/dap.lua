return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local dap = require("dap")
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "launch debug session or resume execution"})
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc =  "toggle breakpoint" })
            vim.keymap.set("n", "<leader>d<Left>", dap.restart_frame, { desc = "restart frame" })
            vim.keymap.set("n", "<leader>d<Right>", dap.step_over, { desc = "step over" })
            vim.keymap.set("n", "<leader>d<Up>", dap.step_out, { desc = "step out" })
            vim.keymap.set("n", "<leader>d<Down>", dap.step_into, { desc = "step into" })
        end
    },
}
