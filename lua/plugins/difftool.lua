return {
    "difftool.lua",
    virtual = true,
    config = function()
        vim.cmd.packadd("nvim.difftool")
    end
}
