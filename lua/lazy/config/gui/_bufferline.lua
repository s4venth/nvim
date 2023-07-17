local M = {}

M.options = {
    style_preset = {
        require("bufferline").style_preset.no_italic,
        require("bufferline").style_preset.no_bold,
    },
    indicator = {
        icon = "|",
        style = "icon"
    },
    diagnostics = "nvim_lsp",
    offsets = {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
    },
    separator_style = "slope",
}

return M
