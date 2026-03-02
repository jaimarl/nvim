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
                    icon = Common.icons.git.branch
                },
                {
                    'diff',
                    symbols = {
                        added = Common.icons.git.added .. ' ',
                        modified = Common.icons.git.modified .. ' ',
                        removed = Common.icons.git.deleted .. ' '
                    }
                },
                {
                    'diagnostics',
                    symbols = {
                        error = Common.icons.diagnostics.error .. ' ',
                        warn = Common.icons.diagnostics.warn .. ' ',
                        info = Common.icons.diagnostics.info .. ' ',
                        hint = Common.icons.diagnostics.hint .. ' '
                    }
                },
            },
            lualine_c = {}
        },

        tabline = {
            lualine_b = {
                {
                    'buffers',
                    symbols = { alternate_file = '󰘁 ' },

                    filetype_names = {
                        ['neo-tree'] = Common.icons.ui.explorer .. ' ' .. 'Explorer',
                        snacks_picker_input = '󰆽 Picker'
                    }
                }
            },
            lualine_z = { 'tabs' }
        }
    }
}
