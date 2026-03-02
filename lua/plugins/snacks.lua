local ignore_schemes = { 'catppuccin', 'tokyonight' }

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    config = function()
        require('snacks').setup({
            picker = {
                enabled = true,

                sources = {
                    icons = { layout = 'select' },
                    command_history = { layout = 'select' },
                    explorer = {
                        layout = 'default',
                        auto_close = true
                    },
                    colorschemes = {
                        transform = function(item)
                            if item.file:match("runtime/colors") then
                                return false
                            end

                            for _, name in ipairs(ignore_schemes) do
                                if item.text == name then return false end
                            end
                        end,
                    },
                },

                icons = {
                    files = {
                        dir = Common.icons.ui.folder .. ' ',
                        dir_open = Common.icons.ui.folder_open .. ' ',
                        file = Common.icons.ui.file .. ' '
                    },
                    undo = {
                        saved   = Common.icons.ui.floppy .. ' ',
                    },
                    ui = {
                        selected = Common.icons.git.staged .. ' ',
                        unselected = Common.icons.git.unstaged .. ' '
                    },
                    git = {
                      commit    = "󰜘 ",
                      staged    = Common.icons.git.staged,
                      added     = Common.icons.git.added,
                      deleted   = Common.icons.git.deleted,
                      ignored   = Common.icons.git.ignored,
                      modified  = Common.icons.git.unstaged,
                      renamed   = Common.icons.git.renamed,
                      unmerged  = " ",
                      untracked = Common.icons.git.untracked,
                    },
                    diagnostics = {
                        Error = Common.icons.diagnostics.error,
                        Warn = Common.icons.diagnostics.warn,
                        Hint = Common.icons.diagnostics.hint,
                        info = Common.icons.diagnostics.info
                    }
                }
            },
            input = { enabled = true },
            notifier = { enabled = true },
            words = {
                enabled = true,
                debounce = 0,
                modes = { 'n', 'c' }
            },
            indent = { enabled = true },
            statuscolumn = {
                enabled = true,
                left = { 'git' },
                right = { 'mark', 'fold', 'sign' },
                folds = {
                    open = true,
                    git_hl = true
                }
            },
            bufdelete = { enabled = true },
            scope = { enabled = true },
            bigfile = { enabled = true },
            quickfile = { enabled = true },

            dashboard = {
                enabled = true,

                sections = {
                    { section = 'header', padding = 1 },
                    function()
                        local stats = Snacks.dashboard.lazy_stats
                        stats = stats and stats.startuptime > 0 and stats or require("lazy.stats").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

                        return {
                            align = "center",
                            text = {
                                { '󰐱 ', hl = 'special' },
                                { stats.loaded .. "/" .. stats.count, hl = "special" },
                                { " plugins loaded in ", hl = "normal" },
                                { ms .. "ms\n\n", hl = "special" },
                            },
                        }
                    end,
                    {
                        section = 'keys',
                        gap = 1,
                        padding = 2
                    },
                    {
                        section = 'recent_files',
                        icon = '󰅐 ',
                        title = { 'Recent Files', hl = 'classic' },
                        indent = 2,
                        padding = 1
                    },
                    {
                        section = 'projects',
                        icon = Common.icons.ui.folder_open,
                        title = { 'Projects', hl = 'normal' },
                        indent = 2,
                        padding = 2
                    },
                    function()
                        local version = vim.version()

                        return {
                            align = "center",
                            text = {
                                { ' Neovim v' .. version.major .. '.' .. version.minor, hl = 'comment' }
                            },
                        }
                    end
                },
                preset = {
                    keys = {
                        { icon = Common.icons.ui.explorer, key = 'e', desc = { 'Explorer', hl = 'normal' }, action = function () require('neo-tree.command').execute({}) end },
                        { icon = '󰦛 ', key = 'r', desc = { 'Recent', hl = 'normal' }, action = ':lua Snacks.dashboard.pick(\'oldfiles\')' },
                        { icon = Common.icons.ui.floppy, key = 's', desc = { 'Session', hl = 'normal' }, action = ':lua require(\'persistence\').load({ last = true })' },
                        { icon = ' ', key = 'c', desc = { 'Colorschemes', hl = 'normal' }, action = ':lua Snacks.picker.colorschemes()' },
                        { icon = '󰒲 ', key = 'l', desc = { 'Lazy', hl = 'normal' }, action = ':Lazy' },
                        { icon = '󱓓 ', key = 'p', desc = { 'Plugins', hl = 'normal' }, action = ':lua Snacks.picker.explorer({ cwd = "~/.config/nvim/lua/plugins" })' },
                        { icon = '󰈆 ', key = 'q', desc = { 'Quit', hl = 'normal' }, action = ':qa' }
                    }
                },
            }
        })
    end
}
