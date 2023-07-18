local M = {}

function M.null_ls()
    require("null-ls").setup({
        sources = {
            require("null-ls").builtins.formatting.stylua,
            require("null-ls").builtins.diagnostics.eslint,
        },
    })
end

return M
