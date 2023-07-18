local all_plugins = {}

-- This function checks if a file exists by tying to read It
-- this, of course does not work for all filetypes but we're only using this 
-- to check for .lua files so it is not a problem
local function exists(string)
    local check = io.open(string, "r")
    if check ~= nil then
        io.close(check)
        return true
    else
        return false
    end
end

-- This function checks which os you're on by checking the separator symbol
-- used in file paths i.e /home wowuld be unix and \\Users would be windows
local function check_os()
    if package.config:sub(1,1) == '\\' then
        Os_type = "Windows"
    else
        Os_type = "Unix"
    end
    return Os_type
end

-- This function uses the previous two functions to check the os type and then construct 
-- the full path to your Neovim config so that it can be checked wether a file exists 
-- if a file exists it then add its output to all_plugins table
local function _file (string)
    local os = check_os()
    if os == "Windows" then
        local _path = vim.fn.stdpath("config") .. "/lua/" .. string .. ".lua"
        if exists(_path) == true then
            Result = require(string)
            table.insert(all_plugins, Result)
        end
    elseif os == "Unix" then
        local config_path = vim.fn.stdpath("config") .. string .. ".lua"
        if exists(config_path) == true then
            T_temp = require(string)
            table.insert(all_plugins, T_temp)
        end
    end
end

-- You may add your own files here
_file("lazy/dependencies")
_file("lazy/themes")
_file("lazy/lsp")
_file("lazy/cmp")
_file("lazy/treesitter")
_file("lazy/debug")
_file("lazy/gui")
_file("lazy/conveniance")
_file("lazy/telescope")
_file("lazy/terminal")
_file("lazy/git_tools")

return all_plugins
