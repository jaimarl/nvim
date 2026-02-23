local common = require('common')

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    opts = {
        options = {
            disabled_filetypes = {
                statusline = { 'snacks_dashboard' }
            },
        },

        sections = {
            lualine_b = {
                {
                    'branch',
                    icon = common.git.branch
                },
                {
                    'diff',
                    symbols = {
                        added = common.git.added .. ' ',
                        modified = common.git.modified .. ' ',
                        removed = common.git.deleted .. ' '
                    }
                },
                {
                    'diagnostics',
                    symbols = {
                        error = common.diagnostics.error .. ' ',
                        warn = common.diagnostics.warn .. ' ',
                        info = common.diagnostics.info .. ' ',
                        hint = common.diagnostics.hint .. ' '
                    }
                },
            },
            lualine_c = {
                'filename'
            }
        }
    }
}
