local M = {}

function M.null_ls()
    require("null-ls").setup({
        sources = {
            --require("null-ls").builtins.formatting.stylua,
            --require("null-ls").builtins.diagnostics.eslint,
        },
    })
end

-- lifted from cmp_config
-- here for simplicity
local on_attach = function (client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
    end
end

function M.rust_tools()
    require("rust-tools").setup({
        server = {
            on_attach = on_attach,
        },
    })
end

return M
