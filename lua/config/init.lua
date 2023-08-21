local M = {}

local function os()
    if package.config:sub(1,1) == '\\' then
        Os = "Windows"
    end
end

function M.setup()
    require("config.mappings")
    require("config.settings")
    if Os == "Windows" then require("config.powershell") end
    if vim.g.neovide then require("config.neovide") end
end
return M
