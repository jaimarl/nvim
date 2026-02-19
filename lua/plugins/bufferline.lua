return {
    'akinsho/bufferline.nvim',
    lazy = false,

    keys = {
        { '<Tab>', ':BufferLineCycleNext<CR>' },
        { '<S-Tab>', ':BufferLineCyclePrev<CR>' },
        { '<C-l>', ':BufferLineCloseOthers<CR>' }
    },

    opts = {}
}
