return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "mason-org/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- setup UI
        dapui.setup()

        -- setup inline virtual text with variable values
        local dapvt = require("nvim-dap-virtual-text")
        dapvt.setup({})

        -- setup mason integration
        local dapmason = require("mason-nvim-dap")
        dapmason.setup({
            ensure_installed = {},
            handlers = {},
            automatic_installation = false,
        })

        -- auto open/close UI
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- breakpoint signs
        vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

        -- keymaps
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "launch debug session or resume execution" })
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
        vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "terminate session" })
        vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "toggle DAP UI" })

        -- stepping
        vim.keymap.set("n", "<leader>d<Left>", dap.restart_frame, { desc = "restart frame" })
        vim.keymap.set("n", "<leader>d<Right>", dap.step_over, { desc = "step over" })
        vim.keymap.set("n", "<leader>d<Up>", dap.step_out, { desc = "step out" })
        vim.keymap.set("n", "<leader>d<Down>", dap.step_into, { desc = "step into" })
    end,
}
