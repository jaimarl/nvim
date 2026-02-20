return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = { { "nvim-lua/plenary.nvim", lazy = true } },
    
    keys = {
        { '<C-up>', ':Yazi toggle<CR>' },
        { '<C-n>', ':Yazi<CR>' },
    },

    opts = {
        open_for_directories = true
    }
}
