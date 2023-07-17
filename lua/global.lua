-- Makes sure these variables exist
if not Nvim then
    Nvim = {}
    Nvim.plugins = {}
end
-- OS finds the operating system and stores it as a global Lua variable
OS = function ()
    if package.config:sub(1,1) == '\\' then
        return "Windows"
    elseif package.config:sub(1,1) == '/' then
        return "Unix"
    end
end

-- Exists checks if a certain file exists by trying to read it
function Exists(file)
    local x = io.open(file, "r")
    if x ~= nil then
        io.close()
        return true
    else
        return false
    end
end

-- Checks if a file exists, and if it does, adds it to the Nvim.plugins table
function Add(file)
    local f_path = Nvim.path .. file
    if Exists(f_path) == true then
        table.insert(Nvim.plugins, require(file))
    end
end

-- Yes
if OS == "Windows" then
    Nvim.path = os.getenv("LOCALAPPDATA") .. "/nvim/lua/"
end
