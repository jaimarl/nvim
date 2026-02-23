local M = {}

M.diagnostics = {
    error = '󰀨',
    warn = '',
    hint = '󰌵',
    info = ''
}

M.git = {
    branch = '󰘬',

    added = '󱇬',
    deleted = '󱘹',
    topdeleted = '󰁞',
    changedeleted = '󰁆',
    modified = '~',

    renamed = '󰌕',
    untracked = '',
    ignored = '󱃓',
    staged = '󱓻',
    unstaged = '󱓼',
    conflict = '󰘬'
}

return M
