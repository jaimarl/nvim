local function startup()
    local stats = Snacks.dashboard.lazy_stats
    stats = stats and stats.startuptime > 0 and stats or require("lazy.stats").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    local version = vim.version()

    return {
        align = "center",
        text = {
            { ' ', hl = 'number' },
            { 'Neovim loaded ', hl = 'footer' },
            { stats.loaded .. "/" .. stats.count, hl = "special" },
            { " plugins loaded in ", hl = "footer" },
            { ms .. "ms", hl = "special" },
            { '\n\nNeovim v' .. version.major .. '.' .. version.minor, hl = 'comment' }
        },
    }
end

require('snacks').setup({
    picker = { enabled = true },
    indent = { enabled = true },
    bufdelete = { enabled = true },

    scroll = {
        animate = {
            duration = { step = 10, total = 125 }
        }
    },

    dashboard = {
        enabled = true,
        sections = {
            { section = 'header' },
            {
                section = 'keys',
                gap = 1,
                padding = 2
            },
            {
                section = 'recent_files',
                icon = ' ',
                title = 'Recent Files',
                indent = 2,
                padding = 2
            },
            {
                section = 'projects',
                icon = ' ',
                title = 'Projects',
                indent = 2,
                padding = 1
            },
            startup
        },
        preset = {
            keys = {
                { icon = '󰇥 ', key = 'y', desc = 'Yazi', action = ':Yazi' },
                { icon = ' ', key = 'r', desc = 'Recent', action = ':lua Snacks.picker.recent()' },
                { icon = ' ', key = 's', desc = 'Last Session', action = function() require("persistence").load({ last = true }) end },
                { icon = ' ', key = 'S', desc = 'Select Session', action = function() require("persistence").select() end },
                { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
                { icon = ' ', key = 'l', desc = 'Lazy', action = ':Lazy' },
                { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' }
            }
        },
    },
})
