-- Actions
vim.keymap.set('i', '<C-s>', '<cmd>:w<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>:w<CR>')

vim.keymap.set('n', '<C-c>', '<cmd>:qa<CR>')
vim.keymap.set('n', '<C-q>',
    function()
        local bufs = vim.fn.getbufinfo({ buflisted = 1 })
        if #bufs <= 1 then
            vim.cmd('confirm q')
        else
            Snacks.bufdelete()
        end
    end
)


--- Persistence
vim.keymap.set("n", "<leader>qs", function() require("persistence").load({ last = true }) end)
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)


-- Yazi
vim.keymap.set('n', '<leader>n', '<cmd>Yazi<cr>')
vim.keymap.set('n', '<C-up>', '<cmd>Yazi toggle<cr>')


-- Bufferline
vim.keymap.set('n','<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n','<S-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<C-l>', ':BufferLineCloseOthers<CR>')
