local common = require('common')

return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim'
    },

    keys = {
        { '<leader>e', '<cmd>Neotree toggle<cr>' },
    },

    config = function()
        vim.api.nvim_set_hl(0, 'NeoTreeFloatTitle', { link = 'SnacksPickerTitle' })
        vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { link = 'SnacksPickerBorder' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'SnacksPckerBorder' })

        vim.api.nvim_set_hl(0, 'NeoTreeNormal', { link = 'SnacksPicker' })
        vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { link = 'SnacksPicker' })
        vim.api.nvim_set_hl(0, 'NeoTreeCursorLine', { link = 'SnacksPickerListCursorLine' })

        require('neo-tree').setup({
            popup_border_style = 'rounded',

            window = {
                position = 'float',
                popup = {
                    title = ' Explorer ',
                },
                mappings = {
                    ['<esc>'] = 'close_window',
                    ['P'] = 'none'
                }
            },

            default_component_configs = {
                indent = {
                    with_expanders = true,
                },
                icon = {
                    folder_closed = '󰉋',
                    folder_open = '󰝰',
                    folder_empty = '󰝰',
                    folder_empty_open = '󰝰',
                    default = '󰈔',
                    use_filtered_colors = true
                },
                git_status = {
                    symbols = {
                        added     = common.git.added,
                        deleted   = common.git.deleted,
                        modified  = common.git.changed,
                        renamed   = common.git.renamed,
                        untracked = common.git.untracked,

                        ignored   = common.git.ignored,
                        unstaged  = common.git.unstaged,
                        staged    = common.git.staged,
                        conflict  = common.git.conflict
                    }
                }
            },

            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                }
            }
        })
    end
}
