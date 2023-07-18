return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
    },

    {
        "rcarriga/nvim-dap-ui",
        event = "VimEnter",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
}
