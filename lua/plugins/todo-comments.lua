return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
        colors = {
            error = { "DiagnosticError" },
            warning = { "DiagnosticWarn" },
            success = { "DiagnosticOk" },
            info = { "DiagnosticInfo" },
            hint = { "DiagnosticHint" },
            debug = { 'Debug' },
            constant = { 'Constant' }
        },
        keywords = {
            ERROR = { icon = "󰃤", color = "error", alt = { "BUG", "ISSUE", "FIX", } },
            WARNING = { icon = " ", color = "warning", alt = { "WARN" } },
            
            PERFORMANCE = { icon = "󱁤", color = 'constant', alt = { "OPTIM", "PERF", "OPTIMIZE" } },
            REFACTOR = { icon = '󰃢', color = 'debug', alt = { 'CLEANUP', 'CLEAN', 'REWRITE' } },
            DEPRECATED = { icon = '󱎘', color = 'warning' },
            TODO = { icon = "󰍕", color = "info" },
            NOTE = { icon = "󰏫", color = "hint", alt = { "INFO" } },

            TEST = { icon = "", color = "debug", alt = { "TESTING" } },
            SUCCESS = { icon = '󰸞', color = 'success', alt = { 'OK', 'PASSED' } },
            FAILED = { icon = '󱈸', color = 'error', alt = { 'FAIL' } }
        },
        merge_keywords = false
    }
}
