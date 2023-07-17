local M = {}

function M.config()
    require('telescope').setup({
        extensions = {
            fzf = {
                fuzzy = true,
            }
        }
    })
end

function M.fzf()
    require('telescope').load_extension('fzf')
end

return M
