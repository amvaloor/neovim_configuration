return {
    "nvim.undotree", -- This is the name of the bundled package
    virtual = true,  -- Tells Lazy this is a built-in "virtual" package
    config = function()
        -- This ensures the built-in package is properly loaded into the Lua path
        vim.cmd.packadd("nvim.undotree")
    end,
    -- Map the key directly here to ensure it only loads when needed
    keys = {
        { "<leader>u", "<cmd>Undotree<CR>", desc = "Toggle Undotree" },
    }
}
