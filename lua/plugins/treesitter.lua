return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',

        config = function ()
            local treesitter = require('nvim-treesitter')
            local parsers = {
                'lua',
                'bash',
                'vim',
                'markdown',
                'markdown_inline'
            }

            treesitter.install(parsers)

            for _, name in ipairs(parsers) do
                local filetypes = vim.treesitter.language.get_filetypes(name)

                if type(filetypes) == 'string' then
                    filetypes = { filetypes }
                end

                if #filetypes > 0 then
                    vim.api.nvim_create_autocmd('FileType', {
                        pattern = filetypes,
                        callback = function (args)
                            vim.treesitter.start()

                            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                            vim.wo[0][0].foldmethod = "expr"

                            vim.bo[args.buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
                        end
                    })
                end
            end
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",

        opts = { max_lines = 1 }
    }
}
