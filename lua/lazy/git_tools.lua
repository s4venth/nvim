return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufNew",
        config = function()
            require("gitsigns").setup()
        end,
    },
}
