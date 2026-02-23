local common = require('common')

return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        cmd = "LazyDev",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
                { path = "lazy.nvim", words = { "LazyVim" } },
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp', 'folke/lazydev.nvim' },

        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local flake_path = vim.fn.expand('~/.nixos')

            -- Lua
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                            }
                        }
                    }
                }
            })
            vim.lsp.enable('lua_ls')

            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = common.diagnostics.error,
                        [vim.diagnostic.severity.WARN]  = common.diagnostics.warn,
                        [vim.diagnostic.severity.HINT]  = common.diagnostics.hint,
                        [vim.diagnostic.severity.INFO]  = common.diagnostics.info,
                    },
                },
            })
        end
    }
}
