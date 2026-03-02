local function fg(name)
    local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
    return hl.fg
end

local function bg(name)
    local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
    return hl.bg
end

local function apply_theme_overrides(theme)
    -- Word Highlight
    vim.api.nvim_set_hl(0, 'lspReferenceRead', { underline = true })
    vim.api.nvim_set_hl(0, 'lspReferenceWrite', { underline = true })
    vim.api.nvim_set_hl(0, 'lspReferenceText', { underline = true })

    -- UI
    vim.api.nvim_set_hl(0, 'WhichKeyNormal', { link = 'StatusLine' })

    vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = bg('StatusLine'), fg = fg('LineNrAbove') })
    vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { link = 'NONE' })
    vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = bg('StatusLine'), fg = fg('LineNrAbove') })
    vim.api.nvim_set_hl(0, 'TreesitterContextLineNumberBottom', { link = 'NONE' })
end

vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = function(args)
        apply_theme_overrides(args.match)
    end
})

return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        priority = 1000,

        opts = {
            lsp_styles = {
                underlines = {
                    errors = { 'undercurl' },
                    hints = { 'undercurl' },
                    warnings = { 'undercurl' },
                    information = { 'undercurl' },
                }
            },
            custom_highlights = function (colors)
                return {
                    SnacksIndent = { fg = colors.surface0 },
                    SnacksIndentScope = { fg = colors.blue },

                    UfoFoldedElipsis = { bg = colors.none, fg = colors.overlay2 }
                }
            end
        }
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
    }
}
