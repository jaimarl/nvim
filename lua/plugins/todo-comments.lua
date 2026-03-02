return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },

    opts = {
        colors = {
            error = { 'DiagnosticError' },
            warning = { 'DiagnosticWarn' },
            hint = { 'DiagnosticHint' },
            info = { 'DiagnosticInfo' },
            ok = { 'DiagnosticOk' },
        },
        keywords = {
            ERROR = { icon = Common.icons.diagnostics.error, color = 'error' },
            WARNING = { icon = Common.icons.diagnostics.warn, color = 'warning', alt = { 'WARN' } },
            HINT = { icon = Common.icons.diagnostics.hint, color = 'hint' },
            INFO = { icon = Common.icons.diagnostics.info, color = 'info', alt = { 'NOTE' } },
            BUG = { icon = Common.icons.diagnostics.bug, color = 'error' },

            TEST = { icon = Common.icons.symbol.question, color = 'info', alt = { 'TESTING' } },
            FAILED = { icon = Common.icons.symbol.x, color = 'error', alt = { 'FAIL' } },
            SUCCESS = { icon = Common.icons.symbol.check, color = 'ok', alt = { 'OK', 'PASSED' } },
        },
        merge_keywords = false
    }
}
