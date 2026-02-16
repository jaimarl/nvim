local color = require('mini.base16').config.palette
local theme = require('lualine.themes.auto')
theme.normal.a.bg = color.base0D

require('lualine').setup {
    options = {
        theme = theme,
        component_separators = '',
        section_separators = { left = '', right = '' }
    };
}
