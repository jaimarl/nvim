local M = {}

local symbol = {
    plus = '+',
    minus = '-',
    question = '󰋖',
    x = '',
    check = ''
}

M.icons = {
    symbol = symbol,

    diagnostics = {
        error = '',
        warn = '',
        hint = '󰌵',
        info = '',
        bug = '',
    },

    git = {
        branch = '󰘬',
        conflict = '󱓌',

        added = symbol.plus,
        deleted = symbol.minus,
        topdeleted = '󰁝',
        changedeleted = '󰁅',
        modified = '~',

        renamed = '󰁔',
        staged = '󰄯',
        unstaged = '󰄰',
        untracked = symbol.question,
        ignored = '󱃓'
    },

    ui = {
        explorer = '󰉓',
        folder = '󰉋',
        folder_open = '󰝰',
        file = '󰈔',

        floppy = '󰆓',

        checkbox = {
            unchecked = '',
            checked = ''
        }
    }
}

return M
