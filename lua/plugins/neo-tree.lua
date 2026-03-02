return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim'
    },

    config = function()
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
                    folder_closed = Common.icons.ui.folder,
                    folder_open = Common.icons.ui.folder_open,
                    folder_empty = Common.icons.ui.folder_open,
                    folder_empty_open = Common.icons.ui.folder_open,
                    default = Common.icons.ui.file,
                    use_filtered_colors = true
                },
                git_status = {
                    symbols = {
                        added = Common.icons.git.added,
                        deleted = Common.icons.git.deleted,
                        modified  = Common.icons.git.changed,
                        renamed = Common.icons.git.renamed,

                        staged = Common.icons.git.staged,
                        unstaged = Common.icons.git.unstaged,
                        untracked = Common.icons.git.untracked,
                        ignored = Common.icons.git.ignored,
                        conflict = Common.icons.git.conflict
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
