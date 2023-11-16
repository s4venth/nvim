---@diagnostic disable: undefined-global

local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local p = {
	bg = hsluv(240, 10, 5),
	fg = hsl(240, 10, 30),
    kw = hsl(240, 10, 75)
	}

return lush(function ()
    return {
        Normal      {fg = p.fg, bg = p.bg},
        Identifier  {fg = p.kw},
        Special     {fg = p.kw},
        Constant    {fg = Identifier.fg.darken(-25), gui = "bold"},
        Statement   {fg = p.kw, },
        Keyword     {Normal},
        Operator    {fg = Special.fg.darken(-10), gui = "bold"},
        Cursor      {gui = "reverse"},
        Function    {fg = Normal.fg.darken(-20)},

        Type        {Normal},

        PreProc     {Keyword},
    }
end)
