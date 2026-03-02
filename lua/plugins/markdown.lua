return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    },

    opts = {
        heading = { icons = { '󰉫 ', '󰉬 ', '󰉭 ', '󰉮 ', '󰉯 ', '󰉰 ' } },
        checkbox = {
            unchecked = { icon = Common.icons.ui.checkbox.unchecked },
            checked = { icon = Common.icons.ui.checkbox.checked },
        },
        sign = { enabled = false }
    },
}
