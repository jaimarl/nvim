return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    keys = {
        { '<leader>`', function() Snacks.picker.pick('icons') end },
        { '<M-Tab>', function() Snacks.picker.buffers() end },
        { '<C-q>', function()
            if vim.bo.filetype == "snacks_dashboard" then return end
            
            local bufs = vim.fn.getbufinfo({ buflisted = 1 })
                if #bufs <= 1 then
                    Snacks.dashboard.open()
                else
                    Snacks.bufdelete()
                end
            end
        }
    },

    opts = {
        picker = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        indent = { enabled = true },
        bufdelete = { enabled = true },
        bigfile = { enabled = true },
        quickfile = { enabled = true },

        scroll = {
            animate = {
                duration = { step = 10, total = 125 }
            }
        },

        dashboard = {
            enabled = true,
            sections = {
                { section = 'header', padding = 1, },
                {
                    section = 'terminal',
                    cmd = 'COMMAND=$(date +"󰃭 %Y-%m-%d | 󰅐 %H:%M:%S") && printf "%*s\n" $(( ($(tput cols) + ${#COMMAND}) / 2 )) "$COMMAND"',
                    hl = 'normal',
                    height = 1,
                    padding = 2
                },
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
                    icon = '󰉋 ',
                    title = { 'Projects', hl = 'normal' },
                    indent = 2,
                    padding = 1
                },
                function()
                    local stats = Snacks.dashboard.lazy_stats
                    stats = stats and stats.startuptime > 0 and stats or require("lazy.stats").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local version = vim.version()

                    return {
                        align = "center",
                        text = {
                            { '󱐋 ', hl = 'special' },
                            { 'Neovim loaded ', hl = 'normal' },
                            { stats.loaded .. "/" .. stats.count, hl = "special" },
                            { " plugins loaded in ", hl = "normal" },
                            { ms .. "ms", hl = "special" },
                            { '\n\n Neovim v' .. version.major .. '.' .. version.minor, hl = 'comment' }
                        },
                    }
                end,
            },
            preset = {
                keys = {
                    { icon = '󰇥 ', key = 'y', desc = { 'Yazi', hl = 'normal' }, action = ':Yazi' },
                    { icon = '󰦛 ', key = 'r', desc = { 'Recent', hl = 'normal' }, action = ':lua Snacks.dashboard.pick(\'oldfiles\')' },
                    { icon = '󰖯 ', key = 's', desc = { 'Last Session', hl = 'normal' }, action = ':lua require(\'persistence\').load({ last = true })' },
                    { icon = '󰖲 ', key = 'S', desc = { 'Select Session', hl = 'normal' }, action = ':lua require(\'persistence\').select()' },
                    { icon = '󰈔 ', key = 'n', desc = { 'New File', hl = 'normal' }, action = ':ene | startinsert' },
                    { icon = '󰒲 ', key = 'l', desc = { 'Lazy', hl = 'normal' }, action = ':Lazy' },
                    { icon = '󰈆 ', key = 'q', desc = { 'Quit', hl = 'normal' }, action = ':qa' }
                }
            },
        } 
    }
}
