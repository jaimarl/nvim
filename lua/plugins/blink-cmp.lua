return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim'
    },
    version = 'v0.*',

    opts = {
        keymap = { preset = 'super-tab' },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        completion = {
            menu = {
                border = 'rounded',
                draw = {
                    columns = {
                        { 'kind_icon', 'label', gap = 1 },
                        { 'kind' }
                    }
                }
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                window = { border = 'rounded' }
            },
        },

        sources = {
            default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        }
    }
}
