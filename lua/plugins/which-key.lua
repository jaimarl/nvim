return {
    'folke/which-key.nvim',
    event = 'VeryLazy',

    opts = {
        icons = { mappings = false },

        defer = function(ctx)
            return ctx.mode == "v" or ctx.mode == "V" or ctx.mode == "<C-V>"
        end
    }
}
