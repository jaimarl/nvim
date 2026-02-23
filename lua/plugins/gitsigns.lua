local common = require('common')

return {
    'lewis6991/gitsigns.nvim',

    opts = {
        signs = {
            add          = { text = common.git.added },
            change       = { text = common.git.modified},
            delete       = { text = common.git.deleted },
            topdelete    = { text = common.git.topdeleted },
            changedelete = { text = common.git.changedeleted },
            untracked    = { text = common.git.untracked }
        },
        signs_staged = {
            add          = { text = common.git.added },
            change       = { text = common.git.modified},
            delete       = { text = common.git.deleted },
            topdelete    = { text = common.git.topdeleted },
            changedelete = { text = common.git.changedeleted },
            untracked    = { text = common.git.untracked }
        },
    },
}
