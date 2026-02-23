return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',

    opts = {
        ensure_installed = { 'lua', 'vim' },
        indent = { enabled = true },
        highlight = { enabled = true },
        folds = { enabled = true },
    }
}
