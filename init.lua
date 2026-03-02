-- Configuration 
_G.Common = require('config.common')

require("config.options")
require("config.keymaps")
require("config.lazy")

-- Save and load colorscheme
local theme_cache = vim.fn.stdpath("data") .. "/last_theme.lua"

local function load_theme()
    local f = io.open(theme_cache, "r")
    if f then
        local theme = f:read("*all")
        f:close()

        pcall(vim.cmd.colorscheme, theme)
    else
        vim.cmd.colorscheme "catppuccin"
    end
end

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local theme = vim.g.colors_name
        local f = io.open(theme_cache, "w")
        if f then
            f:write(theme)
            f:close()
        end
    end,
})

load_theme()
