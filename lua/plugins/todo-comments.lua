local common = require('common')

return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },

    opts = {
        colors = {
            error = { 'DiagnosticError' },
            warning = { 'DiagnosticWarn' },
            success = { 'DiagnosticOk' },
            info = { 'DiagnosticInfo' },
            hint = { 'DiagnosticHint' },
            debug = { 'Debug' },
            constant = { 'Constant' }
        },
        keywords = {
            ERROR = { icon = common.diagnostics.error, color = 'error', alt = { 'BUG', 'ISSUE', 'FIX', } },
            WARNING = { icon = common.diagnostics.warn, color = 'warning', alt = { 'WARN' } },

            PERFORMANCE = { icon = '󱁤', color = 'constant', alt = { 'OPTIM', 'PERF', 'OPTIMIZE' } },
            REFACTOR = { icon = '󰃢', color = 'debug', alt = { 'CLEANUP', 'CLEAN', 'REWRITE' } },
            DEPRECATED = { icon = '󰩹', color = 'warning' },
            TODO = { icon = '󰍕', color = 'info' },
            HINT = { icon = common.diagnostics.hint, color = 'hint' },
            INFO = { icon = common.diagnostics.info, color = 'info', alt = { 'HINT' } },

            TEST = { icon = '', color = 'debug', alt = { 'TESTING' } },
            SUCCESS = { icon = '󰸞', color = 'success', alt = { 'OK', 'PASSED' } },
            FAILED = { icon = '󱈸', color = 'error', alt = { 'FAIL' } }
        },
        merge_keywords = false
    }
}
