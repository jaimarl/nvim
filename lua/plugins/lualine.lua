local color = require('mini.base16').config.palette
local theme = require('lualine.themes.auto')
theme.normal.a.bg = color.base0D

require('lualine').setup {
    options = {
        disabled_filetypes = {
            statusline = { 'snacks_dashboard' }
        },
        theme = theme
    };
}
