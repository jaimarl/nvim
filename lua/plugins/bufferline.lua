local color = require('mini.base16').config.palette

require("bufferline").setup {
    highlights = {
        duplicate_visible = { bg = 'none' },
        duplicate_selected = { bg = 'none' },
        indicator_visible = { bg = 'none' },
        indicator_selected = { bg = 'none', fg = color.base0D },
        buffer_visible = { bg = 'none' },
        buffer_selected = { bg = 'none' },
        modified_visible = { bg = 'none' },
        modified_selected = { bg = 'none' },
    }
}
