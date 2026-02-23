local common = require('common')
local ignore_schemes = { 'catppuccin', 'tokyonight' }

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    keys = {
        -- Picker
        { '<leader>`', function() Snacks.picker.icons({ layout = 'select' }) end },
        { '<leader>:', function() Snacks.picker.command_history({ layout = 'select' }) end },
        { '<leader>t', function() Snacks.picker.colorschemes() end },

        -- Buffers
        { '<S-Tab>', function()
            if vim.bo.filetype == "snacks_dashboard" then return end

            Snacks.picker.buffers({ layout = 'vertical' })
        end },

        { '<C-q>', function()
            if vim.bo.filetype == "snacks_dashboard" then return end

            local bufs = vim.fn.getbufinfo({ buflisted = 1 })

            if #bufs <= 1 then
                vim.cmd('confirm q')
            else
                Snacks.bufdelete.delete()
            end
        end },
    },

    config = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = function ()
                vim.api.nvim_set_hl(0, "lspReferenceRead", { underline = true })
                vim.api.nvim_set_hl(0, "lspReferenceWrite", { underline = true })
                vim.api.nvim_set_hl(0, "lspReferenceText", { underline = true })
            end
        })

        require('snacks').setup({
            picker = {
                enabled = true,

                sources = {
                    explorer = {
                        hidden = true,
                        ignored = true,
                        auto_close = true,
                        layout = 'vertical',
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
                    diagnostics = {
                        Error = common.diagnostics.error,
                        Warn = common.diagnostics.warn,
                        Hint = common.diagnostics.hint,
                        info = common.diagnostics.info
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
                        title = { 'Recent Files', hl = 'normal' },
                        indent = 2,
                        padding = 1
                    },
                    {
                        section = 'projects',
                        icon = '󰝰 ',
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
                        { icon = '󰉓 ', key = 'e', desc = { 'Explorer', hl = 'normal' }, action = function () require('neo-tree.command').execute({}) end },
                        { icon = '󰦛 ', key = 'r', desc = { 'Recent', hl = 'normal' }, action = ':lua Snacks.dashboard.pick(\'oldfiles\')' },
                        { icon = '󰆓 ', key = 's', desc = { 'Session', hl = 'normal' }, action = ':lua require(\'persistence\').load({ last = true })' },
                        { icon = '󰒲 ', key = 'l', desc = { 'Lazy', hl = 'normal' }, action = ':Lazy' },
                        { icon = '󱓓 ', key = 'p', desc = { 'Plugins', hl = 'normal' }, action = ':lua Snacks.picker.lazy()' },
                        { icon = '󰈆 ', key = 'q', desc = { 'Quit', hl = 'normal' }, action = ':qa' }
                    }
                },
            }
        })
    end
}
