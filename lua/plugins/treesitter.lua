return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',

    opts = {
        ensure_installed = { 'lua' },
        indent = { enabled = true },
        highlight = { enabled = true },
        folds = { enabled = true },
    }
}
