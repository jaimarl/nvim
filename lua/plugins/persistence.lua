return {
    'folke/persistence.nvim',
    event = 'BufReadPre',

    keys = {
        { '<leader>qs', function() require('persistence').load({ last = true }) end },
        { '<leader>qS', function() require('persistence').select() end },
        { '<leader>qd', function() require('persistence').stop() end },
    },

    opts = {}
}
