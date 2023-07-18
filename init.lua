require"global"
require"vim_settings"

if vim.g.neovide then
    require"neovide-cfg"
end

if OS == "Windows" then
    require"powershell"
end

require"lazy"
require"mappings"
