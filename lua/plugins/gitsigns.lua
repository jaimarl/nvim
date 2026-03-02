return {
    'lewis6991/gitsigns.nvim',

    opts = {
        signs = {
            add = { text = Common.icons.git.added },
            change = { text = Common.icons.git.modified},
            delete = { text = Common.icons.git.deleted },
            topdelete = { text = Common.icons.git.topdeleted },
            changedelete = { text = Common.icons.git.changedeleted },
            untracked = { text = Common.icons.git.untracked }
        },
        signs_staged = {
            add = { text = Common.icons.git.added },
            change = { text = Common.icons.git.modified},
            delete = { text = Common.icons.git.deleted },
            topdelete = { text = Common.icons.git.topdeleted },
            changedelete = { text = Common.icons.git.changedeleted },
            untracked = { text = Common.icons.git.untracked }
        },
    },
}
