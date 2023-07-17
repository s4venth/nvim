local M = {}

M.init = {
    {
        require("null-ls").setup({
            sources = {
                require("null-ls").builtins.formatting.stylua,
                require("null-ls").builtins.diagnostics.eslint,
            },
        })
    }
}

return M
