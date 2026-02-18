-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)


-- Install Plugins
require("lazy").setup({
    spec = {
        { 'nvim-mini/mini.base16' },
        { "folke/snacks.nvim", priority = 1000, lazy = false },
        { 'folke/persistence.nvim', event = 'BufReadPre' },
        { 'akinsho/bufferline.nvim' },
        { 'brenoprata10/nvim-highlight-colors' },
        { 'cohama/lexima.vim' },
        { 'numToStr/Comment.nvim' },
        { 'nvim-mini/mini.surround' },
        { 'nat-418/boole.nvim' },
        { 'ojroques/nvim-bufdel' },

        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },
        {
            '2kabhishek/nerdy.nvim',
            dependencies = { 'folke/snacks.nvim' },
        },
        {
            "mikavilpas/yazi.nvim", event = "VeryLazy",
            dependencies = { "nvim-lua/plenary.nvim", lazy = true },
        },
    },
})
